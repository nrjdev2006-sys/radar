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
