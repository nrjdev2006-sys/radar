`timescale 1ns/1ps

module tb_radar_pulse_timing;
    reg clk = 1'b0;
    reg rst_n = 1'b0;
    reg start = 1'b0;
    reg stop = 1'b0;
    reg [7:0] cfg_pw_ticks = 8'd3;
    reg [7:0] cfg_pri_ticks = 8'd8;
    wire tx_gate;
    wire busy;
    wire config_error;
    wire pulse_start;

    integer cycle_number = 0;
    integer rise_count = 0;
    integer fall_count = 0;
    integer pulse_start_count = 0;
    integer previous_rise = -1;
    integer previous_fall = -1;
    reg previous_gate = 1'b0;

    radar_pulse_timing #(.COUNTER_WIDTH(8)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .stop(stop),
        .cfg_pw_ticks(cfg_pw_ticks),
        .cfg_pri_ticks(cfg_pri_ticks),
        .tx_gate(tx_gate),
        .busy(busy),
        .config_error(config_error),
        .pulse_start(pulse_start)
    );

    always #5 clk = ~clk;

    // Observe registered outputs just after each active clock edge.
    always @(posedge clk) begin
        #1;
        cycle_number = cycle_number + 1;
        if (tx_gate && !previous_gate) begin
            if (previous_rise >= 0 && (cycle_number - previous_rise) != 8)
                $fatal(1, "PRI mismatch: expected 8 clocks, got %0d", cycle_number - previous_rise);
            previous_rise = cycle_number;
            rise_count = rise_count + 1;
        end
        if (!tx_gate && previous_gate) begin
            if ((cycle_number - previous_rise) != 3)
                $fatal(1, "PW mismatch: expected 3 clocks, got %0d", cycle_number - previous_rise);
            previous_fall = cycle_number;
            fall_count = fall_count + 1;
        end
        if (pulse_start)
            pulse_start_count = pulse_start_count + 1;
        previous_gate = tx_gate;
    end

    initial begin
        #20;
        @(negedge clk);
        rst_n = 1'b1;

        // Three valid pulses must have the requested width and repetition interval.
        @(negedge clk);
        start = 1'b1;
        @(negedge clk);
        start = 1'b0;
        wait (rise_count == 3 && fall_count == 3);
        if (!busy || config_error || pulse_start_count != 3)
            $fatal(1, "valid pulse train did not remain active cleanly");

        @(negedge clk);
        stop = 1'b1;
        @(negedge clk);
        stop = 1'b0;
        #2;
        if (busy || tx_gate)
            $fatal(1, "stop did not disable the pulse generator");

        // Equal PW and PRI is invalid and must not start the output.
        cfg_pw_ticks = 8'd8;
        cfg_pri_ticks = 8'd8;
        @(negedge clk);
        start = 1'b1;
        @(negedge clk);
        start = 1'b0;
        #2;
        if (!config_error || busy || tx_gate)
            $fatal(1, "invalid configuration was not rejected");

        // A valid restart clears the sticky configuration error.
        cfg_pw_ticks = 8'd3;
        cfg_pri_ticks = 8'd8;
        @(negedge clk);
        start = 1'b1;
        @(negedge clk);
        start = 1'b0;
        #2;
        if (config_error || !busy || !tx_gate)
            $fatal(1, "valid restart did not clear error and start");

        $display("PASS: pulse width, PRI, stop, and invalid-config checks");
        $finish;
    end

    initial begin
        #10000;
        $fatal(1, "simulation timed out");
    end
endmodule
