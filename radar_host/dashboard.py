"""Local live spectrum monitor and UDP IQ streamer for the Zybo radar demo."""

from __future__ import annotations

import argparse
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import math
import random
import threading
import time
from typing import Any

from .protocol import MessageType, UDPClient, decode_json_payload, encode_iq_int16

SAMPLE_RATE_HZ = 20_000_000.0
SPEED_OF_LIGHT_M_PER_S = 299_792_458.0
SAMPLE_COUNT = 256
FRAME_INTERVAL_S = 0.10
STATE_LOCK = threading.Lock()
STOP_EVENT = threading.Event()
STREAM_THREAD: threading.Thread | None = None
STATE: dict[str, Any] = {
    "running": False,
    "frames_sent": 0,
    "replies": 0,
    "timeouts": 0,
    "samples": [],
    "echo_sample": None,
    "latest_reply": None,
    "last_error": None,
    "updated_at": None,
    "settings": None,
    "configuration_reply": None,
}
DEFAULT_SETTINGS: dict[str, Any] = {
    "threshold": 0.12,
    "noise_std": 0.02,
    "min_snr_db": 8.0,
    "pulse_width_samples": 4,
    "pri_samples": 128,
    "echo_delay_samples": 40,
    "echo_amplitude": 0.42,
    "enable_echo": True,
}


def sanitize_settings(raw: Any) -> dict[str, Any]:
    if not isinstance(raw, dict):
        raw = {}
    settings = dict(DEFAULT_SETTINGS)
    settings.update(raw)
    for key, low, high in (
        ("threshold", 0.01, 0.8),
        ("noise_std", 0.0, 0.3),
        ("min_snr_db", 0.0, 30.0),
        ("echo_amplitude", 0.0, 0.9),
    ):
        value = float(settings[key])
        if not math.isfinite(value) or not low <= value <= high:
            raise ValueError(f"{key} must be between {low} and {high}")
        settings[key] = value
    settings["pulse_width_samples"] = int(settings["pulse_width_samples"])
    settings["pri_samples"] = int(settings["pri_samples"])
    settings["echo_delay_samples"] = int(settings["echo_delay_samples"])
    settings["enable_echo"] = bool(settings["enable_echo"])
    pw, pri, delay = (settings[k] for k in ("pulse_width_samples", "pri_samples", "echo_delay_samples"))
    if not 1 <= pw <= 16 or not pw < pri <= SAMPLE_COUNT:
        raise ValueError("pulse width must be 1–16 samples and PRI must be wider, up to 256")
    if not pw < delay or delay + pw >= pri:
        raise ValueError("echo delay plus pulse width must fit inside the PRI")
    return settings


def make_signal(rng: random.Random, settings: dict[str, Any]) -> tuple[list[complex], int]:
    """Generate one configurable noisy I/Q frame with a near TX/echo pair."""
    echo_sample = int(settings["echo_delay_samples"])
    phase_offset = rng.uniform(0.0, 2.0 * math.pi)
    samples = [
        complex(
            max(-0.98, min(0.98, rng.gauss(0.0, settings["noise_std"]))),
            max(-0.98, min(0.98, rng.gauss(0.0, settings["noise_std"]))),
        )
        for _ in range(SAMPLE_COUNT)
    ]
    for tx_start in range(0, SAMPLE_COUNT - settings["pulse_width_samples"], settings["pri_samples"]):
        pulses = [(tx_start, 0.68)]
        echo_start = tx_start + echo_sample
        if settings["enable_echo"] and echo_start + settings["pulse_width_samples"] <= SAMPLE_COUNT:
            pulses.append((echo_start, settings["echo_amplitude"]))
        for start, amplitude in pulses:
            for offset in range(settings["pulse_width_samples"]):
                taper = max(0.45, 1.0 - 0.12 * offset)
                index = start + offset
                phase = phase_offset + 2.0 * math.pi * 2_500_000.0 * index / SAMPLE_RATE_HZ
                samples[index] = complex(
                    amplitude * taper * math.cos(phase),
                    amplitude * taper * math.sin(phase),
                )
    return samples, echo_sample


def _update(**values: Any) -> None:
    with STATE_LOCK:
        STATE.update(values)


def _stream(host: str, port: int, timeout_s: float, settings: dict[str, Any]) -> None:
    rng = random.Random()
    sent = replies = timeouts = noise_only = 0
    _update(running=True, last_error=None)
    try:
        with UDPClient(host, port, timeout_s=timeout_s) as client:
            # The deployed PS firmware supports HELLO and IQ_SAMPLES, but not
            # CONFIGURE. Keep the monitor compatible with that verified image.
            try:
                hello = client.request(
                    MessageType.HELLO, expected_types=(MessageType.ACK,)
                )
                configured = decode_json_payload(hello.payload)
                _update(configuration_reply=configured)
            except Exception as exc:
                # Keep the live PC plot useful when the cable or board is down.
                # IQ sends still run and expose their own timeout counter/error.
                _update(configuration_reply={"status": "hello_failed", "error": str(exc)})
            while not STOP_EVENT.is_set():
                with STATE_LOCK:
                    settings = dict(STATE.get("settings") or settings)
                samples, echo_sample = make_signal(rng, settings)
                sent += 1
                _update(
                    frames_sent=sent,
                    samples=[[s.real, s.imag] for s in samples],
                    echo_sample=echo_sample,
                    settings=settings,
                    last_error=None,
                    updated_at=time.time(),
                )
                started = time.monotonic()
                try:
                    response = client.request(
                        MessageType.IQ_SAMPLES,
                        encode_iq_int16(samples),
                        expected_types=(MessageType.DETECTION, MessageType.ACK),
                    )
                    body = decode_json_payload(response.payload)
                    result = {
                        "message_type": response.message_type.name,
                        "sequence": response.sequence,
                        "payload": body,
                    }
                    replies += 1
                    if isinstance(body, dict) and body.get("status") == "noise_only":
                        noise_only += 1
                    _update(replies=replies, noise_only=noise_only, latest_reply=result, last_error=None)
                except TimeoutError:
                    timeouts += 1
                    _update(
                        timeouts=timeouts,
                        latest_reply=None,
                        last_error="No UDP reply from the FPGA before timeout.",
                    )
                remaining = FRAME_INTERVAL_S - (time.monotonic() - started)
                if remaining > 0 and STOP_EVENT.wait(remaining):
                    break
    except Exception as exc:
        _update(last_error=f"Sender socket error: {exc}")
    finally:
        _update(running=False)


PAGE = r"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Zybo Live Signal Monitor</title>
<style>
:root{font-family:Arial,Helvetica,sans-serif;color:#e8edf1;background:#11161c}*{box-sizing:border-box}body{margin:0;background:#11161c}main{max-width:1500px;margin:auto;padding:18px 22px}header{display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid #303942;padding-bottom:12px;margin-bottom:14px}h1{font-size:24px;margin:0 0 4px}h2{font-size:16px;margin:0 0 4px}.muted{font-size:12px;color:#aab4bc;margin:0}.target{font:13px Consolas,monospace;background:#1b222a;padding:8px 11px;border:1px solid #36414c;border-radius:4px}.layout{display:grid;grid-template-columns:minmax(0,1.8fr) minmax(330px,.8fr);gap:14px}.panel{border:1px solid #36414c;border-radius:6px;background:#171d24;padding:12px;margin-bottom:12px}.plot{width:100%;height:230px;display:block;border:1px solid #36414c;margin-top:8px}.plot.spec{height:180px}.props{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:6px;margin-top:8px}.prop,.out{background:#1c242c;border:1px solid #36414c;padding:7px}.prop span,.out span{display:block;font-size:11px;color:#aab4bc}.prop b,.out b{display:block;font:14px Consolas,monospace;margin-top:3px;color:#69b8ee}.controls{display:flex;gap:8px;align-items:center;margin:10px 0}button{padding:8px 18px;border:1px solid #b9c2c9;border-radius:4px;background:#28323b;color:#e8edf1;cursor:pointer;font-weight:600}button.start{background:#18864b;border-color:#18864b;color:#fff}button.stop{color:#9a2525}button:disabled{opacity:.45;cursor:default}.sl{display:grid;grid-template-columns:1fr auto;gap:2px 8px;margin:9px 0;font-size:12px;font-weight:600}.sl input{grid-column:1/-1;width:100%;accent-color:#2784ce}.sl output{font:12px Consolas,monospace;color:#2169a3}.check{font-size:12px;display:flex;gap:7px;align-items:center;margin:10px 0}.outgrid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:6px;margin-top:9px}.out{min-height:55px}.out b{font-size:16px}.reply{background:#11171d;border:1px solid #36414c;padding:8px;font:11px/1.4 Consolas,monospace;white-space:pre-wrap;overflow-wrap:anywhere;max-height:150px;overflow:auto;margin:8px 0 0}.leds{display:grid;grid-template-columns:repeat(3,1fr);gap:6px;margin-top:8px}.led{border:1px solid #36414c;padding:7px;text-align:center;font-size:11px;color:#6b747c}.led b{display:block;color:#e8edf1}.led.hit{background:#fff2cb;border-color:#d3ae37}.note{font-size:11px;line-height:1.45;color:#aab4bc;margin:8px 0 0}.status{font-size:12px;color:#c2cbd2}.error{color:#ad2626}@media(max-width:900px){.layout{grid-template-columns:1fr}.props{grid-template-columns:repeat(2,1fr)}}
</style>
</head>
<body><main>
<header><div><h1>Zybo Live Signal Monitor</h1><p class="muted">Live I/Q stream + spectrum · FPGA detection and range · up to 10 frames/s</p></div><div id="target" class="target">FPGA 192.168.1.10:5005</div></header>
<div class="layout">
<section>
<article class="panel"><h2>Window 1 · Live radar signal</h2><p class="muted">I (cyan), Q (orange), PC threshold and target echo position.</p><canvas id="wave" class="plot"></canvas>
<div class="props"><div class="prop"><span>Peak amplitude</span><b id="peak">—</b></div><div class="prop"><span>Noise floor RMS</span><b id="noise">—</b></div><div class="prop"><span>Threshold</span><b id="threshOut">—</b></div><div class="prop"><span>Measured SNR</span><b id="snrOut">—</b></div>
<div class="prop"><span>PW</span><b id="pwOut">—</b></div><div class="prop"><span>PRI</span><b id="priOut">—</b></div><div class="prop"><span>PRF</span><b id="prfOut">—</b></div><div class="prop"><span>Duty cycle</span><b id="dutyOut">—</b></div></div></article>
<article class="panel"><h2>Window 2 · Threshold filtered pulses</h2><p class="muted">Only generated samples above the adjustable PC threshold.</p><canvas id="filtered" class="plot"></canvas></article><article class="panel"><h2>Window 3 · Removed signal / residual noise</h2><p class="muted">Pulse windows removed from the generated IQ capture.</p><canvas id="residual" class="plot"></canvas></article><article class="panel"><h2>Live signal spectrum</h2><p class="muted">FFT of the latest 256 complex IQ samples · 0–10 MHz.</p><canvas id="spec" class="plot spec"></canvas>
<div class="props"><div class="prop"><span>Echo sample</span><b id="echoSample">—</b></div><div class="prop"><span>Echo ToF</span><b id="tofOut">—</b></div><div class="prop"><span>Calculated distance</span><b id="distanceOut">—</b></div><div class="prop"><span>Frame update rate</span><b>up to 10 fps</b></div></div></article>
<p class="note">PC generates synthetic IQ and sends it over Ethernet. Sliders change the generated signal and PC-side threshold view live. The deployed firmware does not accept live detector-parameter updates. FPGA replies provide detection and range; there is no ADC/RF capture input.</p>
</section>
<aside>
<article class="panel"><h2>Radar DSP control panel</h2><p class="muted">Signal controls apply live while streaming. Threshold and SNR controls are PC-side views.</p>
<label class="sl">Threshold amplitude <output id="thresholdRead">0.12</output><input id="threshold" type="range" min="0.02" max="0.70" step="0.01" value="0.12"></label>
<label class="sl">Noise standard deviation <output id="noiseRead">0.020</output><input id="noiseStd" type="range" min="0" max="0.25" step="0.005" value="0.02"></label>
<label class="sl">Minimum SNR <output id="snrRead">8 dB</output><input id="minSnr" type="range" min="0" max="30" step="1" value="8"></label>
<label class="sl">Pulse width (samples) <output id="pwRead">4</output><input id="pulseWidth" type="range" min="1" max="16" step="1" value="4"></label>
<label class="sl">PRI (samples) <output id="priRead">128</output><input id="priSamples" type="range" min="32" max="256" step="1" value="128"></label>
<label class="sl">Echo delay (samples) <output id="delayRead">40</output><input id="echoDelay" type="range" min="8" max="120" step="1" value="40"></label>
<label class="sl">Echo amplitude <output id="ampRead">0.42</output><input id="echoAmp" type="range" min="0" max="0.8" step="0.01" value="0.42"></label>
<label class="check"><input id="enableEcho" type="checkbox" checked> Generate target echo (turn off for noise-only)</label>
<div class="controls"><button id="start" class="start">Start</button><button id="stop" class="stop" disabled>Stop</button><span id="status" class="status">Stopped</span></div>
<div class="outgrid"><div class="out"><span>Frames sent</span><b id="sent">0</b></div><div class="out"><span>FPGA replies</span><b id="replies">0</b></div><div class="out"><span>Noise-only results</span><b id="noiseCount">0</b></div><div class="out"><span>Timeouts</span><b id="timeouts">0</b></div></div></article>
<article class="panel"><h2>FPGA output</h2><p class="muted">Classification and measurement returned over Ethernet.</p>
<div class="outgrid"><div class="out"><span>FPGA reply</span><b id="classification">Waiting</b></div><div class="out"><span>PC-side signal class</span><b id="localClass">Waiting</b></div><div class="out"><span>FPGA range</span><b id="rangeOut">—</b></div><div class="out"><span>FPGA ToF</span><b id="tofResult">—</b></div><div class="out"><span>Echo sample</span><b id="echoResult">—</b></div><div class="out"><span>Peak amplitude</span><b id="peakResult">—</b></div><div class="out"><span>Estimated SNR</span><b id="snrResult">—</b></div><div class="out"><span>PW / PRI</span><b id="pwPriResult">—</b></div><div class="out"><span>PRF / Duty</span><b id="prfDutyResult">—</b></div></div><pre id="reply" class="reply">Set parameters and press Start.</pre></article>
<article class="panel"><h2>FPGA response indicators</h2><div class="leds"><div class="led" id="led1"><b>FPGA</b>packet replied</div><div class="led" id="led2"><b>FPGA</b>detection</div><div class="led" id="led3"><b>FPGA</b>range result</div></div><p class="note">These mirror the UDP reply shown here; the firmware does not report physical LED state to the PC. Check the board LEDs directly for their hardware pattern.</p></article>
</aside></div></main>
<script>
const byId = id => document.getElementById(id);
const sampleCount = 256;
let currentSamples = [], echoIndex = null, lastFrameStamp = null, scan = 0, latestState = null;

function settingsFromUI() {
  return {
    threshold: Number(byId('threshold').value),
    noise_std: Number(byId('noiseStd').value),
    min_snr_db: Number(byId('minSnr').value),
    pulse_width_samples: Number(byId('pulseWidth').value),
    pri_samples: Number(byId('priSamples').value),
    echo_delay_samples: Number(byId('echoDelay').value),
    echo_amplitude: Number(byId('echoAmp').value),
    enable_echo: byId('enableEcho').checked
  };
}
function refreshReadouts() {
  let s = settingsFromUI();
  byId('thresholdRead').textContent = s.threshold.toFixed(2);
  byId('noiseRead').textContent = s.noise_std.toFixed(3);
  byId('snrRead').textContent = s.min_snr_db + ' dB';
  byId('pwRead').textContent = s.pulse_width_samples;
  byId('priRead').textContent = s.pri_samples;
  byId('delayRead').textContent = s.echo_delay_samples;
  byId('ampRead').textContent = s.echo_amplitude.toFixed(2);
  byId('threshOut').textContent = s.threshold.toFixed(2) + ' FS';
  byId('pwOut').textContent = (s.pulse_width_samples / 20).toFixed(2) + ' μs';
  byId('priOut').textContent = (s.pri_samples / 20).toFixed(2) + ' μs';
  byId('prfOut').textContent = (20000 / s.pri_samples).toFixed(2) + ' kHz';
  byId('dutyOut').textContent = (100 * s.pulse_width_samples / s.pri_samples).toFixed(2) + '%';
  byId('echoSample').textContent = s.echo_delay_samples;
  byId('tofOut').textContent = (s.echo_delay_samples / 20).toFixed(2) + ' μs';
  byId('distanceOut').textContent = (s.echo_delay_samples * 299792458 / 40000000).toFixed(2) + ' m';
}
function draw(canvas, spectrum) {
  let ctx = canvas.getContext('2d'), w = canvas.clientWidth, h = canvas.clientHeight;
  let dpr = window.devicePixelRatio || 1;
  if (canvas.width !== Math.round(w*dpr) || canvas.height !== Math.round(h*dpr)) {
    canvas.width = Math.round(w*dpr); canvas.height = Math.round(h*dpr);
  }
  ctx.setTransform(dpr,0,0,dpr,0,0); ctx.fillStyle='#10151b'; ctx.fillRect(0,0,w,h);
  let L=48,R=12,T=12,B=26,pw=w-L-R,ph=h-T-B;
  ctx.strokeStyle='#303942'; ctx.lineWidth=1; ctx.fillStyle='#c2cbd2'; ctx.font='11px Arial';
  for(let j=0;j<=4;j++){let y=T+ph*j/4;ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(w-R,y);ctx.stroke();ctx.fillText(spectrum?(1-j*.25).toFixed(2):(1-j*.5).toFixed(1),5,y+4)}
  for(let j=0;j<=5;j++){let x=L+pw*j/5;ctx.beginPath();ctx.moveTo(x,T);ctx.lineTo(x,T+ph);ctx.stroke();ctx.fillText(spectrum?(j*2)+' MHz':(j*sampleCount*1e6/20000000/5).toFixed(1)+' μs',x-16,h-7)}
  if(!currentSamples.length)return;
  if(!spectrum){
    let threshold=latestState?.settings?.threshold ?? settingsFromUI().threshold;
    for(let v of [threshold,-threshold]){let y=T+ph*(1-(v+1)/2);ctx.setLineDash([5,3]);ctx.strokeStyle='#c64242';ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(w-R,y);ctx.stroke();ctx.setLineDash([])}
    for(let q=0;q<2;q++){ctx.beginPath();currentSamples.forEach((p,i)=>{let x=L+pw*i/(sampleCount-1),y=T+ph*(1-(p[q]+1)/2);i?ctx.lineTo(x,y):ctx.moveTo(x,y)});ctx.strokeStyle=q?'#e28a21':'#1679b8';ctx.lineWidth=1.35;ctx.stroke()}
    if(echoIndex!==null){let x=L+pw*echoIndex/(sampleCount-1);ctx.setLineDash([4,3]);ctx.strokeStyle='#258749';ctx.beginPath();ctx.moveTo(x,T);ctx.lineTo(x,T+ph);ctx.stroke();ctx.setLineDash([]);ctx.fillStyle='#258749';ctx.fillText('echo',Math.min(x+3,w-40),T+11)}
    let x=L+pw*((scan++%400)/399);ctx.strokeStyle='#666';ctx.lineWidth=1;ctx.beginPath();ctx.moveTo(x,T);ctx.lineTo(x,T+ph);ctx.stroke();
  } else {
    let bins=128,mag=[];
    for(let k=0;k<bins;k++){let re=0,im=0;for(let n=0;n<sampleCount;n++){let a=-2*Math.PI*k*n/sampleCount,I=currentSamples[n][0],Q=currentSamples[n][1];re+=I*Math.cos(a)-Q*Math.sin(a);im+=I*Math.sin(a)+Q*Math.cos(a)}mag.push(Math.hypot(re,im)/sampleCount)}
    let max=Math.max(...mag,1e-9);ctx.beginPath();mag.forEach((v,i)=>{let x=L+pw*i/(bins-1),y=T+ph*(1-v/max);i?ctx.lineTo(x,y):ctx.moveTo(x,y)});ctx.lineTo(w-R,T+ph);ctx.lineTo(L,T+ph);ctx.closePath();ctx.fillStyle='#e4f2fb';ctx.fill();ctx.strokeStyle='#1679b8';ctx.lineWidth=1.4;ctx.stroke();
  }
}
function drawDerived() {
  if (!currentSamples.length) return;
  const cfg = latestState?.settings || settingsFromUI();
  const pw = cfg.pulse_width_samples, delay = cfg.echo_delay_samples;
  const threshold = cfg.threshold;
  const insidePulse = i => (i < pw) || (i >= delay && i < delay + pw);
  const filtered = currentSamples.map((p,i) => Math.hypot(p[0],p[1]) >= threshold ? p : [0,0]);
  const residual = currentSamples.map((p,i) => insidePulse(i) ? [0,0] : p);
  drawTrace(byId('filtered'), filtered, threshold, delay, '#29d17d');
  drawTrace(byId('residual'), residual, null, null, '#f2a51a');
}
function drawTrace(canvas, values, threshold, marker, color) {
  let ctx=canvas.getContext('2d'),w=canvas.clientWidth,h=canvas.clientHeight,dpr=window.devicePixelRatio||1;
  if(canvas.width!==Math.round(w*dpr)||canvas.height!==Math.round(h*dpr)){canvas.width=Math.round(w*dpr);canvas.height=Math.round(h*dpr)}
  ctx.setTransform(dpr,0,0,dpr,0,0);ctx.fillStyle='#10151b';ctx.fillRect(0,0,w,h);
  let L=48,R=12,T=12,B=26,pw=w-L-R,ph=h-T-B;
  ctx.strokeStyle='#303942';ctx.lineWidth=1;ctx.fillStyle='#c2cbd2';ctx.font='11px Arial';
  for(let j=0;j<=4;j++){let y=T+ph*j/4;ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(w-R,y);ctx.stroke();ctx.fillText((1-j*.5).toFixed(1),7,y+4)}
  for(let j=0;j<=5;j++){let x=L+pw*j/5;ctx.beginPath();ctx.moveTo(x,T);ctx.lineTo(x,T+ph);ctx.stroke();ctx.fillText((j*sampleCount*1e6/20000000/5).toFixed(1)+' μs',x-15,h-7)}
  if(threshold!==null){let y=T+ph*(1-(threshold+1)/2);ctx.setLineDash([5,3]);ctx.strokeStyle='#ed5364';ctx.beginPath();ctx.moveTo(L,y);ctx.lineTo(w-R,y);ctx.stroke();ctx.setLineDash([])}
  if(marker!==null){let x=L+pw*marker/(sampleCount-1);ctx.setLineDash([4,3]);ctx.strokeStyle='#49d889';ctx.beginPath();ctx.moveTo(x,T);ctx.lineTo(x,T+ph);ctx.stroke();ctx.setLineDash([])}
  ctx.beginPath();values.forEach((p,i)=>{let x=L+pw*i/(sampleCount-1),y=T+ph*(1-(p[0]+1)/2);i?ctx.lineTo(x,y):ctx.moveTo(x,y)});ctx.strokeStyle=color;ctx.lineWidth=1.5;ctx.stroke();
  ctx.beginPath();values.forEach((p,i)=>{let x=L+pw*i/(sampleCount-1),y=T+ph*(1-(p[1]+1)/2);i?ctx.lineTo(x,y):ctx.moveTo(x,y)});ctx.strokeStyle='#4e9de0';ctx.lineWidth=1;ctx.stroke();
}
function render(s) {
  latestState=s;
  byId('sent').textContent=s.frames_sent||0; byId('replies').textContent=s.replies||0; byId('timeouts').textContent=s.timeouts||0;
  byId('noiseCount').textContent=s.noise_only||0;
  byId('status').textContent=s.running?'Streaming · up to 10 fps':'Stopped';
  byId('start').disabled=s.running; byId('stop').disabled=!s.running;
  if(s.samples?.length===sampleCount && s.updated_at!==lastFrameStamp) {
    currentSamples=s.samples; echoIndex=s.echo_sample; lastFrameStamp=s.updated_at;
    draw(byId('wave'),false); draw(byId('spec'),true); drawDerived();
    let peak=Math.max(...currentSamples.map(p=>Math.max(Math.abs(p[0]),Math.abs(p[1]))));
    byId('peak').textContent=peak.toFixed(3)+' FS';
    const cfg=s.settings||settingsFromUI(), pw=cfg.pulse_width_samples, delay=cfg.echo_delay_samples;
    let background=currentSamples.filter((p,i)=>!(i<pw||(i>=delay&&i<delay+pw)));
    let noiseRms=Math.sqrt(background.reduce((a,p)=>a+p[0]*p[0]+p[1]*p[1],0)/(2*Math.max(1,background.length)));
    let echo=currentSamples.slice(delay,delay+pw), echoPeak=Math.max(0,...echo.map(p=>Math.hypot(p[0],p[1])));
    let snr=noiseRms>0&&echoPeak>0?20*Math.log10(echoPeak/noiseRms):0;
    byId('noise').textContent=noiseRms.toFixed(4)+' FS';
    byId('snrOut').textContent=snr.toFixed(1)+' dB';
    byId('localClass').textContent=echoPeak>=cfg.threshold&&snr>=cfg.min_snr_db?'SIGNAL':'NOISE';
  }
  if(s.latest_reply){
    let p=s.latest_reply.payload||{}, det=p.status==='detection';
    byId('reply').textContent=JSON.stringify(s.latest_reply,null,2);
    byId('classification').textContent=det?'VALID ECHO':(p.status==='noise_only'?'NOISE ONLY':(p.status||'REPLY'));
    byId('rangeOut').textContent=det?Number(p.range_m).toFixed(2)+' m':'—';
    byId('tofResult').textContent=det?(Number(p.echo_delay_s)*1e6).toFixed(2)+' μs':'—';
    byId('echoResult').textContent=det?p.echo_sample:'—';
    const cfg=s.settings||settingsFromUI(), pw=cfg.pulse_width_samples, pri=cfg.pri_samples;
    byId('peakResult').textContent=det?(Number(p.peak_component)/32767).toFixed(3)+' FS':'—';
    let noiseRms=Number(byId('noise').textContent.replace(' FS',''))||0;
    let echoPeak=currentSamples.length?Math.max(0,...currentSamples.slice(cfg.echo_delay_samples,cfg.echo_delay_samples+pw).map(v=>Math.hypot(v[0],v[1]))):0;
    let snr=noiseRms>0&&echoPeak>0?20*Math.log10(echoPeak/noiseRms):0;
    byId('snrResult').textContent=snr.toFixed(1)+' dB';
    byId('pwPriResult').textContent=pw+' / '+pri+' samples';
    byId('prfDutyResult').textContent=(20000/pri).toFixed(2)+' kHz / '+(100*pw/pri).toFixed(2)+'%';
    byId('tofOut').textContent=det?(Number(p.echo_delay_s)*1e6).toFixed(2)+' μs':'—';
    byId('distanceOut').textContent=det?Number(p.range_m).toFixed(2)+' m':'—';
    for(let id of ['led1','led2','led3'])byId(id).classList.toggle('hit',det||(id==='led1'&&p.status==='noise_only'));
  } else if(s.last_error) {
    byId('classification').textContent='NO FPGA REPLY';byId('reply').textContent=s.last_error;
    for(let id of ['led1','led2','led3'])byId(id).classList.remove('hit');
  }
}
async function poll(){try{render(await(await fetch('/api/state',{cache:'no-store'})).json())}catch(e){byId('status').textContent='Dashboard disconnected'}}
let settingsTimer=null;
async function sendSettingsLive(){
  let s=settingsFromUI();refreshReadouts();
  if(s.echo_delay_samples+s.pulse_width_samples>=s.pri_samples){byId('status').textContent='Echo delay + PW must fit inside PRI';return}
  if(latestState?.running){clearTimeout(settingsTimer);settingsTimer=setTimeout(async()=>{try{let r=await fetch('/api/settings',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(s)});let j=await r.json();if(!r.ok)byId('status').textContent=j.error}catch(e){byId('status').textContent='Could not update live settings'}},100)}
}
for(let id of ['threshold','noiseStd','minSnr','pulseWidth','priSamples','echoDelay','echoAmp'])byId(id).addEventListener('input',sendSettingsLive);
byId('enableEcho').addEventListener('change',sendSettingsLive);
byId('start').onclick=async()=>{let s=settingsFromUI();if(s.echo_delay_samples+s.pulse_width_samples>=s.pri_samples){byId('status').textContent='Echo delay + PW must fit inside PRI';return}let r=await fetch('/api/start',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(s)});let j=await r.json();if(!r.ok){byId('status').textContent=j.error;return}poll()};
byId('stop').onclick=async()=>{await fetch('/api/stop',{method:'POST'});poll()};
refreshReadouts();poll();setInterval(poll,100);setInterval(()=>{if(currentSamples.length){draw(byId('wave'),false);drawDerived()}},40);
</script></body></html>"""


def make_handler(host: str, port: int, timeout_s: float) -> type[BaseHTTPRequestHandler]:
    class Handler(BaseHTTPRequestHandler):
        def _json(self, status: int, value: dict[str, Any]) -> None:
            body = json.dumps(value, separators=(",", ":")).encode()
            self.send_response(status)
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.send_header("Cache-Control", "no-store")
            self.end_headers()
            self.wfile.write(body)

        def do_GET(self) -> None:  # noqa: N802
            if self.path == "/api/state":
                with STATE_LOCK:
                    state = json.loads(json.dumps(STATE))
                self._json(200, state)
                return
            if self.path != "/":
                self._json(404, {"error": "not found"})
                return
            body = PAGE.encode()
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.send_header("Cache-Control", "no-store")
            self.end_headers()
            self.wfile.write(body)

        def do_POST(self) -> None:  # noqa: N802
            global STREAM_THREAD
            if self.path == "/api/settings":
                try:
                    request_length = int(self.headers.get("Content-Length", "0"))
                    raw_settings = json.loads(self.rfile.read(request_length)) if request_length else {}
                    settings = sanitize_settings(raw_settings)
                except (ValueError, json.JSONDecodeError) as exc:
                    self._json(400, {"ok": False, "error": str(exc)})
                    return
                _update(settings=settings)
                self._json(200, {"ok": True, "settings": settings})
                return
            if self.path == "/api/start":
                try:
                    request_length = int(self.headers.get("Content-Length", "0"))
                    raw_settings = json.loads(self.rfile.read(request_length)) if request_length else {}
                    settings = sanitize_settings(raw_settings)
                except (ValueError, json.JSONDecodeError) as exc:
                    self._json(400, {"ok": False, "error": str(exc)})
                    return
                with STATE_LOCK:
                    active = STREAM_THREAD is not None and STREAM_THREAD.is_alive()
                    if not active:
                        STOP_EVENT.clear()
                        STATE.update({
                            "running": True, "frames_sent": 0, "replies": 0,
                            "timeouts": 0, "noise_only": 0, "samples": [], "echo_sample": None,
                            "latest_reply": None, "last_error": None,
                            "configuration_reply": None,
                        })
                        STATE["settings"] = settings
                        STREAM_THREAD = threading.Thread(
                            target=_stream, args=(host, port, timeout_s, settings), daemon=True
                        )
                        STREAM_THREAD.start()
                self._json(200, {"ok": True, "running": True})
                return
            if self.path == "/api/stop":
                STOP_EVENT.set()
                self._json(200, {"ok": True, "running": False})
                return
            self._json(404, {"error": "not found"})

        def log_message(self, fmt: str, *args: Any) -> None:
            print("[signal-monitor] " + (fmt % args))

    return Handler


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--host", default="192.168.1.10", help="FPGA board IP")
    parser.add_argument("--port", type=int, default=5005, help="FPGA UDP port")
    parser.add_argument("--http-port", type=int, default=8765)
    parser.add_argument("--timeout", type=float, default=1.0, help="UDP reply timeout")
    args = parser.parse_args()
    server = ThreadingHTTPServer(
        ("127.0.0.1", args.http_port), make_handler(args.host, args.port, args.timeout)
    )
    print(f"Signal monitor: http://127.0.0.1:{args.http_port}")
    print(f"FPGA UDP target: {args.host}:{args.port}")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        STOP_EVENT.set()
        print("Stopping signal monitor.")
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
