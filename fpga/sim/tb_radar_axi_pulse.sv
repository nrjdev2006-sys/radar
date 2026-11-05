`timescale 1ns/1ps

module tb_radar_axi_pulse;
    reg clk = 1'b0;
    reg resetn = 1'b0;
    reg [5:0] awaddr = 0;
    reg awvalid = 0;
    wire awready;
    reg [31:0] wdata = 0;
    reg [3:0] wstrb = 4'hF;
    reg wvalid = 0;
    wire wready;
    wire [1:0] bresp;
    wire bvalid;
    reg bready = 0;
    reg [5:0] araddr = 0;
    reg arvalid = 0;
    wire arready;
    wire [31:0] rdata;
    wire [1:0] rresp;
    wire rvalid;
    reg rready = 0;
    wire tx_gate;

    integer cycle_number = 0;
    integer rise_count = 0;
    integer fall_count = 0;
    integer previous_rise = -1;
    reg previous_gate = 0;
    reg [31:0] read_value;
    reg [1:0] read_response;

    radar_axi_pulse #(.COUNTER_WIDTH(8)) dut (
        .s_axi_aclk(clk), .s_axi_aresetn(resetn),
        .s_axi_awaddr(awaddr), .s_axi_awvalid(awvalid), .s_axi_awready(awready),
        .s_axi_wdata(wdata), .s_axi_wstrb(wstrb), .s_axi_wvalid(wvalid), .s_axi_wready(wready),
        .s_axi_bresp(bresp), .s_axi_bvalid(bvalid), .s_axi_bready(bready),
        .s_axi_araddr(araddr), .s_axi_arvalid(arvalid), .s_axi_arready(arready),
        .s_axi_rdata(rdata), .s_axi_rresp(rresp), .s_axi_rvalid(rvalid), .s_axi_rready(rready),
        .tx_gate(tx_gate)
    );

    always #5 clk = ~clk;

    always @(posedge clk) begin
        #1;
        cycle_number = cycle_number + 1;
        if (tx_gate && !previous_gate) begin
            if (previous_rise >= 0 && cycle_number - previous_rise != 8)
                $fatal(1, "AXI configured PRI mismatch: got %0d clocks", cycle_number - previous_rise);
            previous_rise = cycle_number;
            rise_count = rise_count + 1;
        end
        if (!tx_gate && previous_gate) begin
            if (cycle_number - previous_rise != 3)
                $fatal(1, "AXI configured PW mismatch: got %0d clocks", cycle_number - previous_rise);
            fall_count = fall_count + 1;
        end
        previous_gate = tx_gate;
    end

    task axi_write;
        input [5:0] address;
        input [31:0] value;
        input [3:0] strobe;
        begin
            // Send AW and W in separate transfers to verify independent channels.
            @(negedge clk); awaddr = address; awvalid = 1'b1;
            @(posedge clk);
            if (!awready) $fatal(1, "AXI AW channel was not ready");
            @(negedge clk); awvalid = 1'b0;

            @(negedge clk); wdata = value; wstrb = strobe; wvalid = 1'b1;
            @(posedge clk);
            if (!wready) $fatal(1, "AXI W channel was not ready");
            #1;
            if (!bvalid) $fatal(1, "AXI write response was not produced");
            if (bresp != 2'b00)
                $fatal(1, "AXI write to address %0h returned BRESP=%0b", address, bresp);
            @(negedge clk); wvalid = 1'b0; bready = 1'b1;
            @(posedge clk);
            @(negedge clk); bready = 1'b0;
        end
    endtask

    task axi_read;
        input [5:0] address;
        output [31:0] value;
        output [1:0] response;
        begin
            @(negedge clk); araddr = address; arvalid = 1'b1;
            @(posedge clk);
            if (!arready) $fatal(1, "AXI AR channel was not ready");
            #1;
            if (!rvalid) $fatal(1, "AXI read response was not produced");
            value = rdata;
            response = rresp;
            @(negedge clk); arvalid = 1'b0; rready = 1'b1;
            @(posedge clk);
            @(negedge clk); rready = 1'b0;
        end
    endtask

    initial begin
        #30;
        @(negedge clk); resetn = 1'b1;

        axi_write(6'h04, 32'd3, 4'hF);
        axi_write(6'h08, 32'd8, 4'hF);
        axi_read(6'h04, read_value, read_response);
        if (read_response != 2'b00 || read_value != 3)
            $fatal(1, "PW register readback failed");
        axi_read(6'h08, read_value, read_response);
        if (read_response != 2'b00 || read_value != 8)
            $fatal(1, "PRI register readback failed");

        axi_write(6'h00, 32'd1, 4'h1);
        wait (rise_count == 3 && fall_count == 3);
        axi_read(6'h10, read_value, read_response);
        if (read_response != 2'b00 || read_value != 3)
            $fatal(1, "pulse count register mismatch: got %0d", read_value);
        axi_read(6'h0C, read_value, read_response);
        if (read_response != 2'b00 || !(read_value & 1))
            $fatal(1, "busy status did not stay set during pulse train");

        axi_write(6'h00, 32'd2, 4'h1);
        axi_read(6'h0C, read_value, read_response);
        if (read_response != 2'b00 || (read_value & 5) != 0)
            $fatal(1, "stop did not clear busy and transmit gate");

        axi_write(6'h04, 32'd8, 4'hF);
        axi_write(6'h08, 32'd8, 4'hF);
        axi_write(6'h00, 32'd1, 4'h1);
        axi_read(6'h0C, read_value, read_response);
        if (read_response != 2'b00 || !(read_value & 2) || (read_value & 1))
            $fatal(1, "invalid configuration was not reported through status");

        axi_write(6'h04, 32'd3, 4'hF);
        axi_write(6'h08, 32'd8, 4'hF);
        previous_rise = -1;
        axi_write(6'h00, 32'd1, 4'h1);
        axi_read(6'h0C, read_value, read_response);
        if (read_response != 2'b00 || (read_value & 2) || !(read_value & 1))
            $fatal(1, "valid start did not clear configuration error");
        axi_write(6'h00, 32'd2, 4'h1);

        axi_read(6'h14, read_value, read_response);
        if (read_response != 2'b10)
            $fatal(1, "unmapped register did not return SLVERR (RRESP=%b)", read_response);

        $display("PASS: AXI-Lite register access and PL pulse control");
        $finish;
    end

    initial begin
        #20000;
        $fatal(1, "AXI simulation timed out");
    end
endmodule
