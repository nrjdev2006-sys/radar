// =============================================================================
// fft_config_master.v
//
// One-shot AXI-Stream master for the Xilinx FFT S_AXIS_CONFIG channel.
// Fixed-length (non run-time-configurable) pipelined FFT: TDATA bit 0 is
// FWD_INV (1 = forward FFT). Sent once after coming out of reset, and again
// whenever a config_kick pulse is received (e.g. after a software reset).
// =============================================================================
`timescale 1ns / 1ps

module fft_config_master (
    input  wire        aclk,
    input  wire        aresetn,
    input  wire        config_kick,

    output reg  [7:0]  m_tdata,
    output reg         m_tvalid,
    input  wire        m_tready
);

    localparam [7:0] FWD = 8'h01;   // forward FFT

    reg kicked;

    always @(posedge aclk) begin
        if (!aresetn) begin
            m_tdata  <= FWD;
            m_tvalid <= 1'b1;
            kicked   <= 1'b0;
        end else begin
            if (m_tvalid && m_tready)
                m_tvalid <= 1'b0;

            if (config_kick && !kicked) begin
                m_tdata  <= FWD;
                m_tvalid <= 1'b1;
                kicked   <= 1'b1;
            end else if (!config_kick) begin
                kicked <= 1'b0;
            end
        end
    end

endmodule
