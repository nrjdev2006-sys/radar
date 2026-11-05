import socket
import threading
import unittest

from radar_host.protocol import (
    MAX_PAYLOAD_SIZE,
    Message,
    MessageType,
    ProtocolError,
    UDPClient,
    decode_iq_int16,
    decode_json_payload,
    decode_message,
    encode_iq_int16,
    encode_json_payload,
    encode_message,
)


class MessageCodecTests(unittest.TestCase):
    def test_round_trip_message(self):
        message = Message(MessageType.CONFIGURE, 0x1234, b"config", flags=3)
        self.assertEqual(decode_message(encode_message(message)), message)

    def test_detects_corrupted_payload(self):
        packet = bytearray(encode_message(Message(MessageType.HELLO, 1, b"abc")))
        packet[-2] ^= 1
        with self.assertRaisesRegex(ProtocolError, "CRC"):
            decode_message(bytes(packet))

    def test_detects_length_mismatch(self):
        packet = encode_message(Message(MessageType.HELLO, 1, b"abc"))[:-1]
        with self.assertRaises(ProtocolError):
            decode_message(packet)

    def test_rejects_oversized_payload(self):
        with self.assertRaisesRegex(ProtocolError, "exceeds"):
            encode_message(Message(MessageType.IQ_SAMPLES, 1, bytes(MAX_PAYLOAD_SIZE + 1)))

    def test_json_payload_round_trip(self):
        value = {"pri_ticks": 2000, "pw_ticks": 100, "mode": "pulse"}
        self.assertEqual(decode_json_payload(encode_json_payload(value)), value)

    def test_rejects_malformed_json_payload(self):
        with self.assertRaisesRegex(ProtocolError, "valid UTF-8 JSON"):
            decode_json_payload(b"{bad-json: True")

    def test_detects_invalid_magic(self):
        valid = encode_message(Message(MessageType.HELLO, 1, b"abc"))
        corrupted = b"WRNG" + valid[4:]
        with self.assertRaisesRegex(ProtocolError, "invalid protocol magic"):
            decode_message(corrupted)

    def test_detects_unsupported_version(self):
        valid = encode_message(Message(MessageType.HELLO, 1, b"abc"))
        corrupted = valid[:4] + bytes([99]) + valid[5:]
        with self.assertRaisesRegex(ProtocolError, "unsupported protocol version"):
            decode_message(corrupted)

    def test_detects_short_datagram(self):
        with self.assertRaisesRegex(ProtocolError, "shorter than the protocol header"):
            decode_message(b"RDR1\x01\x00")

    def test_rejects_invalid_sequence_and_flags(self):
        with self.assertRaisesRegex(ProtocolError, "sequence must fit"):
            encode_message(Message(MessageType.HELLO, -1))
        with self.assertRaisesRegex(ProtocolError, "sequence must fit"):
            encode_message(Message(MessageType.HELLO, 0x1_0000_0000))
        with self.assertRaisesRegex(ProtocolError, "flags must fit"):
            encode_message(Message(MessageType.HELLO, 1, flags=-1))
        with self.assertRaisesRegex(ProtocolError, "flags must fit"):
            encode_message(Message(MessageType.HELLO, 1, flags=0x1_0000))

    def test_rejects_non_bytes_payload(self):
        with self.assertRaisesRegex(ProtocolError, "payload must be bytes"):
            encode_message(Message(MessageType.HELLO, 1, payload="string-not-bytes"))  # type: ignore

    def test_rejects_invalid_iq_payload(self):
        with self.assertRaisesRegex(ProtocolError, "multiple of four bytes"):
            decode_iq_int16(b"\x00\x01\x02")
        with self.assertRaisesRegex(ProtocolError, "must be in \\[-1, 1\\]"):
            encode_iq_int16([complex(1.5, 0.0)])
        with self.assertRaisesRegex(ProtocolError, "must be finite"):
            encode_iq_int16([complex(float("nan"), 0.0)])

    def test_encode_decode_all_message_types(self):
        for msg_type in MessageType:
            msg = Message(msg_type, sequence=42, payload=b"payload_data", flags=1)
            encoded = encode_message(msg)
            decoded = decode_message(encoded)
            self.assertEqual(decoded.message_type, msg_type)
            self.assertEqual(decoded.sequence, 42)
            self.assertEqual(decoded.payload, b"payload_data")
            self.assertEqual(decoded.flags, 1)

    def test_detection_result_packet_parsing(self):
        # Simulate software round-trip: configure command -> detection result
        config_payload = encode_json_payload({
            "configuration_id": 101,
            "pw_ticks": 100,
            "pri_ticks": 2000,
            "carrier_hz": 2500000.0,
            "pulse_count": 3
        })
        cmd_msg = Message(MessageType.CONFIGURE, sequence=1, payload=config_payload)
        cmd_bytes = encode_message(cmd_msg)
        decoded_cmd = decode_message(cmd_bytes)
        parsed_config = decode_json_payload(decoded_cmd.payload)
        self.assertEqual(parsed_config["configuration_id"], 101)

        # Software-generated synthetic detection response packet
        detection_data = {
            "status": "SIMULATED_NO_HARDWARE",
            "run_id": 1,
            "pulse_id": 3,
            "simulated_range_m": 2997.925,
            "simulated_echo_delay_s": 2e-05,
            "simulated_carrier_hz": 2500000.0,
            "simulated_pw_s": 5e-06,
            "simulated_pri_s": 1e-04,
            "confidence": 1.0,
            "note": "SIMULATED REFERENCE ONLY - NOT A REAL TARGET"
        }
        det_msg = Message(
            MessageType.DETECTION,
            sequence=decoded_cmd.sequence,
            payload=encode_json_payload(detection_data)
        )
        det_bytes = encode_message(det_msg)
        decoded_det = decode_message(det_bytes)
        self.assertEqual(decoded_det.message_type, MessageType.DETECTION)
        self.assertEqual(decoded_det.sequence, 1)
        parsed_result = decode_json_payload(decoded_det.payload)
        self.assertEqual(parsed_result["status"], "SIMULATED_NO_HARDWARE")
        self.assertAlmostEqual(parsed_result["simulated_range_m"], 2997.925, places=3)

    def test_iq_int16_round_trip(self):
        samples = (complex(-1.0, 0.5), complex(0.25, -0.25))
        decoded = decode_iq_int16(encode_iq_int16(samples))
        for expected, actual in zip(samples, decoded):
            self.assertAlmostEqual(actual.real, expected.real, places=4)
            self.assertAlmostEqual(actual.imag, expected.imag, places=4)


class UDPClientTests(unittest.TestCase):
    def test_request_reply_with_local_mock_fpga(self):
        server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        server.bind(("127.0.0.1", 0))
        port = server.getsockname()[1]
        received = []

        def serve_one_request():
            data, client_address = server.recvfrom(1500)
            request = decode_message(data)
            received.append(request)
            response = Message(MessageType.ACK, request.sequence, b"ready")
            server.sendto(encode_message(response), client_address)

        worker = threading.Thread(target=serve_one_request, daemon=True)
        worker.start()
        try:
            with UDPClient("127.0.0.1", port, timeout_s=1.0) as client:
                reply = client.request(
                    MessageType.HELLO,
                    expected_types=(MessageType.ACK,),
                )
            worker.join(timeout=1.0)
            self.assertFalse(worker.is_alive())
            self.assertEqual(received[0].message_type, MessageType.HELLO)
            self.assertEqual(reply.message_type, MessageType.ACK)
            self.assertEqual(reply.sequence, received[0].sequence)
            self.assertEqual(reply.payload, b"ready")
        finally:
            server.close()


if __name__ == "__main__":
    unittest.main()
