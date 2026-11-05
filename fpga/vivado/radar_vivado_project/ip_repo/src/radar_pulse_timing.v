`timescale 1ns/1ps

// Board-independent pulse timing core. All timing is measured in clk cycles.
// The PS or another control block should hold start/stop for at least one clk.
module radar_pulse_timing #(
    parameter COUNTER_WIDTH = 32
) (
    input  wire                      clk,
    input  wire                      rst_n,
    input  wire                      start,
    input  wire                      stop,
    input  wire [COUNTER_WIDTH-1:0]  cfg_pw_ticks,
    input  wire [COUNTER_WIDTH-1:0]  cfg_pri_ticks,
    output reg                       tx_gate,
    output reg                       busy,
    output reg                       config_error,
    output reg                       pulse_start
);

    reg [COUNTER_WIDTH-1:0] active_pw_ticks;
    reg [COUNTER_WIDTH-1:0] active_pri_ticks;
    reg [COUNTER_WIDTH-1:0] period_count;
    reg [COUNTER_WIDTH-1:0] pulse_count;

    wire config_valid;
    assign config_valid = (cfg_pw_ticks != {COUNTER_WIDTH{1'b0}}) &&
                          (cfg_pri_ticks > cfg_pw_ticks);

    always @(posedge clk) begin
        if (!rst_n) begin
            active_pw_ticks  <= {COUNTER_WIDTH{1'b0}};
            active_pri_ticks <= {COUNTER_WIDTH{1'b0}};
            period_count     <= {COUNTER_WIDTH{1'b0}};
            pulse_count      <= {COUNTER_WIDTH{1'b0}};
            tx_gate          <= 1'b0;
            busy             <= 1'b0;
            config_error     <= 1'b0;
            pulse_start      <= 1'b0;
        end else begin
            pulse_start <= 1'b0;

            if (stop) begin
                tx_gate      <= 1'b0;
                busy         <= 1'b0;
                period_count <= {COUNTER_WIDTH{1'b0}};
                pulse_count  <= {COUNTER_WIDTH{1'b0}};
            end else if (!busy) begin
                if (start) begin
                    if (config_valid) begin
                        active_pw_ticks  <= cfg_pw_ticks;
                        active_pri_ticks <= cfg_pri_ticks;
                        period_count     <= {COUNTER_WIDTH{1'b0}};
                        pulse_count      <= {COUNTER_WIDTH{1'b0}};
                        tx_gate          <= 1'b1;
                        busy             <= 1'b1;
                        config_error     <= 1'b0;
                        pulse_start      <= 1'b1;
                    end else begin
                        tx_gate      <= 1'b0;
                        busy         <= 1'b0;
                        config_error <= 1'b1;
                    end
                end
            end else begin
                // A start edge now occurs every active_pri_ticks clocks.
                if (period_count == active_pri_ticks - 1'b1) begin
                    period_count <= {COUNTER_WIDTH{1'b0}};
                    tx_gate      <= 1'b1;
                    pulse_count  <= {COUNTER_WIDTH{1'b0}};
                    pulse_start  <= 1'b1;
                end else begin
                    period_count <= period_count + 1'b1;
                end

                // The gate is high for exactly active_pw_ticks clocks.
                if (tx_gate) begin
                    if (pulse_count >= active_pw_ticks - 1'b1) begin
                        tx_gate     <= 1'b0;
                        pulse_count <= {COUNTER_WIDTH{1'b0}};
                    end else begin
                        pulse_count <= pulse_count + 1'b1;
                    end
                end
            end
        end
    end

endmodule
