`timescale 1ns/1ps

// AXI4-Lite register wrapper for the board-independent pulse timing core.
// AXI clock and pulse-core clock are intentionally the same clock in this v1.
module radar_axi_pulse #(
    parameter COUNTER_WIDTH = 32
) (
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK",
       X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN" *)
    input  wire        s_axi_aclk,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST",
       X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire        s_axi_aresetn,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
    input  wire [5:0]  s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
    input  wire        s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
    output wire        s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
    input  wire [31:0] s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
    input  wire [3:0]  s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
    input  wire        s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
    output wire        s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
    output wire [1:0]  s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
    output reg         s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
    input  wire        s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
    input  wire [5:0]  s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
    input  wire        s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
    output wire        s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
    output reg  [31:0] s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
    output wire [1:0]  s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
    output reg         s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
    input  wire        s_axi_rready,
    output wire        tx_gate
);

    localparam [5:0] REG_CONTROL    = 6'h00;
    localparam [5:0] REG_PW_TICKS   = 6'h04;
    localparam [5:0] REG_PRI_TICKS  = 6'h08;
    localparam [5:0] REG_STATUS     = 6'h0C;
    localparam [5:0] REG_PULSE_COUNT = 6'h10;

    reg [5:0] awaddr_hold;
    reg [31:0] wdata_hold;
    reg [3:0] wstrb_hold;
    reg aw_hold_valid;
    reg w_hold_valid;
    reg [31:0] pw_ticks_reg;
    reg [31:0] pri_ticks_reg;
    reg start_request;
    reg stop_request;
    reg bresp_error;
    reg rresp_error;
    reg [31:0] pulse_count_reg;

    wire [5:0] write_addr = aw_hold_valid ? awaddr_hold : s_axi_awaddr;
    wire [31:0] write_data = w_hold_valid ? wdata_hold : s_axi_wdata;
    wire [3:0] write_strb = w_hold_valid ? wstrb_hold : s_axi_wstrb;
    wire aw_handshake = s_axi_awvalid && s_axi_awready;
    wire w_handshake = s_axi_wvalid && s_axi_wready;
    wire have_aw = aw_hold_valid || aw_handshake;
    wire have_w = w_hold_valid || w_handshake;
    wire core_busy;
    wire core_config_error;
    wire core_pulse_start;
    integer byte_index;

    assign s_axi_awready = !aw_hold_valid && !s_axi_bvalid;
    assign s_axi_wready  = !w_hold_valid && !s_axi_bvalid;
    assign s_axi_arready = !s_axi_rvalid;
    assign s_axi_bresp = {bresp_error, 1'b0};
    assign s_axi_rresp = {rresp_error, 1'b0};

    radar_pulse_timing #(.COUNTER_WIDTH(COUNTER_WIDTH)) pulse_core (
        .clk(s_axi_aclk),
        .rst_n(s_axi_aresetn),
        .start(start_request),
        .stop(stop_request),
        .cfg_pw_ticks(pw_ticks_reg[COUNTER_WIDTH-1:0]),
        .cfg_pri_ticks(pri_ticks_reg[COUNTER_WIDTH-1:0]),
        .tx_gate(tx_gate),
        .busy(core_busy),
        .config_error(core_config_error),
        .pulse_start(core_pulse_start)
    );

    always @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            awaddr_hold    <= 6'b0;
            wdata_hold     <= 32'b0;
            wstrb_hold     <= 4'b0;
            aw_hold_valid  <= 1'b0;
            w_hold_valid   <= 1'b0;
            pw_ticks_reg   <= 32'b0;
            pri_ticks_reg  <= 32'b0;
            start_request  <= 1'b0;
            stop_request   <= 1'b0;
            pulse_count_reg <= 32'b0;
            bresp_error   <= 1'b0;
            s_axi_bvalid   <= 1'b0;
            s_axi_rdata    <= 32'b0;
            rresp_error   <= 1'b0;
            s_axi_rvalid   <= 1'b0;
        end else begin
            start_request <= 1'b0;
            stop_request  <= 1'b0;

            if (core_pulse_start)
                pulse_count_reg <= pulse_count_reg + 1'b1;

            if (aw_handshake) begin
                awaddr_hold <= s_axi_awaddr;
                aw_hold_valid <= 1'b1;
            end
            if (w_handshake) begin
                wdata_hold <= s_axi_wdata;
                wstrb_hold <= s_axi_wstrb;
                w_hold_valid <= 1'b1;
            end

            if (s_axi_bvalid && s_axi_bready)
                s_axi_bvalid <= 1'b0;

            if (have_aw && have_w && !s_axi_bvalid) begin
                aw_hold_valid <= 1'b0;
                w_hold_valid <= 1'b0;
                s_axi_bvalid <= 1'b1;

                if ((write_addr[1:0] != 2'b00) ||
                    !((write_addr == REG_CONTROL) ||
                      (write_addr == REG_PW_TICKS) ||
                      (write_addr == REG_PRI_TICKS))) begin
                    bresp_error <= 1'b1; // SLVERR: unsupported or unaligned address
                end else begin
                    bresp_error <= 1'b0;
                    case (write_addr)
                        REG_CONTROL: begin
                            if (write_strb[0]) begin
                                start_request <= write_data[0];
                                stop_request <= write_data[1];
                            end
                        end
                        REG_PW_TICKS: begin
                            for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1)
                                if (write_strb[byte_index])
                                    pw_ticks_reg[byte_index*8 +: 8] <= write_data[byte_index*8 +: 8];
                        end
                        REG_PRI_TICKS: begin
                            for (byte_index = 0; byte_index < 4; byte_index = byte_index + 1)
                                if (write_strb[byte_index])
                                    pri_ticks_reg[byte_index*8 +: 8] <= write_data[byte_index*8 +: 8];
                        end
                        default: begin
                        end
                    endcase
                end
            end

            if (s_axi_rvalid && s_axi_rready)
                s_axi_rvalid <= 1'b0;

            if (s_axi_arvalid && s_axi_arready) begin
                s_axi_rvalid <= 1'b1;
                case (s_axi_araddr)
                    REG_PW_TICKS: begin
                        s_axi_rdata <= pw_ticks_reg;
                        rresp_error <= 1'b0;
                    end
                    REG_PRI_TICKS: begin
                        s_axi_rdata <= pri_ticks_reg;
                        rresp_error <= 1'b0;
                    end
                    REG_STATUS: begin
                        s_axi_rdata <= {29'b0, tx_gate, core_config_error, core_busy};
                        rresp_error <= 1'b0;
                    end
                    REG_PULSE_COUNT: begin
                        s_axi_rdata <= pulse_count_reg;
                        rresp_error <= 1'b0;
                    end
                    default: begin
                        s_axi_rdata <= 32'b0;
                        rresp_error <= 1'b1; // SLVERR: unsupported address
                    end
                endcase
            end
        end
    end

endmodule
