// =============================================================================
// radar_core.v
//
// Custom PL core sitting around the Xilinx FFT:
//
//   DMA MM2S  -->  pulse detector (tap) + Hann window  -->  FFT  -->  peak
//                         ^                                      |
//                         +-------- AXI-Lite registers ----------+
//
// AXI-Lite map (byte addresses, 32-bit data):
//   0x00 CONTROL      R/W  [0]enable [1]soft_reset(w1) [2]window_en [3]cfg_kick(w1)
//   0x04 STATUS       RO   [0]peak_valid [1]pulse_valid [2]pri_valid
//                          [3]frame_busy [4]in_pulse
//   0x08 FFT_SIZE     R/W  default 1024
//   0x0C THRESHOLD    R/W  mag^2 pulse threshold (from PC, derived from RF freq)
//   0x10 PEAK_BIN     RO
//   0x14 PEAK_MAG2    RO
//   0x18 DC_MAG2      RO
//   0x1C PW_SAMPLES   RO   last pulse width in samples
//   0x20 PRI_SAMPLES  RO   last PRI in samples
//   0x24 PULSE_COUNT  RO
//   0x28 BINS_SEEN    RO
//   0x2C LAST_MAG2    RO   last time-domain mag^2 (debug)
//   0x30 FRAME_COUNT  RO   completed FFT frames
//   0x34 MAGIC        RO   0x52444152 ("RADR")
//   0x38 SCRATCH      R/W  host identity test
// =============================================================================
`timescale 1ns / 1ps

module radar_core (
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXI:S_AXIS:M_AXIS_FFT:S_AXIS_FFT:M_AXIS_FFT_CONFIG, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000" *)
    input  wire        aclk,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire        aresetn,

    // ---- AXI4-Lite slave ----------------------------------------------------
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR"  *)
    (* X_INTERFACE_PARAMETER = "DATA_WIDTH 32, PROTOCOL AXI4LITE, ADDR_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1" *)
    input  wire [31:0] s_axi_awaddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT"  *) input  wire [2:0]  s_axi_awprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input  wire        s_axi_awvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output reg         s_axi_awready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA"   *) input  wire [31:0] s_axi_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB"   *) input  wire [3:0]  s_axi_wstrb,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID"  *) input  wire        s_axi_wvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY"  *) output reg         s_axi_wready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP"   *) output reg  [1:0]  s_axi_bresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID"  *) output reg         s_axi_bvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY"  *) input  wire        s_axi_bready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR"  *) input  wire [31:0] s_axi_araddr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT"  *) input  wire [2:0]  s_axi_arprot,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input  wire        s_axi_arvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output reg         s_axi_arready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA"   *) output reg  [31:0] s_axi_rdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP"   *) output reg  [1:0]  s_axi_rresp,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID"  *) output reg         s_axi_rvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY"  *) input  wire        s_axi_rready,

    // ---- AXIS from AXI DMA MM2S (I/Q samples) -------------------------------
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *) input  wire [31:0] s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input  wire        s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output wire        s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST"  *) input  wire        s_axis_tlast,

    // ---- AXIS to FFT data input ---------------------------------------------
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TDATA"  *) output wire [31:0] m_axis_fft_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TVALID" *) output wire        m_axis_fft_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TREADY" *) input  wire        m_axis_fft_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TLAST"  *) output wire        m_axis_fft_tlast,

    // ---- AXIS FFT config ----------------------------------------------------
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TDATA"  *) output wire [7:0]  m_axis_fft_config_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TVALID" *) output wire        m_axis_fft_config_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TREADY" *) input  wire        m_axis_fft_config_tready,

    // ---- AXIS from FFT data output ------------------------------------------
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TDATA"  *) input  wire [31:0] s_axis_fft_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TVALID" *) input  wire        s_axis_fft_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TREADY" *) output wire        s_axis_fft_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TLAST"  *) input  wire        s_axis_fft_tlast,

    // Optional status LEDs
    output wire [3:0]  leds
);

    // -------------------------------------------------------------------------
    // Software-visible registers
    // -------------------------------------------------------------------------
    reg        enable;
    reg        soft_reset_r;
    reg        window_enable;
    reg        config_kick;
    reg [15:0] fft_size;
    reg [31:0] threshold;
    reg [31:0] scratch;
    reg [31:0] frame_count;
    reg        peak_valid_d;

    wire        peak_valid;
    wire        pulse_valid;
    wire        pri_valid;
    wire        frame_busy;
    wire        in_pulse;
    wire [15:0] peak_bin;
    wire [31:0] peak_mag2;
    wire [31:0] dc_mag2;
    wire [31:0] pw_samples;
    wire [31:0] pri_samples;
    wire [31:0] pulse_count;
    wire [15:0] bins_seen;
    wire [31:0] last_mag2;

    wire [31:0] status_word = {27'd0, in_pulse, frame_busy, pri_valid, pulse_valid, peak_valid};

    // -------------------------------------------------------------------------
    // AXI-Lite write
    // -------------------------------------------------------------------------
    wire wr_fire = s_axi_awvalid && s_axi_wvalid && (!s_axi_bvalid || s_axi_bready);

    always @(posedge aclk) begin
        if (!aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= 2'b00;
            enable        <= 1'b0;
            soft_reset_r  <= 1'b0;
            window_enable <= 1'b1;
            config_kick   <= 1'b0;
            fft_size      <= 16'd1024;
            threshold     <= 32'd1_000_000;
            scratch       <= 32'hA5A50001;
        end else begin
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            soft_reset_r  <= 1'b0;
            config_kick   <= 1'b0;

            if (s_axi_bvalid && s_axi_bready)
                s_axi_bvalid <= 1'b0;

            if (wr_fire) begin
                s_axi_awready <= 1'b1;
                s_axi_wready  <= 1'b1;
                s_axi_bvalid  <= 1'b1;
                s_axi_bresp   <= 2'b00;
                case (s_axi_awaddr[7:2])
                    6'h00: begin
                        if (s_axi_wstrb[0]) begin
                            enable        <= s_axi_wdata[0];
                            soft_reset_r  <= s_axi_wdata[1];
                            window_enable <= s_axi_wdata[2];
                            config_kick   <= s_axi_wdata[3];
                        end
                    end
                    6'h02: begin
                        if (s_axi_wstrb[0]) fft_size[7:0]  <= s_axi_wdata[7:0];
                        if (s_axi_wstrb[1]) fft_size[15:8] <= s_axi_wdata[15:8];
                    end
                    6'h03: begin
                        if (s_axi_wstrb[0]) threshold[7:0]   <= s_axi_wdata[7:0];
                        if (s_axi_wstrb[1]) threshold[15:8]  <= s_axi_wdata[15:8];
                        if (s_axi_wstrb[2]) threshold[23:16] <= s_axi_wdata[23:16];
                        if (s_axi_wstrb[3]) threshold[31:24] <= s_axi_wdata[31:24];
                    end
                    6'h0E: begin
                        if (s_axi_wstrb[0]) scratch[7:0]   <= s_axi_wdata[7:0];
                        if (s_axi_wstrb[1]) scratch[15:8]  <= s_axi_wdata[15:8];
                        if (s_axi_wstrb[2]) scratch[23:16] <= s_axi_wdata[23:16];
                        if (s_axi_wstrb[3]) scratch[31:24] <= s_axi_wdata[31:24];
                    end
                    default: ;
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // AXI-Lite read
    // -------------------------------------------------------------------------
    always @(posedge aclk) begin
        if (!aresetn) begin
            s_axi_arready <= 1'b0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rdata   <= 32'd0;
            s_axi_rresp   <= 2'b00;
        end else begin
            s_axi_arready <= 1'b0;
            if (s_axi_rvalid && s_axi_rready)
                s_axi_rvalid <= 1'b0;

            if (s_axi_arvalid && (!s_axi_rvalid || s_axi_rready)) begin
                s_axi_arready <= 1'b1;
                s_axi_rvalid  <= 1'b1;
                s_axi_rresp   <= 2'b00;
                case (s_axi_araddr[7:2])
                    6'h00: s_axi_rdata <= {28'd0, 1'b0, window_enable, 1'b0, enable};
                    6'h01: s_axi_rdata <= status_word;
                    6'h02: s_axi_rdata <= {16'd0, fft_size};
                    6'h03: s_axi_rdata <= threshold;
                    6'h04: s_axi_rdata <= {16'd0, peak_bin};
                    6'h05: s_axi_rdata <= peak_mag2;
                    6'h06: s_axi_rdata <= dc_mag2;
                    6'h07: s_axi_rdata <= pw_samples;
                    6'h08: s_axi_rdata <= pri_samples;
                    6'h09: s_axi_rdata <= pulse_count;
                    6'h0A: s_axi_rdata <= {16'd0, bins_seen};
                    6'h0B: s_axi_rdata <= last_mag2;
                    6'h0C: s_axi_rdata <= frame_count;
                    6'h0D: s_axi_rdata <= 32'h52444152; // "RADR"
                    6'h0E: s_axi_rdata <= scratch;
                    default: s_axi_rdata <= 32'hDEADBEEF;
                endcase
            end
        end
    end

    // Count completed FFT frames
    always @(posedge aclk) begin
        if (!aresetn || soft_reset_r)
            frame_count <= 32'd0;
        else begin
            peak_valid_d <= peak_valid;
            if (peak_valid && !peak_valid_d)
                frame_count <= frame_count + 32'd1;
        end
    end

    // -------------------------------------------------------------------------
    // Datapath
    // -------------------------------------------------------------------------
    axis_pulse_detect u_pulse (
        .aclk        (aclk),
        .aresetn     (aresetn),
        .enable      (enable),
        .soft_reset  (soft_reset_r),
        .threshold   (threshold),
        .s_valid     (s_axis_tvalid),
        .s_ready     (s_axis_tready),
        .s_tdata     (s_axis_tdata),
        .s_tlast     (s_axis_tlast),
        .pw_samples  (pw_samples),
        .pri_samples (pri_samples),
        .pulse_count (pulse_count),
        .last_mag2   (last_mag2),
        .pulse_valid (pulse_valid),
        .pri_valid   (pri_valid),
        .in_pulse    (in_pulse)
    );

    axis_window u_window (
        .aclk           (aclk),
        .aresetn        (aresetn),
        .enable         (enable),
        .window_enable  (window_enable),
        .fft_size       (fft_size),
        .s_tdata        (s_axis_tdata),
        .s_tvalid       (s_axis_tvalid),
        .s_tready       (s_axis_tready),
        .s_tlast        (s_axis_tlast),
        .m_tdata        (m_axis_fft_tdata),
        .m_tvalid       (m_axis_fft_tvalid),
        .m_tready       (m_axis_fft_tready),
        .m_tlast        (m_axis_fft_tlast)
    );

    fft_config_master u_fft_cfg (
        .aclk        (aclk),
        .aresetn     (aresetn),
        .config_kick (config_kick),
        .m_tdata     (m_axis_fft_config_tdata),
        .m_tvalid    (m_axis_fft_config_tvalid),
        .m_tready    (m_axis_fft_config_tready)
    );

    axis_peak_detect u_peak (
        .aclk           (aclk),
        .aresetn        (aresetn),
        .enable         (enable),
        .s_tdata        (s_axis_fft_tdata),
        .s_tvalid       (s_axis_fft_tvalid),
        .s_tready       (s_axis_fft_tready),
        .s_tlast        (s_axis_fft_tlast),
        .peak_bin       (peak_bin),
        .peak_mag2      (peak_mag2),
        .dc_mag2        (dc_mag2),
        .bins_seen      (bins_seen),
        .peak_valid     (peak_valid),
        .frame_busy     (frame_busy),
        .overflow_dummy ()
    );

    // Heartbeat + status LEDs
    reg [24:0] hb;
    always @(posedge aclk) begin
        if (!aresetn) hb <= 25'd0;
        else          hb <= hb + 25'd1;
    end
    assign leds = {hb[24], in_pulse, peak_valid, enable};

    wire unused_prot = |s_axi_awprot | |s_axi_arprot;

endmodule
