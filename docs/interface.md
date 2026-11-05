# PC ↔ FPGA interface proposal

The PC implementation uses UDP with a compact version 1 frame. FPGA firmware must implement this frame before the PC can communicate with the board. UDP packet arrival is never the pulse timing reference; PL timing must be clocked locally.

## Version 1 message frame

All integers are unsigned and network byte order (big-endian), except the signed IQ sample components. The frame is:

| Field | Size | Value |
|---|---:|---|
| Magic | 4 bytes | ASCII `RDR1` |
| Version | 1 byte | `1` |
| Type | 1 byte | See message type table |
| Flags | 2 bytes | Reserved; send zero initially |
| Sequence | 4 bytes | Request/reply correlation ID |
| Payload length | 4 bytes | Payload bytes only |
| Payload | 0–1380 bytes | Type-specific |
| CRC-32 | 4 bytes | CRC-32 over header and payload |

Datagrams are capped at 1400 bytes so they fit within a standard Ethernet MTU without IP fragmentation. Receivers validate magic, version, exact length, message type, and CRC before processing a command.

| Type | ID | Payload |
|---|---:|---|
| HELLO | 1 | Empty or implementation/version JSON |
| CONFIGURE | 2 | UTF-8 JSON configuration |
| START | 3 | UTF-8 JSON run request |
| STOP | 4 | UTF-8 JSON stop request |
| STATUS | 5 | Empty or UTF-8 JSON status request |
| IQ_SAMPLES | 16 | Interleaved signed 16-bit I,Q pairs |
| ACK | 128 | UTF-8 JSON or short status payload |
| DETECTION | 129 | UTF-8 JSON detection result |
| ERROR | 255 | UTF-8 JSON error detail |

The host codec and synchronous UDP request/reply client are in `radar_host/protocol.py`. The current client allows one outstanding request and checks the source IP/port and response sequence. It does not retry requests or provide streaming reliability.

## Initial commands

| Command | Essential fields |
|---|---|
The JSON schemas are provisional until the FPGA model and firmware are known. Keep parameter names and units explicit; use integer sample-clock ticks for deterministic timing. A configuration should include `configuration_id`, `mode`, `carrier_hz` or RF-front-end tuning words, `pw_ticks`, `pri_ticks`, `receive_window_ticks`, and `pulse_count`. Start/stop/status requests should include the applicable run or request ID.

The receiver should apply timing changes at a defined PL boundary, such as the next pulse period, and acknowledge the applied configuration ID.

## Detection result

Return at least:

- run and pulse IDs;
- PL transmit timestamp and echo timestamp or sample index;
- corrected echo delay in clock ticks;
- range in metres;
- measured PW, PRI, and frequency with units and estimator/domain labels;
- detection confidence/quality and validity flags;
- overflow, missed-pulse, packet-loss, or calibration status.

Prefer integer ticks and explicit units in the wire format. The PC can convert to display units. Preserve raw capture metadata so an unexpected range estimate can be reviewed against the original samples. IQ pairs are normalized to `[-1, 1]` on the PC and encoded as signed 16-bit components.

## Data path sizing

If raw data must cross Ethernet, estimate the payload rate before implementing the streamer:

```text
payload_bits_per_second = samples_per_second * bits_per_sample * channels
```

Then include packet framing and transport overhead, and budget for buffering and retransmission or loss reporting. A better initial architecture is often to capture and detect in PL, then send compact detections and selected raw captures to the PC.
