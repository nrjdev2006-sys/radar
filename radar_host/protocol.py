"""Version 1 UDP message framing for the PC/FPGA control link.

The protocol is deliberately small and board-independent. FPGA firmware must
implement the same framing before this client can communicate with hardware.
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import IntEnum
import json
import math
import socket
import struct
import zlib
from typing import Iterable


MAGIC = b"RDR1"
VERSION = 1
HEADER = struct.Struct("!4sBBHII")
CRC = struct.Struct("!I")
MAX_DATAGRAM_SIZE = 1400
MAX_PAYLOAD_SIZE = MAX_DATAGRAM_SIZE - HEADER.size - CRC.size
IQ_PAIR = struct.Struct("!hh")


class MessageType(IntEnum):
    HELLO = 1
    CONFIGURE = 2
    START = 3
    STOP = 4
    STATUS = 5
    IQ_SAMPLES = 16
    ACK = 128
    DETECTION = 129
    ERROR = 255


class ProtocolError(ValueError):
    """The datagram is invalid or does not match this protocol version."""


@dataclass(frozen=True)
class Message:
    message_type: MessageType
    sequence: int
    payload: bytes = b""
    flags: int = 0


def encode_message(message: Message) -> bytes:
    if not 0 <= message.sequence <= 0xFFFFFFFF:
        raise ProtocolError("sequence must fit in an unsigned 32-bit integer")
    if not 0 <= message.flags <= 0xFFFF:
        raise ProtocolError("flags must fit in an unsigned 16-bit integer")
    if not isinstance(message.payload, bytes):
        raise ProtocolError("payload must be bytes")
    if len(message.payload) > MAX_PAYLOAD_SIZE:
        raise ProtocolError(f"payload exceeds {MAX_PAYLOAD_SIZE} bytes")
    try:
        message_type = MessageType(message.message_type)
    except ValueError as exc:
        raise ProtocolError("unknown message type") from exc

    header = HEADER.pack(
        MAGIC,
        VERSION,
        int(message_type),
        message.flags,
        message.sequence,
        len(message.payload),
    )
    body = header + message.payload
    return body + CRC.pack(zlib.crc32(body) & 0xFFFFFFFF)


def decode_message(datagram: bytes) -> Message:
    if len(datagram) < HEADER.size + CRC.size:
        raise ProtocolError("datagram is shorter than the protocol header")
    if len(datagram) > MAX_DATAGRAM_SIZE:
        raise ProtocolError("datagram exceeds the configured maximum size")

    magic, version, message_type, flags, sequence, payload_length = HEADER.unpack_from(datagram)
    if magic != MAGIC:
        raise ProtocolError("invalid protocol magic")
    if version != VERSION:
        raise ProtocolError(f"unsupported protocol version {version}")
    expected_size = HEADER.size + payload_length + CRC.size
    if expected_size != len(datagram):
        raise ProtocolError("payload length does not match datagram size")

    body = datagram[:-CRC.size]
    received_crc, = CRC.unpack_from(datagram, len(body))
    if received_crc != (zlib.crc32(body) & 0xFFFFFFFF):
        raise ProtocolError("CRC mismatch")
    try:
        kind = MessageType(message_type)
    except ValueError as exc:
        raise ProtocolError(f"unknown message type {message_type}") from exc

    payload_start = HEADER.size
    return Message(kind, sequence, datagram[payload_start:-CRC.size], flags)


def encode_json_payload(value: object) -> bytes:
    try:
        payload = json.dumps(value, separators=(",", ":"), sort_keys=True).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise ProtocolError("value cannot be encoded as JSON") from exc
    if len(payload) > MAX_PAYLOAD_SIZE:
        raise ProtocolError(f"JSON payload exceeds {MAX_PAYLOAD_SIZE} bytes")
    return payload


def decode_json_payload(payload: bytes) -> object:
    try:
        return json.loads(payload.decode("utf-8"))
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ProtocolError("payload is not valid UTF-8 JSON") from exc


def encode_iq_int16(samples: Iterable[complex]) -> bytes:
    """Encode normalized complex samples as signed, network-order int16 IQ pairs."""

    output = bytearray()
    for sample in samples:
        if not (math.isfinite(sample.real) and math.isfinite(sample.imag)):
            raise ProtocolError("IQ samples must be finite")
        if abs(sample.real) > 1.0 or abs(sample.imag) > 1.0:
            raise ProtocolError("normalized IQ components must be in [-1, 1]")
        i_value = max(-32768, min(32767, round(sample.real * 32767)))
        q_value = max(-32768, min(32767, round(sample.imag * 32767)))
        output.extend(IQ_PAIR.pack(i_value, q_value))
    if len(output) > MAX_PAYLOAD_SIZE:
        raise ProtocolError("IQ block is too large for one datagram; split it into chunks")
    return bytes(output)


def decode_iq_int16(payload: bytes) -> tuple[complex, ...]:
    if len(payload) % IQ_PAIR.size:
        raise ProtocolError("IQ payload length must be a multiple of four bytes")
    if len(payload) > MAX_PAYLOAD_SIZE:
        raise ProtocolError("IQ payload is too large")
    return tuple(
        complex(i_value / 32767.0, q_value / 32767.0)
        for i_value, q_value in IQ_PAIR.iter_unpack(payload)
    )


class UDPClient:
    """Synchronous request/reply client; one outstanding request at a time."""

    def __init__(self, host: str, port: int, *, timeout_s: float = 1.0) -> None:
        if not 1 <= port <= 65535:
            raise ValueError("port must be between 1 and 65535")
        if not math.isfinite(timeout_s) or timeout_s <= 0:
            raise ValueError("timeout_s must be finite and positive")
        try:
            self.remote = socket.gethostbyname(host), port
        except OSError as exc:
            raise OSError(f"could not resolve FPGA host {host!r}") from exc
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self._socket.settimeout(timeout_s)
        self._sequence = 0

    def request(
        self,
        message_type: MessageType,
        payload: bytes = b"",
        *,
        expected_types: tuple[MessageType, ...] | None = None,
    ) -> Message:
        sequence = self._sequence
        self._sequence = (self._sequence + 1) & 0xFFFFFFFF
        self._socket.sendto(encode_message(Message(message_type, sequence, payload)), self.remote)
        datagram, source = self._socket.recvfrom(MAX_DATAGRAM_SIZE + 1)
        if source != self.remote:
            raise ProtocolError("reply came from an unexpected address")
        response = decode_message(datagram)
        if response.sequence != sequence:
            raise ProtocolError("reply sequence does not match request")
        if expected_types is not None and response.message_type not in expected_types:
            raise ProtocolError(f"unexpected reply type {response.message_type.name}")
        return response

    def close(self) -> None:
        self._socket.close()

    def __enter__(self) -> "UDPClient":
        return self

    def __exit__(self, exc_type, exc_value, traceback) -> None:
        self.close()
