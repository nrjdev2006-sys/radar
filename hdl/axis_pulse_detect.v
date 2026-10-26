// =============================================================================
// axis_pulse_detect.v
//
// Tap on the incoming I/Q AXI-Stream. Does not stall the stream.
// For each complex sample computes mag^2 = I^2 + Q^2 and compares it to a
// programmable threshold (set from the radar RF frequency on the PC).
//
// Measured (in sample counts, converted to seconds in the PS):
//   PW  = samples spent continuously above threshold
//   PRI = samples between consecutive rising edges
//   PRF = 1 / PRI   (computed in software)
//
// Threshold is magnitude-squared of 16-bit I/Q, so it is a 32-bit unsigned.
// =============================================================================
`timescale 1ns / 1ps

module axis_pulse_detect (
    input  wire        aclk,
    input  wire        aresetn,

    input  wire        enable,
    input  wire        soft_reset,     // pulse: clear counters / last-edge state
    input  wire [31:0] threshold,      // mag^2 threshold

    // Peek at DMA stream (valid when s_valid & s_ready)
    input  wire        s_valid,
    input  wire        s_ready,
    input  wire [31:0] s_tdata,        // {Q[31:16], I[15:0]} signed
    input  wire        s_tlast,

    output reg  [31:0] pw_samples,     // last completed pulse width
    output reg  [31:0] pri_samples,    // last completed PRI
    output reg  [31:0] pulse_count,
    output reg  [31:0] last_mag2,
    output reg         pulse_valid,    // at least one complete PW captured
    output reg         pri_valid,      // at least one complete PRI captured
    output reg         in_pulse
);

    wire signed [15:0] i_s = s_tdata[15:0];
    wire signed [15:0] q_s = s_tdata[31:16];

    // I^2 + Q^2 : 16x16 signed multiply fits in 32 bits (max 2*32768^2).
    wire signed [31:0] i2 = i_s * i_s;
    wire signed [31:0] q2 = q_s * q_s;
    wire        [31:0] mag2 = $unsigned(i2) + $unsigned(q2);

    wire sample_fire = enable && s_valid && s_ready;
    wire above       = (mag2 >= threshold) && (threshold != 32'd0);

    reg        above_d;
    reg [31:0] pw_acc;
    reg [31:0] since_rise;
    reg        have_rise;

    always @(posedge aclk) begin
        if (!aresetn || soft_reset) begin
            above_d      <= 1'b0;
            in_pulse     <= 1'b0;
            pw_acc       <= 32'd0;
            since_rise   <= 32'd0;
            have_rise    <= 1'b0;
            pw_samples   <= 32'd0;
            pri_samples  <= 32'd0;
            pulse_count  <= 32'd0;
            last_mag2    <= 32'd0;
            pulse_valid  <= 1'b0;
            pri_valid    <= 1'b0;
        end else if (sample_fire) begin
            above_d   <= above;
            last_mag2 <= mag2;

            if (have_rise)
                since_rise <= since_rise + 32'd1;

            if (above && !above_d) begin
                // Rising edge: start of a pulse.
                if (have_rise) begin
                    pri_samples <= since_rise;
                    pri_valid   <= 1'b1;
                end
                since_rise  <= 32'd1;
                have_rise   <= 1'b1;
                in_pulse    <= 1'b1;
                pw_acc      <= 32'd1;
                pulse_count <= pulse_count + 32'd1;
            end else if (!above && above_d) begin
                // Falling edge: latch pulse width.
                pw_samples  <= (pw_acc == 32'd0) ? 32'd1 : pw_acc;
                pulse_valid <= 1'b1;
                in_pulse    <= 1'b0;
                pw_acc      <= 32'd0;
            end else if (in_pulse) begin
                pw_acc <= pw_acc + 32'd1;
            end
        end
    end

    // s_tlast is unused; pulse state persists across DMA frames.
    wire unused_tlast = s_tlast;

endmodule
