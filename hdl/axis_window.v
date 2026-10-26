// =============================================================================
// axis_window.v
//
// Optional Hann window in front of the FFT.
// Coefficient ROM is 1024 x Q1.15 (0..32767). For FFT_SIZE != 1024 the
// address is scaled: addr = n * 1024 / fft_size.
//
// Bypass when window_enable = 0 (pass-through, registered handshake).
// Data format: {Q[31:16], I[15:0]} signed 16-bit.
// =============================================================================
`timescale 1ns / 1ps

module axis_window #(
    parameter integer ROM_LEN = 1024
)(
    input  wire        aclk,
    input  wire        aresetn,

    input  wire        enable,
    input  wire        window_enable,
    input  wire [15:0] fft_size,       // 256, 512, 1024, ...

    input  wire [31:0] s_tdata,
    input  wire        s_tvalid,
    output wire        s_tready,
    input  wire        s_tlast,

    output reg  [31:0] m_tdata,
    output reg         m_tvalid,
    input  wire        m_tready,
    output reg         m_tlast
);

    wire fire_in  = s_tvalid && s_tready;
    wire fire_out = m_tvalid && m_tready;
    assign s_tready = (~m_tvalid) || m_tready;

    reg [15:0] n_count;

    // addr = n * ROM_LEN / fft_size  (fft_size is a power of two)
    wire [15:0] size_m1 = (fft_size == 16'd0) ? 16'd1024 : fft_size;
    wire [25:0] addr_full = n_count * ROM_LEN;
    // Divide by power-of-two via shift selected from fft_size.
    reg  [9:0]  rom_addr;
    always @(*) begin
        case (size_m1)
            16'd256:  rom_addr = addr_full[17:8];   // /256
            16'd512:  rom_addr = addr_full[18:9];   // /512
            16'd2048: rom_addr = addr_full[20:11];  // /2048, saturates to 10-bit
            16'd4096: rom_addr = addr_full[21:12];
            default:  rom_addr = addr_full[19:10];  // /1024
        endcase
    end

    wire [15:0] w_q15;
    hann_rom u_hann (
        .addr (rom_addr),
        .data (w_q15)
    );

    wire signed [15:0] i_s = s_tdata[15:0];
    wire signed [15:0] q_s = s_tdata[31:16];

    // signed 16 * unsigned Q1.15 -> keep bits [30:15]
    wire signed [31:0] i_w = i_s * $signed({1'b0, w_q15});
    wire signed [31:0] q_w = q_s * $signed({1'b0, w_q15});
    wire signed [15:0] i_o = i_w[30:15];
    wire signed [15:0] q_o = q_w[30:15];

    always @(posedge aclk) begin
        if (!aresetn) begin
            m_tdata  <= 32'd0;
            m_tvalid <= 1'b0;
            m_tlast  <= 1'b0;
            n_count  <= 16'd0;
        end else begin
            if (fire_out)
                m_tvalid <= 1'b0;

            if (fire_in) begin
                if (!enable) begin
                    m_tdata  <= s_tdata;
                end else if (window_enable) begin
                    m_tdata  <= {q_o, i_o};
                end else begin
                    m_tdata  <= s_tdata;
                end
                m_tvalid <= 1'b1;
                m_tlast  <= s_tlast;

                if (s_tlast)
                    n_count <= 16'd0;
                else
                    n_count <= n_count + 16'd1;
            end
        end
    end

endmodule
