// =============================================================================
// tb_pulse_detect.v
// Drive a pulsed complex tone through axis_pulse_detect and check PW / PRI.
// Run with:  xvlog ../axis_pulse_detect.v tb_pulse_detect.v ; xelab tb_pulse_detect -R
//           or iverilog -o tb.vvp ../axis_pulse_detect.v tb_pulse_detect.v && vvp tb.vvp
// =============================================================================
`timescale 1ns / 1ps

module tb_pulse_detect;
    reg         aclk = 0;
    always #5 aclk = ~aclk;   // 100 MHz

    reg         aresetn = 0;
    reg         enable  = 0;
    reg         soft_reset = 0;
    reg  [31:0] threshold;
    reg         s_valid = 0;
    reg         s_ready = 1;
    reg  [31:0] s_tdata = 0;
    reg         s_tlast = 0;

    wire [31:0] pw_samples, pri_samples, pulse_count, last_mag2;
    wire        pulse_valid, pri_valid, in_pulse;

    axis_pulse_detect dut (
        .aclk(aclk), .aresetn(aresetn), .enable(enable),
        .soft_reset(soft_reset), .threshold(threshold),
        .s_valid(s_valid), .s_ready(s_ready), .s_tdata(s_tdata), .s_tlast(s_tlast),
        .pw_samples(pw_samples), .pri_samples(pri_samples),
        .pulse_count(pulse_count), .last_mag2(last_mag2),
        .pulse_valid(pulse_valid), .pri_valid(pri_valid), .in_pulse(in_pulse)
    );

    localparam integer PW  = 50;
    localparam integer PRI = 200;
    localparam signed [15:0] AMP = 16'sd16000;
    // mag^2 = 2*16000^2 = 512000000; threshold well below that
    initial threshold = 32'd10_000_000;

    integer n, errors;
    initial begin
        errors = 0;
        repeat (5) @(posedge aclk);
        aresetn <= 1;
        enable  <= 1;
        repeat (2) @(posedge aclk);

        // Three pulses
        for (n = 0; n < 3*PRI; n = n + 1) begin
            @(posedge aclk);
            s_valid <= 1;
            if ((n % PRI) < PW)
                s_tdata <= {AMP, AMP};
            else
                s_tdata <= 32'd0;
            s_tlast <= 1'b0;
        end
        @(posedge aclk);
        s_valid <= 0;

        repeat (5) @(posedge aclk);

        $display("PW samples  = %0d (expect %0d)", pw_samples, PW);
        $display("PRI samples = %0d (expect %0d)", pri_samples, PRI);
        $display("Pulse count = %0d (expect 3)", pulse_count);

        if (pw_samples != PW)   errors = errors + 1;
        if (pri_samples != PRI) errors = errors + 1;
        if (pulse_count != 3)   errors = errors + 1;
        if (!pulse_valid || !pri_valid) errors = errors + 1;

        if (errors == 0) $display("PASS");
        else             $display("FAIL (%0d errors)", errors);
        $finish;
    end
endmodule
