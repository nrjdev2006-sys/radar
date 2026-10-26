// =============================================================================
// axis_peak_detect.v
//
// Consumes the Xilinx FFT AXI-Stream output (natural order) and finds the
// strongest non-DC bin using mag^2 = Re^2 + Im^2 (no square root).
//
// tdata = {Im[31:16], Re[15:0]}  (matches xfft 16-bit scaled output)
// =============================================================================
`timescale 1ns / 1ps

module axis_peak_detect (
    input  wire        aclk,
    input  wire        aresetn,

    input  wire        enable,

    input  wire [31:0] s_tdata,
    input  wire        s_tvalid,
    output wire        s_tready,
    input  wire        s_tlast,

    output reg  [15:0] peak_bin,
    output reg  [31:0] peak_mag2,
    output reg  [31:0] dc_mag2,
    output reg  [15:0] bins_seen,
    output reg         peak_valid,     // held until next frame starts
    output reg         frame_busy,
    output             overflow_dummy
);

    // Always ready: FFT is the producer and we must not stall it for long.
    assign s_tready = 1'b1;
    assign overflow_dummy = 1'b0;

    wire fire = s_tvalid && s_tready && enable;

    wire signed [15:0] re_s = s_tdata[15:0];
    wire signed [15:0] im_s = s_tdata[31:16];
    wire signed [31:0] re2  = re_s * re_s;
    wire signed [31:0] im2  = im_s * im_s;
    wire        [31:0] mag2 = $unsigned(re2) + $unsigned(im2);

    reg [15:0] bin_idx;
    reg [15:0] run_bin;
    reg [31:0] run_mag2;

    reg [15:0] next_bin;
    reg [31:0] next_mag;

    always @(*) begin
        if (bin_idx == 16'd0) begin
            next_bin = 16'd0;
            next_mag = 32'd0;
        end else if (mag2 > run_mag2) begin
            next_bin = bin_idx;
            next_mag = mag2;
        end else begin
            next_bin = run_bin;
            next_mag = run_mag2;
        end
    end

    always @(posedge aclk) begin
        if (!aresetn) begin
            bin_idx    <= 16'd0;
            run_bin    <= 16'd0;
            run_mag2   <= 32'd0;
            peak_bin   <= 16'd0;
            peak_mag2  <= 32'd0;
            dc_mag2    <= 32'd0;
            bins_seen  <= 16'd0;
            peak_valid <= 1'b0;
            frame_busy <= 1'b0;
        end else if (fire) begin
            frame_busy <= 1'b1;

            if (bin_idx == 16'd0)
                dc_mag2 <= mag2;

            if (s_tlast) begin
                peak_bin   <= next_bin;
                peak_mag2  <= next_mag;
                bins_seen  <= bin_idx + 16'd1;
                peak_valid <= 1'b1;
                frame_busy <= 1'b0;
                bin_idx    <= 16'd0;
                run_bin    <= 16'd0;
                run_mag2   <= 32'd0;
            end else begin
                run_bin  <= next_bin;
                run_mag2 <= next_mag;
                bin_idx  <= bin_idx + 16'd1;
            end
        end
    end

endmodule
