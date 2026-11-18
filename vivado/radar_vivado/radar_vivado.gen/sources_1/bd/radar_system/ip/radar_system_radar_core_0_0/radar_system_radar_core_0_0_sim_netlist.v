// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov  3 10:27:41 2026
// Host        : DESKTOP-FKE42VV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Dell/zynq-radar-sp/vivado/radar_vivado/radar_vivado.gen/sources_1/bd/radar_system/ip/radar_system_radar_core_0_0/radar_system_radar_core_0_0_sim_netlist.v
// Design      : radar_system_radar_core_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "radar_system_radar_core_0_0,radar_core,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "radar_core,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module radar_system_radar_core_0_0
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,
    m_axis_fft_tdata,
    m_axis_fft_tvalid,
    m_axis_fft_tready,
    m_axis_fft_tlast,
    m_axis_fft_config_tdata,
    m_axis_fft_config_tvalid,
    m_axis_fft_config_tready,
    s_axis_fft_tdata,
    s_axis_fft_tvalid,
    s_axis_fft_tready,
    s_axis_fft_tlast,
    leds);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF S_AXI:S_AXIS:M_AXIS_FFT:S_AXIS_FFT:M_AXIS_FFT_CONFIG, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, ADDR_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_FFT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_fft_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TVALID" *) output m_axis_fft_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TREADY" *) input m_axis_fft_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT TLAST" *) output m_axis_fft_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_FFT_CONFIG, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [7:0]m_axis_fft_config_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TVALID" *) output m_axis_fft_config_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TREADY" *) input m_axis_fft_config_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_FFT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value vect} size {attribs {resolve_type generated dependency vect_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency vect_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_xn_re {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xn_re} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32752} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency frame_size format long minimum {} maximum {}} value 1024} stride {attribs {resolve_type generated dependency frame_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xn_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency xn_fractwidth format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} field_xn_im {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xn_im} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32752} bitoffset {attribs {resolve_type generated dependency xn_im_offset format long minimum {} maximum {}} value 16} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency frame_size format long minimum {} maximum {}} value 1024} stride {attribs {resolve_type generated dependency frame_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xn_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency xn_fractwidth format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}}}}} TDATA_WIDTH 32 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_xk_index {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xk_index} enabled {attribs {resolve_type generated dependency xk_index_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xk_index_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_blk_exp {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value blk_exp} enabled {attribs {resolve_type generated dependency blk_exp_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type generated dependency blk_exp_offset format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} field_ovflo {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value ovflo} enabled {attribs {resolve_type generated dependency ovflo_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type generated dependency ovflo_offset format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}}}} TUSER_WIDTH 8}, INSERT_VIP 0" *) input [31:0]s_axis_fft_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TVALID" *) input s_axis_fft_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TREADY" *) output s_axis_fft_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_FFT TLAST" *) input s_axis_fft_tlast;
  output [3:0]leds;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aresetn;
  wire inst_n_0;
  wire inst_n_12;
  wire inst_n_13;
  wire inst_n_14;
  wire inst_n_15;
  wire inst_n_16;
  wire inst_n_17;
  wire inst_n_18;
  wire inst_n_19;
  wire inst_n_20;
  wire inst_n_21;
  wire [3:0]leds;
  wire m_axis_fft_config_tready;
  wire m_axis_fft_config_tvalid;
  wire [31:0]m_axis_fft_tdata;
  wire m_axis_fft_tlast;
  wire m_axis_fft_tready;
  wire m_axis_fft_tvalid;
  wire n_count_reg_rep_n_0;
  wire n_count_reg_rep_n_1;
  wire n_count_reg_rep_n_10;
  wire n_count_reg_rep_n_11;
  wire n_count_reg_rep_n_12;
  wire n_count_reg_rep_n_13;
  wire n_count_reg_rep_n_14;
  wire n_count_reg_rep_n_15;
  wire n_count_reg_rep_n_2;
  wire n_count_reg_rep_n_3;
  wire n_count_reg_rep_n_4;
  wire n_count_reg_rep_n_5;
  wire n_count_reg_rep_n_6;
  wire n_count_reg_rep_n_7;
  wire n_count_reg_rep_n_8;
  wire n_count_reg_rep_n_9;
  wire [31:0]s_axi_araddr;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [31:0]s_axis_fft_tdata;
  wire s_axis_fft_tlast;
  wire s_axis_fft_tvalid;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [15:0]NLW_n_count_reg_rep_DOBDO_UNCONNECTED;
  wire [1:0]NLW_n_count_reg_rep_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_n_count_reg_rep_DOPBDOP_UNCONNECTED;

  assign m_axis_fft_config_tdata[7] = \<const0> ;
  assign m_axis_fft_config_tdata[6] = \<const0> ;
  assign m_axis_fft_config_tdata[5] = \<const0> ;
  assign m_axis_fft_config_tdata[4] = \<const0> ;
  assign m_axis_fft_config_tdata[3] = \<const0> ;
  assign m_axis_fft_config_tdata[2] = \<const0> ;
  assign m_axis_fft_config_tdata[1] = \<const0> ;
  assign m_axis_fft_config_tdata[0] = \<const1> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axis_fft_tready = \<const1> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  radar_system_radar_core_0_0_radar_core inst
       (.ADDRARDADDR({inst_n_12,inst_n_13,inst_n_14,inst_n_15,inst_n_16,inst_n_17,inst_n_18,inst_n_19,inst_n_20,inst_n_21}),
        .DOADO({n_count_reg_rep_n_0,n_count_reg_rep_n_1,n_count_reg_rep_n_2,n_count_reg_rep_n_3,n_count_reg_rep_n_4,n_count_reg_rep_n_5,n_count_reg_rep_n_6,n_count_reg_rep_n_7,n_count_reg_rep_n_8,n_count_reg_rep_n_9,n_count_reg_rep_n_10,n_count_reg_rep_n_11,n_count_reg_rep_n_12,n_count_reg_rep_n_13,n_count_reg_rep_n_14,n_count_reg_rep_n_15}),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(inst_n_0),
        .enable_reg_0(leds[0]),
        .in_pulse_reg(leds[2]),
        .leds(leds[3]),
        .m_axis_fft_config_tready(m_axis_fft_config_tready),
        .m_axis_fft_config_tvalid(m_axis_fft_config_tvalid),
        .m_axis_fft_tdata(m_axis_fft_tdata),
        .m_axis_fft_tlast(m_axis_fft_tlast),
        .m_axis_fft_tready(m_axis_fft_tready),
        .m_tvalid_reg(m_axis_fft_tvalid),
        .peak_valid_reg(leds[1]),
        .s_axi_araddr(s_axi_araddr[7:2]),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr[7:2]),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid_reg_0(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axis_fft_tdata(s_axis_fft_tdata),
        .s_axis_fft_tlast(s_axis_fft_tlast),
        .s_axis_fft_tvalid(s_axis_fft_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "16384" *) 
  (* RTL_RAM_NAME = "axis_window/n_count_reg_rep" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0045003D0034002C0025001F00190014000F000B000800050003000100000000),
    .INIT_01(256'h01280115010300F200E100D000C100B200A300950088007B006F00640059004F),
    .INIT_02(256'h02A6028A026E02530238021E020501EC01D401BC01A5018F01790164014F013B),
    .INIT_03(256'h04BB04960470044C0428040503E203C0039E037D035C033D031D02FE02E002C3),
    .INIT_04(256'h07630734070606D906AC067F0653062805FD05D305A9058005580530050804E2),
    .INIT_05(256'h0A970A5F0A2909F309BD09880953091F08EC08B908860855082307F207C20792),
    .INIT_06(256'h0E4E0E0F0DD00D920D540D170CDA0C9E0C620C270BED0BB20B790B3F0B070ACE),
    .INIT_07(256'h1281123A11F411AE1169112410E0109C105910160FD30F910F500F0F0ECE0E8E),
    .INIT_08(256'h172316D61689163D15F115A5155A150F14C5147B143113E8139F1357130F12C8),
    .INIT_09(256'h1C2B1BD81B851B321AE01A8E1A3D19EC199B194B18FB18AB185C180D17BF1771),
    .INIT_0A(256'h218B213320DB2083202B1FD41F7D1F271ED11E7B1E251DD01D7B1D271CD21C7E),
    .INIT_0B(256'h273626DA267D262125C5256A250E24B3245823FE23A3234922EF2296223D21E4),
    .INIT_0C(256'h2D1F2CBF2C5F2BFF2BA02B412AE12A832A2429C52967290928AB284E27F02793),
    .INIT_0D(256'h333632D43271320F31AD314B30E9308730262FC42F632F022EA12E402DE02D7F),
    .INIT_0E(256'h396D390938A5384137DD3779371636B2364F35EB3588352534C2345F33FC3399),
    .INIT_0F(256'h3FB43F4F3EEB3E863E223DBD3D583CF43C8F3C2B3BC73B623AFE3A9A3A3539D1),
    .INIT_10(256'h45FC4598453344CF446B440643A2433D42D94274421041AB414740E2407D4019),
    .INIT_11(256'h4C354BD24B6F4B0C4AA94A4649E2497F491B48B7485447F0478C472846C44660),
    .INIT_12(256'h525051EF518E512E50CD506B500A4FA94F474EE54E834E214DBF4D5D4CFA4C98),
    .INIT_13(256'h583D57E05783572556C75669560A55AC554D54EE548F542F53D05370531052B0),
    .INIT_14(256'h5DEF5D965D3C5CE35C895C2F5BD45B795B1E5AC35A685A0C59B0595458F7589A),
    .INIT_15(256'h6357630362AE625A620461AF6159610360AD60565FFF5FA85F505EF85EA05E48),
    .INIT_16(256'h6867681967CA677B672C66DC668C663C65EB6599654864F664A4645163FE63AA),
    .INIT_17(256'h6D146CCC6C846C3C6BF36BA96B606B156ACB6A806A3469E8699C6950690268B5),
    .INIT_18(256'h7151711170D0708F704D700B6FC86F856F416EFD6EB86E736E2E6DE86DA26D5B),
    .INIT_19(256'h751574DC74A3746A743073F573BA737F7343730672C9728C724E720F71D07191),
    .INIT_1A(256'h7855782577F477C37792775F772D76F976C67691765D762775F175BB7584754D),
    .INIT_1B(256'h7B0A7AE37ABB7A937A6A7A417A1779EC79C17996796A793D791078E278B37884),
    .INIT_1C(256'h7D2D7D107CF17CD27CB37C927C727C507C2E7C0C7BE97BC57BA17B7C7B577B31),
    .INIT_1D(256'h7EBA7EA57E917E7B7E657E4E7E377E1F7E077DEE7DD47DBA7D9F7D837D677D4B),
    .INIT_1E(256'h7FAB7FA07F957F8A7F7D7F707F637F557F467F367F267F167F057EF37EE07ECD),
    .INIT_1F(256'h7FFF7FFE7FFD7FFB7FF97FF67FF27FEE7FE97FE37FDD7FD67FCF7FC77FBE7FB5),
    .INIT_20(256'h7FB57FBE7FC77FCF7FD67FDD7FE37FE97FEE7FF27FF67FF97FFB7FFD7FFE7FFF),
    .INIT_21(256'h7ECD7EE07EF37F057F167F267F367F467F557F637F707F7D7F8A7F957FA07FAB),
    .INIT_22(256'h7D4B7D677D837D9F7DBA7DD47DEE7E077E1F7E377E4E7E657E7B7E917EA57EBA),
    .INIT_23(256'h7B317B577B7C7BA17BC57BE97C0C7C2E7C507C727C927CB37CD27CF17D107D2D),
    .INIT_24(256'h788478B378E27910793D796A799679C179EC7A177A417A6A7A937ABB7AE37B0A),
    .INIT_25(256'h754D758475BB75F17627765D769176C676F9772D775F779277C377F478257855),
    .INIT_26(256'h719171D0720F724E728C72C973067343737F73BA73F57430746A74A374DC7515),
    .INIT_27(256'h6D5B6DA26DE86E2E6E736EB86EFD6F416F856FC8700B704D708F70D071117151),
    .INIT_28(256'h68B569026950699C69E86A346A806ACB6B156B606BA96BF36C3C6C846CCC6D14),
    .INIT_29(256'h63AA63FE645164A464F66548659965EB663C668C66DC672C677B67CA68196867),
    .INIT_2A(256'h5E485EA05EF85F505FA85FFF605660AD6103615961AF6204625A62AE63036357),
    .INIT_2B(256'h589A58F7595459B05A0C5A685AC35B1E5B795BD45C2F5C895CE35D3C5D965DEF),
    .INIT_2C(256'h52B05310537053D0542F548F54EE554D55AC560A566956C75725578357E0583D),
    .INIT_2D(256'h4C984CFA4D5D4DBF4E214E834EE54F474FA9500A506B50CD512E518E51EF5250),
    .INIT_2E(256'h466046C44728478C47F0485448B7491B497F49E24A464AA94B0C4B6F4BD24C35),
    .INIT_2F(256'h4019407D40E2414741AB4210427442D9433D43A24406446B44CF4533459845FC),
    .INIT_30(256'h39D13A353A9A3AFE3B623BC73C2B3C8F3CF43D583DBD3E223E863EEB3F4F3FB4),
    .INIT_31(256'h339933FC345F34C23525358835EB364F36B23716377937DD384138A53909396D),
    .INIT_32(256'h2D7F2DE02E402EA12F022F632FC43026308730E9314B31AD320F327132D43336),
    .INIT_33(256'h279327F0284E28AB2909296729C52A242A832AE12B412BA02BFF2C5F2CBF2D1F),
    .INIT_34(256'h21E4223D229622EF234923A323FE245824B3250E256A25C52621267D26DA2736),
    .INIT_35(256'h1C7E1CD21D271D7B1DD01E251E7B1ED11F271F7D1FD4202B208320DB2133218B),
    .INIT_36(256'h177117BF180D185C18AB18FB194B199B19EC1A3D1A8E1AE01B321B851BD81C2B),
    .INIT_37(256'h12C8130F1357139F13E81431147B14C5150F155A15A515F1163D168916D61723),
    .INIT_38(256'h0E8E0ECE0F0F0F500F910FD310161059109C10E01124116911AE11F4123A1281),
    .INIT_39(256'h0ACE0B070B3F0B790BB20BED0C270C620C9E0CDA0D170D540D920DD00E0F0E4E),
    .INIT_3A(256'h079207C207F208230855088608B908EC091F0953098809BD09F30A290A5F0A97),
    .INIT_3B(256'h04E2050805300558058005A905D305FD06280653067F06AC06D9070607340763),
    .INIT_3C(256'h02C302E002FE031D033D035C037D039E03C003E204050428044C0470049604BB),
    .INIT_3D(256'h013B014F01640179018F01A501BC01D401EC0205021E02380253026E028A02A6),
    .INIT_3E(256'h004F00590064006F007B0088009500A300B200C100D000E100F2010301150128),
    .INIT_3F(256'h000000000001000300050008000B000F00140019001F0025002C0034003D0045),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    n_count_reg_rep
       (.ADDRARDADDR({inst_n_12,inst_n_13,inst_n_14,inst_n_15,inst_n_16,inst_n_17,inst_n_18,inst_n_19,inst_n_20,inst_n_21,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(aclk),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({n_count_reg_rep_n_0,n_count_reg_rep_n_1,n_count_reg_rep_n_2,n_count_reg_rep_n_3,n_count_reg_rep_n_4,n_count_reg_rep_n_5,n_count_reg_rep_n_6,n_count_reg_rep_n_7,n_count_reg_rep_n_8,n_count_reg_rep_n_9,n_count_reg_rep_n_10,n_count_reg_rep_n_11,n_count_reg_rep_n_12,n_count_reg_rep_n_13,n_count_reg_rep_n_14,n_count_reg_rep_n_15}),
        .DOBDO(NLW_n_count_reg_rep_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_n_count_reg_rep_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_n_count_reg_rep_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(inst_n_0),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "axis_peak_detect" *) 
module radar_system_radar_core_0_0_axis_peak_detect
   (clear,
    peak_valid_reg_0,
    peak_valid_d_reg,
    frame_count0,
    D,
    \peak_mag2_reg[1]_0 ,
    \peak_mag2_reg[2]_0 ,
    \peak_mag2_reg[4]_0 ,
    s_axi_araddr_3_sp_1,
    \s_axi_araddr[3]_0 ,
    s_axi_araddr_2_sp_1,
    \s_axi_araddr[2]_0 ,
    \s_axi_araddr[2]_1 ,
    \s_axi_araddr[2]_2 ,
    \s_axi_araddr[2]_3 ,
    \s_axi_araddr[2]_4 ,
    \s_axi_araddr[2]_5 ,
    \s_axi_araddr[2]_6 ,
    \s_axi_araddr[2]_7 ,
    \s_axi_araddr[2]_8 ,
    \s_axi_araddr[2]_9 ,
    \s_axi_araddr[2]_10 ,
    \s_axi_araddr[2]_11 ,
    \s_axi_araddr[2]_12 ,
    \s_axi_araddr[2]_13 ,
    \bins_seen_reg[15]_0 ,
    s_axis_fft_tlast,
    aclk,
    s_axis_fft_tdata,
    peak_valid_d,
    peak_valid_d_reg_0,
    s_axis_fft_tvalid,
    re2_pipe_reg_0,
    aresetn,
    \s_axi_rdata_reg[0] ,
    s_axi_araddr,
    \s_axi_rdata_reg[0]_0 ,
    pw_samples,
    Q,
    \s_axi_rdata_reg[15] ,
    \s_axi_rdata_reg[3] ,
    \s_axi_rdata_reg[3]_0 ,
    \s_axi_rdata_reg[5] ,
    \s_axi_rdata_reg[5]_0 ,
    \s_axi_rdata_reg[5]_1 ,
    \s_axi_rdata_reg[6] ,
    \s_axi_rdata_reg[6]_0 ,
    \s_axi_rdata_reg[7] ,
    \s_axi_rdata_reg[7]_0 ,
    \s_axi_rdata_reg[9] ,
    \s_axi_rdata_reg[9]_0 ,
    \s_axi_rdata_reg[10] ,
    \s_axi_rdata_reg[10]_0 ,
    \s_axi_rdata_reg[11] ,
    \s_axi_rdata_reg[11]_0 ,
    \s_axi_rdata_reg[12] ,
    \s_axi_rdata_reg[12]_0 ,
    \s_axi_rdata_reg[13] ,
    \s_axi_rdata_reg[13]_0 ,
    \s_axi_rdata_reg[15]_0 ,
    \s_axi_rdata_reg[15]_1 ,
    \s_axi_rdata_reg[16] ,
    \s_axi_rdata_reg[22] ,
    \s_axi_rdata_reg[22]_0 ,
    \s_axi_rdata_reg[22]_1 );
  output clear;
  output peak_valid_reg_0;
  output peak_valid_d_reg;
  output frame_count0;
  output [11:0]D;
  output \peak_mag2_reg[1]_0 ;
  output \peak_mag2_reg[2]_0 ;
  output \peak_mag2_reg[4]_0 ;
  output s_axi_araddr_3_sp_1;
  output \s_axi_araddr[3]_0 ;
  output s_axi_araddr_2_sp_1;
  output \s_axi_araddr[2]_0 ;
  output \s_axi_araddr[2]_1 ;
  output \s_axi_araddr[2]_2 ;
  output \s_axi_araddr[2]_3 ;
  output \s_axi_araddr[2]_4 ;
  output \s_axi_araddr[2]_5 ;
  output \s_axi_araddr[2]_6 ;
  output \s_axi_araddr[2]_7 ;
  output \s_axi_araddr[2]_8 ;
  output \s_axi_araddr[2]_9 ;
  output \s_axi_araddr[2]_10 ;
  output \s_axi_araddr[2]_11 ;
  output \s_axi_araddr[2]_12 ;
  output \s_axi_araddr[2]_13 ;
  output [15:0]\bins_seen_reg[15]_0 ;
  input s_axis_fft_tlast;
  input aclk;
  input [31:0]s_axis_fft_tdata;
  input peak_valid_d;
  input peak_valid_d_reg_0;
  input s_axis_fft_tvalid;
  input re2_pipe_reg_0;
  input aresetn;
  input \s_axi_rdata_reg[0] ;
  input [3:0]s_axi_araddr;
  input \s_axi_rdata_reg[0]_0 ;
  input [31:0]pw_samples;
  input [13:0]Q;
  input [12:0]\s_axi_rdata_reg[15] ;
  input \s_axi_rdata_reg[3] ;
  input \s_axi_rdata_reg[3]_0 ;
  input \s_axi_rdata_reg[5] ;
  input \s_axi_rdata_reg[5]_0 ;
  input \s_axi_rdata_reg[5]_1 ;
  input \s_axi_rdata_reg[6] ;
  input \s_axi_rdata_reg[6]_0 ;
  input \s_axi_rdata_reg[7] ;
  input \s_axi_rdata_reg[7]_0 ;
  input \s_axi_rdata_reg[9] ;
  input \s_axi_rdata_reg[9]_0 ;
  input \s_axi_rdata_reg[10] ;
  input \s_axi_rdata_reg[10]_0 ;
  input \s_axi_rdata_reg[11] ;
  input \s_axi_rdata_reg[11]_0 ;
  input \s_axi_rdata_reg[12] ;
  input \s_axi_rdata_reg[12]_0 ;
  input \s_axi_rdata_reg[13] ;
  input \s_axi_rdata_reg[13]_0 ;
  input \s_axi_rdata_reg[15]_0 ;
  input \s_axi_rdata_reg[15]_1 ;
  input \s_axi_rdata_reg[16] ;
  input \s_axi_rdata_reg[22] ;
  input \s_axi_rdata_reg[22]_0 ;
  input \s_axi_rdata_reg[22]_1 ;

  wire [11:0]D;
  wire [13:0]Q;
  wire aclk;
  wire aresetn;
  wire \bin_idx[0]_i_1_n_0 ;
  wire \bin_idx[0]_i_3_n_0 ;
  wire [15:0]bin_idx_reg;
  wire \bin_idx_reg[0]_i_2_n_0 ;
  wire \bin_idx_reg[0]_i_2_n_1 ;
  wire \bin_idx_reg[0]_i_2_n_2 ;
  wire \bin_idx_reg[0]_i_2_n_3 ;
  wire \bin_idx_reg[0]_i_2_n_4 ;
  wire \bin_idx_reg[0]_i_2_n_5 ;
  wire \bin_idx_reg[0]_i_2_n_6 ;
  wire \bin_idx_reg[0]_i_2_n_7 ;
  wire \bin_idx_reg[12]_i_1_n_1 ;
  wire \bin_idx_reg[12]_i_1_n_2 ;
  wire \bin_idx_reg[12]_i_1_n_3 ;
  wire \bin_idx_reg[12]_i_1_n_4 ;
  wire \bin_idx_reg[12]_i_1_n_5 ;
  wire \bin_idx_reg[12]_i_1_n_6 ;
  wire \bin_idx_reg[12]_i_1_n_7 ;
  wire \bin_idx_reg[4]_i_1_n_0 ;
  wire \bin_idx_reg[4]_i_1_n_1 ;
  wire \bin_idx_reg[4]_i_1_n_2 ;
  wire \bin_idx_reg[4]_i_1_n_3 ;
  wire \bin_idx_reg[4]_i_1_n_4 ;
  wire \bin_idx_reg[4]_i_1_n_5 ;
  wire \bin_idx_reg[4]_i_1_n_6 ;
  wire \bin_idx_reg[4]_i_1_n_7 ;
  wire \bin_idx_reg[8]_i_1_n_0 ;
  wire \bin_idx_reg[8]_i_1_n_1 ;
  wire \bin_idx_reg[8]_i_1_n_2 ;
  wire \bin_idx_reg[8]_i_1_n_3 ;
  wire \bin_idx_reg[8]_i_1_n_4 ;
  wire \bin_idx_reg[8]_i_1_n_5 ;
  wire \bin_idx_reg[8]_i_1_n_6 ;
  wire \bin_idx_reg[8]_i_1_n_7 ;
  wire [15:0]bin_pipe;
  wire bins_seen0_carry__0_n_0;
  wire bins_seen0_carry__0_n_1;
  wire bins_seen0_carry__0_n_2;
  wire bins_seen0_carry__0_n_3;
  wire bins_seen0_carry__1_n_0;
  wire bins_seen0_carry__1_n_1;
  wire bins_seen0_carry__1_n_2;
  wire bins_seen0_carry__1_n_3;
  wire bins_seen0_carry__2_n_2;
  wire bins_seen0_carry__2_n_3;
  wire bins_seen0_carry_n_0;
  wire bins_seen0_carry_n_1;
  wire bins_seen0_carry_n_2;
  wire bins_seen0_carry_n_3;
  wire [15:0]\bins_seen_reg[15]_0 ;
  wire clear;
  wire [31:0]dc_mag2;
  wire \dc_mag2[31]_i_1_n_0 ;
  wire \dc_mag2[31]_i_2_n_0 ;
  wire \dc_mag2[31]_i_3_n_0 ;
  wire \dc_mag2[31]_i_4_n_0 ;
  wire \dc_mag2[31]_i_5_n_0 ;
  wire fire;
  wire frame_busy;
  wire frame_busy_i_1_n_0;
  wire frame_count0;
  wire last_pipe;
  wire mag2_pipe_n_100;
  wire mag2_pipe_n_101;
  wire mag2_pipe_n_102;
  wire mag2_pipe_n_103;
  wire mag2_pipe_n_104;
  wire mag2_pipe_n_105;
  wire mag2_pipe_n_74;
  wire mag2_pipe_n_75;
  wire mag2_pipe_n_76;
  wire mag2_pipe_n_77;
  wire mag2_pipe_n_78;
  wire mag2_pipe_n_79;
  wire mag2_pipe_n_80;
  wire mag2_pipe_n_81;
  wire mag2_pipe_n_82;
  wire mag2_pipe_n_83;
  wire mag2_pipe_n_84;
  wire mag2_pipe_n_85;
  wire mag2_pipe_n_86;
  wire mag2_pipe_n_87;
  wire mag2_pipe_n_88;
  wire mag2_pipe_n_89;
  wire mag2_pipe_n_90;
  wire mag2_pipe_n_91;
  wire mag2_pipe_n_92;
  wire mag2_pipe_n_93;
  wire mag2_pipe_n_94;
  wire mag2_pipe_n_95;
  wire mag2_pipe_n_96;
  wire mag2_pipe_n_97;
  wire mag2_pipe_n_98;
  wire mag2_pipe_n_99;
  wire new_peak0;
  wire new_peak0_carry__0_i_1_n_0;
  wire new_peak0_carry__0_i_2_n_0;
  wire new_peak0_carry__0_i_3_n_0;
  wire new_peak0_carry__0_i_4_n_0;
  wire new_peak0_carry__0_i_5_n_0;
  wire new_peak0_carry__0_i_6_n_0;
  wire new_peak0_carry__0_i_7_n_0;
  wire new_peak0_carry__0_i_8_n_0;
  wire new_peak0_carry__0_n_0;
  wire new_peak0_carry__0_n_1;
  wire new_peak0_carry__0_n_2;
  wire new_peak0_carry__0_n_3;
  wire new_peak0_carry__1_i_1_n_0;
  wire new_peak0_carry__1_i_2_n_0;
  wire new_peak0_carry__1_i_3_n_0;
  wire new_peak0_carry__1_i_4_n_0;
  wire new_peak0_carry__1_i_5_n_0;
  wire new_peak0_carry__1_i_6_n_0;
  wire new_peak0_carry__1_i_7_n_0;
  wire new_peak0_carry__1_i_8_n_0;
  wire new_peak0_carry__1_n_0;
  wire new_peak0_carry__1_n_1;
  wire new_peak0_carry__1_n_2;
  wire new_peak0_carry__1_n_3;
  wire new_peak0_carry__2_i_1_n_0;
  wire new_peak0_carry__2_i_2_n_0;
  wire new_peak0_carry__2_i_3_n_0;
  wire new_peak0_carry__2_i_4_n_0;
  wire new_peak0_carry__2_i_5_n_0;
  wire new_peak0_carry__2_i_6_n_0;
  wire new_peak0_carry__2_i_7_n_0;
  wire new_peak0_carry__2_i_8_n_0;
  wire new_peak0_carry__2_n_1;
  wire new_peak0_carry__2_n_2;
  wire new_peak0_carry__2_n_3;
  wire new_peak0_carry_i_1_n_0;
  wire new_peak0_carry_i_2_n_0;
  wire new_peak0_carry_i_3_n_0;
  wire new_peak0_carry_i_4_n_0;
  wire new_peak0_carry_i_5_n_0;
  wire new_peak0_carry_i_6_n_0;
  wire new_peak0_carry_i_7_n_0;
  wire new_peak0_carry_i_8_n_0;
  wire new_peak0_carry_n_0;
  wire new_peak0_carry_n_1;
  wire new_peak0_carry_n_2;
  wire new_peak0_carry_n_3;
  wire new_peak__15;
  wire [15:0]p_1_in;
  wire [15:0]peak_bin;
  wire \peak_bin[15]_i_1_n_0 ;
  wire [31:0]peak_mag2;
  wire \peak_mag2_reg[1]_0 ;
  wire \peak_mag2_reg[2]_0 ;
  wire \peak_mag2_reg[4]_0 ;
  wire peak_valid_d;
  wire peak_valid_d_reg;
  wire peak_valid_d_reg_0;
  wire peak_valid_i_1_n_0;
  wire peak_valid_reg_0;
  wire [31:0]pw_samples;
  wire re2_pipe_reg_0;
  wire re2_pipe_reg_n_100;
  wire re2_pipe_reg_n_101;
  wire re2_pipe_reg_n_102;
  wire re2_pipe_reg_n_103;
  wire re2_pipe_reg_n_104;
  wire re2_pipe_reg_n_105;
  wire re2_pipe_reg_n_106;
  wire re2_pipe_reg_n_107;
  wire re2_pipe_reg_n_108;
  wire re2_pipe_reg_n_109;
  wire re2_pipe_reg_n_110;
  wire re2_pipe_reg_n_111;
  wire re2_pipe_reg_n_112;
  wire re2_pipe_reg_n_113;
  wire re2_pipe_reg_n_114;
  wire re2_pipe_reg_n_115;
  wire re2_pipe_reg_n_116;
  wire re2_pipe_reg_n_117;
  wire re2_pipe_reg_n_118;
  wire re2_pipe_reg_n_119;
  wire re2_pipe_reg_n_120;
  wire re2_pipe_reg_n_121;
  wire re2_pipe_reg_n_122;
  wire re2_pipe_reg_n_123;
  wire re2_pipe_reg_n_124;
  wire re2_pipe_reg_n_125;
  wire re2_pipe_reg_n_126;
  wire re2_pipe_reg_n_127;
  wire re2_pipe_reg_n_128;
  wire re2_pipe_reg_n_129;
  wire re2_pipe_reg_n_130;
  wire re2_pipe_reg_n_131;
  wire re2_pipe_reg_n_132;
  wire re2_pipe_reg_n_133;
  wire re2_pipe_reg_n_134;
  wire re2_pipe_reg_n_135;
  wire re2_pipe_reg_n_136;
  wire re2_pipe_reg_n_137;
  wire re2_pipe_reg_n_138;
  wire re2_pipe_reg_n_139;
  wire re2_pipe_reg_n_140;
  wire re2_pipe_reg_n_141;
  wire re2_pipe_reg_n_142;
  wire re2_pipe_reg_n_143;
  wire re2_pipe_reg_n_144;
  wire re2_pipe_reg_n_145;
  wire re2_pipe_reg_n_146;
  wire re2_pipe_reg_n_147;
  wire re2_pipe_reg_n_148;
  wire re2_pipe_reg_n_149;
  wire re2_pipe_reg_n_150;
  wire re2_pipe_reg_n_151;
  wire re2_pipe_reg_n_152;
  wire re2_pipe_reg_n_153;
  wire re2_pipe_reg_n_74;
  wire re2_pipe_reg_n_75;
  wire re2_pipe_reg_n_76;
  wire re2_pipe_reg_n_77;
  wire re2_pipe_reg_n_78;
  wire re2_pipe_reg_n_79;
  wire re2_pipe_reg_n_80;
  wire re2_pipe_reg_n_81;
  wire re2_pipe_reg_n_82;
  wire re2_pipe_reg_n_83;
  wire re2_pipe_reg_n_84;
  wire re2_pipe_reg_n_85;
  wire re2_pipe_reg_n_86;
  wire re2_pipe_reg_n_87;
  wire re2_pipe_reg_n_88;
  wire re2_pipe_reg_n_89;
  wire re2_pipe_reg_n_90;
  wire re2_pipe_reg_n_91;
  wire re2_pipe_reg_n_92;
  wire re2_pipe_reg_n_93;
  wire re2_pipe_reg_n_94;
  wire re2_pipe_reg_n_95;
  wire re2_pipe_reg_n_96;
  wire re2_pipe_reg_n_97;
  wire re2_pipe_reg_n_98;
  wire re2_pipe_reg_n_99;
  wire [15:0]run_bin;
  wire [15:0]run_bin1_in;
  wire run_mag2;
  wire \run_mag2[0]_i_1_n_0 ;
  wire \run_mag2[10]_i_1_n_0 ;
  wire \run_mag2[11]_i_1_n_0 ;
  wire \run_mag2[12]_i_1_n_0 ;
  wire \run_mag2[13]_i_1_n_0 ;
  wire \run_mag2[14]_i_1_n_0 ;
  wire \run_mag2[15]_i_1_n_0 ;
  wire \run_mag2[16]_i_1_n_0 ;
  wire \run_mag2[17]_i_1_n_0 ;
  wire \run_mag2[18]_i_1_n_0 ;
  wire \run_mag2[19]_i_1_n_0 ;
  wire \run_mag2[1]_i_1_n_0 ;
  wire \run_mag2[20]_i_1_n_0 ;
  wire \run_mag2[21]_i_1_n_0 ;
  wire \run_mag2[22]_i_1_n_0 ;
  wire \run_mag2[23]_i_1_n_0 ;
  wire \run_mag2[24]_i_1_n_0 ;
  wire \run_mag2[25]_i_1_n_0 ;
  wire \run_mag2[26]_i_1_n_0 ;
  wire \run_mag2[27]_i_1_n_0 ;
  wire \run_mag2[28]_i_1_n_0 ;
  wire \run_mag2[29]_i_1_n_0 ;
  wire \run_mag2[2]_i_1_n_0 ;
  wire \run_mag2[30]_i_1_n_0 ;
  wire \run_mag2[31]_i_2_n_0 ;
  wire \run_mag2[31]_i_4_n_0 ;
  wire \run_mag2[31]_i_5_n_0 ;
  wire \run_mag2[31]_i_6_n_0 ;
  wire \run_mag2[31]_i_7_n_0 ;
  wire \run_mag2[3]_i_1_n_0 ;
  wire \run_mag2[4]_i_1_n_0 ;
  wire \run_mag2[5]_i_1_n_0 ;
  wire \run_mag2[6]_i_1_n_0 ;
  wire \run_mag2[7]_i_1_n_0 ;
  wire \run_mag2[8]_i_1_n_0 ;
  wire \run_mag2[9]_i_1_n_0 ;
  wire \run_mag2_reg_n_0_[0] ;
  wire \run_mag2_reg_n_0_[10] ;
  wire \run_mag2_reg_n_0_[11] ;
  wire \run_mag2_reg_n_0_[12] ;
  wire \run_mag2_reg_n_0_[13] ;
  wire \run_mag2_reg_n_0_[14] ;
  wire \run_mag2_reg_n_0_[15] ;
  wire \run_mag2_reg_n_0_[16] ;
  wire \run_mag2_reg_n_0_[17] ;
  wire \run_mag2_reg_n_0_[18] ;
  wire \run_mag2_reg_n_0_[19] ;
  wire \run_mag2_reg_n_0_[1] ;
  wire \run_mag2_reg_n_0_[20] ;
  wire \run_mag2_reg_n_0_[21] ;
  wire \run_mag2_reg_n_0_[22] ;
  wire \run_mag2_reg_n_0_[23] ;
  wire \run_mag2_reg_n_0_[24] ;
  wire \run_mag2_reg_n_0_[25] ;
  wire \run_mag2_reg_n_0_[26] ;
  wire \run_mag2_reg_n_0_[27] ;
  wire \run_mag2_reg_n_0_[28] ;
  wire \run_mag2_reg_n_0_[29] ;
  wire \run_mag2_reg_n_0_[2] ;
  wire \run_mag2_reg_n_0_[30] ;
  wire \run_mag2_reg_n_0_[31] ;
  wire \run_mag2_reg_n_0_[3] ;
  wire \run_mag2_reg_n_0_[4] ;
  wire \run_mag2_reg_n_0_[5] ;
  wire \run_mag2_reg_n_0_[6] ;
  wire \run_mag2_reg_n_0_[7] ;
  wire \run_mag2_reg_n_0_[8] ;
  wire \run_mag2_reg_n_0_[9] ;
  wire [3:0]s_axi_araddr;
  wire \s_axi_araddr[2]_0 ;
  wire \s_axi_araddr[2]_1 ;
  wire \s_axi_araddr[2]_10 ;
  wire \s_axi_araddr[2]_11 ;
  wire \s_axi_araddr[2]_12 ;
  wire \s_axi_araddr[2]_13 ;
  wire \s_axi_araddr[2]_2 ;
  wire \s_axi_araddr[2]_3 ;
  wire \s_axi_araddr[2]_4 ;
  wire \s_axi_araddr[2]_5 ;
  wire \s_axi_araddr[2]_6 ;
  wire \s_axi_araddr[2]_7 ;
  wire \s_axi_araddr[2]_8 ;
  wire \s_axi_araddr[2]_9 ;
  wire \s_axi_araddr[3]_0 ;
  wire s_axi_araddr_2_sn_1;
  wire s_axi_araddr_3_sn_1;
  wire \s_axi_rdata[0]_i_2_n_0 ;
  wire \s_axi_rdata[0]_i_4_n_0 ;
  wire \s_axi_rdata[10]_i_2_n_0 ;
  wire \s_axi_rdata[10]_i_5_n_0 ;
  wire \s_axi_rdata[11]_i_2_n_0 ;
  wire \s_axi_rdata[11]_i_5_n_0 ;
  wire \s_axi_rdata[12]_i_2_n_0 ;
  wire \s_axi_rdata[12]_i_5_n_0 ;
  wire \s_axi_rdata[13]_i_2_n_0 ;
  wire \s_axi_rdata[13]_i_5_n_0 ;
  wire \s_axi_rdata[14]_i_5_n_0 ;
  wire \s_axi_rdata[15]_i_2_n_0 ;
  wire \s_axi_rdata[15]_i_5_n_0 ;
  wire \s_axi_rdata[22]_i_3_n_0 ;
  wire \s_axi_rdata[3]_i_2_n_0 ;
  wire \s_axi_rdata[3]_i_4_n_0 ;
  wire \s_axi_rdata[5]_i_2_n_0 ;
  wire \s_axi_rdata[5]_i_5_n_0 ;
  wire \s_axi_rdata[6]_i_2_n_0 ;
  wire \s_axi_rdata[6]_i_5_n_0 ;
  wire \s_axi_rdata[7]_i_2_n_0 ;
  wire \s_axi_rdata[7]_i_5_n_0 ;
  wire \s_axi_rdata[8]_i_5_n_0 ;
  wire \s_axi_rdata[9]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_5_n_0 ;
  wire \s_axi_rdata_reg[0] ;
  wire \s_axi_rdata_reg[0]_0 ;
  wire \s_axi_rdata_reg[10] ;
  wire \s_axi_rdata_reg[10]_0 ;
  wire \s_axi_rdata_reg[11] ;
  wire \s_axi_rdata_reg[11]_0 ;
  wire \s_axi_rdata_reg[12] ;
  wire \s_axi_rdata_reg[12]_0 ;
  wire \s_axi_rdata_reg[13] ;
  wire \s_axi_rdata_reg[13]_0 ;
  wire [12:0]\s_axi_rdata_reg[15] ;
  wire \s_axi_rdata_reg[15]_0 ;
  wire \s_axi_rdata_reg[15]_1 ;
  wire \s_axi_rdata_reg[16] ;
  wire \s_axi_rdata_reg[22] ;
  wire \s_axi_rdata_reg[22]_0 ;
  wire \s_axi_rdata_reg[22]_1 ;
  wire \s_axi_rdata_reg[3] ;
  wire \s_axi_rdata_reg[3]_0 ;
  wire \s_axi_rdata_reg[5] ;
  wire \s_axi_rdata_reg[5]_0 ;
  wire \s_axi_rdata_reg[5]_1 ;
  wire \s_axi_rdata_reg[6] ;
  wire \s_axi_rdata_reg[6]_0 ;
  wire \s_axi_rdata_reg[7] ;
  wire \s_axi_rdata_reg[7]_0 ;
  wire \s_axi_rdata_reg[9] ;
  wire \s_axi_rdata_reg[9]_0 ;
  wire [31:0]s_axis_fft_tdata;
  wire s_axis_fft_tlast;
  wire s_axis_fft_tvalid;
  wire valid_pipe;
  wire [3:3]\NLW_bin_idx_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]NLW_bins_seen0_carry__2_CO_UNCONNECTED;
  wire [3:3]NLW_bins_seen0_carry__2_O_UNCONNECTED;
  wire NLW_mag2_pipe_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mag2_pipe_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mag2_pipe_OVERFLOW_UNCONNECTED;
  wire NLW_mag2_pipe_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mag2_pipe_PATTERNDETECT_UNCONNECTED;
  wire NLW_mag2_pipe_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mag2_pipe_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mag2_pipe_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mag2_pipe_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_mag2_pipe_P_UNCONNECTED;
  wire [47:0]NLW_mag2_pipe_PCOUT_UNCONNECTED;
  wire [3:0]NLW_new_peak0_carry_O_UNCONNECTED;
  wire [3:0]NLW_new_peak0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_new_peak0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_new_peak0_carry__2_O_UNCONNECTED;
  wire NLW_re2_pipe_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_re2_pipe_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_re2_pipe_reg_OVERFLOW_UNCONNECTED;
  wire NLW_re2_pipe_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_re2_pipe_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_re2_pipe_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_re2_pipe_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_re2_pipe_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_re2_pipe_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_re2_pipe_reg_P_UNCONNECTED;

  assign s_axi_araddr_2_sp_1 = s_axi_araddr_2_sn_1;
  assign s_axi_araddr_3_sp_1 = s_axi_araddr_3_sn_1;
  LUT4 #(
    .INIT(16'h80FF)) 
    \bin_idx[0]_i_1 
       (.I0(s_axis_fft_tlast),
        .I1(s_axis_fft_tvalid),
        .I2(re2_pipe_reg_0),
        .I3(aresetn),
        .O(\bin_idx[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bin_idx[0]_i_3 
       (.I0(bin_idx_reg[0]),
        .O(\bin_idx[0]_i_3_n_0 ));
  FDRE \bin_idx_reg[0] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[0]_i_2_n_7 ),
        .Q(bin_idx_reg[0]),
        .R(\bin_idx[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bin_idx_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\bin_idx_reg[0]_i_2_n_0 ,\bin_idx_reg[0]_i_2_n_1 ,\bin_idx_reg[0]_i_2_n_2 ,\bin_idx_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\bin_idx_reg[0]_i_2_n_4 ,\bin_idx_reg[0]_i_2_n_5 ,\bin_idx_reg[0]_i_2_n_6 ,\bin_idx_reg[0]_i_2_n_7 }),
        .S({bin_idx_reg[3:1],\bin_idx[0]_i_3_n_0 }));
  FDRE \bin_idx_reg[10] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[8]_i_1_n_5 ),
        .Q(bin_idx_reg[10]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[11] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[8]_i_1_n_4 ),
        .Q(bin_idx_reg[11]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[12] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[12]_i_1_n_7 ),
        .Q(bin_idx_reg[12]),
        .R(\bin_idx[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bin_idx_reg[12]_i_1 
       (.CI(\bin_idx_reg[8]_i_1_n_0 ),
        .CO({\NLW_bin_idx_reg[12]_i_1_CO_UNCONNECTED [3],\bin_idx_reg[12]_i_1_n_1 ,\bin_idx_reg[12]_i_1_n_2 ,\bin_idx_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bin_idx_reg[12]_i_1_n_4 ,\bin_idx_reg[12]_i_1_n_5 ,\bin_idx_reg[12]_i_1_n_6 ,\bin_idx_reg[12]_i_1_n_7 }),
        .S(bin_idx_reg[15:12]));
  FDRE \bin_idx_reg[13] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[12]_i_1_n_6 ),
        .Q(bin_idx_reg[13]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[14] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[12]_i_1_n_5 ),
        .Q(bin_idx_reg[14]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[15] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[12]_i_1_n_4 ),
        .Q(bin_idx_reg[15]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[1] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[0]_i_2_n_6 ),
        .Q(bin_idx_reg[1]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[2] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[0]_i_2_n_5 ),
        .Q(bin_idx_reg[2]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[3] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[0]_i_2_n_4 ),
        .Q(bin_idx_reg[3]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[4] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[4]_i_1_n_7 ),
        .Q(bin_idx_reg[4]),
        .R(\bin_idx[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bin_idx_reg[4]_i_1 
       (.CI(\bin_idx_reg[0]_i_2_n_0 ),
        .CO({\bin_idx_reg[4]_i_1_n_0 ,\bin_idx_reg[4]_i_1_n_1 ,\bin_idx_reg[4]_i_1_n_2 ,\bin_idx_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bin_idx_reg[4]_i_1_n_4 ,\bin_idx_reg[4]_i_1_n_5 ,\bin_idx_reg[4]_i_1_n_6 ,\bin_idx_reg[4]_i_1_n_7 }),
        .S(bin_idx_reg[7:4]));
  FDRE \bin_idx_reg[5] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[4]_i_1_n_6 ),
        .Q(bin_idx_reg[5]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[6] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[4]_i_1_n_5 ),
        .Q(bin_idx_reg[6]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[7] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[4]_i_1_n_4 ),
        .Q(bin_idx_reg[7]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_idx_reg[8] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[8]_i_1_n_7 ),
        .Q(bin_idx_reg[8]),
        .R(\bin_idx[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \bin_idx_reg[8]_i_1 
       (.CI(\bin_idx_reg[4]_i_1_n_0 ),
        .CO({\bin_idx_reg[8]_i_1_n_0 ,\bin_idx_reg[8]_i_1_n_1 ,\bin_idx_reg[8]_i_1_n_2 ,\bin_idx_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\bin_idx_reg[8]_i_1_n_4 ,\bin_idx_reg[8]_i_1_n_5 ,\bin_idx_reg[8]_i_1_n_6 ,\bin_idx_reg[8]_i_1_n_7 }),
        .S(bin_idx_reg[11:8]));
  FDRE \bin_idx_reg[9] 
       (.C(aclk),
        .CE(fire),
        .D(\bin_idx_reg[8]_i_1_n_6 ),
        .Q(bin_idx_reg[9]),
        .R(\bin_idx[0]_i_1_n_0 ));
  FDRE \bin_pipe_reg[0] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[0]),
        .Q(bin_pipe[0]),
        .R(clear));
  FDRE \bin_pipe_reg[10] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[10]),
        .Q(bin_pipe[10]),
        .R(clear));
  FDRE \bin_pipe_reg[11] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[11]),
        .Q(bin_pipe[11]),
        .R(clear));
  FDRE \bin_pipe_reg[12] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[12]),
        .Q(bin_pipe[12]),
        .R(clear));
  FDRE \bin_pipe_reg[13] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[13]),
        .Q(bin_pipe[13]),
        .R(clear));
  FDRE \bin_pipe_reg[14] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[14]),
        .Q(bin_pipe[14]),
        .R(clear));
  FDRE \bin_pipe_reg[15] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[15]),
        .Q(bin_pipe[15]),
        .R(clear));
  FDRE \bin_pipe_reg[1] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[1]),
        .Q(bin_pipe[1]),
        .R(clear));
  FDRE \bin_pipe_reg[2] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[2]),
        .Q(bin_pipe[2]),
        .R(clear));
  FDRE \bin_pipe_reg[3] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[3]),
        .Q(bin_pipe[3]),
        .R(clear));
  FDRE \bin_pipe_reg[4] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[4]),
        .Q(bin_pipe[4]),
        .R(clear));
  FDRE \bin_pipe_reg[5] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[5]),
        .Q(bin_pipe[5]),
        .R(clear));
  FDRE \bin_pipe_reg[6] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[6]),
        .Q(bin_pipe[6]),
        .R(clear));
  FDRE \bin_pipe_reg[7] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[7]),
        .Q(bin_pipe[7]),
        .R(clear));
  FDRE \bin_pipe_reg[8] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[8]),
        .Q(bin_pipe[8]),
        .R(clear));
  FDRE \bin_pipe_reg[9] 
       (.C(aclk),
        .CE(fire),
        .D(bin_idx_reg[9]),
        .Q(bin_pipe[9]),
        .R(clear));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 bins_seen0_carry
       (.CI(1'b0),
        .CO({bins_seen0_carry_n_0,bins_seen0_carry_n_1,bins_seen0_carry_n_2,bins_seen0_carry_n_3}),
        .CYINIT(bin_pipe[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(bin_pipe[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 bins_seen0_carry__0
       (.CI(bins_seen0_carry_n_0),
        .CO({bins_seen0_carry__0_n_0,bins_seen0_carry__0_n_1,bins_seen0_carry__0_n_2,bins_seen0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(bin_pipe[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 bins_seen0_carry__1
       (.CI(bins_seen0_carry__0_n_0),
        .CO({bins_seen0_carry__1_n_0,bins_seen0_carry__1_n_1,bins_seen0_carry__1_n_2,bins_seen0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(bin_pipe[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 bins_seen0_carry__2
       (.CI(bins_seen0_carry__1_n_0),
        .CO({NLW_bins_seen0_carry__2_CO_UNCONNECTED[3:2],bins_seen0_carry__2_n_2,bins_seen0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_bins_seen0_carry__2_O_UNCONNECTED[3],p_1_in[15:13]}),
        .S({1'b0,bin_pipe[15:13]}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \bins_seen[0]_i_1 
       (.I0(bin_pipe[0]),
        .O(p_1_in[0]));
  FDRE \bins_seen_reg[0] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(\bins_seen_reg[15]_0 [0]),
        .R(clear));
  FDRE \bins_seen_reg[10] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(\bins_seen_reg[15]_0 [10]),
        .R(clear));
  FDRE \bins_seen_reg[11] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(\bins_seen_reg[15]_0 [11]),
        .R(clear));
  FDRE \bins_seen_reg[12] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[12]),
        .Q(\bins_seen_reg[15]_0 [12]),
        .R(clear));
  FDRE \bins_seen_reg[13] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[13]),
        .Q(\bins_seen_reg[15]_0 [13]),
        .R(clear));
  FDRE \bins_seen_reg[14] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[14]),
        .Q(\bins_seen_reg[15]_0 [14]),
        .R(clear));
  FDRE \bins_seen_reg[15] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(\bins_seen_reg[15]_0 [15]),
        .R(clear));
  FDRE \bins_seen_reg[1] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(\bins_seen_reg[15]_0 [1]),
        .R(clear));
  FDRE \bins_seen_reg[2] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(\bins_seen_reg[15]_0 [2]),
        .R(clear));
  FDRE \bins_seen_reg[3] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(\bins_seen_reg[15]_0 [3]),
        .R(clear));
  FDRE \bins_seen_reg[4] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(\bins_seen_reg[15]_0 [4]),
        .R(clear));
  FDRE \bins_seen_reg[5] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(\bins_seen_reg[15]_0 [5]),
        .R(clear));
  FDRE \bins_seen_reg[6] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(\bins_seen_reg[15]_0 [6]),
        .R(clear));
  FDRE \bins_seen_reg[7] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(\bins_seen_reg[15]_0 [7]),
        .R(clear));
  FDRE \bins_seen_reg[8] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(\bins_seen_reg[15]_0 [8]),
        .R(clear));
  FDRE \bins_seen_reg[9] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(\bins_seen_reg[15]_0 [9]),
        .R(clear));
  LUT4 #(
    .INIT(16'h8000)) 
    \dc_mag2[31]_i_1 
       (.I0(\dc_mag2[31]_i_2_n_0 ),
        .I1(\dc_mag2[31]_i_3_n_0 ),
        .I2(\dc_mag2[31]_i_4_n_0 ),
        .I3(\dc_mag2[31]_i_5_n_0 ),
        .O(\dc_mag2[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \dc_mag2[31]_i_2 
       (.I0(bin_pipe[0]),
        .I1(bin_pipe[1]),
        .I2(bin_pipe[2]),
        .I3(\run_mag2[31]_i_6_n_0 ),
        .I4(bin_pipe[7]),
        .I5(bin_pipe[8]),
        .O(\dc_mag2[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \dc_mag2[31]_i_3 
       (.I0(bin_pipe[10]),
        .I1(bin_pipe[11]),
        .I2(bin_pipe[13]),
        .I3(bin_pipe[14]),
        .I4(bin_pipe[15]),
        .I5(valid_pipe),
        .O(\dc_mag2[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \dc_mag2[31]_i_4 
       (.I0(bin_pipe[7]),
        .I1(bin_pipe[8]),
        .I2(bin_pipe[6]),
        .I3(bin_pipe[4]),
        .I4(bin_pipe[5]),
        .I5(bin_pipe[3]),
        .O(\dc_mag2[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \dc_mag2[31]_i_5 
       (.I0(bin_pipe[13]),
        .I1(bin_pipe[14]),
        .I2(bin_pipe[12]),
        .I3(bin_pipe[10]),
        .I4(bin_pipe[11]),
        .I5(bin_pipe[9]),
        .O(\dc_mag2[31]_i_5_n_0 ));
  FDRE \dc_mag2_reg[0] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_105),
        .Q(dc_mag2[0]),
        .R(clear));
  FDRE \dc_mag2_reg[10] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_95),
        .Q(dc_mag2[10]),
        .R(clear));
  FDRE \dc_mag2_reg[11] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_94),
        .Q(dc_mag2[11]),
        .R(clear));
  FDRE \dc_mag2_reg[12] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_93),
        .Q(dc_mag2[12]),
        .R(clear));
  FDRE \dc_mag2_reg[13] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_92),
        .Q(dc_mag2[13]),
        .R(clear));
  FDRE \dc_mag2_reg[14] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_91),
        .Q(dc_mag2[14]),
        .R(clear));
  FDRE \dc_mag2_reg[15] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_90),
        .Q(dc_mag2[15]),
        .R(clear));
  FDRE \dc_mag2_reg[16] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_89),
        .Q(dc_mag2[16]),
        .R(clear));
  FDRE \dc_mag2_reg[17] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_88),
        .Q(dc_mag2[17]),
        .R(clear));
  FDRE \dc_mag2_reg[18] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_87),
        .Q(dc_mag2[18]),
        .R(clear));
  FDRE \dc_mag2_reg[19] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_86),
        .Q(dc_mag2[19]),
        .R(clear));
  FDRE \dc_mag2_reg[1] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_104),
        .Q(dc_mag2[1]),
        .R(clear));
  FDRE \dc_mag2_reg[20] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_85),
        .Q(dc_mag2[20]),
        .R(clear));
  FDRE \dc_mag2_reg[21] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_84),
        .Q(dc_mag2[21]),
        .R(clear));
  FDRE \dc_mag2_reg[22] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_83),
        .Q(dc_mag2[22]),
        .R(clear));
  FDRE \dc_mag2_reg[23] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_82),
        .Q(dc_mag2[23]),
        .R(clear));
  FDRE \dc_mag2_reg[24] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_81),
        .Q(dc_mag2[24]),
        .R(clear));
  FDRE \dc_mag2_reg[25] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_80),
        .Q(dc_mag2[25]),
        .R(clear));
  FDRE \dc_mag2_reg[26] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_79),
        .Q(dc_mag2[26]),
        .R(clear));
  FDRE \dc_mag2_reg[27] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_78),
        .Q(dc_mag2[27]),
        .R(clear));
  FDRE \dc_mag2_reg[28] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_77),
        .Q(dc_mag2[28]),
        .R(clear));
  FDRE \dc_mag2_reg[29] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_76),
        .Q(dc_mag2[29]),
        .R(clear));
  FDRE \dc_mag2_reg[2] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_103),
        .Q(dc_mag2[2]),
        .R(clear));
  FDRE \dc_mag2_reg[30] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_75),
        .Q(dc_mag2[30]),
        .R(clear));
  FDRE \dc_mag2_reg[31] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_74),
        .Q(dc_mag2[31]),
        .R(clear));
  FDRE \dc_mag2_reg[3] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_102),
        .Q(dc_mag2[3]),
        .R(clear));
  FDRE \dc_mag2_reg[4] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_101),
        .Q(dc_mag2[4]),
        .R(clear));
  FDRE \dc_mag2_reg[5] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_100),
        .Q(dc_mag2[5]),
        .R(clear));
  FDRE \dc_mag2_reg[6] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_99),
        .Q(dc_mag2[6]),
        .R(clear));
  FDRE \dc_mag2_reg[7] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_98),
        .Q(dc_mag2[7]),
        .R(clear));
  FDRE \dc_mag2_reg[8] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_97),
        .Q(dc_mag2[8]),
        .R(clear));
  FDRE \dc_mag2_reg[9] 
       (.C(aclk),
        .CE(\dc_mag2[31]_i_1_n_0 ),
        .D(mag2_pipe_n_96),
        .Q(dc_mag2[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000EA00EA00EA00)) 
    frame_busy_i_1
       (.I0(frame_busy),
        .I1(s_axis_fft_tvalid),
        .I2(re2_pipe_reg_0),
        .I3(aresetn),
        .I4(valid_pipe),
        .I5(last_pipe),
        .O(frame_busy_i_1_n_0));
  FDRE frame_busy_reg
       (.C(aclk),
        .CE(1'b1),
        .D(frame_busy_i_1_n_0),
        .Q(frame_busy),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \frame_count[0]_i_1 
       (.I0(peak_valid_reg_0),
        .I1(peak_valid_d),
        .O(frame_count0));
  LUT2 #(
    .INIT(4'h8)) 
    last_pipe_i_1
       (.I0(s_axis_fft_tvalid),
        .I1(re2_pipe_reg_0),
        .O(fire));
  FDRE last_pipe_reg
       (.C(aclk),
        .CE(fire),
        .D(s_axis_fft_tlast),
        .Q(last_pipe),
        .R(clear));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    mag2_pipe
       (.A({s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31:16]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mag2_pipe_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({s_axis_fft_tdata[31],s_axis_fft_tdata[31],s_axis_fft_tdata[31:16]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mag2_pipe_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mag2_pipe_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mag2_pipe_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(fire),
        .CEP(1'b0),
        .CLK(aclk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mag2_pipe_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mag2_pipe_OVERFLOW_UNCONNECTED),
        .P({NLW_mag2_pipe_P_UNCONNECTED[47:32],mag2_pipe_n_74,mag2_pipe_n_75,mag2_pipe_n_76,mag2_pipe_n_77,mag2_pipe_n_78,mag2_pipe_n_79,mag2_pipe_n_80,mag2_pipe_n_81,mag2_pipe_n_82,mag2_pipe_n_83,mag2_pipe_n_84,mag2_pipe_n_85,mag2_pipe_n_86,mag2_pipe_n_87,mag2_pipe_n_88,mag2_pipe_n_89,mag2_pipe_n_90,mag2_pipe_n_91,mag2_pipe_n_92,mag2_pipe_n_93,mag2_pipe_n_94,mag2_pipe_n_95,mag2_pipe_n_96,mag2_pipe_n_97,mag2_pipe_n_98,mag2_pipe_n_99,mag2_pipe_n_100,mag2_pipe_n_101,mag2_pipe_n_102,mag2_pipe_n_103,mag2_pipe_n_104,mag2_pipe_n_105}),
        .PATTERNBDETECT(NLW_mag2_pipe_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mag2_pipe_PATTERNDETECT_UNCONNECTED),
        .PCIN({re2_pipe_reg_n_106,re2_pipe_reg_n_107,re2_pipe_reg_n_108,re2_pipe_reg_n_109,re2_pipe_reg_n_110,re2_pipe_reg_n_111,re2_pipe_reg_n_112,re2_pipe_reg_n_113,re2_pipe_reg_n_114,re2_pipe_reg_n_115,re2_pipe_reg_n_116,re2_pipe_reg_n_117,re2_pipe_reg_n_118,re2_pipe_reg_n_119,re2_pipe_reg_n_120,re2_pipe_reg_n_121,re2_pipe_reg_n_122,re2_pipe_reg_n_123,re2_pipe_reg_n_124,re2_pipe_reg_n_125,re2_pipe_reg_n_126,re2_pipe_reg_n_127,re2_pipe_reg_n_128,re2_pipe_reg_n_129,re2_pipe_reg_n_130,re2_pipe_reg_n_131,re2_pipe_reg_n_132,re2_pipe_reg_n_133,re2_pipe_reg_n_134,re2_pipe_reg_n_135,re2_pipe_reg_n_136,re2_pipe_reg_n_137,re2_pipe_reg_n_138,re2_pipe_reg_n_139,re2_pipe_reg_n_140,re2_pipe_reg_n_141,re2_pipe_reg_n_142,re2_pipe_reg_n_143,re2_pipe_reg_n_144,re2_pipe_reg_n_145,re2_pipe_reg_n_146,re2_pipe_reg_n_147,re2_pipe_reg_n_148,re2_pipe_reg_n_149,re2_pipe_reg_n_150,re2_pipe_reg_n_151,re2_pipe_reg_n_152,re2_pipe_reg_n_153}),
        .PCOUT(NLW_mag2_pipe_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(clear),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mag2_pipe_UNDERFLOW_UNCONNECTED));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 new_peak0_carry
       (.CI(1'b0),
        .CO({new_peak0_carry_n_0,new_peak0_carry_n_1,new_peak0_carry_n_2,new_peak0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({new_peak0_carry_i_1_n_0,new_peak0_carry_i_2_n_0,new_peak0_carry_i_3_n_0,new_peak0_carry_i_4_n_0}),
        .O(NLW_new_peak0_carry_O_UNCONNECTED[3:0]),
        .S({new_peak0_carry_i_5_n_0,new_peak0_carry_i_6_n_0,new_peak0_carry_i_7_n_0,new_peak0_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 new_peak0_carry__0
       (.CI(new_peak0_carry_n_0),
        .CO({new_peak0_carry__0_n_0,new_peak0_carry__0_n_1,new_peak0_carry__0_n_2,new_peak0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({new_peak0_carry__0_i_1_n_0,new_peak0_carry__0_i_2_n_0,new_peak0_carry__0_i_3_n_0,new_peak0_carry__0_i_4_n_0}),
        .O(NLW_new_peak0_carry__0_O_UNCONNECTED[3:0]),
        .S({new_peak0_carry__0_i_5_n_0,new_peak0_carry__0_i_6_n_0,new_peak0_carry__0_i_7_n_0,new_peak0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__0_i_1
       (.I0(mag2_pipe_n_91),
        .I1(\run_mag2_reg_n_0_[14] ),
        .I2(\run_mag2_reg_n_0_[15] ),
        .I3(mag2_pipe_n_90),
        .O(new_peak0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__0_i_2
       (.I0(mag2_pipe_n_93),
        .I1(\run_mag2_reg_n_0_[12] ),
        .I2(\run_mag2_reg_n_0_[13] ),
        .I3(mag2_pipe_n_92),
        .O(new_peak0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__0_i_3
       (.I0(mag2_pipe_n_95),
        .I1(\run_mag2_reg_n_0_[10] ),
        .I2(\run_mag2_reg_n_0_[11] ),
        .I3(mag2_pipe_n_94),
        .O(new_peak0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__0_i_4
       (.I0(mag2_pipe_n_97),
        .I1(\run_mag2_reg_n_0_[8] ),
        .I2(\run_mag2_reg_n_0_[9] ),
        .I3(mag2_pipe_n_96),
        .O(new_peak0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__0_i_5
       (.I0(\run_mag2_reg_n_0_[15] ),
        .I1(mag2_pipe_n_90),
        .I2(\run_mag2_reg_n_0_[14] ),
        .I3(mag2_pipe_n_91),
        .O(new_peak0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__0_i_6
       (.I0(\run_mag2_reg_n_0_[13] ),
        .I1(mag2_pipe_n_92),
        .I2(\run_mag2_reg_n_0_[12] ),
        .I3(mag2_pipe_n_93),
        .O(new_peak0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__0_i_7
       (.I0(\run_mag2_reg_n_0_[11] ),
        .I1(mag2_pipe_n_94),
        .I2(\run_mag2_reg_n_0_[10] ),
        .I3(mag2_pipe_n_95),
        .O(new_peak0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__0_i_8
       (.I0(\run_mag2_reg_n_0_[9] ),
        .I1(mag2_pipe_n_96),
        .I2(\run_mag2_reg_n_0_[8] ),
        .I3(mag2_pipe_n_97),
        .O(new_peak0_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 new_peak0_carry__1
       (.CI(new_peak0_carry__0_n_0),
        .CO({new_peak0_carry__1_n_0,new_peak0_carry__1_n_1,new_peak0_carry__1_n_2,new_peak0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({new_peak0_carry__1_i_1_n_0,new_peak0_carry__1_i_2_n_0,new_peak0_carry__1_i_3_n_0,new_peak0_carry__1_i_4_n_0}),
        .O(NLW_new_peak0_carry__1_O_UNCONNECTED[3:0]),
        .S({new_peak0_carry__1_i_5_n_0,new_peak0_carry__1_i_6_n_0,new_peak0_carry__1_i_7_n_0,new_peak0_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__1_i_1
       (.I0(mag2_pipe_n_83),
        .I1(\run_mag2_reg_n_0_[22] ),
        .I2(\run_mag2_reg_n_0_[23] ),
        .I3(mag2_pipe_n_82),
        .O(new_peak0_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__1_i_2
       (.I0(mag2_pipe_n_85),
        .I1(\run_mag2_reg_n_0_[20] ),
        .I2(\run_mag2_reg_n_0_[21] ),
        .I3(mag2_pipe_n_84),
        .O(new_peak0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__1_i_3
       (.I0(mag2_pipe_n_87),
        .I1(\run_mag2_reg_n_0_[18] ),
        .I2(\run_mag2_reg_n_0_[19] ),
        .I3(mag2_pipe_n_86),
        .O(new_peak0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__1_i_4
       (.I0(mag2_pipe_n_89),
        .I1(\run_mag2_reg_n_0_[16] ),
        .I2(\run_mag2_reg_n_0_[17] ),
        .I3(mag2_pipe_n_88),
        .O(new_peak0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__1_i_5
       (.I0(\run_mag2_reg_n_0_[23] ),
        .I1(mag2_pipe_n_82),
        .I2(\run_mag2_reg_n_0_[22] ),
        .I3(mag2_pipe_n_83),
        .O(new_peak0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__1_i_6
       (.I0(\run_mag2_reg_n_0_[21] ),
        .I1(mag2_pipe_n_84),
        .I2(\run_mag2_reg_n_0_[20] ),
        .I3(mag2_pipe_n_85),
        .O(new_peak0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__1_i_7
       (.I0(\run_mag2_reg_n_0_[19] ),
        .I1(mag2_pipe_n_86),
        .I2(\run_mag2_reg_n_0_[18] ),
        .I3(mag2_pipe_n_87),
        .O(new_peak0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__1_i_8
       (.I0(\run_mag2_reg_n_0_[17] ),
        .I1(mag2_pipe_n_88),
        .I2(\run_mag2_reg_n_0_[16] ),
        .I3(mag2_pipe_n_89),
        .O(new_peak0_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 new_peak0_carry__2
       (.CI(new_peak0_carry__1_n_0),
        .CO({new_peak0,new_peak0_carry__2_n_1,new_peak0_carry__2_n_2,new_peak0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({new_peak0_carry__2_i_1_n_0,new_peak0_carry__2_i_2_n_0,new_peak0_carry__2_i_3_n_0,new_peak0_carry__2_i_4_n_0}),
        .O(NLW_new_peak0_carry__2_O_UNCONNECTED[3:0]),
        .S({new_peak0_carry__2_i_5_n_0,new_peak0_carry__2_i_6_n_0,new_peak0_carry__2_i_7_n_0,new_peak0_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__2_i_1
       (.I0(mag2_pipe_n_75),
        .I1(\run_mag2_reg_n_0_[30] ),
        .I2(\run_mag2_reg_n_0_[31] ),
        .I3(mag2_pipe_n_74),
        .O(new_peak0_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__2_i_2
       (.I0(mag2_pipe_n_77),
        .I1(\run_mag2_reg_n_0_[28] ),
        .I2(\run_mag2_reg_n_0_[29] ),
        .I3(mag2_pipe_n_76),
        .O(new_peak0_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__2_i_3
       (.I0(mag2_pipe_n_79),
        .I1(\run_mag2_reg_n_0_[26] ),
        .I2(\run_mag2_reg_n_0_[27] ),
        .I3(mag2_pipe_n_78),
        .O(new_peak0_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry__2_i_4
       (.I0(mag2_pipe_n_81),
        .I1(\run_mag2_reg_n_0_[24] ),
        .I2(\run_mag2_reg_n_0_[25] ),
        .I3(mag2_pipe_n_80),
        .O(new_peak0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__2_i_5
       (.I0(\run_mag2_reg_n_0_[31] ),
        .I1(mag2_pipe_n_74),
        .I2(\run_mag2_reg_n_0_[30] ),
        .I3(mag2_pipe_n_75),
        .O(new_peak0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__2_i_6
       (.I0(\run_mag2_reg_n_0_[29] ),
        .I1(mag2_pipe_n_76),
        .I2(\run_mag2_reg_n_0_[28] ),
        .I3(mag2_pipe_n_77),
        .O(new_peak0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__2_i_7
       (.I0(\run_mag2_reg_n_0_[27] ),
        .I1(mag2_pipe_n_78),
        .I2(\run_mag2_reg_n_0_[26] ),
        .I3(mag2_pipe_n_79),
        .O(new_peak0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry__2_i_8
       (.I0(\run_mag2_reg_n_0_[25] ),
        .I1(mag2_pipe_n_80),
        .I2(\run_mag2_reg_n_0_[24] ),
        .I3(mag2_pipe_n_81),
        .O(new_peak0_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry_i_1
       (.I0(mag2_pipe_n_99),
        .I1(\run_mag2_reg_n_0_[6] ),
        .I2(\run_mag2_reg_n_0_[7] ),
        .I3(mag2_pipe_n_98),
        .O(new_peak0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry_i_2
       (.I0(mag2_pipe_n_101),
        .I1(\run_mag2_reg_n_0_[4] ),
        .I2(\run_mag2_reg_n_0_[5] ),
        .I3(mag2_pipe_n_100),
        .O(new_peak0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry_i_3
       (.I0(mag2_pipe_n_103),
        .I1(\run_mag2_reg_n_0_[2] ),
        .I2(\run_mag2_reg_n_0_[3] ),
        .I3(mag2_pipe_n_102),
        .O(new_peak0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    new_peak0_carry_i_4
       (.I0(mag2_pipe_n_105),
        .I1(\run_mag2_reg_n_0_[0] ),
        .I2(\run_mag2_reg_n_0_[1] ),
        .I3(mag2_pipe_n_104),
        .O(new_peak0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry_i_5
       (.I0(\run_mag2_reg_n_0_[7] ),
        .I1(mag2_pipe_n_98),
        .I2(\run_mag2_reg_n_0_[6] ),
        .I3(mag2_pipe_n_99),
        .O(new_peak0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry_i_6
       (.I0(\run_mag2_reg_n_0_[5] ),
        .I1(mag2_pipe_n_100),
        .I2(\run_mag2_reg_n_0_[4] ),
        .I3(mag2_pipe_n_101),
        .O(new_peak0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry_i_7
       (.I0(\run_mag2_reg_n_0_[3] ),
        .I1(mag2_pipe_n_102),
        .I2(\run_mag2_reg_n_0_[2] ),
        .I3(mag2_pipe_n_103),
        .O(new_peak0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    new_peak0_carry_i_8
       (.I0(\run_mag2_reg_n_0_[1] ),
        .I1(mag2_pipe_n_104),
        .I2(\run_mag2_reg_n_0_[0] ),
        .I3(mag2_pipe_n_105),
        .O(new_peak0_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \peak_bin[15]_i_1 
       (.I0(valid_pipe),
        .I1(last_pipe),
        .O(\peak_bin[15]_i_1_n_0 ));
  FDRE \peak_bin_reg[0] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[0]),
        .Q(peak_bin[0]),
        .R(clear));
  FDRE \peak_bin_reg[10] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[10]),
        .Q(peak_bin[10]),
        .R(clear));
  FDRE \peak_bin_reg[11] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[11]),
        .Q(peak_bin[11]),
        .R(clear));
  FDRE \peak_bin_reg[12] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[12]),
        .Q(peak_bin[12]),
        .R(clear));
  FDRE \peak_bin_reg[13] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[13]),
        .Q(peak_bin[13]),
        .R(clear));
  FDRE \peak_bin_reg[14] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[14]),
        .Q(peak_bin[14]),
        .R(clear));
  FDRE \peak_bin_reg[15] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[15]),
        .Q(peak_bin[15]),
        .R(clear));
  FDRE \peak_bin_reg[1] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[1]),
        .Q(peak_bin[1]),
        .R(clear));
  FDRE \peak_bin_reg[2] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[2]),
        .Q(peak_bin[2]),
        .R(clear));
  FDRE \peak_bin_reg[3] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[3]),
        .Q(peak_bin[3]),
        .R(clear));
  FDRE \peak_bin_reg[4] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[4]),
        .Q(peak_bin[4]),
        .R(clear));
  FDRE \peak_bin_reg[5] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[5]),
        .Q(peak_bin[5]),
        .R(clear));
  FDRE \peak_bin_reg[6] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[6]),
        .Q(peak_bin[6]),
        .R(clear));
  FDRE \peak_bin_reg[7] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[7]),
        .Q(peak_bin[7]),
        .R(clear));
  FDRE \peak_bin_reg[8] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[8]),
        .Q(peak_bin[8]),
        .R(clear));
  FDRE \peak_bin_reg[9] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(run_bin1_in[9]),
        .Q(peak_bin[9]),
        .R(clear));
  FDRE \peak_mag2_reg[0] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[0]_i_1_n_0 ),
        .Q(peak_mag2[0]),
        .R(clear));
  FDRE \peak_mag2_reg[10] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[10]_i_1_n_0 ),
        .Q(peak_mag2[10]),
        .R(clear));
  FDRE \peak_mag2_reg[11] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[11]_i_1_n_0 ),
        .Q(peak_mag2[11]),
        .R(clear));
  FDRE \peak_mag2_reg[12] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[12]_i_1_n_0 ),
        .Q(peak_mag2[12]),
        .R(clear));
  FDRE \peak_mag2_reg[13] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[13]_i_1_n_0 ),
        .Q(peak_mag2[13]),
        .R(clear));
  FDRE \peak_mag2_reg[14] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[14]_i_1_n_0 ),
        .Q(peak_mag2[14]),
        .R(clear));
  FDRE \peak_mag2_reg[15] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[15]_i_1_n_0 ),
        .Q(peak_mag2[15]),
        .R(clear));
  FDRE \peak_mag2_reg[16] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[16]_i_1_n_0 ),
        .Q(peak_mag2[16]),
        .R(clear));
  FDRE \peak_mag2_reg[17] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[17]_i_1_n_0 ),
        .Q(peak_mag2[17]),
        .R(clear));
  FDRE \peak_mag2_reg[18] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[18]_i_1_n_0 ),
        .Q(peak_mag2[18]),
        .R(clear));
  FDRE \peak_mag2_reg[19] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[19]_i_1_n_0 ),
        .Q(peak_mag2[19]),
        .R(clear));
  FDRE \peak_mag2_reg[1] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[1]_i_1_n_0 ),
        .Q(peak_mag2[1]),
        .R(clear));
  FDRE \peak_mag2_reg[20] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[20]_i_1_n_0 ),
        .Q(peak_mag2[20]),
        .R(clear));
  FDRE \peak_mag2_reg[21] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[21]_i_1_n_0 ),
        .Q(peak_mag2[21]),
        .R(clear));
  FDRE \peak_mag2_reg[22] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[22]_i_1_n_0 ),
        .Q(peak_mag2[22]),
        .R(clear));
  FDRE \peak_mag2_reg[23] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[23]_i_1_n_0 ),
        .Q(peak_mag2[23]),
        .R(clear));
  FDRE \peak_mag2_reg[24] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[24]_i_1_n_0 ),
        .Q(peak_mag2[24]),
        .R(clear));
  FDRE \peak_mag2_reg[25] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[25]_i_1_n_0 ),
        .Q(peak_mag2[25]),
        .R(clear));
  FDRE \peak_mag2_reg[26] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[26]_i_1_n_0 ),
        .Q(peak_mag2[26]),
        .R(clear));
  FDRE \peak_mag2_reg[27] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[27]_i_1_n_0 ),
        .Q(peak_mag2[27]),
        .R(clear));
  FDRE \peak_mag2_reg[28] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[28]_i_1_n_0 ),
        .Q(peak_mag2[28]),
        .R(clear));
  FDRE \peak_mag2_reg[29] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[29]_i_1_n_0 ),
        .Q(peak_mag2[29]),
        .R(clear));
  FDRE \peak_mag2_reg[2] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[2]_i_1_n_0 ),
        .Q(peak_mag2[2]),
        .R(clear));
  FDRE \peak_mag2_reg[30] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[30]_i_1_n_0 ),
        .Q(peak_mag2[30]),
        .R(clear));
  FDRE \peak_mag2_reg[31] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[31]_i_2_n_0 ),
        .Q(peak_mag2[31]),
        .R(clear));
  FDRE \peak_mag2_reg[3] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[3]_i_1_n_0 ),
        .Q(peak_mag2[3]),
        .R(clear));
  FDRE \peak_mag2_reg[4] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[4]_i_1_n_0 ),
        .Q(peak_mag2[4]),
        .R(clear));
  FDRE \peak_mag2_reg[5] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[5]_i_1_n_0 ),
        .Q(peak_mag2[5]),
        .R(clear));
  FDRE \peak_mag2_reg[6] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[6]_i_1_n_0 ),
        .Q(peak_mag2[6]),
        .R(clear));
  FDRE \peak_mag2_reg[7] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[7]_i_1_n_0 ),
        .Q(peak_mag2[7]),
        .R(clear));
  FDRE \peak_mag2_reg[8] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[8]_i_1_n_0 ),
        .Q(peak_mag2[8]),
        .R(clear));
  FDRE \peak_mag2_reg[9] 
       (.C(aclk),
        .CE(\peak_bin[15]_i_1_n_0 ),
        .D(\run_mag2[9]_i_1_n_0 ),
        .Q(peak_mag2[9]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    peak_valid_d_i_1
       (.I0(peak_valid_d),
        .I1(peak_valid_d_reg_0),
        .I2(peak_valid_reg_0),
        .O(peak_valid_d_reg));
  LUT3 #(
    .INIT(8'hF8)) 
    peak_valid_i_1
       (.I0(last_pipe),
        .I1(valid_pipe),
        .I2(peak_valid_reg_0),
        .O(peak_valid_i_1_n_0));
  FDRE peak_valid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(peak_valid_i_1_n_0),
        .Q(peak_valid_reg_0),
        .R(clear));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-12 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    re2_pipe_reg
       (.A({s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_re2_pipe_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({s_axis_fft_tdata[15],s_axis_fft_tdata[15],s_axis_fft_tdata[15:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_re2_pipe_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_re2_pipe_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_re2_pipe_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(fire),
        .CLK(aclk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_re2_pipe_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_re2_pipe_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_re2_pipe_reg_P_UNCONNECTED[47:32],re2_pipe_reg_n_74,re2_pipe_reg_n_75,re2_pipe_reg_n_76,re2_pipe_reg_n_77,re2_pipe_reg_n_78,re2_pipe_reg_n_79,re2_pipe_reg_n_80,re2_pipe_reg_n_81,re2_pipe_reg_n_82,re2_pipe_reg_n_83,re2_pipe_reg_n_84,re2_pipe_reg_n_85,re2_pipe_reg_n_86,re2_pipe_reg_n_87,re2_pipe_reg_n_88,re2_pipe_reg_n_89,re2_pipe_reg_n_90,re2_pipe_reg_n_91,re2_pipe_reg_n_92,re2_pipe_reg_n_93,re2_pipe_reg_n_94,re2_pipe_reg_n_95,re2_pipe_reg_n_96,re2_pipe_reg_n_97,re2_pipe_reg_n_98,re2_pipe_reg_n_99,re2_pipe_reg_n_100,re2_pipe_reg_n_101,re2_pipe_reg_n_102,re2_pipe_reg_n_103,re2_pipe_reg_n_104,re2_pipe_reg_n_105}),
        .PATTERNBDETECT(NLW_re2_pipe_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_re2_pipe_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({re2_pipe_reg_n_106,re2_pipe_reg_n_107,re2_pipe_reg_n_108,re2_pipe_reg_n_109,re2_pipe_reg_n_110,re2_pipe_reg_n_111,re2_pipe_reg_n_112,re2_pipe_reg_n_113,re2_pipe_reg_n_114,re2_pipe_reg_n_115,re2_pipe_reg_n_116,re2_pipe_reg_n_117,re2_pipe_reg_n_118,re2_pipe_reg_n_119,re2_pipe_reg_n_120,re2_pipe_reg_n_121,re2_pipe_reg_n_122,re2_pipe_reg_n_123,re2_pipe_reg_n_124,re2_pipe_reg_n_125,re2_pipe_reg_n_126,re2_pipe_reg_n_127,re2_pipe_reg_n_128,re2_pipe_reg_n_129,re2_pipe_reg_n_130,re2_pipe_reg_n_131,re2_pipe_reg_n_132,re2_pipe_reg_n_133,re2_pipe_reg_n_134,re2_pipe_reg_n_135,re2_pipe_reg_n_136,re2_pipe_reg_n_137,re2_pipe_reg_n_138,re2_pipe_reg_n_139,re2_pipe_reg_n_140,re2_pipe_reg_n_141,re2_pipe_reg_n_142,re2_pipe_reg_n_143,re2_pipe_reg_n_144,re2_pipe_reg_n_145,re2_pipe_reg_n_146,re2_pipe_reg_n_147,re2_pipe_reg_n_148,re2_pipe_reg_n_149,re2_pipe_reg_n_150,re2_pipe_reg_n_151,re2_pipe_reg_n_152,re2_pipe_reg_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(clear),
        .UNDERFLOW(NLW_re2_pipe_reg_UNDERFLOW_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[0]_i_1 
       (.I0(bin_pipe[0]),
        .I1(new_peak__15),
        .I2(run_bin[0]),
        .O(run_bin1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[10]_i_1 
       (.I0(bin_pipe[10]),
        .I1(new_peak__15),
        .I2(run_bin[10]),
        .O(run_bin1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[11]_i_1 
       (.I0(bin_pipe[11]),
        .I1(new_peak__15),
        .I2(run_bin[11]),
        .O(run_bin1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[12]_i_1 
       (.I0(bin_pipe[12]),
        .I1(new_peak__15),
        .I2(run_bin[12]),
        .O(run_bin1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[13]_i_1 
       (.I0(bin_pipe[13]),
        .I1(new_peak__15),
        .I2(run_bin[13]),
        .O(run_bin1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[14]_i_1 
       (.I0(bin_pipe[14]),
        .I1(new_peak__15),
        .I2(run_bin[14]),
        .O(run_bin1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[15]_i_1 
       (.I0(bin_pipe[15]),
        .I1(new_peak__15),
        .I2(run_bin[15]),
        .O(run_bin1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[1]_i_1 
       (.I0(bin_pipe[1]),
        .I1(new_peak__15),
        .I2(run_bin[1]),
        .O(run_bin1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[2]_i_1 
       (.I0(bin_pipe[2]),
        .I1(new_peak__15),
        .I2(run_bin[2]),
        .O(run_bin1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[3]_i_1 
       (.I0(bin_pipe[3]),
        .I1(new_peak__15),
        .I2(run_bin[3]),
        .O(run_bin1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[4]_i_1 
       (.I0(bin_pipe[4]),
        .I1(new_peak__15),
        .I2(run_bin[4]),
        .O(run_bin1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[5]_i_1 
       (.I0(bin_pipe[5]),
        .I1(new_peak__15),
        .I2(run_bin[5]),
        .O(run_bin1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[6]_i_1 
       (.I0(bin_pipe[6]),
        .I1(new_peak__15),
        .I2(run_bin[6]),
        .O(run_bin1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[7]_i_1 
       (.I0(bin_pipe[7]),
        .I1(new_peak__15),
        .I2(run_bin[7]),
        .O(run_bin1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[8]_i_1 
       (.I0(bin_pipe[8]),
        .I1(new_peak__15),
        .I2(run_bin[8]),
        .O(run_bin1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_bin[9]_i_1 
       (.I0(bin_pipe[9]),
        .I1(new_peak__15),
        .I2(run_bin[9]),
        .O(run_bin1_in[9]));
  FDRE \run_bin_reg[0] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[0]),
        .Q(run_bin[0]),
        .R(run_mag2));
  FDRE \run_bin_reg[10] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[10]),
        .Q(run_bin[10]),
        .R(run_mag2));
  FDRE \run_bin_reg[11] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[11]),
        .Q(run_bin[11]),
        .R(run_mag2));
  FDRE \run_bin_reg[12] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[12]),
        .Q(run_bin[12]),
        .R(run_mag2));
  FDRE \run_bin_reg[13] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[13]),
        .Q(run_bin[13]),
        .R(run_mag2));
  FDRE \run_bin_reg[14] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[14]),
        .Q(run_bin[14]),
        .R(run_mag2));
  FDRE \run_bin_reg[15] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[15]),
        .Q(run_bin[15]),
        .R(run_mag2));
  FDRE \run_bin_reg[1] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[1]),
        .Q(run_bin[1]),
        .R(run_mag2));
  FDRE \run_bin_reg[2] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[2]),
        .Q(run_bin[2]),
        .R(run_mag2));
  FDRE \run_bin_reg[3] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[3]),
        .Q(run_bin[3]),
        .R(run_mag2));
  FDRE \run_bin_reg[4] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[4]),
        .Q(run_bin[4]),
        .R(run_mag2));
  FDRE \run_bin_reg[5] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[5]),
        .Q(run_bin[5]),
        .R(run_mag2));
  FDRE \run_bin_reg[6] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[6]),
        .Q(run_bin[6]),
        .R(run_mag2));
  FDRE \run_bin_reg[7] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[7]),
        .Q(run_bin[7]),
        .R(run_mag2));
  FDRE \run_bin_reg[8] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[8]),
        .Q(run_bin[8]),
        .R(run_mag2));
  FDRE \run_bin_reg[9] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(run_bin1_in[9]),
        .Q(run_bin[9]),
        .R(run_mag2));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[0]_i_1 
       (.I0(mag2_pipe_n_105),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[0] ),
        .O(\run_mag2[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[10]_i_1 
       (.I0(mag2_pipe_n_95),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[10] ),
        .O(\run_mag2[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[11]_i_1 
       (.I0(mag2_pipe_n_94),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[11] ),
        .O(\run_mag2[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[12]_i_1 
       (.I0(mag2_pipe_n_93),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[12] ),
        .O(\run_mag2[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[13]_i_1 
       (.I0(mag2_pipe_n_92),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[13] ),
        .O(\run_mag2[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[14]_i_1 
       (.I0(mag2_pipe_n_91),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[14] ),
        .O(\run_mag2[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[15]_i_1 
       (.I0(mag2_pipe_n_90),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[15] ),
        .O(\run_mag2[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[16]_i_1 
       (.I0(mag2_pipe_n_89),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[16] ),
        .O(\run_mag2[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[17]_i_1 
       (.I0(mag2_pipe_n_88),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[17] ),
        .O(\run_mag2[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[18]_i_1 
       (.I0(mag2_pipe_n_87),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[18] ),
        .O(\run_mag2[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[19]_i_1 
       (.I0(mag2_pipe_n_86),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[19] ),
        .O(\run_mag2[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[1]_i_1 
       (.I0(mag2_pipe_n_104),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[1] ),
        .O(\run_mag2[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[20]_i_1 
       (.I0(mag2_pipe_n_85),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[20] ),
        .O(\run_mag2[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[21]_i_1 
       (.I0(mag2_pipe_n_84),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[21] ),
        .O(\run_mag2[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[22]_i_1 
       (.I0(mag2_pipe_n_83),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[22] ),
        .O(\run_mag2[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[23]_i_1 
       (.I0(mag2_pipe_n_82),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[23] ),
        .O(\run_mag2[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[24]_i_1 
       (.I0(mag2_pipe_n_81),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[24] ),
        .O(\run_mag2[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[25]_i_1 
       (.I0(mag2_pipe_n_80),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[25] ),
        .O(\run_mag2[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[26]_i_1 
       (.I0(mag2_pipe_n_79),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[26] ),
        .O(\run_mag2[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[27]_i_1 
       (.I0(mag2_pipe_n_78),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[27] ),
        .O(\run_mag2[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[28]_i_1 
       (.I0(mag2_pipe_n_77),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[28] ),
        .O(\run_mag2[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[29]_i_1 
       (.I0(mag2_pipe_n_76),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[29] ),
        .O(\run_mag2[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[2]_i_1 
       (.I0(mag2_pipe_n_103),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[2] ),
        .O(\run_mag2[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[30]_i_1 
       (.I0(mag2_pipe_n_75),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[30] ),
        .O(\run_mag2[30]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8F)) 
    \run_mag2[31]_i_1 
       (.I0(last_pipe),
        .I1(valid_pipe),
        .I2(aresetn),
        .O(run_mag2));
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[31]_i_2 
       (.I0(mag2_pipe_n_74),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[31] ),
        .O(\run_mag2[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEF00000000)) 
    \run_mag2[31]_i_3 
       (.I0(\run_mag2[31]_i_4_n_0 ),
        .I1(\run_mag2[31]_i_5_n_0 ),
        .I2(\run_mag2[31]_i_6_n_0 ),
        .I3(bin_pipe[7]),
        .I4(bin_pipe[6]),
        .I5(new_peak0),
        .O(new_peak__15));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \run_mag2[31]_i_4 
       (.I0(bin_pipe[10]),
        .I1(bin_pipe[11]),
        .I2(bin_pipe[9]),
        .I3(bin_pipe[8]),
        .I4(\run_mag2[31]_i_7_n_0 ),
        .O(\run_mag2[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \run_mag2[31]_i_5 
       (.I0(bin_pipe[0]),
        .I1(bin_pipe[1]),
        .I2(bin_pipe[2]),
        .I3(bin_pipe[3]),
        .O(\run_mag2[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \run_mag2[31]_i_6 
       (.I0(bin_pipe[4]),
        .I1(bin_pipe[5]),
        .O(\run_mag2[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \run_mag2[31]_i_7 
       (.I0(bin_pipe[12]),
        .I1(bin_pipe[13]),
        .I2(bin_pipe[15]),
        .I3(bin_pipe[14]),
        .O(\run_mag2[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[3]_i_1 
       (.I0(mag2_pipe_n_102),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[3] ),
        .O(\run_mag2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[4]_i_1 
       (.I0(mag2_pipe_n_101),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[4] ),
        .O(\run_mag2[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[5]_i_1 
       (.I0(mag2_pipe_n_100),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[5] ),
        .O(\run_mag2[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[6]_i_1 
       (.I0(mag2_pipe_n_99),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[6] ),
        .O(\run_mag2[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[7]_i_1 
       (.I0(mag2_pipe_n_98),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[7] ),
        .O(\run_mag2[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[8]_i_1 
       (.I0(mag2_pipe_n_97),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[8] ),
        .O(\run_mag2[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \run_mag2[9]_i_1 
       (.I0(mag2_pipe_n_96),
        .I1(new_peak__15),
        .I2(\run_mag2_reg_n_0_[9] ),
        .O(\run_mag2[9]_i_1_n_0 ));
  FDRE \run_mag2_reg[0] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[0]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[0] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[10] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[10]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[10] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[11] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[11]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[11] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[12] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[12]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[12] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[13] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[13]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[13] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[14] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[14]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[14] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[15] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[15]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[15] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[16] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[16]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[16] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[17] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[17]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[17] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[18] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[18]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[18] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[19] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[19]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[19] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[1] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[1]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[1] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[20] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[20]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[20] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[21] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[21]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[21] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[22] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[22]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[22] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[23] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[23]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[23] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[24] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[24]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[24] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[25] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[25]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[25] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[26] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[26]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[26] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[27] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[27]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[27] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[28] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[28]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[28] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[29] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[29]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[29] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[2] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[2]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[2] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[30] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[30]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[30] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[31] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[31]_i_2_n_0 ),
        .Q(\run_mag2_reg_n_0_[31] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[3] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[3]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[3] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[4] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[4]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[4] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[5] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[5]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[5] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[6] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[6]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[6] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[7] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[7]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[7] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[8] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[8]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[8] ),
        .R(run_mag2));
  FDRE \run_mag2_reg[9] 
       (.C(aclk),
        .CE(valid_pipe),
        .D(\run_mag2[9]_i_1_n_0 ),
        .Q(\run_mag2_reg_n_0_[9] ),
        .R(run_mag2));
  LUT1 #(
    .INIT(2'h1)) 
    s_axi_bvalid_i_1
       (.I0(aresetn),
        .O(clear));
  LUT6 #(
    .INIT(64'hCFEFCFECCCEFCCEC)) 
    \s_axi_rdata[0]_i_1 
       (.I0(\s_axi_rdata[0]_i_2_n_0 ),
        .I1(\s_axi_rdata_reg[0] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[0]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[0]_0 ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[0]_i_2 
       (.I0(peak_mag2[0]),
        .I1(pw_samples[0]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[0]),
        .I5(dc_mag2[0]),
        .O(\s_axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[0]_i_4 
       (.I0(peak_valid_reg_0),
        .I1(Q[0]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(re2_pipe_reg_0),
        .I5(\s_axi_rdata_reg[15] [0]),
        .O(\s_axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[10]_i_1 
       (.I0(\s_axi_rdata[10]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[10] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[10]_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[10]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [7]),
        .I3(Q[7]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[10]_i_5_n_0 ),
        .O(\s_axi_rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[10]_i_5 
       (.I0(peak_mag2[10]),
        .I1(pw_samples[10]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[10]),
        .I5(dc_mag2[10]),
        .O(\s_axi_rdata[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[11]_i_1 
       (.I0(\s_axi_rdata[11]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[11] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[11]_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[11]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [8]),
        .I3(Q[8]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[11]_i_5_n_0 ),
        .O(\s_axi_rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[11]_i_5 
       (.I0(peak_mag2[11]),
        .I1(pw_samples[11]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[11]),
        .I5(dc_mag2[11]),
        .O(\s_axi_rdata[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[12]_i_1 
       (.I0(\s_axi_rdata[12]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[12] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[12]_0 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[12]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [9]),
        .I3(Q[9]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[12]_i_5_n_0 ),
        .O(\s_axi_rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[12]_i_5 
       (.I0(peak_mag2[12]),
        .I1(pw_samples[12]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[12]),
        .I5(dc_mag2[12]),
        .O(\s_axi_rdata[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[13]_i_1 
       (.I0(\s_axi_rdata[13]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[13] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[13]_0 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[13]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [10]),
        .I3(Q[10]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[13]_i_5_n_0 ),
        .O(\s_axi_rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[13]_i_5 
       (.I0(peak_mag2[13]),
        .I1(pw_samples[13]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[13]),
        .I5(dc_mag2[13]),
        .O(\s_axi_rdata[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[14]_i_4 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [11]),
        .I3(Q[11]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[14]_i_5_n_0 ),
        .O(\s_axi_araddr[3]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[14]_i_5 
       (.I0(peak_mag2[14]),
        .I1(pw_samples[14]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[14]),
        .I5(dc_mag2[14]),
        .O(\s_axi_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[15]_i_1 
       (.I0(\s_axi_rdata[15]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[15]_0 ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[15]_1 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[15]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [12]),
        .I3(Q[12]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[15]_i_5_n_0 ),
        .O(\s_axi_rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[15]_i_5 
       (.I0(peak_mag2[15]),
        .I1(pw_samples[15]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[15]),
        .I5(dc_mag2[15]),
        .O(\s_axi_rdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[16]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[16]),
        .I4(peak_mag2[16]),
        .I5(dc_mag2[16]),
        .O(s_axi_araddr_2_sn_1));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[17]_i_3 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[17]),
        .I4(peak_mag2[17]),
        .I5(dc_mag2[17]),
        .O(\s_axi_araddr[2]_0 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[18]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[18]),
        .I4(peak_mag2[18]),
        .I5(dc_mag2[18]),
        .O(\s_axi_araddr[2]_1 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[19]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[19]),
        .I4(peak_mag2[19]),
        .I5(dc_mag2[19]),
        .O(\s_axi_araddr[2]_2 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[1]_i_2 
       (.I0(peak_mag2[1]),
        .I1(pw_samples[1]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[1]),
        .I5(dc_mag2[1]),
        .O(\peak_mag2_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[20]_i_3 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[20]),
        .I4(peak_mag2[20]),
        .I5(dc_mag2[20]),
        .O(\s_axi_araddr[2]_3 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[21]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[21]),
        .I4(peak_mag2[21]),
        .I5(dc_mag2[21]),
        .O(\s_axi_araddr[2]_4 ));
  LUT6 #(
    .INIT(64'h00000000FFFFFFEA)) 
    \s_axi_rdata[22]_i_1 
       (.I0(\s_axi_rdata_reg[22] ),
        .I1(Q[13]),
        .I2(\s_axi_rdata_reg[22]_0 ),
        .I3(\s_axi_rdata[22]_i_3_n_0 ),
        .I4(\s_axi_rdata_reg[22]_1 ),
        .I5(\s_axi_rdata_reg[5]_0 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[22]_i_3 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[22]),
        .I4(peak_mag2[22]),
        .I5(dc_mag2[22]),
        .O(\s_axi_rdata[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[23]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[23]),
        .I4(peak_mag2[23]),
        .I5(dc_mag2[23]),
        .O(\s_axi_araddr[2]_5 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[24]_i_3 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[24]),
        .I4(peak_mag2[24]),
        .I5(dc_mag2[24]),
        .O(\s_axi_araddr[2]_6 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[25]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[25]),
        .I4(peak_mag2[25]),
        .I5(dc_mag2[25]),
        .O(\s_axi_araddr[2]_7 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[26]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[26]),
        .I4(peak_mag2[26]),
        .I5(dc_mag2[26]),
        .O(\s_axi_araddr[2]_8 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[27]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[27]),
        .I4(peak_mag2[27]),
        .I5(dc_mag2[27]),
        .O(\s_axi_araddr[2]_9 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[28]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[28]),
        .I4(peak_mag2[28]),
        .I5(dc_mag2[28]),
        .O(\s_axi_araddr[2]_10 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[29]_i_3 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[29]),
        .I4(peak_mag2[29]),
        .I5(dc_mag2[29]),
        .O(\s_axi_araddr[2]_11 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[2]_i_2 
       (.I0(peak_mag2[2]),
        .I1(pw_samples[2]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[2]),
        .I5(dc_mag2[2]),
        .O(\peak_mag2_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[30]_i_4 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[30]),
        .I4(peak_mag2[30]),
        .I5(dc_mag2[30]),
        .O(\s_axi_araddr[2]_12 ));
  LUT6 #(
    .INIT(64'hA828A02088088000)) 
    \s_axi_rdata[31]_i_6 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(pw_samples[31]),
        .I4(peak_mag2[31]),
        .I5(dc_mag2[31]),
        .O(\s_axi_araddr[2]_13 ));
  LUT6 #(
    .INIT(64'hCFEFCFECCCEFCCEC)) 
    \s_axi_rdata[3]_i_1 
       (.I0(\s_axi_rdata[3]_i_2_n_0 ),
        .I1(\s_axi_rdata_reg[3] ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[3]_i_4_n_0 ),
        .I5(\s_axi_rdata_reg[3]_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[3]_i_2 
       (.I0(peak_mag2[3]),
        .I1(pw_samples[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[3]),
        .I5(dc_mag2[3]),
        .O(\s_axi_rdata[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \s_axi_rdata[3]_i_4 
       (.I0(\s_axi_rdata_reg[15] [1]),
        .I1(frame_busy),
        .I2(Q[1]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .O(\s_axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[4]_i_3 
       (.I0(peak_mag2[4]),
        .I1(pw_samples[4]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[4]),
        .I5(dc_mag2[4]),
        .O(\peak_mag2_reg[4]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[5]_i_1 
       (.I0(\s_axi_rdata[5]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[5] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[5]_1 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[5]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [2]),
        .I3(Q[2]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[5]_i_5_n_0 ),
        .O(\s_axi_rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[5]_i_5 
       (.I0(peak_mag2[5]),
        .I1(pw_samples[5]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[5]),
        .I5(dc_mag2[5]),
        .O(\s_axi_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[6]_i_1 
       (.I0(\s_axi_rdata[6]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[6] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[6]_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[6]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [3]),
        .I3(Q[3]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[6]_i_5_n_0 ),
        .O(\s_axi_rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[6]_i_5 
       (.I0(peak_mag2[6]),
        .I1(pw_samples[6]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[6]),
        .I5(dc_mag2[6]),
        .O(\s_axi_rdata[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[7]_i_1 
       (.I0(\s_axi_rdata[7]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[7] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[7]_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[7]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [4]),
        .I3(Q[4]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[7]_i_5_n_0 ),
        .O(\s_axi_rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[7]_i_5 
       (.I0(peak_mag2[7]),
        .I1(pw_samples[7]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[7]),
        .I5(dc_mag2[7]),
        .O(\s_axi_rdata[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[8]_i_4 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [5]),
        .I3(Q[5]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[8]_i_5_n_0 ),
        .O(s_axi_araddr_3_sn_1));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[8]_i_5 
       (.I0(peak_mag2[8]),
        .I1(pw_samples[8]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[8]),
        .I5(dc_mag2[8]),
        .O(\s_axi_rdata[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF2E22)) 
    \s_axi_rdata[9]_i_1 
       (.I0(\s_axi_rdata[9]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[2]),
        .I3(\s_axi_rdata_reg[9] ),
        .I4(\s_axi_rdata_reg[5]_0 ),
        .I5(\s_axi_rdata_reg[9]_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'hFFFFA8200000A820)) 
    \s_axi_rdata[9]_i_2 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_araddr[0]),
        .I2(\s_axi_rdata_reg[15] [6]),
        .I3(Q[6]),
        .I4(s_axi_araddr[2]),
        .I5(\s_axi_rdata[9]_i_5_n_0 ),
        .O(\s_axi_rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[9]_i_5 
       (.I0(peak_mag2[9]),
        .I1(pw_samples[9]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(peak_bin[9]),
        .I5(dc_mag2[9]),
        .O(\s_axi_rdata[9]_i_5_n_0 ));
  FDRE valid_pipe_reg
       (.C(aclk),
        .CE(1'b1),
        .D(fire),
        .Q(valid_pipe),
        .R(clear));
endmodule

(* ORIG_REF_NAME = "axis_pulse_detect" *) 
module radar_system_radar_core_0_0_axis_pulse_detect
   (soft_reset_r_reg,
    in_pulse_reg_0,
    have_rise,
    in_pulse012_out,
    \pulse_count_reg[0]_0 ,
    D,
    \pulse_count_reg[3]_0 ,
    \pulse_count_reg[5]_0 ,
    \pulse_count_reg[6]_0 ,
    \pulse_count_reg[7]_0 ,
    \pulse_count_reg[9]_0 ,
    \pulse_count_reg[10]_0 ,
    \pulse_count_reg[11]_0 ,
    \pulse_count_reg[12]_0 ,
    \pulse_count_reg[13]_0 ,
    \pulse_count_reg[15]_0 ,
    s_axi_araddr_2_sp_1,
    pw_samples,
    s_axis_tdata,
    sample_fire,
    aclk,
    \pulse_count_reg[31]_0 ,
    aresetn,
    s_axis_tvalid,
    \pri_samples_reg[0]_0 ,
    \pri_samples_reg[0]_1 ,
    m_axis_fft_tready,
    Q,
    s_axi_araddr,
    \s_axi_rdata_reg[15] ,
    \s_axi_rdata_reg[1] ,
    \s_axi_rdata_reg[1]_0 ,
    \s_axi_rdata[4]_i_2_0 ,
    \s_axi_rdata_reg[2] ,
    \s_axi_rdata_reg[2]_0 ,
    p_4_in,
    \s_axi_rdata_reg[4] ,
    \s_axi_rdata_reg[4]_0 ,
    \s_axi_rdata_reg[8] ,
    \s_axi_rdata_reg[8]_0 ,
    \s_axi_rdata_reg[8]_1 ,
    \s_axi_rdata_reg[14] ,
    \s_axi_rdata_reg[14]_0 ,
    \s_axi_rdata_reg[16] ,
    \s_axi_rdata_reg[16]_0 ,
    \s_axi_rdata_reg[16]_1 ,
    \s_axi_rdata_reg[16]_2 ,
    \s_axi_rdata_reg[17] ,
    frame_count_reg,
    \s_axi_rdata_reg[29] ,
    \s_axi_rdata_reg[18] ,
    \s_axi_rdata_reg[18]_0 ,
    \s_axi_rdata_reg[19] ,
    \s_axi_rdata_reg[19]_0 ,
    \s_axi_rdata_reg[20] ,
    \s_axi_rdata_reg[21] ,
    \s_axi_rdata_reg[21]_0 ,
    \s_axi_rdata_reg[23] ,
    \s_axi_rdata_reg[23]_0 ,
    \s_axi_rdata_reg[24] ,
    \s_axi_rdata_reg[25] ,
    \s_axi_rdata_reg[25]_0 ,
    \s_axi_rdata_reg[26] ,
    \s_axi_rdata_reg[26]_0 ,
    \s_axi_rdata_reg[27] ,
    \s_axi_rdata_reg[27]_0 ,
    \s_axi_rdata_reg[28] ,
    \s_axi_rdata_reg[28]_0 ,
    \s_axi_rdata_reg[29]_0 ,
    \s_axi_rdata_reg[30] ,
    \s_axi_rdata_reg[30]_0 ,
    \s_axi_rdata_reg[31] ,
    \s_axi_rdata_reg[31]_0 ,
    E,
    SR,
    \since_rise_reg[31]_0 );
  output soft_reset_r_reg;
  output in_pulse_reg_0;
  output have_rise;
  output in_pulse012_out;
  output \pulse_count_reg[0]_0 ;
  output [19:0]D;
  output \pulse_count_reg[3]_0 ;
  output \pulse_count_reg[5]_0 ;
  output \pulse_count_reg[6]_0 ;
  output \pulse_count_reg[7]_0 ;
  output \pulse_count_reg[9]_0 ;
  output \pulse_count_reg[10]_0 ;
  output \pulse_count_reg[11]_0 ;
  output \pulse_count_reg[12]_0 ;
  output \pulse_count_reg[13]_0 ;
  output \pulse_count_reg[15]_0 ;
  output s_axi_araddr_2_sp_1;
  output [31:0]pw_samples;
  input [31:0]s_axis_tdata;
  input sample_fire;
  input aclk;
  input \pulse_count_reg[31]_0 ;
  input aresetn;
  input s_axis_tvalid;
  input \pri_samples_reg[0]_0 ;
  input \pri_samples_reg[0]_1 ;
  input m_axis_fft_tready;
  input [31:0]Q;
  input [5:0]s_axi_araddr;
  input [15:0]\s_axi_rdata_reg[15] ;
  input \s_axi_rdata_reg[1] ;
  input \s_axi_rdata_reg[1]_0 ;
  input [2:0]\s_axi_rdata[4]_i_2_0 ;
  input \s_axi_rdata_reg[2] ;
  input \s_axi_rdata_reg[2]_0 ;
  input [0:0]p_4_in;
  input \s_axi_rdata_reg[4] ;
  input \s_axi_rdata_reg[4]_0 ;
  input \s_axi_rdata_reg[8] ;
  input \s_axi_rdata_reg[8]_0 ;
  input \s_axi_rdata_reg[8]_1 ;
  input \s_axi_rdata_reg[14] ;
  input \s_axi_rdata_reg[14]_0 ;
  input \s_axi_rdata_reg[16] ;
  input \s_axi_rdata_reg[16]_0 ;
  input \s_axi_rdata_reg[16]_1 ;
  input \s_axi_rdata_reg[16]_2 ;
  input \s_axi_rdata_reg[17] ;
  input [3:0]frame_count_reg;
  input [3:0]\s_axi_rdata_reg[29] ;
  input \s_axi_rdata_reg[18] ;
  input \s_axi_rdata_reg[18]_0 ;
  input \s_axi_rdata_reg[19] ;
  input \s_axi_rdata_reg[19]_0 ;
  input \s_axi_rdata_reg[20] ;
  input \s_axi_rdata_reg[21] ;
  input \s_axi_rdata_reg[21]_0 ;
  input \s_axi_rdata_reg[23] ;
  input \s_axi_rdata_reg[23]_0 ;
  input \s_axi_rdata_reg[24] ;
  input \s_axi_rdata_reg[25] ;
  input \s_axi_rdata_reg[25]_0 ;
  input \s_axi_rdata_reg[26] ;
  input \s_axi_rdata_reg[26]_0 ;
  input \s_axi_rdata_reg[27] ;
  input \s_axi_rdata_reg[27]_0 ;
  input \s_axi_rdata_reg[28] ;
  input \s_axi_rdata_reg[28]_0 ;
  input \s_axi_rdata_reg[29]_0 ;
  input \s_axi_rdata_reg[30] ;
  input \s_axi_rdata_reg[30]_0 ;
  input \s_axi_rdata_reg[31] ;
  input \s_axi_rdata_reg[31]_0 ;
  input [0:0]E;
  input [0:0]SR;
  input [0:0]\since_rise_reg[31]_0 ;

  wire [19:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire [0:0]SR;
  wire above;
  wire above013_in;
  wire above0_carry__0_i_1_n_0;
  wire above0_carry__0_i_2_n_0;
  wire above0_carry__0_i_3_n_0;
  wire above0_carry__0_i_4_n_0;
  wire above0_carry__0_i_5_n_0;
  wire above0_carry__0_i_6_n_0;
  wire above0_carry__0_i_7_n_0;
  wire above0_carry__0_i_8_n_0;
  wire above0_carry__0_n_0;
  wire above0_carry__0_n_1;
  wire above0_carry__0_n_2;
  wire above0_carry__0_n_3;
  wire above0_carry__1_i_1_n_0;
  wire above0_carry__1_i_2_n_0;
  wire above0_carry__1_i_3_n_0;
  wire above0_carry__1_i_4_n_0;
  wire above0_carry__1_i_5_n_0;
  wire above0_carry__1_i_6_n_0;
  wire above0_carry__1_i_7_n_0;
  wire above0_carry__1_i_8_n_0;
  wire above0_carry__1_n_0;
  wire above0_carry__1_n_1;
  wire above0_carry__1_n_2;
  wire above0_carry__1_n_3;
  wire above0_carry__2_i_1_n_0;
  wire above0_carry__2_i_2_n_0;
  wire above0_carry__2_i_3_n_0;
  wire above0_carry__2_i_4_n_0;
  wire above0_carry__2_i_5_n_0;
  wire above0_carry__2_i_6_n_0;
  wire above0_carry__2_i_7_n_0;
  wire above0_carry__2_i_8_n_0;
  wire above0_carry__2_n_1;
  wire above0_carry__2_n_2;
  wire above0_carry__2_n_3;
  wire above0_carry_i_1_n_0;
  wire above0_carry_i_2_n_0;
  wire above0_carry_i_3_n_0;
  wire above0_carry_i_4_n_0;
  wire above0_carry_i_5_n_0;
  wire above0_carry_i_6_n_0;
  wire above0_carry_i_7_n_0;
  wire above0_carry_i_8_n_0;
  wire above0_carry_n_0;
  wire above0_carry_n_1;
  wire above0_carry_n_2;
  wire above0_carry_n_3;
  wire above_d;
  wire above_d_i_10_n_0;
  wire above_d_i_3_n_0;
  wire above_d_i_4_n_0;
  wire above_d_i_5_n_0;
  wire above_d_i_6_n_0;
  wire above_d_i_7_n_0;
  wire above_d_i_8_n_0;
  wire above_d_i_9_n_0;
  wire aclk;
  wire aresetn;
  wire [3:0]frame_count_reg;
  wire have_rise;
  wire have_rise7_out;
  wire have_rise_i_1_n_0;
  wire i2_n_100;
  wire i2_n_101;
  wire i2_n_102;
  wire i2_n_103;
  wire i2_n_104;
  wire i2_n_105;
  wire i2_n_106;
  wire i2_n_107;
  wire i2_n_108;
  wire i2_n_109;
  wire i2_n_110;
  wire i2_n_111;
  wire i2_n_112;
  wire i2_n_113;
  wire i2_n_114;
  wire i2_n_115;
  wire i2_n_116;
  wire i2_n_117;
  wire i2_n_118;
  wire i2_n_119;
  wire i2_n_120;
  wire i2_n_121;
  wire i2_n_122;
  wire i2_n_123;
  wire i2_n_124;
  wire i2_n_125;
  wire i2_n_126;
  wire i2_n_127;
  wire i2_n_128;
  wire i2_n_129;
  wire i2_n_130;
  wire i2_n_131;
  wire i2_n_132;
  wire i2_n_133;
  wire i2_n_134;
  wire i2_n_135;
  wire i2_n_136;
  wire i2_n_137;
  wire i2_n_138;
  wire i2_n_139;
  wire i2_n_140;
  wire i2_n_141;
  wire i2_n_142;
  wire i2_n_143;
  wire i2_n_144;
  wire i2_n_145;
  wire i2_n_146;
  wire i2_n_147;
  wire i2_n_148;
  wire i2_n_149;
  wire i2_n_150;
  wire i2_n_151;
  wire i2_n_152;
  wire i2_n_153;
  wire i2_n_74;
  wire i2_n_75;
  wire i2_n_76;
  wire i2_n_77;
  wire i2_n_78;
  wire i2_n_79;
  wire i2_n_80;
  wire i2_n_81;
  wire i2_n_82;
  wire i2_n_83;
  wire i2_n_84;
  wire i2_n_85;
  wire i2_n_86;
  wire i2_n_87;
  wire i2_n_88;
  wire i2_n_89;
  wire i2_n_90;
  wire i2_n_91;
  wire i2_n_92;
  wire i2_n_93;
  wire i2_n_94;
  wire i2_n_95;
  wire i2_n_96;
  wire i2_n_97;
  wire i2_n_98;
  wire i2_n_99;
  wire in_pulse012_out;
  wire in_pulse_i_2_n_0;
  wire in_pulse_reg_0;
  wire [31:0]last_mag2;
  wire m_axis_fft_tready;
  wire mag2_n_100;
  wire mag2_n_101;
  wire mag2_n_102;
  wire mag2_n_103;
  wire mag2_n_104;
  wire mag2_n_105;
  wire mag2_n_74;
  wire mag2_n_75;
  wire mag2_n_76;
  wire mag2_n_77;
  wire mag2_n_78;
  wire mag2_n_79;
  wire mag2_n_80;
  wire mag2_n_81;
  wire mag2_n_82;
  wire mag2_n_83;
  wire mag2_n_84;
  wire mag2_n_85;
  wire mag2_n_86;
  wire mag2_n_87;
  wire mag2_n_88;
  wire mag2_n_89;
  wire mag2_n_90;
  wire mag2_n_91;
  wire mag2_n_92;
  wire mag2_n_93;
  wire mag2_n_94;
  wire mag2_n_95;
  wire mag2_n_96;
  wire mag2_n_97;
  wire mag2_n_98;
  wire mag2_n_99;
  wire [31:1]p_2_in;
  wire [0:0]p_4_in;
  wire [31:0]pri_samples;
  wire \pri_samples[31]_i_1_n_0 ;
  wire \pri_samples_reg[0]_0 ;
  wire \pri_samples_reg[0]_1 ;
  wire pri_valid;
  wire pri_valid_i_1_n_0;
  wire [31:0]pulse_count;
  wire \pulse_count[0]_i_3_n_0 ;
  wire \pulse_count_reg[0]_0 ;
  wire \pulse_count_reg[0]_i_2_n_0 ;
  wire \pulse_count_reg[0]_i_2_n_1 ;
  wire \pulse_count_reg[0]_i_2_n_2 ;
  wire \pulse_count_reg[0]_i_2_n_3 ;
  wire \pulse_count_reg[0]_i_2_n_4 ;
  wire \pulse_count_reg[0]_i_2_n_5 ;
  wire \pulse_count_reg[0]_i_2_n_6 ;
  wire \pulse_count_reg[0]_i_2_n_7 ;
  wire \pulse_count_reg[10]_0 ;
  wire \pulse_count_reg[11]_0 ;
  wire \pulse_count_reg[12]_0 ;
  wire \pulse_count_reg[12]_i_1_n_0 ;
  wire \pulse_count_reg[12]_i_1_n_1 ;
  wire \pulse_count_reg[12]_i_1_n_2 ;
  wire \pulse_count_reg[12]_i_1_n_3 ;
  wire \pulse_count_reg[12]_i_1_n_4 ;
  wire \pulse_count_reg[12]_i_1_n_5 ;
  wire \pulse_count_reg[12]_i_1_n_6 ;
  wire \pulse_count_reg[12]_i_1_n_7 ;
  wire \pulse_count_reg[13]_0 ;
  wire \pulse_count_reg[15]_0 ;
  wire \pulse_count_reg[16]_i_1_n_0 ;
  wire \pulse_count_reg[16]_i_1_n_1 ;
  wire \pulse_count_reg[16]_i_1_n_2 ;
  wire \pulse_count_reg[16]_i_1_n_3 ;
  wire \pulse_count_reg[16]_i_1_n_4 ;
  wire \pulse_count_reg[16]_i_1_n_5 ;
  wire \pulse_count_reg[16]_i_1_n_6 ;
  wire \pulse_count_reg[16]_i_1_n_7 ;
  wire \pulse_count_reg[20]_i_1_n_0 ;
  wire \pulse_count_reg[20]_i_1_n_1 ;
  wire \pulse_count_reg[20]_i_1_n_2 ;
  wire \pulse_count_reg[20]_i_1_n_3 ;
  wire \pulse_count_reg[20]_i_1_n_4 ;
  wire \pulse_count_reg[20]_i_1_n_5 ;
  wire \pulse_count_reg[20]_i_1_n_6 ;
  wire \pulse_count_reg[20]_i_1_n_7 ;
  wire \pulse_count_reg[24]_i_1_n_0 ;
  wire \pulse_count_reg[24]_i_1_n_1 ;
  wire \pulse_count_reg[24]_i_1_n_2 ;
  wire \pulse_count_reg[24]_i_1_n_3 ;
  wire \pulse_count_reg[24]_i_1_n_4 ;
  wire \pulse_count_reg[24]_i_1_n_5 ;
  wire \pulse_count_reg[24]_i_1_n_6 ;
  wire \pulse_count_reg[24]_i_1_n_7 ;
  wire \pulse_count_reg[28]_i_1_n_1 ;
  wire \pulse_count_reg[28]_i_1_n_2 ;
  wire \pulse_count_reg[28]_i_1_n_3 ;
  wire \pulse_count_reg[28]_i_1_n_4 ;
  wire \pulse_count_reg[28]_i_1_n_5 ;
  wire \pulse_count_reg[28]_i_1_n_6 ;
  wire \pulse_count_reg[28]_i_1_n_7 ;
  wire \pulse_count_reg[31]_0 ;
  wire \pulse_count_reg[3]_0 ;
  wire \pulse_count_reg[4]_i_1_n_0 ;
  wire \pulse_count_reg[4]_i_1_n_1 ;
  wire \pulse_count_reg[4]_i_1_n_2 ;
  wire \pulse_count_reg[4]_i_1_n_3 ;
  wire \pulse_count_reg[4]_i_1_n_4 ;
  wire \pulse_count_reg[4]_i_1_n_5 ;
  wire \pulse_count_reg[4]_i_1_n_6 ;
  wire \pulse_count_reg[4]_i_1_n_7 ;
  wire \pulse_count_reg[5]_0 ;
  wire \pulse_count_reg[6]_0 ;
  wire \pulse_count_reg[7]_0 ;
  wire \pulse_count_reg[8]_i_1_n_0 ;
  wire \pulse_count_reg[8]_i_1_n_1 ;
  wire \pulse_count_reg[8]_i_1_n_2 ;
  wire \pulse_count_reg[8]_i_1_n_3 ;
  wire \pulse_count_reg[8]_i_1_n_4 ;
  wire \pulse_count_reg[8]_i_1_n_5 ;
  wire \pulse_count_reg[8]_i_1_n_6 ;
  wire \pulse_count_reg[8]_i_1_n_7 ;
  wire \pulse_count_reg[9]_0 ;
  wire pulse_valid;
  wire pulse_valid_i_1_n_0;
  wire [2:2]pw_acc;
  wire [31:1]pw_acc0;
  wire \pw_acc0_inferred__0/i__carry__0_n_0 ;
  wire \pw_acc0_inferred__0/i__carry__0_n_1 ;
  wire \pw_acc0_inferred__0/i__carry__0_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__0_n_3 ;
  wire \pw_acc0_inferred__0/i__carry__1_n_0 ;
  wire \pw_acc0_inferred__0/i__carry__1_n_1 ;
  wire \pw_acc0_inferred__0/i__carry__1_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__1_n_3 ;
  wire \pw_acc0_inferred__0/i__carry__2_n_0 ;
  wire \pw_acc0_inferred__0/i__carry__2_n_1 ;
  wire \pw_acc0_inferred__0/i__carry__2_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__2_n_3 ;
  wire \pw_acc0_inferred__0/i__carry__3_n_0 ;
  wire \pw_acc0_inferred__0/i__carry__3_n_1 ;
  wire \pw_acc0_inferred__0/i__carry__3_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__3_n_3 ;
  wire \pw_acc0_inferred__0/i__carry__4_n_0 ;
  wire \pw_acc0_inferred__0/i__carry__4_n_1 ;
  wire \pw_acc0_inferred__0/i__carry__4_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__4_n_3 ;
  wire \pw_acc0_inferred__0/i__carry__5_n_0 ;
  wire \pw_acc0_inferred__0/i__carry__5_n_1 ;
  wire \pw_acc0_inferred__0/i__carry__5_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__5_n_3 ;
  wire \pw_acc0_inferred__0/i__carry__6_n_2 ;
  wire \pw_acc0_inferred__0/i__carry__6_n_3 ;
  wire \pw_acc0_inferred__0/i__carry_n_0 ;
  wire \pw_acc0_inferred__0/i__carry_n_1 ;
  wire \pw_acc0_inferred__0/i__carry_n_2 ;
  wire \pw_acc0_inferred__0/i__carry_n_3 ;
  wire \pw_acc[0]_i_1_n_0 ;
  wire \pw_acc_reg_n_0_[0] ;
  wire \pw_acc_reg_n_0_[10] ;
  wire \pw_acc_reg_n_0_[11] ;
  wire \pw_acc_reg_n_0_[12] ;
  wire \pw_acc_reg_n_0_[13] ;
  wire \pw_acc_reg_n_0_[14] ;
  wire \pw_acc_reg_n_0_[15] ;
  wire \pw_acc_reg_n_0_[16] ;
  wire \pw_acc_reg_n_0_[17] ;
  wire \pw_acc_reg_n_0_[18] ;
  wire \pw_acc_reg_n_0_[19] ;
  wire \pw_acc_reg_n_0_[1] ;
  wire \pw_acc_reg_n_0_[20] ;
  wire \pw_acc_reg_n_0_[21] ;
  wire \pw_acc_reg_n_0_[22] ;
  wire \pw_acc_reg_n_0_[23] ;
  wire \pw_acc_reg_n_0_[24] ;
  wire \pw_acc_reg_n_0_[25] ;
  wire \pw_acc_reg_n_0_[26] ;
  wire \pw_acc_reg_n_0_[27] ;
  wire \pw_acc_reg_n_0_[28] ;
  wire \pw_acc_reg_n_0_[29] ;
  wire \pw_acc_reg_n_0_[2] ;
  wire \pw_acc_reg_n_0_[30] ;
  wire \pw_acc_reg_n_0_[31] ;
  wire \pw_acc_reg_n_0_[3] ;
  wire \pw_acc_reg_n_0_[4] ;
  wire \pw_acc_reg_n_0_[5] ;
  wire \pw_acc_reg_n_0_[6] ;
  wire \pw_acc_reg_n_0_[7] ;
  wire \pw_acc_reg_n_0_[8] ;
  wire \pw_acc_reg_n_0_[9] ;
  wire [31:0]pw_samples;
  wire \pw_samples[0]_i_1_n_0 ;
  wire \pw_samples[0]_i_2_n_0 ;
  wire \pw_samples[31]_i_10_n_0 ;
  wire \pw_samples[31]_i_1_n_0 ;
  wire \pw_samples[31]_i_2_n_0 ;
  wire \pw_samples[31]_i_3_n_0 ;
  wire \pw_samples[31]_i_4_n_0 ;
  wire \pw_samples[31]_i_5_n_0 ;
  wire \pw_samples[31]_i_6_n_0 ;
  wire \pw_samples[31]_i_7_n_0 ;
  wire \pw_samples[31]_i_8_n_0 ;
  wire \pw_samples[31]_i_9_n_0 ;
  wire [5:0]s_axi_araddr;
  wire s_axi_araddr_2_sn_1;
  wire \s_axi_rdata[14]_i_3_n_0 ;
  wire \s_axi_rdata[16]_i_3_n_0 ;
  wire \s_axi_rdata[17]_i_2_n_0 ;
  wire \s_axi_rdata[17]_i_4_n_0 ;
  wire \s_axi_rdata[18]_i_3_n_0 ;
  wire \s_axi_rdata[19]_i_3_n_0 ;
  wire \s_axi_rdata[1]_i_4_n_0 ;
  wire \s_axi_rdata[1]_i_5_n_0 ;
  wire \s_axi_rdata[20]_i_2_n_0 ;
  wire \s_axi_rdata[20]_i_4_n_0 ;
  wire \s_axi_rdata[21]_i_3_n_0 ;
  wire \s_axi_rdata[23]_i_3_n_0 ;
  wire \s_axi_rdata[24]_i_2_n_0 ;
  wire \s_axi_rdata[24]_i_4_n_0 ;
  wire \s_axi_rdata[25]_i_3_n_0 ;
  wire \s_axi_rdata[26]_i_3_n_0 ;
  wire \s_axi_rdata[27]_i_3_n_0 ;
  wire \s_axi_rdata[28]_i_3_n_0 ;
  wire \s_axi_rdata[29]_i_2_n_0 ;
  wire \s_axi_rdata[29]_i_4_n_0 ;
  wire \s_axi_rdata[2]_i_4_n_0 ;
  wire \s_axi_rdata[2]_i_5_n_0 ;
  wire \s_axi_rdata[30]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_5_n_0 ;
  wire [2:0]\s_axi_rdata[4]_i_2_0 ;
  wire \s_axi_rdata[4]_i_2_n_0 ;
  wire \s_axi_rdata[4]_i_5_n_0 ;
  wire \s_axi_rdata[4]_i_6_n_0 ;
  wire \s_axi_rdata[8]_i_3_n_0 ;
  wire \s_axi_rdata_reg[14] ;
  wire \s_axi_rdata_reg[14]_0 ;
  wire [15:0]\s_axi_rdata_reg[15] ;
  wire \s_axi_rdata_reg[16] ;
  wire \s_axi_rdata_reg[16]_0 ;
  wire \s_axi_rdata_reg[16]_1 ;
  wire \s_axi_rdata_reg[16]_2 ;
  wire \s_axi_rdata_reg[17] ;
  wire \s_axi_rdata_reg[18] ;
  wire \s_axi_rdata_reg[18]_0 ;
  wire \s_axi_rdata_reg[19] ;
  wire \s_axi_rdata_reg[19]_0 ;
  wire \s_axi_rdata_reg[1] ;
  wire \s_axi_rdata_reg[1]_0 ;
  wire \s_axi_rdata_reg[20] ;
  wire \s_axi_rdata_reg[21] ;
  wire \s_axi_rdata_reg[21]_0 ;
  wire \s_axi_rdata_reg[23] ;
  wire \s_axi_rdata_reg[23]_0 ;
  wire \s_axi_rdata_reg[24] ;
  wire \s_axi_rdata_reg[25] ;
  wire \s_axi_rdata_reg[25]_0 ;
  wire \s_axi_rdata_reg[26] ;
  wire \s_axi_rdata_reg[26]_0 ;
  wire \s_axi_rdata_reg[27] ;
  wire \s_axi_rdata_reg[27]_0 ;
  wire \s_axi_rdata_reg[28] ;
  wire \s_axi_rdata_reg[28]_0 ;
  wire [3:0]\s_axi_rdata_reg[29] ;
  wire \s_axi_rdata_reg[29]_0 ;
  wire \s_axi_rdata_reg[2] ;
  wire \s_axi_rdata_reg[2]_0 ;
  wire \s_axi_rdata_reg[30] ;
  wire \s_axi_rdata_reg[30]_0 ;
  wire \s_axi_rdata_reg[31] ;
  wire \s_axi_rdata_reg[31]_0 ;
  wire \s_axi_rdata_reg[4] ;
  wire \s_axi_rdata_reg[4]_0 ;
  wire \s_axi_rdata_reg[8] ;
  wire \s_axi_rdata_reg[8]_0 ;
  wire \s_axi_rdata_reg[8]_1 ;
  wire [31:0]s_axis_tdata;
  wire s_axis_tvalid;
  wire sample_fire;
  wire \since_rise[0]_i_1_n_0 ;
  wire \since_rise_reg[12]_i_1_n_0 ;
  wire \since_rise_reg[12]_i_1_n_1 ;
  wire \since_rise_reg[12]_i_1_n_2 ;
  wire \since_rise_reg[12]_i_1_n_3 ;
  wire \since_rise_reg[16]_i_1_n_0 ;
  wire \since_rise_reg[16]_i_1_n_1 ;
  wire \since_rise_reg[16]_i_1_n_2 ;
  wire \since_rise_reg[16]_i_1_n_3 ;
  wire \since_rise_reg[20]_i_1_n_0 ;
  wire \since_rise_reg[20]_i_1_n_1 ;
  wire \since_rise_reg[20]_i_1_n_2 ;
  wire \since_rise_reg[20]_i_1_n_3 ;
  wire \since_rise_reg[24]_i_1_n_0 ;
  wire \since_rise_reg[24]_i_1_n_1 ;
  wire \since_rise_reg[24]_i_1_n_2 ;
  wire \since_rise_reg[24]_i_1_n_3 ;
  wire \since_rise_reg[28]_i_1_n_0 ;
  wire \since_rise_reg[28]_i_1_n_1 ;
  wire \since_rise_reg[28]_i_1_n_2 ;
  wire \since_rise_reg[28]_i_1_n_3 ;
  wire [0:0]\since_rise_reg[31]_0 ;
  wire \since_rise_reg[31]_i_3_n_2 ;
  wire \since_rise_reg[31]_i_3_n_3 ;
  wire \since_rise_reg[4]_i_1_n_0 ;
  wire \since_rise_reg[4]_i_1_n_1 ;
  wire \since_rise_reg[4]_i_1_n_2 ;
  wire \since_rise_reg[4]_i_1_n_3 ;
  wire \since_rise_reg[8]_i_1_n_0 ;
  wire \since_rise_reg[8]_i_1_n_1 ;
  wire \since_rise_reg[8]_i_1_n_2 ;
  wire \since_rise_reg[8]_i_1_n_3 ;
  wire \since_rise_reg_n_0_[0] ;
  wire \since_rise_reg_n_0_[10] ;
  wire \since_rise_reg_n_0_[11] ;
  wire \since_rise_reg_n_0_[12] ;
  wire \since_rise_reg_n_0_[13] ;
  wire \since_rise_reg_n_0_[14] ;
  wire \since_rise_reg_n_0_[15] ;
  wire \since_rise_reg_n_0_[16] ;
  wire \since_rise_reg_n_0_[17] ;
  wire \since_rise_reg_n_0_[18] ;
  wire \since_rise_reg_n_0_[19] ;
  wire \since_rise_reg_n_0_[1] ;
  wire \since_rise_reg_n_0_[20] ;
  wire \since_rise_reg_n_0_[21] ;
  wire \since_rise_reg_n_0_[22] ;
  wire \since_rise_reg_n_0_[23] ;
  wire \since_rise_reg_n_0_[24] ;
  wire \since_rise_reg_n_0_[25] ;
  wire \since_rise_reg_n_0_[26] ;
  wire \since_rise_reg_n_0_[27] ;
  wire \since_rise_reg_n_0_[28] ;
  wire \since_rise_reg_n_0_[29] ;
  wire \since_rise_reg_n_0_[2] ;
  wire \since_rise_reg_n_0_[30] ;
  wire \since_rise_reg_n_0_[31] ;
  wire \since_rise_reg_n_0_[3] ;
  wire \since_rise_reg_n_0_[4] ;
  wire \since_rise_reg_n_0_[5] ;
  wire \since_rise_reg_n_0_[6] ;
  wire \since_rise_reg_n_0_[7] ;
  wire \since_rise_reg_n_0_[8] ;
  wire \since_rise_reg_n_0_[9] ;
  wire soft_reset_r_reg;
  wire [3:0]NLW_above0_carry_O_UNCONNECTED;
  wire [3:0]NLW_above0_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_above0_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_above0_carry__2_O_UNCONNECTED;
  wire NLW_i2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_i2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_i2_OVERFLOW_UNCONNECTED;
  wire NLW_i2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_i2_PATTERNDETECT_UNCONNECTED;
  wire NLW_i2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_i2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_i2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_i2_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_i2_P_UNCONNECTED;
  wire NLW_mag2_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mag2_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mag2_OVERFLOW_UNCONNECTED;
  wire NLW_mag2_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mag2_PATTERNDETECT_UNCONNECTED;
  wire NLW_mag2_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mag2_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mag2_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mag2_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_mag2_P_UNCONNECTED;
  wire [47:0]NLW_mag2_PCOUT_UNCONNECTED;
  wire [3:3]\NLW_pulse_count_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_pw_acc0_inferred__0/i__carry__6_CO_UNCONNECTED ;
  wire [3:3]\NLW_pw_acc0_inferred__0/i__carry__6_O_UNCONNECTED ;
  wire [3:2]\NLW_since_rise_reg[31]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_since_rise_reg[31]_i_3_O_UNCONNECTED ;

  assign s_axi_araddr_2_sp_1 = s_axi_araddr_2_sn_1;
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 above0_carry
       (.CI(1'b0),
        .CO({above0_carry_n_0,above0_carry_n_1,above0_carry_n_2,above0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({above0_carry_i_1_n_0,above0_carry_i_2_n_0,above0_carry_i_3_n_0,above0_carry_i_4_n_0}),
        .O(NLW_above0_carry_O_UNCONNECTED[3:0]),
        .S({above0_carry_i_5_n_0,above0_carry_i_6_n_0,above0_carry_i_7_n_0,above0_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 above0_carry__0
       (.CI(above0_carry_n_0),
        .CO({above0_carry__0_n_0,above0_carry__0_n_1,above0_carry__0_n_2,above0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({above0_carry__0_i_1_n_0,above0_carry__0_i_2_n_0,above0_carry__0_i_3_n_0,above0_carry__0_i_4_n_0}),
        .O(NLW_above0_carry__0_O_UNCONNECTED[3:0]),
        .S({above0_carry__0_i_5_n_0,above0_carry__0_i_6_n_0,above0_carry__0_i_7_n_0,above0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__0_i_1
       (.I0(mag2_n_91),
        .I1(Q[14]),
        .I2(Q[15]),
        .I3(mag2_n_90),
        .O(above0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__0_i_2
       (.I0(mag2_n_93),
        .I1(Q[12]),
        .I2(Q[13]),
        .I3(mag2_n_92),
        .O(above0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__0_i_3
       (.I0(mag2_n_95),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(mag2_n_94),
        .O(above0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__0_i_4
       (.I0(mag2_n_97),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(mag2_n_96),
        .O(above0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__0_i_5
       (.I0(Q[15]),
        .I1(mag2_n_90),
        .I2(Q[14]),
        .I3(mag2_n_91),
        .O(above0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__0_i_6
       (.I0(Q[13]),
        .I1(mag2_n_92),
        .I2(Q[12]),
        .I3(mag2_n_93),
        .O(above0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__0_i_7
       (.I0(Q[11]),
        .I1(mag2_n_94),
        .I2(Q[10]),
        .I3(mag2_n_95),
        .O(above0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__0_i_8
       (.I0(Q[9]),
        .I1(mag2_n_96),
        .I2(Q[8]),
        .I3(mag2_n_97),
        .O(above0_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 above0_carry__1
       (.CI(above0_carry__0_n_0),
        .CO({above0_carry__1_n_0,above0_carry__1_n_1,above0_carry__1_n_2,above0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({above0_carry__1_i_1_n_0,above0_carry__1_i_2_n_0,above0_carry__1_i_3_n_0,above0_carry__1_i_4_n_0}),
        .O(NLW_above0_carry__1_O_UNCONNECTED[3:0]),
        .S({above0_carry__1_i_5_n_0,above0_carry__1_i_6_n_0,above0_carry__1_i_7_n_0,above0_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__1_i_1
       (.I0(mag2_n_83),
        .I1(Q[22]),
        .I2(Q[23]),
        .I3(mag2_n_82),
        .O(above0_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__1_i_2
       (.I0(mag2_n_85),
        .I1(Q[20]),
        .I2(Q[21]),
        .I3(mag2_n_84),
        .O(above0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__1_i_3
       (.I0(mag2_n_87),
        .I1(Q[18]),
        .I2(Q[19]),
        .I3(mag2_n_86),
        .O(above0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__1_i_4
       (.I0(mag2_n_89),
        .I1(Q[16]),
        .I2(Q[17]),
        .I3(mag2_n_88),
        .O(above0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__1_i_5
       (.I0(Q[23]),
        .I1(mag2_n_82),
        .I2(Q[22]),
        .I3(mag2_n_83),
        .O(above0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__1_i_6
       (.I0(Q[21]),
        .I1(mag2_n_84),
        .I2(Q[20]),
        .I3(mag2_n_85),
        .O(above0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__1_i_7
       (.I0(Q[19]),
        .I1(mag2_n_86),
        .I2(Q[18]),
        .I3(mag2_n_87),
        .O(above0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__1_i_8
       (.I0(Q[17]),
        .I1(mag2_n_88),
        .I2(Q[16]),
        .I3(mag2_n_89),
        .O(above0_carry__1_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 above0_carry__2
       (.CI(above0_carry__1_n_0),
        .CO({above013_in,above0_carry__2_n_1,above0_carry__2_n_2,above0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({above0_carry__2_i_1_n_0,above0_carry__2_i_2_n_0,above0_carry__2_i_3_n_0,above0_carry__2_i_4_n_0}),
        .O(NLW_above0_carry__2_O_UNCONNECTED[3:0]),
        .S({above0_carry__2_i_5_n_0,above0_carry__2_i_6_n_0,above0_carry__2_i_7_n_0,above0_carry__2_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__2_i_1
       (.I0(mag2_n_75),
        .I1(Q[30]),
        .I2(Q[31]),
        .I3(mag2_n_74),
        .O(above0_carry__2_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__2_i_2
       (.I0(mag2_n_77),
        .I1(Q[28]),
        .I2(Q[29]),
        .I3(mag2_n_76),
        .O(above0_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__2_i_3
       (.I0(mag2_n_79),
        .I1(Q[26]),
        .I2(Q[27]),
        .I3(mag2_n_78),
        .O(above0_carry__2_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry__2_i_4
       (.I0(mag2_n_81),
        .I1(Q[24]),
        .I2(Q[25]),
        .I3(mag2_n_80),
        .O(above0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__2_i_5
       (.I0(Q[31]),
        .I1(mag2_n_74),
        .I2(Q[30]),
        .I3(mag2_n_75),
        .O(above0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__2_i_6
       (.I0(Q[29]),
        .I1(mag2_n_76),
        .I2(Q[28]),
        .I3(mag2_n_77),
        .O(above0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__2_i_7
       (.I0(Q[27]),
        .I1(mag2_n_78),
        .I2(Q[26]),
        .I3(mag2_n_79),
        .O(above0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry__2_i_8
       (.I0(Q[25]),
        .I1(mag2_n_80),
        .I2(Q[24]),
        .I3(mag2_n_81),
        .O(above0_carry__2_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry_i_1
       (.I0(mag2_n_99),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(mag2_n_98),
        .O(above0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry_i_2
       (.I0(mag2_n_101),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(mag2_n_100),
        .O(above0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry_i_3
       (.I0(mag2_n_103),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(mag2_n_102),
        .O(above0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    above0_carry_i_4
       (.I0(mag2_n_105),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(mag2_n_104),
        .O(above0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry_i_5
       (.I0(Q[7]),
        .I1(mag2_n_98),
        .I2(Q[6]),
        .I3(mag2_n_99),
        .O(above0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry_i_6
       (.I0(Q[5]),
        .I1(mag2_n_100),
        .I2(Q[4]),
        .I3(mag2_n_101),
        .O(above0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry_i_7
       (.I0(Q[3]),
        .I1(mag2_n_102),
        .I2(Q[2]),
        .I3(mag2_n_103),
        .O(above0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    above0_carry_i_8
       (.I0(Q[1]),
        .I1(mag2_n_104),
        .I2(Q[0]),
        .I3(mag2_n_105),
        .O(above0_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    above_d_i_10
       (.I0(Q[13]),
        .I1(Q[12]),
        .I2(Q[11]),
        .I3(Q[10]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(above_d_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    above_d_i_2
       (.I0(above013_in),
        .I1(above_d_i_3_n_0),
        .I2(above_d_i_4_n_0),
        .I3(above_d_i_5_n_0),
        .O(above));
  LUT4 #(
    .INIT(16'hFFFE)) 
    above_d_i_3
       (.I0(Q[6]),
        .I1(Q[7]),
        .I2(Q[8]),
        .I3(Q[9]),
        .O(above_d_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    above_d_i_4
       (.I0(Q[14]),
        .I1(Q[15]),
        .I2(above_d_i_6_n_0),
        .I3(above_d_i_7_n_0),
        .I4(above_d_i_8_n_0),
        .I5(above_d_i_9_n_0),
        .O(above_d_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    above_d_i_5
       (.I0(above_d_i_10_n_0),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(above_d_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    above_d_i_6
       (.I0(Q[24]),
        .I1(Q[25]),
        .I2(Q[26]),
        .I3(Q[27]),
        .O(above_d_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    above_d_i_7
       (.I0(Q[28]),
        .I1(Q[29]),
        .I2(Q[31]),
        .I3(Q[30]),
        .O(above_d_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    above_d_i_8
       (.I0(Q[16]),
        .I1(Q[17]),
        .I2(Q[18]),
        .I3(Q[19]),
        .O(above_d_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    above_d_i_9
       (.I0(Q[20]),
        .I1(Q[21]),
        .I2(Q[22]),
        .I3(Q[23]),
        .O(above_d_i_9_n_0));
  FDRE above_d_reg
       (.C(aclk),
        .CE(sample_fire),
        .D(above),
        .Q(above_d),
        .R(soft_reset_r_reg));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    have_rise_i_1
       (.I0(have_rise7_out),
        .I1(have_rise),
        .O(have_rise_i_1_n_0));
  FDRE have_rise_reg
       (.C(aclk),
        .CE(1'b1),
        .D(have_rise_i_1_n_0),
        .Q(have_rise),
        .R(soft_reset_r_reg));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    i2
       (.A({s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_i2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_i2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_i2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_i2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_i2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_i2_OVERFLOW_UNCONNECTED),
        .P({NLW_i2_P_UNCONNECTED[47:32],i2_n_74,i2_n_75,i2_n_76,i2_n_77,i2_n_78,i2_n_79,i2_n_80,i2_n_81,i2_n_82,i2_n_83,i2_n_84,i2_n_85,i2_n_86,i2_n_87,i2_n_88,i2_n_89,i2_n_90,i2_n_91,i2_n_92,i2_n_93,i2_n_94,i2_n_95,i2_n_96,i2_n_97,i2_n_98,i2_n_99,i2_n_100,i2_n_101,i2_n_102,i2_n_103,i2_n_104,i2_n_105}),
        .PATTERNBDETECT(NLW_i2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_i2_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({i2_n_106,i2_n_107,i2_n_108,i2_n_109,i2_n_110,i2_n_111,i2_n_112,i2_n_113,i2_n_114,i2_n_115,i2_n_116,i2_n_117,i2_n_118,i2_n_119,i2_n_120,i2_n_121,i2_n_122,i2_n_123,i2_n_124,i2_n_125,i2_n_126,i2_n_127,i2_n_128,i2_n_129,i2_n_130,i2_n_131,i2_n_132,i2_n_133,i2_n_134,i2_n_135,i2_n_136,i2_n_137,i2_n_138,i2_n_139,i2_n_140,i2_n_141,i2_n_142,i2_n_143,i2_n_144,i2_n_145,i2_n_146,i2_n_147,i2_n_148,i2_n_149,i2_n_150,i2_n_151,i2_n_152,i2_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_i2_UNDERFLOW_UNCONNECTED));
  LUT2 #(
    .INIT(4'hB)) 
    in_pulse_i_1
       (.I0(\pulse_count_reg[31]_0 ),
        .I1(aresetn),
        .O(soft_reset_r_reg));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hBF20)) 
    in_pulse_i_2
       (.I0(above),
        .I1(above_d),
        .I2(sample_fire),
        .I3(in_pulse_reg_0),
        .O(in_pulse_i_2_n_0));
  FDRE in_pulse_reg
       (.C(aclk),
        .CE(1'b1),
        .D(in_pulse_i_2_n_0),
        .Q(in_pulse_reg_0),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[0] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_105),
        .Q(last_mag2[0]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[10] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_95),
        .Q(last_mag2[10]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[11] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_94),
        .Q(last_mag2[11]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[12] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_93),
        .Q(last_mag2[12]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[13] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_92),
        .Q(last_mag2[13]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[14] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_91),
        .Q(last_mag2[14]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[15] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_90),
        .Q(last_mag2[15]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[16] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_89),
        .Q(last_mag2[16]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[17] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_88),
        .Q(last_mag2[17]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[18] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_87),
        .Q(last_mag2[18]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[19] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_86),
        .Q(last_mag2[19]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[1] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_104),
        .Q(last_mag2[1]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[20] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_85),
        .Q(last_mag2[20]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[21] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_84),
        .Q(last_mag2[21]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[22] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_83),
        .Q(last_mag2[22]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[23] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_82),
        .Q(last_mag2[23]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[24] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_81),
        .Q(last_mag2[24]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[25] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_80),
        .Q(last_mag2[25]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[26] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_79),
        .Q(last_mag2[26]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[27] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_78),
        .Q(last_mag2[27]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[28] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_77),
        .Q(last_mag2[28]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[29] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_76),
        .Q(last_mag2[29]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[2] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_103),
        .Q(last_mag2[2]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[30] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_75),
        .Q(last_mag2[30]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[31] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_74),
        .Q(last_mag2[31]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[3] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_102),
        .Q(last_mag2[3]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[4] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_101),
        .Q(last_mag2[4]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[5] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_100),
        .Q(last_mag2[5]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[6] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_99),
        .Q(last_mag2[6]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[7] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_98),
        .Q(last_mag2[7]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[8] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_97),
        .Q(last_mag2[8]),
        .R(soft_reset_r_reg));
  FDRE \last_mag2_reg[9] 
       (.C(aclk),
        .CE(sample_fire),
        .D(mag2_n_96),
        .Q(last_mag2[9]),
        .R(soft_reset_r_reg));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    mag2
       (.A({s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31:16]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mag2_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31:16]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mag2_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mag2_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mag2_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mag2_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mag2_OVERFLOW_UNCONNECTED),
        .P({NLW_mag2_P_UNCONNECTED[47:32],mag2_n_74,mag2_n_75,mag2_n_76,mag2_n_77,mag2_n_78,mag2_n_79,mag2_n_80,mag2_n_81,mag2_n_82,mag2_n_83,mag2_n_84,mag2_n_85,mag2_n_86,mag2_n_87,mag2_n_88,mag2_n_89,mag2_n_90,mag2_n_91,mag2_n_92,mag2_n_93,mag2_n_94,mag2_n_95,mag2_n_96,mag2_n_97,mag2_n_98,mag2_n_99,mag2_n_100,mag2_n_101,mag2_n_102,mag2_n_103,mag2_n_104,mag2_n_105}),
        .PATTERNBDETECT(NLW_mag2_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mag2_PATTERNDETECT_UNCONNECTED),
        .PCIN({i2_n_106,i2_n_107,i2_n_108,i2_n_109,i2_n_110,i2_n_111,i2_n_112,i2_n_113,i2_n_114,i2_n_115,i2_n_116,i2_n_117,i2_n_118,i2_n_119,i2_n_120,i2_n_121,i2_n_122,i2_n_123,i2_n_124,i2_n_125,i2_n_126,i2_n_127,i2_n_128,i2_n_129,i2_n_130,i2_n_131,i2_n_132,i2_n_133,i2_n_134,i2_n_135,i2_n_136,i2_n_137,i2_n_138,i2_n_139,i2_n_140,i2_n_141,i2_n_142,i2_n_143,i2_n_144,i2_n_145,i2_n_146,i2_n_147,i2_n_148,i2_n_149,i2_n_150,i2_n_151,i2_n_152,i2_n_153}),
        .PCOUT(NLW_mag2_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mag2_UNDERFLOW_UNCONNECTED));
  LUT6 #(
    .INIT(64'h8080008000000000)) 
    \pri_samples[31]_i_1 
       (.I0(have_rise),
        .I1(s_axis_tvalid),
        .I2(\pri_samples_reg[0]_0 ),
        .I3(\pri_samples_reg[0]_1 ),
        .I4(m_axis_fft_tready),
        .I5(in_pulse012_out),
        .O(\pri_samples[31]_i_1_n_0 ));
  FDRE \pri_samples_reg[0] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[0] ),
        .Q(pri_samples[0]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[10] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[10] ),
        .Q(pri_samples[10]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[11] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[11] ),
        .Q(pri_samples[11]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[12] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[12] ),
        .Q(pri_samples[12]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[13] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[13] ),
        .Q(pri_samples[13]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[14] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[14] ),
        .Q(pri_samples[14]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[15] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[15] ),
        .Q(pri_samples[15]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[16] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[16] ),
        .Q(pri_samples[16]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[17] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[17] ),
        .Q(pri_samples[17]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[18] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[18] ),
        .Q(pri_samples[18]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[19] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[19] ),
        .Q(pri_samples[19]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[1] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[1] ),
        .Q(pri_samples[1]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[20] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[20] ),
        .Q(pri_samples[20]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[21] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[21] ),
        .Q(pri_samples[21]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[22] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[22] ),
        .Q(pri_samples[22]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[23] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[23] ),
        .Q(pri_samples[23]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[24] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[24] ),
        .Q(pri_samples[24]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[25] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[25] ),
        .Q(pri_samples[25]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[26] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[26] ),
        .Q(pri_samples[26]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[27] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[27] ),
        .Q(pri_samples[27]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[28] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[28] ),
        .Q(pri_samples[28]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[29] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[29] ),
        .Q(pri_samples[29]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[2] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[2] ),
        .Q(pri_samples[2]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[30] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[30] ),
        .Q(pri_samples[30]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[31] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[31] ),
        .Q(pri_samples[31]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[3] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[3] ),
        .Q(pri_samples[3]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[4] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[4] ),
        .Q(pri_samples[4]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[5] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[5] ),
        .Q(pri_samples[5]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[6] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[6] ),
        .Q(pri_samples[6]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[7] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[7] ),
        .Q(pri_samples[7]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[8] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[8] ),
        .Q(pri_samples[8]),
        .R(soft_reset_r_reg));
  FDRE \pri_samples_reg[9] 
       (.C(aclk),
        .CE(\pri_samples[31]_i_1_n_0 ),
        .D(\since_rise_reg_n_0_[9] ),
        .Q(pri_samples[9]),
        .R(soft_reset_r_reg));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFF80)) 
    pri_valid_i_1
       (.I0(in_pulse012_out),
        .I1(sample_fire),
        .I2(have_rise),
        .I3(pri_valid),
        .O(pri_valid_i_1_n_0));
  FDRE pri_valid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(pri_valid_i_1_n_0),
        .Q(pri_valid),
        .R(soft_reset_r_reg));
  LUT6 #(
    .INIT(64'h2020202020202000)) 
    \pulse_count[0]_i_1 
       (.I0(sample_fire),
        .I1(above_d),
        .I2(above013_in),
        .I3(above_d_i_3_n_0),
        .I4(above_d_i_4_n_0),
        .I5(above_d_i_5_n_0),
        .O(have_rise7_out));
  LUT1 #(
    .INIT(2'h1)) 
    \pulse_count[0]_i_3 
       (.I0(pulse_count[0]),
        .O(\pulse_count[0]_i_3_n_0 ));
  FDRE \pulse_count_reg[0] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[0]_i_2_n_7 ),
        .Q(pulse_count[0]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\pulse_count_reg[0]_i_2_n_0 ,\pulse_count_reg[0]_i_2_n_1 ,\pulse_count_reg[0]_i_2_n_2 ,\pulse_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pulse_count_reg[0]_i_2_n_4 ,\pulse_count_reg[0]_i_2_n_5 ,\pulse_count_reg[0]_i_2_n_6 ,\pulse_count_reg[0]_i_2_n_7 }),
        .S({pulse_count[3:1],\pulse_count[0]_i_3_n_0 }));
  FDRE \pulse_count_reg[10] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[8]_i_1_n_5 ),
        .Q(pulse_count[10]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[11] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[8]_i_1_n_4 ),
        .Q(pulse_count[11]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[12] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[12]_i_1_n_7 ),
        .Q(pulse_count[12]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[12]_i_1 
       (.CI(\pulse_count_reg[8]_i_1_n_0 ),
        .CO({\pulse_count_reg[12]_i_1_n_0 ,\pulse_count_reg[12]_i_1_n_1 ,\pulse_count_reg[12]_i_1_n_2 ,\pulse_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[12]_i_1_n_4 ,\pulse_count_reg[12]_i_1_n_5 ,\pulse_count_reg[12]_i_1_n_6 ,\pulse_count_reg[12]_i_1_n_7 }),
        .S(pulse_count[15:12]));
  FDRE \pulse_count_reg[13] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[12]_i_1_n_6 ),
        .Q(pulse_count[13]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[14] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[12]_i_1_n_5 ),
        .Q(pulse_count[14]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[15] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[12]_i_1_n_4 ),
        .Q(pulse_count[15]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[16] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[16]_i_1_n_7 ),
        .Q(pulse_count[16]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[16]_i_1 
       (.CI(\pulse_count_reg[12]_i_1_n_0 ),
        .CO({\pulse_count_reg[16]_i_1_n_0 ,\pulse_count_reg[16]_i_1_n_1 ,\pulse_count_reg[16]_i_1_n_2 ,\pulse_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[16]_i_1_n_4 ,\pulse_count_reg[16]_i_1_n_5 ,\pulse_count_reg[16]_i_1_n_6 ,\pulse_count_reg[16]_i_1_n_7 }),
        .S(pulse_count[19:16]));
  FDRE \pulse_count_reg[17] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[16]_i_1_n_6 ),
        .Q(pulse_count[17]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[18] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[16]_i_1_n_5 ),
        .Q(pulse_count[18]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[19] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[16]_i_1_n_4 ),
        .Q(pulse_count[19]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[1] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[0]_i_2_n_6 ),
        .Q(pulse_count[1]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[20] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[20]_i_1_n_7 ),
        .Q(pulse_count[20]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[20]_i_1 
       (.CI(\pulse_count_reg[16]_i_1_n_0 ),
        .CO({\pulse_count_reg[20]_i_1_n_0 ,\pulse_count_reg[20]_i_1_n_1 ,\pulse_count_reg[20]_i_1_n_2 ,\pulse_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[20]_i_1_n_4 ,\pulse_count_reg[20]_i_1_n_5 ,\pulse_count_reg[20]_i_1_n_6 ,\pulse_count_reg[20]_i_1_n_7 }),
        .S(pulse_count[23:20]));
  FDRE \pulse_count_reg[21] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[20]_i_1_n_6 ),
        .Q(pulse_count[21]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[22] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[20]_i_1_n_5 ),
        .Q(pulse_count[22]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[23] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[20]_i_1_n_4 ),
        .Q(pulse_count[23]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[24] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[24]_i_1_n_7 ),
        .Q(pulse_count[24]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[24]_i_1 
       (.CI(\pulse_count_reg[20]_i_1_n_0 ),
        .CO({\pulse_count_reg[24]_i_1_n_0 ,\pulse_count_reg[24]_i_1_n_1 ,\pulse_count_reg[24]_i_1_n_2 ,\pulse_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[24]_i_1_n_4 ,\pulse_count_reg[24]_i_1_n_5 ,\pulse_count_reg[24]_i_1_n_6 ,\pulse_count_reg[24]_i_1_n_7 }),
        .S(pulse_count[27:24]));
  FDRE \pulse_count_reg[25] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[24]_i_1_n_6 ),
        .Q(pulse_count[25]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[26] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[24]_i_1_n_5 ),
        .Q(pulse_count[26]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[27] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[24]_i_1_n_4 ),
        .Q(pulse_count[27]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[28] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[28]_i_1_n_7 ),
        .Q(pulse_count[28]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[28]_i_1 
       (.CI(\pulse_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_pulse_count_reg[28]_i_1_CO_UNCONNECTED [3],\pulse_count_reg[28]_i_1_n_1 ,\pulse_count_reg[28]_i_1_n_2 ,\pulse_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[28]_i_1_n_4 ,\pulse_count_reg[28]_i_1_n_5 ,\pulse_count_reg[28]_i_1_n_6 ,\pulse_count_reg[28]_i_1_n_7 }),
        .S(pulse_count[31:28]));
  FDRE \pulse_count_reg[29] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[28]_i_1_n_6 ),
        .Q(pulse_count[29]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[2] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[0]_i_2_n_5 ),
        .Q(pulse_count[2]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[30] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[28]_i_1_n_5 ),
        .Q(pulse_count[30]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[31] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[28]_i_1_n_4 ),
        .Q(pulse_count[31]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[3] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[0]_i_2_n_4 ),
        .Q(pulse_count[3]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[4] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[4]_i_1_n_7 ),
        .Q(pulse_count[4]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[4]_i_1 
       (.CI(\pulse_count_reg[0]_i_2_n_0 ),
        .CO({\pulse_count_reg[4]_i_1_n_0 ,\pulse_count_reg[4]_i_1_n_1 ,\pulse_count_reg[4]_i_1_n_2 ,\pulse_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[4]_i_1_n_4 ,\pulse_count_reg[4]_i_1_n_5 ,\pulse_count_reg[4]_i_1_n_6 ,\pulse_count_reg[4]_i_1_n_7 }),
        .S(pulse_count[7:4]));
  FDRE \pulse_count_reg[5] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[4]_i_1_n_6 ),
        .Q(pulse_count[5]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[6] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[4]_i_1_n_5 ),
        .Q(pulse_count[6]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[7] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[4]_i_1_n_4 ),
        .Q(pulse_count[7]),
        .R(soft_reset_r_reg));
  FDRE \pulse_count_reg[8] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[8]_i_1_n_7 ),
        .Q(pulse_count[8]),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pulse_count_reg[8]_i_1 
       (.CI(\pulse_count_reg[4]_i_1_n_0 ),
        .CO({\pulse_count_reg[8]_i_1_n_0 ,\pulse_count_reg[8]_i_1_n_1 ,\pulse_count_reg[8]_i_1_n_2 ,\pulse_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pulse_count_reg[8]_i_1_n_4 ,\pulse_count_reg[8]_i_1_n_5 ,\pulse_count_reg[8]_i_1_n_6 ,\pulse_count_reg[8]_i_1_n_7 }),
        .S(pulse_count[11:8]));
  FDRE \pulse_count_reg[9] 
       (.C(aclk),
        .CE(have_rise7_out),
        .D(\pulse_count_reg[8]_i_1_n_6 ),
        .Q(pulse_count[9]),
        .R(soft_reset_r_reg));
  LUT2 #(
    .INIT(4'hE)) 
    pulse_valid_i_1
       (.I0(\pw_samples[31]_i_2_n_0 ),
        .I1(pulse_valid),
        .O(pulse_valid_i_1_n_0));
  FDRE pulse_valid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(pulse_valid_i_1_n_0),
        .Q(pulse_valid),
        .R(soft_reset_r_reg));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\pw_acc0_inferred__0/i__carry_n_0 ,\pw_acc0_inferred__0/i__carry_n_1 ,\pw_acc0_inferred__0/i__carry_n_2 ,\pw_acc0_inferred__0/i__carry_n_3 }),
        .CYINIT(\pw_acc_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[4:1]),
        .S({\pw_acc_reg_n_0_[4] ,\pw_acc_reg_n_0_[3] ,\pw_acc_reg_n_0_[2] ,\pw_acc_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__0 
       (.CI(\pw_acc0_inferred__0/i__carry_n_0 ),
        .CO({\pw_acc0_inferred__0/i__carry__0_n_0 ,\pw_acc0_inferred__0/i__carry__0_n_1 ,\pw_acc0_inferred__0/i__carry__0_n_2 ,\pw_acc0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[8:5]),
        .S({\pw_acc_reg_n_0_[8] ,\pw_acc_reg_n_0_[7] ,\pw_acc_reg_n_0_[6] ,\pw_acc_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__1 
       (.CI(\pw_acc0_inferred__0/i__carry__0_n_0 ),
        .CO({\pw_acc0_inferred__0/i__carry__1_n_0 ,\pw_acc0_inferred__0/i__carry__1_n_1 ,\pw_acc0_inferred__0/i__carry__1_n_2 ,\pw_acc0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[12:9]),
        .S({\pw_acc_reg_n_0_[12] ,\pw_acc_reg_n_0_[11] ,\pw_acc_reg_n_0_[10] ,\pw_acc_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__2 
       (.CI(\pw_acc0_inferred__0/i__carry__1_n_0 ),
        .CO({\pw_acc0_inferred__0/i__carry__2_n_0 ,\pw_acc0_inferred__0/i__carry__2_n_1 ,\pw_acc0_inferred__0/i__carry__2_n_2 ,\pw_acc0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[16:13]),
        .S({\pw_acc_reg_n_0_[16] ,\pw_acc_reg_n_0_[15] ,\pw_acc_reg_n_0_[14] ,\pw_acc_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__3 
       (.CI(\pw_acc0_inferred__0/i__carry__2_n_0 ),
        .CO({\pw_acc0_inferred__0/i__carry__3_n_0 ,\pw_acc0_inferred__0/i__carry__3_n_1 ,\pw_acc0_inferred__0/i__carry__3_n_2 ,\pw_acc0_inferred__0/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[20:17]),
        .S({\pw_acc_reg_n_0_[20] ,\pw_acc_reg_n_0_[19] ,\pw_acc_reg_n_0_[18] ,\pw_acc_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__4 
       (.CI(\pw_acc0_inferred__0/i__carry__3_n_0 ),
        .CO({\pw_acc0_inferred__0/i__carry__4_n_0 ,\pw_acc0_inferred__0/i__carry__4_n_1 ,\pw_acc0_inferred__0/i__carry__4_n_2 ,\pw_acc0_inferred__0/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[24:21]),
        .S({\pw_acc_reg_n_0_[24] ,\pw_acc_reg_n_0_[23] ,\pw_acc_reg_n_0_[22] ,\pw_acc_reg_n_0_[21] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__5 
       (.CI(\pw_acc0_inferred__0/i__carry__4_n_0 ),
        .CO({\pw_acc0_inferred__0/i__carry__5_n_0 ,\pw_acc0_inferred__0/i__carry__5_n_1 ,\pw_acc0_inferred__0/i__carry__5_n_2 ,\pw_acc0_inferred__0/i__carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(pw_acc0[28:25]),
        .S({\pw_acc_reg_n_0_[28] ,\pw_acc_reg_n_0_[27] ,\pw_acc_reg_n_0_[26] ,\pw_acc_reg_n_0_[25] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \pw_acc0_inferred__0/i__carry__6 
       (.CI(\pw_acc0_inferred__0/i__carry__5_n_0 ),
        .CO({\NLW_pw_acc0_inferred__0/i__carry__6_CO_UNCONNECTED [3:2],\pw_acc0_inferred__0/i__carry__6_n_2 ,\pw_acc0_inferred__0/i__carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_pw_acc0_inferred__0/i__carry__6_O_UNCONNECTED [3],pw_acc0[31:29]}),
        .S({1'b0,\pw_acc_reg_n_0_[31] ,\pw_acc_reg_n_0_[30] ,\pw_acc_reg_n_0_[29] }));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'h7F578A08)) 
    \pw_acc[0]_i_1 
       (.I0(sample_fire),
        .I1(in_pulse_reg_0),
        .I2(above_d),
        .I3(above),
        .I4(\pw_acc_reg_n_0_[0] ),
        .O(\pw_acc[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCEEC)) 
    \pw_acc[31]_i_1 
       (.I0(sample_fire),
        .I1(soft_reset_r_reg),
        .I2(above),
        .I3(above_d),
        .O(pw_acc));
  FDRE \pw_acc_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\pw_acc[0]_i_1_n_0 ),
        .Q(\pw_acc_reg_n_0_[0] ),
        .R(soft_reset_r_reg));
  FDRE \pw_acc_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[10]),
        .Q(\pw_acc_reg_n_0_[10] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[11]),
        .Q(\pw_acc_reg_n_0_[11] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[12]),
        .Q(\pw_acc_reg_n_0_[12] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[13]),
        .Q(\pw_acc_reg_n_0_[13] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[14]),
        .Q(\pw_acc_reg_n_0_[14] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[15]),
        .Q(\pw_acc_reg_n_0_[15] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[16]),
        .Q(\pw_acc_reg_n_0_[16] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[17]),
        .Q(\pw_acc_reg_n_0_[17] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[18]),
        .Q(\pw_acc_reg_n_0_[18] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[19]),
        .Q(\pw_acc_reg_n_0_[19] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[1]),
        .Q(\pw_acc_reg_n_0_[1] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[20]),
        .Q(\pw_acc_reg_n_0_[20] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[21]),
        .Q(\pw_acc_reg_n_0_[21] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[22]),
        .Q(\pw_acc_reg_n_0_[22] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[23]),
        .Q(\pw_acc_reg_n_0_[23] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[24]),
        .Q(\pw_acc_reg_n_0_[24] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[25]),
        .Q(\pw_acc_reg_n_0_[25] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[26]),
        .Q(\pw_acc_reg_n_0_[26] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[27]),
        .Q(\pw_acc_reg_n_0_[27] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[28]),
        .Q(\pw_acc_reg_n_0_[28] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[29]),
        .Q(\pw_acc_reg_n_0_[29] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[2]),
        .Q(\pw_acc_reg_n_0_[2] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[30]),
        .Q(\pw_acc_reg_n_0_[30] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[31]),
        .Q(\pw_acc_reg_n_0_[31] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[3]),
        .Q(\pw_acc_reg_n_0_[3] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[4]),
        .Q(\pw_acc_reg_n_0_[4] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[5]),
        .Q(\pw_acc_reg_n_0_[5] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[6]),
        .Q(\pw_acc_reg_n_0_[6] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[7]),
        .Q(\pw_acc_reg_n_0_[7] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[8]),
        .Q(\pw_acc_reg_n_0_[8] ),
        .R(pw_acc));
  FDRE \pw_acc_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(pw_acc0[9]),
        .Q(\pw_acc_reg_n_0_[9] ),
        .R(pw_acc));
  LUT6 #(
    .INIT(64'hBBBBBFBB88888F88)) 
    \pw_samples[0]_i_1 
       (.I0(\pw_acc_reg_n_0_[0] ),
        .I1(\pw_samples[31]_i_2_n_0 ),
        .I2(\pw_samples[0]_i_2_n_0 ),
        .I3(\pw_samples[31]_i_3_n_0 ),
        .I4(\pw_samples[31]_i_4_n_0 ),
        .I5(pw_samples[0]),
        .O(\pw_samples[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEAFFFFFFFF)) 
    \pw_samples[0]_i_2 
       (.I0(\pw_acc_reg_n_0_[1] ),
        .I1(above013_in),
        .I2(above_d_i_3_n_0),
        .I3(above_d_i_4_n_0),
        .I4(above_d_i_5_n_0),
        .I5(above_d),
        .O(\pw_samples[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAABAAAAAA)) 
    \pw_samples[31]_i_1 
       (.I0(soft_reset_r_reg),
        .I1(\pw_acc_reg_n_0_[1] ),
        .I2(above),
        .I3(above_d),
        .I4(\pw_samples[31]_i_3_n_0 ),
        .I5(\pw_samples[31]_i_4_n_0 ),
        .O(\pw_samples[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pw_samples[31]_i_10 
       (.I0(\pw_acc_reg_n_0_[29] ),
        .I1(\pw_acc_reg_n_0_[30] ),
        .I2(\pw_acc_reg_n_0_[31] ),
        .I3(\pw_acc_reg_n_0_[0] ),
        .O(\pw_samples[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h2222222A00000000)) 
    \pw_samples[31]_i_2 
       (.I0(sample_fire),
        .I1(above013_in),
        .I2(above_d_i_3_n_0),
        .I3(above_d_i_4_n_0),
        .I4(above_d_i_5_n_0),
        .I5(above_d),
        .O(\pw_samples[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \pw_samples[31]_i_3 
       (.I0(sample_fire),
        .I1(\pw_acc_reg_n_0_[2] ),
        .I2(\pw_acc_reg_n_0_[3] ),
        .I3(\pw_acc_reg_n_0_[4] ),
        .I4(\pw_samples[31]_i_5_n_0 ),
        .I5(\pw_samples[31]_i_6_n_0 ),
        .O(\pw_samples[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \pw_samples[31]_i_4 
       (.I0(\pw_samples[31]_i_7_n_0 ),
        .I1(\pw_acc_reg_n_0_[17] ),
        .I2(\pw_acc_reg_n_0_[18] ),
        .I3(\pw_acc_reg_n_0_[19] ),
        .I4(\pw_acc_reg_n_0_[20] ),
        .I5(\pw_samples[31]_i_8_n_0 ),
        .O(\pw_samples[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \pw_samples[31]_i_5 
       (.I0(\pw_acc_reg_n_0_[8] ),
        .I1(\pw_acc_reg_n_0_[7] ),
        .I2(\pw_acc_reg_n_0_[6] ),
        .I3(\pw_acc_reg_n_0_[5] ),
        .O(\pw_samples[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \pw_samples[31]_i_6 
       (.I0(\pw_acc_reg_n_0_[13] ),
        .I1(\pw_acc_reg_n_0_[14] ),
        .I2(\pw_acc_reg_n_0_[15] ),
        .I3(\pw_acc_reg_n_0_[16] ),
        .I4(\pw_samples[31]_i_9_n_0 ),
        .O(\pw_samples[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pw_samples[31]_i_7 
       (.I0(\pw_acc_reg_n_0_[21] ),
        .I1(\pw_acc_reg_n_0_[22] ),
        .I2(\pw_acc_reg_n_0_[23] ),
        .I3(\pw_acc_reg_n_0_[24] ),
        .O(\pw_samples[31]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \pw_samples[31]_i_8 
       (.I0(\pw_acc_reg_n_0_[28] ),
        .I1(\pw_acc_reg_n_0_[27] ),
        .I2(\pw_acc_reg_n_0_[26] ),
        .I3(\pw_acc_reg_n_0_[25] ),
        .I4(\pw_samples[31]_i_10_n_0 ),
        .O(\pw_samples[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \pw_samples[31]_i_9 
       (.I0(\pw_acc_reg_n_0_[12] ),
        .I1(\pw_acc_reg_n_0_[11] ),
        .I2(\pw_acc_reg_n_0_[10] ),
        .I3(\pw_acc_reg_n_0_[9] ),
        .O(\pw_samples[31]_i_9_n_0 ));
  FDRE \pw_samples_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\pw_samples[0]_i_1_n_0 ),
        .Q(pw_samples[0]),
        .R(soft_reset_r_reg));
  FDRE \pw_samples_reg[10] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[10] ),
        .Q(pw_samples[10]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[11] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[11] ),
        .Q(pw_samples[11]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[12] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[12] ),
        .Q(pw_samples[12]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[13] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[13] ),
        .Q(pw_samples[13]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[14] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[14] ),
        .Q(pw_samples[14]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[15] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[15] ),
        .Q(pw_samples[15]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[16] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[16] ),
        .Q(pw_samples[16]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[17] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[17] ),
        .Q(pw_samples[17]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[18] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[18] ),
        .Q(pw_samples[18]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[19] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[19] ),
        .Q(pw_samples[19]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[1] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[1] ),
        .Q(pw_samples[1]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[20] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[20] ),
        .Q(pw_samples[20]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[21] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[21] ),
        .Q(pw_samples[21]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[22] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[22] ),
        .Q(pw_samples[22]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[23] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[23] ),
        .Q(pw_samples[23]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[24] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[24] ),
        .Q(pw_samples[24]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[25] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[25] ),
        .Q(pw_samples[25]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[26] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[26] ),
        .Q(pw_samples[26]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[27] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[27] ),
        .Q(pw_samples[27]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[28] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[28] ),
        .Q(pw_samples[28]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[29] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[29] ),
        .Q(pw_samples[29]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[2] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[2] ),
        .Q(pw_samples[2]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[30] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[30] ),
        .Q(pw_samples[30]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[31] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[31] ),
        .Q(pw_samples[31]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[3] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[3] ),
        .Q(pw_samples[3]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[4] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[4] ),
        .Q(pw_samples[4]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[5] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[5] ),
        .Q(pw_samples[5]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[6] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[6] ),
        .Q(pw_samples[6]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[7] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[7] ),
        .Q(pw_samples[7]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[8] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[8] ),
        .Q(pw_samples[8]),
        .R(\pw_samples[31]_i_1_n_0 ));
  FDRE \pw_samples_reg[9] 
       (.C(aclk),
        .CE(\pw_samples[31]_i_2_n_0 ),
        .D(\pw_acc_reg_n_0_[9] ),
        .Q(pw_samples[9]),
        .R(\pw_samples[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[0]_i_5 
       (.I0(pulse_count[0]),
        .I1(last_mag2[0]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[0]),
        .I5(\s_axi_rdata_reg[15] [0]),
        .O(\pulse_count_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[10]_i_3 
       (.I0(pulse_count[10]),
        .I1(last_mag2[10]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[10]),
        .I5(\s_axi_rdata_reg[15] [10]),
        .O(\pulse_count_reg[10]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[11]_i_3 
       (.I0(pulse_count[11]),
        .I1(last_mag2[11]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[11]),
        .I5(\s_axi_rdata_reg[15] [11]),
        .O(\pulse_count_reg[11]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[12]_i_3 
       (.I0(pulse_count[12]),
        .I1(last_mag2[12]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[12]),
        .I5(\s_axi_rdata_reg[15] [12]),
        .O(\pulse_count_reg[12]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[13]_i_3 
       (.I0(pulse_count[13]),
        .I1(last_mag2[13]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[13]),
        .I5(\s_axi_rdata_reg[15] [13]),
        .O(\pulse_count_reg[13]_0 ));
  LUT6 #(
    .INIT(64'h00000000AEFFAEAA)) 
    \s_axi_rdata[14]_i_1 
       (.I0(\s_axi_rdata_reg[14] ),
        .I1(\s_axi_rdata[14]_i_3_n_0 ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata_reg[14]_0 ),
        .I5(\s_axi_rdata_reg[8]_1 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[14]_i_3 
       (.I0(pulse_count[14]),
        .I1(last_mag2[14]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[14]),
        .I5(\s_axi_rdata_reg[15] [14]),
        .O(\s_axi_rdata[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[15]_i_3 
       (.I0(pulse_count[15]),
        .I1(last_mag2[15]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[15]),
        .I5(\s_axi_rdata_reg[15] [15]),
        .O(\pulse_count_reg[15]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[16]_i_1 
       (.I0(\s_axi_rdata_reg[16] ),
        .I1(Q[16]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[16]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[16]_1 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[16]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[16]),
        .I4(pulse_count[16]),
        .I5(pri_samples[16]),
        .O(\s_axi_rdata[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFF8F8F8)) 
    \s_axi_rdata[17]_i_1 
       (.I0(\s_axi_rdata[17]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(\s_axi_rdata_reg[17] ),
        .I3(Q[17]),
        .I4(\s_axi_rdata_reg[16]_0 ),
        .I5(\s_axi_rdata_reg[8]_1 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hAAFAAAEEAAAAAAAA)) 
    \s_axi_rdata[17]_i_2 
       (.I0(\s_axi_rdata[17]_i_4_n_0 ),
        .I1(frame_count_reg[0]),
        .I2(\s_axi_rdata_reg[29] [0]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \s_axi_rdata[17]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(last_mag2[17]),
        .I3(pulse_count[17]),
        .I4(pri_samples[17]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[18]_i_1 
       (.I0(\s_axi_rdata_reg[18] ),
        .I1(Q[18]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[18]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[18]_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[18]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[18]),
        .I4(pulse_count[18]),
        .I5(pri_samples[18]),
        .O(\s_axi_rdata[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[19]_i_1 
       (.I0(\s_axi_rdata_reg[19] ),
        .I1(Q[19]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[19]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[19]_0 ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[19]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[19]),
        .I4(pulse_count[19]),
        .I5(pri_samples[19]),
        .O(\s_axi_rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFEFCFECCCEFCCEC)) 
    \s_axi_rdata[1]_i_1 
       (.I0(\s_axi_rdata_reg[1] ),
        .I1(\s_axi_rdata_reg[1]_0 ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[1]_i_4_n_0 ),
        .I5(\s_axi_rdata[1]_i_5_n_0 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \s_axi_rdata[1]_i_4 
       (.I0(\s_axi_rdata[4]_i_2_0 [0]),
        .I1(pulse_valid),
        .I2(Q[1]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .O(\s_axi_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[1]_i_5 
       (.I0(pulse_count[1]),
        .I1(last_mag2[1]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[1]),
        .I5(\s_axi_rdata_reg[15] [1]),
        .O(\s_axi_rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFF8F8F8)) 
    \s_axi_rdata[20]_i_1 
       (.I0(\s_axi_rdata[20]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(\s_axi_rdata_reg[20] ),
        .I3(Q[20]),
        .I4(\s_axi_rdata_reg[16]_0 ),
        .I5(\s_axi_rdata_reg[8]_1 ),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hAAFAAAEEAAAAAAAA)) 
    \s_axi_rdata[20]_i_2 
       (.I0(\s_axi_rdata[20]_i_4_n_0 ),
        .I1(frame_count_reg[1]),
        .I2(\s_axi_rdata_reg[29] [1]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \s_axi_rdata[20]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(last_mag2[20]),
        .I3(pulse_count[20]),
        .I4(pri_samples[20]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[21]_i_1 
       (.I0(\s_axi_rdata_reg[21] ),
        .I1(Q[21]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[21]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[21]_0 ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[21]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[21]),
        .I4(pulse_count[21]),
        .I5(pri_samples[21]),
        .O(\s_axi_rdata[21]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[22]_i_4 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[22]),
        .I4(pulse_count[22]),
        .I5(pri_samples[22]),
        .O(s_axi_araddr_2_sn_1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[23]_i_1 
       (.I0(\s_axi_rdata_reg[23] ),
        .I1(Q[23]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[23]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[23]_0 ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[23]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[23]),
        .I4(pulse_count[23]),
        .I5(pri_samples[23]),
        .O(\s_axi_rdata[23]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFF8F8F8)) 
    \s_axi_rdata[24]_i_1 
       (.I0(\s_axi_rdata[24]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(\s_axi_rdata_reg[24] ),
        .I3(Q[24]),
        .I4(\s_axi_rdata_reg[16]_0 ),
        .I5(\s_axi_rdata_reg[8]_1 ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hAAFAAAEEAAAAAAAA)) 
    \s_axi_rdata[24]_i_2 
       (.I0(\s_axi_rdata[24]_i_4_n_0 ),
        .I1(frame_count_reg[2]),
        .I2(\s_axi_rdata_reg[29] [2]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \s_axi_rdata[24]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(last_mag2[24]),
        .I3(pulse_count[24]),
        .I4(pri_samples[24]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[25]_i_1 
       (.I0(\s_axi_rdata_reg[25] ),
        .I1(Q[25]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[25]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[25]_0 ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[25]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[25]),
        .I4(pulse_count[25]),
        .I5(pri_samples[25]),
        .O(\s_axi_rdata[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[26]_i_1 
       (.I0(\s_axi_rdata_reg[26] ),
        .I1(Q[26]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[26]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[26]_0 ),
        .O(D[14]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[26]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[26]),
        .I4(pulse_count[26]),
        .I5(pri_samples[26]),
        .O(\s_axi_rdata[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[27]_i_1 
       (.I0(\s_axi_rdata_reg[27] ),
        .I1(Q[27]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[27]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[27]_0 ),
        .O(D[15]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[27]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[27]),
        .I4(pulse_count[27]),
        .I5(pri_samples[27]),
        .O(\s_axi_rdata[27]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[28]_i_1 
       (.I0(\s_axi_rdata_reg[28] ),
        .I1(Q[28]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[28]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[28]_0 ),
        .O(D[16]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[28]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[28]),
        .I4(pulse_count[28]),
        .I5(pri_samples[28]),
        .O(\s_axi_rdata[28]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFF8F8F8)) 
    \s_axi_rdata[29]_i_1 
       (.I0(\s_axi_rdata[29]_i_2_n_0 ),
        .I1(s_axi_araddr[3]),
        .I2(\s_axi_rdata_reg[29]_0 ),
        .I3(Q[29]),
        .I4(\s_axi_rdata_reg[16]_0 ),
        .I5(\s_axi_rdata_reg[8]_1 ),
        .O(D[17]));
  LUT6 #(
    .INIT(64'hAAFAAAEEAAAAAAAA)) 
    \s_axi_rdata[29]_i_2 
       (.I0(\s_axi_rdata[29]_i_4_n_0 ),
        .I1(frame_count_reg[3]),
        .I2(\s_axi_rdata_reg[29] [3]),
        .I3(s_axi_araddr[0]),
        .I4(s_axi_araddr[1]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \s_axi_rdata[29]_i_4 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_araddr[1]),
        .I2(last_mag2[29]),
        .I3(pulse_count[29]),
        .I4(pri_samples[29]),
        .I5(s_axi_araddr[2]),
        .O(\s_axi_rdata[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFEFCFECCCEFCCEC)) 
    \s_axi_rdata[2]_i_1 
       (.I0(\s_axi_rdata_reg[2] ),
        .I1(\s_axi_rdata_reg[2]_0 ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[2]_i_4_n_0 ),
        .I5(\s_axi_rdata[2]_i_5_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[2]_i_4 
       (.I0(pri_valid),
        .I1(Q[2]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(p_4_in),
        .I5(\s_axi_rdata[4]_i_2_0 [1]),
        .O(\s_axi_rdata[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[2]_i_5 
       (.I0(pulse_count[2]),
        .I1(last_mag2[2]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[2]),
        .I5(\s_axi_rdata_reg[15] [2]),
        .O(\s_axi_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[30]_i_1 
       (.I0(\s_axi_rdata_reg[30] ),
        .I1(Q[30]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[30]_i_3_n_0 ),
        .I5(\s_axi_rdata_reg[30]_0 ),
        .O(D[18]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[30]_i_3 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[30]),
        .I4(pulse_count[30]),
        .I5(pri_samples[30]),
        .O(\s_axi_rdata[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \s_axi_rdata[31]_i_1 
       (.I0(\s_axi_rdata_reg[31] ),
        .I1(Q[31]),
        .I2(\s_axi_rdata_reg[16]_0 ),
        .I3(\s_axi_rdata_reg[8]_1 ),
        .I4(\s_axi_rdata[31]_i_5_n_0 ),
        .I5(\s_axi_rdata_reg[31]_0 ),
        .O(D[19]));
  LUT6 #(
    .INIT(64'h8A0A820288088000)) 
    \s_axi_rdata[31]_i_5 
       (.I0(\s_axi_rdata_reg[16]_2 ),
        .I1(s_axi_araddr[0]),
        .I2(s_axi_araddr[1]),
        .I3(last_mag2[31]),
        .I4(pulse_count[31]),
        .I5(pri_samples[31]),
        .O(\s_axi_rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[3]_i_5 
       (.I0(pulse_count[3]),
        .I1(last_mag2[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[3]),
        .I5(\s_axi_rdata_reg[15] [3]),
        .O(\pulse_count_reg[3]_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \s_axi_rdata[4]_i_1 
       (.I0(\s_axi_rdata[4]_i_2_n_0 ),
        .I1(s_axi_araddr[4]),
        .I2(s_axi_araddr[5]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hCFEFCFECCCEFCCEC)) 
    \s_axi_rdata[4]_i_2 
       (.I0(\s_axi_rdata_reg[4] ),
        .I1(\s_axi_rdata_reg[4]_0 ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata[4]_i_5_n_0 ),
        .I5(\s_axi_rdata[4]_i_6_n_0 ),
        .O(\s_axi_rdata[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF0CCAA00)) 
    \s_axi_rdata[4]_i_5 
       (.I0(\s_axi_rdata[4]_i_2_0 [2]),
        .I1(in_pulse_reg_0),
        .I2(Q[4]),
        .I3(s_axi_araddr[1]),
        .I4(s_axi_araddr[0]),
        .O(\s_axi_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[4]_i_6 
       (.I0(pulse_count[4]),
        .I1(last_mag2[4]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[4]),
        .I5(\s_axi_rdata_reg[15] [4]),
        .O(\s_axi_rdata[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[5]_i_3 
       (.I0(pulse_count[5]),
        .I1(last_mag2[5]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[5]),
        .I5(\s_axi_rdata_reg[15] [5]),
        .O(\pulse_count_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[6]_i_3 
       (.I0(pulse_count[6]),
        .I1(last_mag2[6]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[6]),
        .I5(\s_axi_rdata_reg[15] [6]),
        .O(\pulse_count_reg[6]_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[7]_i_3 
       (.I0(pulse_count[7]),
        .I1(last_mag2[7]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[7]),
        .I5(\s_axi_rdata_reg[15] [7]),
        .O(\pulse_count_reg[7]_0 ));
  LUT6 #(
    .INIT(64'h00000000AEFFAEAA)) 
    \s_axi_rdata[8]_i_1 
       (.I0(\s_axi_rdata_reg[8] ),
        .I1(\s_axi_rdata[8]_i_3_n_0 ),
        .I2(s_axi_araddr[2]),
        .I3(s_axi_araddr[3]),
        .I4(\s_axi_rdata_reg[8]_0 ),
        .I5(\s_axi_rdata_reg[8]_1 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[8]_i_3 
       (.I0(pulse_count[8]),
        .I1(last_mag2[8]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[8]),
        .I5(\s_axi_rdata_reg[15] [8]),
        .O(\s_axi_rdata[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAFCFA0C0AFC0A0)) 
    \s_axi_rdata[9]_i_3 
       (.I0(pulse_count[9]),
        .I1(last_mag2[9]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(pri_samples[9]),
        .I5(\s_axi_rdata_reg[15] [9]),
        .O(\pulse_count_reg[9]_0 ));
  LUT4 #(
    .INIT(16'hF7F8)) 
    \since_rise[0]_i_1 
       (.I0(have_rise),
        .I1(sample_fire),
        .I2(have_rise7_out),
        .I3(\since_rise_reg_n_0_[0] ),
        .O(\since_rise[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h0000FE00)) 
    \since_rise[31]_i_4 
       (.I0(above_d_i_5_n_0),
        .I1(above_d_i_4_n_0),
        .I2(above_d_i_3_n_0),
        .I3(above013_in),
        .I4(above_d),
        .O(in_pulse012_out));
  FDRE \since_rise_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\since_rise[0]_i_1_n_0 ),
        .Q(\since_rise_reg_n_0_[0] ),
        .R(soft_reset_r_reg));
  FDRE \since_rise_reg[10] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[10]),
        .Q(\since_rise_reg_n_0_[10] ),
        .R(SR));
  FDRE \since_rise_reg[11] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[11]),
        .Q(\since_rise_reg_n_0_[11] ),
        .R(SR));
  FDRE \since_rise_reg[12] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[12]),
        .Q(\since_rise_reg_n_0_[12] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[12]_i_1 
       (.CI(\since_rise_reg[8]_i_1_n_0 ),
        .CO({\since_rise_reg[12]_i_1_n_0 ,\since_rise_reg[12]_i_1_n_1 ,\since_rise_reg[12]_i_1_n_2 ,\since_rise_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[12:9]),
        .S({\since_rise_reg_n_0_[12] ,\since_rise_reg_n_0_[11] ,\since_rise_reg_n_0_[10] ,\since_rise_reg_n_0_[9] }));
  FDRE \since_rise_reg[13] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[13]),
        .Q(\since_rise_reg_n_0_[13] ),
        .R(SR));
  FDRE \since_rise_reg[14] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[14]),
        .Q(\since_rise_reg_n_0_[14] ),
        .R(SR));
  FDRE \since_rise_reg[15] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[15]),
        .Q(\since_rise_reg_n_0_[15] ),
        .R(SR));
  FDRE \since_rise_reg[16] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[16]),
        .Q(\since_rise_reg_n_0_[16] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[16]_i_1 
       (.CI(\since_rise_reg[12]_i_1_n_0 ),
        .CO({\since_rise_reg[16]_i_1_n_0 ,\since_rise_reg[16]_i_1_n_1 ,\since_rise_reg[16]_i_1_n_2 ,\since_rise_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[16:13]),
        .S({\since_rise_reg_n_0_[16] ,\since_rise_reg_n_0_[15] ,\since_rise_reg_n_0_[14] ,\since_rise_reg_n_0_[13] }));
  FDRE \since_rise_reg[17] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[17]),
        .Q(\since_rise_reg_n_0_[17] ),
        .R(SR));
  FDRE \since_rise_reg[18] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[18]),
        .Q(\since_rise_reg_n_0_[18] ),
        .R(SR));
  FDRE \since_rise_reg[19] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[19]),
        .Q(\since_rise_reg_n_0_[19] ),
        .R(SR));
  FDRE \since_rise_reg[1] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[1]),
        .Q(\since_rise_reg_n_0_[1] ),
        .R(SR));
  FDRE \since_rise_reg[20] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[20]),
        .Q(\since_rise_reg_n_0_[20] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[20]_i_1 
       (.CI(\since_rise_reg[16]_i_1_n_0 ),
        .CO({\since_rise_reg[20]_i_1_n_0 ,\since_rise_reg[20]_i_1_n_1 ,\since_rise_reg[20]_i_1_n_2 ,\since_rise_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[20:17]),
        .S({\since_rise_reg_n_0_[20] ,\since_rise_reg_n_0_[19] ,\since_rise_reg_n_0_[18] ,\since_rise_reg_n_0_[17] }));
  FDRE \since_rise_reg[21] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[21]),
        .Q(\since_rise_reg_n_0_[21] ),
        .R(SR));
  FDRE \since_rise_reg[22] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[22]),
        .Q(\since_rise_reg_n_0_[22] ),
        .R(SR));
  FDRE \since_rise_reg[23] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[23]),
        .Q(\since_rise_reg_n_0_[23] ),
        .R(SR));
  FDRE \since_rise_reg[24] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[24]),
        .Q(\since_rise_reg_n_0_[24] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[24]_i_1 
       (.CI(\since_rise_reg[20]_i_1_n_0 ),
        .CO({\since_rise_reg[24]_i_1_n_0 ,\since_rise_reg[24]_i_1_n_1 ,\since_rise_reg[24]_i_1_n_2 ,\since_rise_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[24:21]),
        .S({\since_rise_reg_n_0_[24] ,\since_rise_reg_n_0_[23] ,\since_rise_reg_n_0_[22] ,\since_rise_reg_n_0_[21] }));
  FDRE \since_rise_reg[25] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[25]),
        .Q(\since_rise_reg_n_0_[25] ),
        .R(SR));
  FDRE \since_rise_reg[26] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[26]),
        .Q(\since_rise_reg_n_0_[26] ),
        .R(SR));
  FDRE \since_rise_reg[27] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[27]),
        .Q(\since_rise_reg_n_0_[27] ),
        .R(SR));
  FDRE \since_rise_reg[28] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[28]),
        .Q(\since_rise_reg_n_0_[28] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[28]_i_1 
       (.CI(\since_rise_reg[24]_i_1_n_0 ),
        .CO({\since_rise_reg[28]_i_1_n_0 ,\since_rise_reg[28]_i_1_n_1 ,\since_rise_reg[28]_i_1_n_2 ,\since_rise_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[28:25]),
        .S({\since_rise_reg_n_0_[28] ,\since_rise_reg_n_0_[27] ,\since_rise_reg_n_0_[26] ,\since_rise_reg_n_0_[25] }));
  FDRE \since_rise_reg[29] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[29]),
        .Q(\since_rise_reg_n_0_[29] ),
        .R(SR));
  FDRE \since_rise_reg[2] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[2]),
        .Q(\since_rise_reg_n_0_[2] ),
        .R(SR));
  FDRE \since_rise_reg[30] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[30]),
        .Q(\since_rise_reg_n_0_[30] ),
        .R(SR));
  FDRE \since_rise_reg[31] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[31]),
        .Q(\since_rise_reg_n_0_[31] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[31]_i_3 
       (.CI(\since_rise_reg[28]_i_1_n_0 ),
        .CO({\NLW_since_rise_reg[31]_i_3_CO_UNCONNECTED [3:2],\since_rise_reg[31]_i_3_n_2 ,\since_rise_reg[31]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_since_rise_reg[31]_i_3_O_UNCONNECTED [3],p_2_in[31:29]}),
        .S({1'b0,\since_rise_reg_n_0_[31] ,\since_rise_reg_n_0_[30] ,\since_rise_reg_n_0_[29] }));
  FDRE \since_rise_reg[3] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[3]),
        .Q(\since_rise_reg_n_0_[3] ),
        .R(SR));
  FDRE \since_rise_reg[4] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[4]),
        .Q(\since_rise_reg_n_0_[4] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\since_rise_reg[4]_i_1_n_0 ,\since_rise_reg[4]_i_1_n_1 ,\since_rise_reg[4]_i_1_n_2 ,\since_rise_reg[4]_i_1_n_3 }),
        .CYINIT(\since_rise_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[4:1]),
        .S({\since_rise_reg_n_0_[4] ,\since_rise_reg_n_0_[3] ,\since_rise_reg_n_0_[2] ,\since_rise_reg_n_0_[1] }));
  FDRE \since_rise_reg[5] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[5]),
        .Q(\since_rise_reg_n_0_[5] ),
        .R(SR));
  FDRE \since_rise_reg[6] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[6]),
        .Q(\since_rise_reg_n_0_[6] ),
        .R(SR));
  FDRE \since_rise_reg[7] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[7]),
        .Q(\since_rise_reg_n_0_[7] ),
        .R(SR));
  FDRE \since_rise_reg[8] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[8]),
        .Q(\since_rise_reg_n_0_[8] ),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \since_rise_reg[8]_i_1 
       (.CI(\since_rise_reg[4]_i_1_n_0 ),
        .CO({\since_rise_reg[8]_i_1_n_0 ,\since_rise_reg[8]_i_1_n_1 ,\since_rise_reg[8]_i_1_n_2 ,\since_rise_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_2_in[8:5]),
        .S({\since_rise_reg_n_0_[8] ,\since_rise_reg_n_0_[7] ,\since_rise_reg_n_0_[6] ,\since_rise_reg_n_0_[5] }));
  FDRE \since_rise_reg[9] 
       (.C(aclk),
        .CE(\since_rise_reg[31]_0 ),
        .D(p_2_in[9]),
        .Q(\since_rise_reg_n_0_[9] ),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "axis_window" *) 
module radar_system_radar_core_0_0_axis_window
   (aresetn_0,
    m_tvalid_reg_0,
    m_axis_fft_tlast,
    ADDRARDADDR,
    SR,
    m_axis_fft_tready_0,
    E,
    sample_fire,
    s_axis_tready,
    m_axis_fft_tdata,
    aresetn,
    m_axis_fft_tready,
    s_axis_tvalid,
    s_axis_tdata,
    DOADO,
    clear,
    s_axis_tlast,
    aclk,
    \m_tdata_reg[31]_0 ,
    in_pulse012_out,
    \since_rise_reg[1] ,
    have_rise,
    \pw_acc_reg[1] ,
    p_4_in);
  output aresetn_0;
  output m_tvalid_reg_0;
  output m_axis_fft_tlast;
  output [9:0]ADDRARDADDR;
  output [0:0]SR;
  output [0:0]m_axis_fft_tready_0;
  output [0:0]E;
  output sample_fire;
  output s_axis_tready;
  output [31:0]m_axis_fft_tdata;
  input aresetn;
  input m_axis_fft_tready;
  input s_axis_tvalid;
  input [31:0]s_axis_tdata;
  input [15:0]DOADO;
  input clear;
  input s_axis_tlast;
  input aclk;
  input \m_tdata_reg[31]_0 ;
  input in_pulse012_out;
  input \since_rise_reg[1] ;
  input have_rise;
  input \pw_acc_reg[1] ;
  input [0:0]p_4_in;

  wire [9:0]ADDRARDADDR;
  wire [15:0]DOADO;
  wire [0:0]E;
  wire [0:0]SR;
  wire aclk;
  wire aresetn;
  wire aresetn_0;
  wire clear;
  wire fire_in;
  wire have_rise;
  wire i_w_n_100;
  wire i_w_n_101;
  wire i_w_n_102;
  wire i_w_n_103;
  wire i_w_n_104;
  wire i_w_n_105;
  wire i_w_n_73;
  wire i_w_n_74;
  wire i_w_n_75;
  wire i_w_n_76;
  wire i_w_n_77;
  wire i_w_n_78;
  wire i_w_n_79;
  wire i_w_n_80;
  wire i_w_n_81;
  wire i_w_n_82;
  wire i_w_n_83;
  wire i_w_n_84;
  wire i_w_n_85;
  wire i_w_n_86;
  wire i_w_n_87;
  wire i_w_n_88;
  wire i_w_n_89;
  wire i_w_n_90;
  wire i_w_n_91;
  wire i_w_n_92;
  wire i_w_n_93;
  wire i_w_n_94;
  wire i_w_n_95;
  wire i_w_n_96;
  wire i_w_n_97;
  wire i_w_n_98;
  wire i_w_n_99;
  wire in_pulse012_out;
  wire [31:0]m_axis_fft_tdata;
  wire m_axis_fft_tlast;
  wire m_axis_fft_tready;
  wire [0:0]m_axis_fft_tready_0;
  wire \m_tdata_reg[31]_0 ;
  wire m_tvalid_i_1__0_n_0;
  wire m_tvalid_reg_0;
  wire \n_count[0]_i_1_n_0 ;
  wire \n_count[0]_i_3_n_0 ;
  wire [9:0]n_count_reg;
  wire \n_count_reg[0]_i_2_n_0 ;
  wire \n_count_reg[0]_i_2_n_1 ;
  wire \n_count_reg[0]_i_2_n_2 ;
  wire \n_count_reg[0]_i_2_n_3 ;
  wire \n_count_reg[0]_i_2_n_4 ;
  wire \n_count_reg[0]_i_2_n_5 ;
  wire \n_count_reg[0]_i_2_n_6 ;
  wire \n_count_reg[0]_i_2_n_7 ;
  wire \n_count_reg[4]_i_1_n_0 ;
  wire \n_count_reg[4]_i_1_n_1 ;
  wire \n_count_reg[4]_i_1_n_2 ;
  wire \n_count_reg[4]_i_1_n_3 ;
  wire \n_count_reg[4]_i_1_n_4 ;
  wire \n_count_reg[4]_i_1_n_5 ;
  wire \n_count_reg[4]_i_1_n_6 ;
  wire \n_count_reg[4]_i_1_n_7 ;
  wire \n_count_reg[8]_i_1_n_3 ;
  wire \n_count_reg[8]_i_1_n_6 ;
  wire \n_count_reg[8]_i_1_n_7 ;
  wire n_count_reg_rep_i_12_n_7;
  wire n_count_reg_rep_i_13_n_0;
  wire n_count_reg_rep_i_13_n_1;
  wire n_count_reg_rep_i_13_n_2;
  wire n_count_reg_rep_i_13_n_3;
  wire n_count_reg_rep_i_13_n_4;
  wire n_count_reg_rep_i_13_n_5;
  wire n_count_reg_rep_i_13_n_6;
  wire n_count_reg_rep_i_13_n_7;
  wire n_count_reg_rep_i_14_n_0;
  wire n_count_reg_rep_i_14_n_1;
  wire n_count_reg_rep_i_14_n_2;
  wire n_count_reg_rep_i_14_n_3;
  wire n_count_reg_rep_i_14_n_4;
  wire n_count_reg_rep_i_14_n_5;
  wire n_count_reg_rep_i_14_n_6;
  wire n_count_reg_rep_i_14_n_7;
  wire [31:0]p_1_in;
  wire [0:0]p_4_in;
  wire \pw_acc_reg[1] ;
  wire q_w_n_100;
  wire q_w_n_101;
  wire q_w_n_102;
  wire q_w_n_103;
  wire q_w_n_104;
  wire q_w_n_105;
  wire q_w_n_73;
  wire q_w_n_74;
  wire q_w_n_75;
  wire q_w_n_76;
  wire q_w_n_77;
  wire q_w_n_78;
  wire q_w_n_79;
  wire q_w_n_80;
  wire q_w_n_81;
  wire q_w_n_82;
  wire q_w_n_83;
  wire q_w_n_84;
  wire q_w_n_85;
  wire q_w_n_86;
  wire q_w_n_87;
  wire q_w_n_88;
  wire q_w_n_89;
  wire q_w_n_90;
  wire q_w_n_91;
  wire q_w_n_92;
  wire q_w_n_93;
  wire q_w_n_94;
  wire q_w_n_95;
  wire q_w_n_96;
  wire q_w_n_97;
  wire q_w_n_98;
  wire q_w_n_99;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire sample_fire;
  wire \since_rise_reg[1] ;
  wire NLW_i_w_CARRYCASCOUT_UNCONNECTED;
  wire NLW_i_w_MULTSIGNOUT_UNCONNECTED;
  wire NLW_i_w_OVERFLOW_UNCONNECTED;
  wire NLW_i_w_PATTERNBDETECT_UNCONNECTED;
  wire NLW_i_w_PATTERNDETECT_UNCONNECTED;
  wire NLW_i_w_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_i_w_ACOUT_UNCONNECTED;
  wire [17:0]NLW_i_w_BCOUT_UNCONNECTED;
  wire [3:0]NLW_i_w_CARRYOUT_UNCONNECTED;
  wire [47:33]NLW_i_w_P_UNCONNECTED;
  wire [47:0]NLW_i_w_PCOUT_UNCONNECTED;
  wire [3:1]\NLW_n_count_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_n_count_reg[8]_i_1_O_UNCONNECTED ;
  wire [3:0]NLW_n_count_reg_rep_i_12_CO_UNCONNECTED;
  wire [3:1]NLW_n_count_reg_rep_i_12_O_UNCONNECTED;
  wire NLW_q_w_CARRYCASCOUT_UNCONNECTED;
  wire NLW_q_w_MULTSIGNOUT_UNCONNECTED;
  wire NLW_q_w_OVERFLOW_UNCONNECTED;
  wire NLW_q_w_PATTERNBDETECT_UNCONNECTED;
  wire NLW_q_w_PATTERNDETECT_UNCONNECTED;
  wire NLW_q_w_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_q_w_ACOUT_UNCONNECTED;
  wire [17:0]NLW_q_w_BCOUT_UNCONNECTED;
  wire [3:0]NLW_q_w_CARRYOUT_UNCONNECTED;
  wire [47:33]NLW_q_w_P_UNCONNECTED;
  wire [47:0]NLW_q_w_PCOUT_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    above_d_i_1
       (.I0(s_axis_tvalid),
        .I1(\m_tdata_reg[31]_0 ),
        .I2(m_tvalid_reg_0),
        .I3(m_axis_fft_tready),
        .O(sample_fire));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    i_w
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DOADO}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_i_w_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({s_axis_tdata[15],s_axis_tdata[15],s_axis_tdata[15:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_i_w_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_i_w_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_i_w_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_i_w_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_i_w_OVERFLOW_UNCONNECTED),
        .P({NLW_i_w_P_UNCONNECTED[47:33],i_w_n_73,i_w_n_74,i_w_n_75,i_w_n_76,i_w_n_77,i_w_n_78,i_w_n_79,i_w_n_80,i_w_n_81,i_w_n_82,i_w_n_83,i_w_n_84,i_w_n_85,i_w_n_86,i_w_n_87,i_w_n_88,i_w_n_89,i_w_n_90,i_w_n_91,i_w_n_92,i_w_n_93,i_w_n_94,i_w_n_95,i_w_n_96,i_w_n_97,i_w_n_98,i_w_n_99,i_w_n_100,i_w_n_101,i_w_n_102,i_w_n_103,i_w_n_104,i_w_n_105}),
        .PATTERNBDETECT(NLW_i_w_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_i_w_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_i_w_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_i_w_UNDERFLOW_UNCONNECTED));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[0]_i_1 
       (.I0(s_axis_tdata[0]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_90),
        .O(p_1_in[0]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[10]_i_1 
       (.I0(s_axis_tdata[10]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_80),
        .O(p_1_in[10]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[11]_i_1 
       (.I0(s_axis_tdata[11]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_79),
        .O(p_1_in[11]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[12]_i_1 
       (.I0(s_axis_tdata[12]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_78),
        .O(p_1_in[12]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[13]_i_1 
       (.I0(s_axis_tdata[13]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_77),
        .O(p_1_in[13]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[14]_i_1 
       (.I0(s_axis_tdata[14]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_76),
        .O(p_1_in[14]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[15]_i_1 
       (.I0(s_axis_tdata[15]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_75),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[16]_i_1 
       (.I0(s_axis_tdata[16]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_90),
        .O(p_1_in[16]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[17]_i_1 
       (.I0(s_axis_tdata[17]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_89),
        .O(p_1_in[17]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[18]_i_1 
       (.I0(s_axis_tdata[18]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_88),
        .O(p_1_in[18]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[19]_i_1 
       (.I0(s_axis_tdata[19]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_87),
        .O(p_1_in[19]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[1]_i_1 
       (.I0(s_axis_tdata[1]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_89),
        .O(p_1_in[1]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[20]_i_1 
       (.I0(s_axis_tdata[20]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_86),
        .O(p_1_in[20]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[21]_i_1 
       (.I0(s_axis_tdata[21]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_85),
        .O(p_1_in[21]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[22]_i_1 
       (.I0(s_axis_tdata[22]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_84),
        .O(p_1_in[22]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[23]_i_1 
       (.I0(s_axis_tdata[23]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_83),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[24]_i_1 
       (.I0(s_axis_tdata[24]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_82),
        .O(p_1_in[24]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[25]_i_1 
       (.I0(s_axis_tdata[25]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_81),
        .O(p_1_in[25]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[26]_i_1 
       (.I0(s_axis_tdata[26]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_80),
        .O(p_1_in[26]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[27]_i_1 
       (.I0(s_axis_tdata[27]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_79),
        .O(p_1_in[27]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[28]_i_1 
       (.I0(s_axis_tdata[28]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_78),
        .O(p_1_in[28]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[29]_i_1 
       (.I0(s_axis_tdata[29]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_77),
        .O(p_1_in[29]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[2]_i_1 
       (.I0(s_axis_tdata[2]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_88),
        .O(p_1_in[2]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[30]_i_1 
       (.I0(s_axis_tdata[30]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_76),
        .O(p_1_in[30]));
  LUT3 #(
    .INIT(8'hA2)) 
    \m_tdata[31]_i_1 
       (.I0(s_axis_tvalid),
        .I1(m_tvalid_reg_0),
        .I2(m_axis_fft_tready),
        .O(fire_in));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[31]_i_2 
       (.I0(s_axis_tdata[31]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(q_w_n_75),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[3]_i_1 
       (.I0(s_axis_tdata[3]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_87),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[4]_i_1 
       (.I0(s_axis_tdata[4]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_86),
        .O(p_1_in[4]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[5]_i_1 
       (.I0(s_axis_tdata[5]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_85),
        .O(p_1_in[5]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[6]_i_1 
       (.I0(s_axis_tdata[6]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_84),
        .O(p_1_in[6]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[7]_i_1 
       (.I0(s_axis_tdata[7]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_83),
        .O(p_1_in[7]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[8]_i_1 
       (.I0(s_axis_tdata[8]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_82),
        .O(p_1_in[8]));
  LUT4 #(
    .INIT(16'hEA2A)) 
    \m_tdata[9]_i_1 
       (.I0(s_axis_tdata[9]),
        .I1(p_4_in),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(i_w_n_81),
        .O(p_1_in[9]));
  FDRE \m_tdata_reg[0] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[0]),
        .Q(m_axis_fft_tdata[0]),
        .R(clear));
  FDRE \m_tdata_reg[10] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[10]),
        .Q(m_axis_fft_tdata[10]),
        .R(clear));
  FDRE \m_tdata_reg[11] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[11]),
        .Q(m_axis_fft_tdata[11]),
        .R(clear));
  FDRE \m_tdata_reg[12] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[12]),
        .Q(m_axis_fft_tdata[12]),
        .R(clear));
  FDRE \m_tdata_reg[13] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[13]),
        .Q(m_axis_fft_tdata[13]),
        .R(clear));
  FDRE \m_tdata_reg[14] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[14]),
        .Q(m_axis_fft_tdata[14]),
        .R(clear));
  FDRE \m_tdata_reg[15] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[15]),
        .Q(m_axis_fft_tdata[15]),
        .R(clear));
  FDRE \m_tdata_reg[16] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[16]),
        .Q(m_axis_fft_tdata[16]),
        .R(clear));
  FDRE \m_tdata_reg[17] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[17]),
        .Q(m_axis_fft_tdata[17]),
        .R(clear));
  FDRE \m_tdata_reg[18] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[18]),
        .Q(m_axis_fft_tdata[18]),
        .R(clear));
  FDRE \m_tdata_reg[19] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[19]),
        .Q(m_axis_fft_tdata[19]),
        .R(clear));
  FDRE \m_tdata_reg[1] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[1]),
        .Q(m_axis_fft_tdata[1]),
        .R(clear));
  FDRE \m_tdata_reg[20] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[20]),
        .Q(m_axis_fft_tdata[20]),
        .R(clear));
  FDRE \m_tdata_reg[21] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[21]),
        .Q(m_axis_fft_tdata[21]),
        .R(clear));
  FDRE \m_tdata_reg[22] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[22]),
        .Q(m_axis_fft_tdata[22]),
        .R(clear));
  FDRE \m_tdata_reg[23] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[23]),
        .Q(m_axis_fft_tdata[23]),
        .R(clear));
  FDRE \m_tdata_reg[24] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[24]),
        .Q(m_axis_fft_tdata[24]),
        .R(clear));
  FDRE \m_tdata_reg[25] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[25]),
        .Q(m_axis_fft_tdata[25]),
        .R(clear));
  FDRE \m_tdata_reg[26] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[26]),
        .Q(m_axis_fft_tdata[26]),
        .R(clear));
  FDRE \m_tdata_reg[27] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[27]),
        .Q(m_axis_fft_tdata[27]),
        .R(clear));
  FDRE \m_tdata_reg[28] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[28]),
        .Q(m_axis_fft_tdata[28]),
        .R(clear));
  FDRE \m_tdata_reg[29] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[29]),
        .Q(m_axis_fft_tdata[29]),
        .R(clear));
  FDRE \m_tdata_reg[2] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[2]),
        .Q(m_axis_fft_tdata[2]),
        .R(clear));
  FDRE \m_tdata_reg[30] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[30]),
        .Q(m_axis_fft_tdata[30]),
        .R(clear));
  FDRE \m_tdata_reg[31] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[31]),
        .Q(m_axis_fft_tdata[31]),
        .R(clear));
  FDRE \m_tdata_reg[3] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[3]),
        .Q(m_axis_fft_tdata[3]),
        .R(clear));
  FDRE \m_tdata_reg[4] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[4]),
        .Q(m_axis_fft_tdata[4]),
        .R(clear));
  FDRE \m_tdata_reg[5] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[5]),
        .Q(m_axis_fft_tdata[5]),
        .R(clear));
  FDRE \m_tdata_reg[6] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[6]),
        .Q(m_axis_fft_tdata[6]),
        .R(clear));
  FDRE \m_tdata_reg[7] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[7]),
        .Q(m_axis_fft_tdata[7]),
        .R(clear));
  FDRE \m_tdata_reg[8] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[8]),
        .Q(m_axis_fft_tdata[8]),
        .R(clear));
  FDRE \m_tdata_reg[9] 
       (.C(aclk),
        .CE(fire_in),
        .D(p_1_in[9]),
        .Q(m_axis_fft_tdata[9]),
        .R(clear));
  FDRE m_tlast_reg
       (.C(aclk),
        .CE(fire_in),
        .D(s_axis_tlast),
        .Q(m_axis_fft_tlast),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hF4)) 
    m_tvalid_i_1__0
       (.I0(m_axis_fft_tready),
        .I1(m_tvalid_reg_0),
        .I2(s_axis_tvalid),
        .O(m_tvalid_i_1__0_n_0));
  FDRE m_tvalid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_tvalid_i_1__0_n_0),
        .Q(m_tvalid_reg_0),
        .R(clear));
  LUT5 #(
    .INIT(32'h8808FFFF)) 
    \n_count[0]_i_1 
       (.I0(s_axis_tlast),
        .I1(s_axis_tvalid),
        .I2(m_tvalid_reg_0),
        .I3(m_axis_fft_tready),
        .I4(aresetn),
        .O(\n_count[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \n_count[0]_i_3 
       (.I0(n_count_reg[0]),
        .O(\n_count[0]_i_3_n_0 ));
  FDRE \n_count_reg[0] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[0]_i_2_n_7 ),
        .Q(n_count_reg[0]),
        .R(\n_count[0]_i_1_n_0 ));
  CARRY4 \n_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\n_count_reg[0]_i_2_n_0 ,\n_count_reg[0]_i_2_n_1 ,\n_count_reg[0]_i_2_n_2 ,\n_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\n_count_reg[0]_i_2_n_4 ,\n_count_reg[0]_i_2_n_5 ,\n_count_reg[0]_i_2_n_6 ,\n_count_reg[0]_i_2_n_7 }),
        .S({n_count_reg[3:1],\n_count[0]_i_3_n_0 }));
  FDRE \n_count_reg[1] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[0]_i_2_n_6 ),
        .Q(n_count_reg[1]),
        .R(\n_count[0]_i_1_n_0 ));
  FDRE \n_count_reg[2] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[0]_i_2_n_5 ),
        .Q(n_count_reg[2]),
        .R(\n_count[0]_i_1_n_0 ));
  FDRE \n_count_reg[3] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[0]_i_2_n_4 ),
        .Q(n_count_reg[3]),
        .R(\n_count[0]_i_1_n_0 ));
  FDRE \n_count_reg[4] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[4]_i_1_n_7 ),
        .Q(n_count_reg[4]),
        .R(\n_count[0]_i_1_n_0 ));
  CARRY4 \n_count_reg[4]_i_1 
       (.CI(\n_count_reg[0]_i_2_n_0 ),
        .CO({\n_count_reg[4]_i_1_n_0 ,\n_count_reg[4]_i_1_n_1 ,\n_count_reg[4]_i_1_n_2 ,\n_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\n_count_reg[4]_i_1_n_4 ,\n_count_reg[4]_i_1_n_5 ,\n_count_reg[4]_i_1_n_6 ,\n_count_reg[4]_i_1_n_7 }),
        .S(n_count_reg[7:4]));
  FDRE \n_count_reg[5] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[4]_i_1_n_6 ),
        .Q(n_count_reg[5]),
        .R(\n_count[0]_i_1_n_0 ));
  FDRE \n_count_reg[6] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[4]_i_1_n_5 ),
        .Q(n_count_reg[6]),
        .R(\n_count[0]_i_1_n_0 ));
  FDRE \n_count_reg[7] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[4]_i_1_n_4 ),
        .Q(n_count_reg[7]),
        .R(\n_count[0]_i_1_n_0 ));
  FDRE \n_count_reg[8] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[8]_i_1_n_7 ),
        .Q(n_count_reg[8]),
        .R(\n_count[0]_i_1_n_0 ));
  CARRY4 \n_count_reg[8]_i_1 
       (.CI(\n_count_reg[4]_i_1_n_0 ),
        .CO({\NLW_n_count_reg[8]_i_1_CO_UNCONNECTED [3:1],\n_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_n_count_reg[8]_i_1_O_UNCONNECTED [3:2],\n_count_reg[8]_i_1_n_6 ,\n_count_reg[8]_i_1_n_7 }),
        .S({1'b0,1'b0,n_count_reg[9:8]}));
  FDRE \n_count_reg[9] 
       (.C(aclk),
        .CE(fire_in),
        .D(\n_count_reg[8]_i_1_n_6 ),
        .Q(n_count_reg[9]),
        .R(\n_count[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hDF55)) 
    n_count_reg_rep_i_1
       (.I0(aresetn),
        .I1(m_axis_fft_tready),
        .I2(m_tvalid_reg_0),
        .I3(s_axis_tvalid),
        .O(aresetn_0));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_10
       (.I0(n_count_reg_rep_i_14_n_7),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[1]));
  LUT6 #(
    .INIT(64'h0400444444444444)) 
    n_count_reg_rep_i_11
       (.I0(n_count_reg[0]),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[0]));
  CARRY4 n_count_reg_rep_i_12
       (.CI(n_count_reg_rep_i_13_n_0),
        .CO(NLW_n_count_reg_rep_i_12_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_n_count_reg_rep_i_12_O_UNCONNECTED[3:1],n_count_reg_rep_i_12_n_7}),
        .S({1'b0,1'b0,1'b0,n_count_reg[9]}));
  CARRY4 n_count_reg_rep_i_13
       (.CI(n_count_reg_rep_i_14_n_0),
        .CO({n_count_reg_rep_i_13_n_0,n_count_reg_rep_i_13_n_1,n_count_reg_rep_i_13_n_2,n_count_reg_rep_i_13_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({n_count_reg_rep_i_13_n_4,n_count_reg_rep_i_13_n_5,n_count_reg_rep_i_13_n_6,n_count_reg_rep_i_13_n_7}),
        .S(n_count_reg[8:5]));
  CARRY4 n_count_reg_rep_i_14
       (.CI(1'b0),
        .CO({n_count_reg_rep_i_14_n_0,n_count_reg_rep_i_14_n_1,n_count_reg_rep_i_14_n_2,n_count_reg_rep_i_14_n_3}),
        .CYINIT(n_count_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({n_count_reg_rep_i_14_n_4,n_count_reg_rep_i_14_n_5,n_count_reg_rep_i_14_n_6,n_count_reg_rep_i_14_n_7}),
        .S(n_count_reg[4:1]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_2
       (.I0(n_count_reg_rep_i_12_n_7),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[9]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_3
       (.I0(n_count_reg_rep_i_13_n_4),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[8]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_4
       (.I0(n_count_reg_rep_i_13_n_5),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[7]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_5
       (.I0(n_count_reg_rep_i_13_n_6),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[6]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_6
       (.I0(n_count_reg_rep_i_13_n_7),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[5]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_7
       (.I0(n_count_reg_rep_i_14_n_4),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[4]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_8
       (.I0(n_count_reg_rep_i_14_n_5),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[3]));
  LUT6 #(
    .INIT(64'h0800888888888888)) 
    n_count_reg_rep_i_9
       (.I0(n_count_reg_rep_i_14_n_6),
        .I1(aresetn),
        .I2(m_axis_fft_tready),
        .I3(m_tvalid_reg_0),
        .I4(s_axis_tvalid),
        .I5(s_axis_tlast),
        .O(ADDRARDADDR[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'hB0000000)) 
    \pw_acc[31]_i_2 
       (.I0(m_axis_fft_tready),
        .I1(m_tvalid_reg_0),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(s_axis_tvalid),
        .I4(\pw_acc_reg[1] ),
        .O(E));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    q_w
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DOADO}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_q_w_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({s_axis_tdata[31],s_axis_tdata[31],s_axis_tdata[31:16]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_q_w_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_q_w_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_q_w_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_q_w_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_q_w_OVERFLOW_UNCONNECTED),
        .P({NLW_q_w_P_UNCONNECTED[47:33],q_w_n_73,q_w_n_74,q_w_n_75,q_w_n_76,q_w_n_77,q_w_n_78,q_w_n_79,q_w_n_80,q_w_n_81,q_w_n_82,q_w_n_83,q_w_n_84,q_w_n_85,q_w_n_86,q_w_n_87,q_w_n_88,q_w_n_89,q_w_n_90,q_w_n_91,q_w_n_92,q_w_n_93,q_w_n_94,q_w_n_95,q_w_n_96,q_w_n_97,q_w_n_98,q_w_n_99,q_w_n_100,q_w_n_101,q_w_n_102,q_w_n_103,q_w_n_104,q_w_n_105}),
        .PATTERNBDETECT(NLW_q_w_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_q_w_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_q_w_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_q_w_UNDERFLOW_UNCONNECTED));
  LUT2 #(
    .INIT(4'hB)) 
    s_axis_tready_INST_0
       (.I0(m_axis_fft_tready),
        .I1(m_tvalid_reg_0),
        .O(s_axis_tready));
  LUT6 #(
    .INIT(64'hFFFFFFFF88080000)) 
    \since_rise[31]_i_1 
       (.I0(s_axis_tvalid),
        .I1(\m_tdata_reg[31]_0 ),
        .I2(m_tvalid_reg_0),
        .I3(m_axis_fft_tready),
        .I4(in_pulse012_out),
        .I5(\since_rise_reg[1] ),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hB0000000)) 
    \since_rise[31]_i_2 
       (.I0(m_axis_fft_tready),
        .I1(m_tvalid_reg_0),
        .I2(\m_tdata_reg[31]_0 ),
        .I3(s_axis_tvalid),
        .I4(have_rise),
        .O(m_axis_fft_tready_0));
endmodule

(* ORIG_REF_NAME = "fft_config_master" *) 
module radar_system_radar_core_0_0_fft_config_master
   (m_axis_fft_config_tvalid,
    clear,
    kicked_reg_0,
    aclk,
    aresetn,
    m_axis_fft_config_tready);
  output m_axis_fft_config_tvalid;
  input clear;
  input kicked_reg_0;
  input aclk;
  input aresetn;
  input m_axis_fft_config_tready;

  wire aclk;
  wire aresetn;
  wire clear;
  wire kicked;
  wire kicked_reg_0;
  wire m_axis_fft_config_tready;
  wire m_axis_fft_config_tvalid;
  wire m_tvalid_i_1_n_0;

  FDRE kicked_reg
       (.C(aclk),
        .CE(1'b1),
        .D(kicked_reg_0),
        .Q(kicked),
        .R(clear));
  LUT5 #(
    .INIT(32'h75FF7575)) 
    m_tvalid_i_1
       (.I0(aresetn),
        .I1(m_axis_fft_config_tready),
        .I2(m_axis_fft_config_tvalid),
        .I3(kicked),
        .I4(kicked_reg_0),
        .O(m_tvalid_i_1_n_0));
  FDRE m_tvalid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_tvalid_i_1_n_0),
        .Q(m_axis_fft_config_tvalid),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "radar_core" *) 
module radar_system_radar_core_0_0_radar_core
   (aresetn_0,
    m_tvalid_reg,
    m_axis_fft_tlast,
    s_axi_awready,
    s_axi_wready,
    s_axi_arready,
    s_axi_rvalid,
    in_pulse_reg,
    peak_valid_reg,
    m_axis_fft_config_tvalid,
    s_axi_bvalid_reg_0,
    enable_reg_0,
    ADDRARDADDR,
    m_axis_fft_tdata,
    s_axi_rdata,
    leds,
    s_axis_tready,
    s_axis_tdata,
    aclk,
    aresetn,
    m_axis_fft_tready,
    s_axis_tvalid,
    DOADO,
    s_axis_tlast,
    s_axis_fft_tlast,
    s_axis_fft_tdata,
    s_axi_arvalid,
    s_axi_rready,
    s_axi_bready,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_awaddr,
    m_axis_fft_config_tready,
    s_axis_fft_tvalid,
    s_axi_araddr);
  output aresetn_0;
  output m_tvalid_reg;
  output m_axis_fft_tlast;
  output s_axi_awready;
  output s_axi_wready;
  output s_axi_arready;
  output s_axi_rvalid;
  output in_pulse_reg;
  output peak_valid_reg;
  output m_axis_fft_config_tvalid;
  output s_axi_bvalid_reg_0;
  output enable_reg_0;
  output [9:0]ADDRARDADDR;
  output [31:0]m_axis_fft_tdata;
  output [31:0]s_axi_rdata;
  output [0:0]leds;
  output s_axis_tready;
  input [31:0]s_axis_tdata;
  input aclk;
  input aresetn;
  input m_axis_fft_tready;
  input s_axis_tvalid;
  input [15:0]DOADO;
  input s_axis_tlast;
  input s_axis_fft_tlast;
  input [31:0]s_axis_fft_tdata;
  input s_axi_arvalid;
  input s_axi_rready;
  input s_axi_bready;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input [5:0]s_axi_awaddr;
  input m_axis_fft_config_tready;
  input s_axis_fft_tvalid;
  input [5:0]s_axi_araddr;

  wire [9:0]ADDRARDADDR;
  wire [15:0]DOADO;
  wire aclk;
  wire aresetn;
  wire aresetn_0;
  wire [15:0]bins_seen;
  wire clear;
  wire config_kick_i_1_n_0;
  wire config_kick_reg_n_0;
  wire enable_i_1_n_0;
  wire enable_i_2_n_0;
  wire enable_i_3_n_0;
  wire enable_reg_0;
  wire [15:0]fft_size;
  wire frame_count0;
  wire \frame_count[0]_i_3_n_0 ;
  wire [31:0]frame_count_reg;
  wire \frame_count_reg[0]_i_2_n_0 ;
  wire \frame_count_reg[0]_i_2_n_1 ;
  wire \frame_count_reg[0]_i_2_n_2 ;
  wire \frame_count_reg[0]_i_2_n_3 ;
  wire \frame_count_reg[0]_i_2_n_4 ;
  wire \frame_count_reg[0]_i_2_n_5 ;
  wire \frame_count_reg[0]_i_2_n_6 ;
  wire \frame_count_reg[0]_i_2_n_7 ;
  wire \frame_count_reg[12]_i_1_n_0 ;
  wire \frame_count_reg[12]_i_1_n_1 ;
  wire \frame_count_reg[12]_i_1_n_2 ;
  wire \frame_count_reg[12]_i_1_n_3 ;
  wire \frame_count_reg[12]_i_1_n_4 ;
  wire \frame_count_reg[12]_i_1_n_5 ;
  wire \frame_count_reg[12]_i_1_n_6 ;
  wire \frame_count_reg[12]_i_1_n_7 ;
  wire \frame_count_reg[16]_i_1_n_0 ;
  wire \frame_count_reg[16]_i_1_n_1 ;
  wire \frame_count_reg[16]_i_1_n_2 ;
  wire \frame_count_reg[16]_i_1_n_3 ;
  wire \frame_count_reg[16]_i_1_n_4 ;
  wire \frame_count_reg[16]_i_1_n_5 ;
  wire \frame_count_reg[16]_i_1_n_6 ;
  wire \frame_count_reg[16]_i_1_n_7 ;
  wire \frame_count_reg[20]_i_1_n_0 ;
  wire \frame_count_reg[20]_i_1_n_1 ;
  wire \frame_count_reg[20]_i_1_n_2 ;
  wire \frame_count_reg[20]_i_1_n_3 ;
  wire \frame_count_reg[20]_i_1_n_4 ;
  wire \frame_count_reg[20]_i_1_n_5 ;
  wire \frame_count_reg[20]_i_1_n_6 ;
  wire \frame_count_reg[20]_i_1_n_7 ;
  wire \frame_count_reg[24]_i_1_n_0 ;
  wire \frame_count_reg[24]_i_1_n_1 ;
  wire \frame_count_reg[24]_i_1_n_2 ;
  wire \frame_count_reg[24]_i_1_n_3 ;
  wire \frame_count_reg[24]_i_1_n_4 ;
  wire \frame_count_reg[24]_i_1_n_5 ;
  wire \frame_count_reg[24]_i_1_n_6 ;
  wire \frame_count_reg[24]_i_1_n_7 ;
  wire \frame_count_reg[28]_i_1_n_1 ;
  wire \frame_count_reg[28]_i_1_n_2 ;
  wire \frame_count_reg[28]_i_1_n_3 ;
  wire \frame_count_reg[28]_i_1_n_4 ;
  wire \frame_count_reg[28]_i_1_n_5 ;
  wire \frame_count_reg[28]_i_1_n_6 ;
  wire \frame_count_reg[28]_i_1_n_7 ;
  wire \frame_count_reg[4]_i_1_n_0 ;
  wire \frame_count_reg[4]_i_1_n_1 ;
  wire \frame_count_reg[4]_i_1_n_2 ;
  wire \frame_count_reg[4]_i_1_n_3 ;
  wire \frame_count_reg[4]_i_1_n_4 ;
  wire \frame_count_reg[4]_i_1_n_5 ;
  wire \frame_count_reg[4]_i_1_n_6 ;
  wire \frame_count_reg[4]_i_1_n_7 ;
  wire \frame_count_reg[8]_i_1_n_0 ;
  wire \frame_count_reg[8]_i_1_n_1 ;
  wire \frame_count_reg[8]_i_1_n_2 ;
  wire \frame_count_reg[8]_i_1_n_3 ;
  wire \frame_count_reg[8]_i_1_n_4 ;
  wire \frame_count_reg[8]_i_1_n_5 ;
  wire \frame_count_reg[8]_i_1_n_6 ;
  wire \frame_count_reg[8]_i_1_n_7 ;
  wire have_rise;
  wire \hb[0]_i_2_n_0 ;
  wire \hb_reg[0]_i_1_n_0 ;
  wire \hb_reg[0]_i_1_n_1 ;
  wire \hb_reg[0]_i_1_n_2 ;
  wire \hb_reg[0]_i_1_n_3 ;
  wire \hb_reg[0]_i_1_n_4 ;
  wire \hb_reg[0]_i_1_n_5 ;
  wire \hb_reg[0]_i_1_n_6 ;
  wire \hb_reg[0]_i_1_n_7 ;
  wire \hb_reg[12]_i_1_n_0 ;
  wire \hb_reg[12]_i_1_n_1 ;
  wire \hb_reg[12]_i_1_n_2 ;
  wire \hb_reg[12]_i_1_n_3 ;
  wire \hb_reg[12]_i_1_n_4 ;
  wire \hb_reg[12]_i_1_n_5 ;
  wire \hb_reg[12]_i_1_n_6 ;
  wire \hb_reg[12]_i_1_n_7 ;
  wire \hb_reg[16]_i_1_n_0 ;
  wire \hb_reg[16]_i_1_n_1 ;
  wire \hb_reg[16]_i_1_n_2 ;
  wire \hb_reg[16]_i_1_n_3 ;
  wire \hb_reg[16]_i_1_n_4 ;
  wire \hb_reg[16]_i_1_n_5 ;
  wire \hb_reg[16]_i_1_n_6 ;
  wire \hb_reg[16]_i_1_n_7 ;
  wire \hb_reg[20]_i_1_n_0 ;
  wire \hb_reg[20]_i_1_n_1 ;
  wire \hb_reg[20]_i_1_n_2 ;
  wire \hb_reg[20]_i_1_n_3 ;
  wire \hb_reg[20]_i_1_n_4 ;
  wire \hb_reg[20]_i_1_n_5 ;
  wire \hb_reg[20]_i_1_n_6 ;
  wire \hb_reg[20]_i_1_n_7 ;
  wire \hb_reg[24]_i_1_n_7 ;
  wire \hb_reg[4]_i_1_n_0 ;
  wire \hb_reg[4]_i_1_n_1 ;
  wire \hb_reg[4]_i_1_n_2 ;
  wire \hb_reg[4]_i_1_n_3 ;
  wire \hb_reg[4]_i_1_n_4 ;
  wire \hb_reg[4]_i_1_n_5 ;
  wire \hb_reg[4]_i_1_n_6 ;
  wire \hb_reg[4]_i_1_n_7 ;
  wire \hb_reg[8]_i_1_n_0 ;
  wire \hb_reg[8]_i_1_n_1 ;
  wire \hb_reg[8]_i_1_n_2 ;
  wire \hb_reg[8]_i_1_n_3 ;
  wire \hb_reg[8]_i_1_n_4 ;
  wire \hb_reg[8]_i_1_n_5 ;
  wire \hb_reg[8]_i_1_n_6 ;
  wire \hb_reg[8]_i_1_n_7 ;
  wire \hb_reg_n_0_[0] ;
  wire \hb_reg_n_0_[10] ;
  wire \hb_reg_n_0_[11] ;
  wire \hb_reg_n_0_[12] ;
  wire \hb_reg_n_0_[13] ;
  wire \hb_reg_n_0_[14] ;
  wire \hb_reg_n_0_[15] ;
  wire \hb_reg_n_0_[16] ;
  wire \hb_reg_n_0_[17] ;
  wire \hb_reg_n_0_[18] ;
  wire \hb_reg_n_0_[19] ;
  wire \hb_reg_n_0_[1] ;
  wire \hb_reg_n_0_[20] ;
  wire \hb_reg_n_0_[21] ;
  wire \hb_reg_n_0_[22] ;
  wire \hb_reg_n_0_[23] ;
  wire \hb_reg_n_0_[2] ;
  wire \hb_reg_n_0_[3] ;
  wire \hb_reg_n_0_[4] ;
  wire \hb_reg_n_0_[5] ;
  wire \hb_reg_n_0_[6] ;
  wire \hb_reg_n_0_[7] ;
  wire \hb_reg_n_0_[8] ;
  wire \hb_reg_n_0_[9] ;
  wire in_pulse012_out;
  wire in_pulse_reg;
  wire [0:0]leds;
  wire m_axis_fft_config_tready;
  wire m_axis_fft_config_tvalid;
  wire [31:0]m_axis_fft_tdata;
  wire m_axis_fft_tlast;
  wire m_axis_fft_tready;
  wire m_tvalid_reg;
  wire [15:7]p_1_in;
  wire [2:2]p_4_in;
  wire peak_valid_d;
  wire peak_valid_reg;
  wire [31:0]pw_samples;
  wire [5:0]s_axi_araddr;
  wire s_axi_arready;
  wire s_axi_arready0__0;
  wire s_axi_arvalid;
  wire [5:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awready_i_1_n_0;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_bvalid_i_2_n_0;
  wire s_axi_bvalid_reg_0;
  wire [31:0]s_axi_rdata;
  wire \s_axi_rdata[0]_i_3_n_0 ;
  wire \s_axi_rdata[10]_i_4_n_0 ;
  wire \s_axi_rdata[11]_i_4_n_0 ;
  wire \s_axi_rdata[12]_i_4_n_0 ;
  wire \s_axi_rdata[13]_i_4_n_0 ;
  wire \s_axi_rdata[14]_i_2_n_0 ;
  wire \s_axi_rdata[15]_i_4_n_0 ;
  wire \s_axi_rdata[16]_i_2_n_0 ;
  wire \s_axi_rdata[18]_i_2_n_0 ;
  wire \s_axi_rdata[19]_i_2_n_0 ;
  wire \s_axi_rdata[1]_i_3_n_0 ;
  wire \s_axi_rdata[21]_i_2_n_0 ;
  wire \s_axi_rdata[22]_i_2_n_0 ;
  wire \s_axi_rdata[23]_i_2_n_0 ;
  wire \s_axi_rdata[25]_i_2_n_0 ;
  wire \s_axi_rdata[26]_i_2_n_0 ;
  wire \s_axi_rdata[27]_i_2_n_0 ;
  wire \s_axi_rdata[28]_i_2_n_0 ;
  wire \s_axi_rdata[2]_i_3_n_0 ;
  wire \s_axi_rdata[30]_i_2_n_0 ;
  wire \s_axi_rdata[31]_i_2_n_0 ;
  wire \s_axi_rdata[31]_i_3_n_0 ;
  wire \s_axi_rdata[31]_i_4_n_0 ;
  wire \s_axi_rdata[31]_i_7_n_0 ;
  wire \s_axi_rdata[31]_i_8_n_0 ;
  wire \s_axi_rdata[3]_i_3_n_0 ;
  wire \s_axi_rdata[3]_i_6_n_0 ;
  wire \s_axi_rdata[4]_i_4_n_0 ;
  wire \s_axi_rdata[5]_i_4_n_0 ;
  wire \s_axi_rdata[6]_i_4_n_0 ;
  wire \s_axi_rdata[7]_i_4_n_0 ;
  wire \s_axi_rdata[8]_i_2_n_0 ;
  wire \s_axi_rdata[9]_i_4_n_0 ;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire s_axi_rvalid_i_1_n_0;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [31:0]s_axis_fft_tdata;
  wire s_axis_fft_tlast;
  wire s_axis_fft_tvalid;
  wire [31:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire sample_fire;
  wire [31:0]scratch;
  wire \scratch[15]_i_1_n_0 ;
  wire \scratch[23]_i_1_n_0 ;
  wire \scratch[31]_i_1_n_0 ;
  wire \scratch[7]_i_1_n_0 ;
  wire since_rise;
  wire soft_reset_r_i_1_n_0;
  wire soft_reset_r_reg_n_0;
  wire [31:0]threshold;
  wire \threshold[15]_i_1_n_0 ;
  wire \threshold[23]_i_1_n_0 ;
  wire \threshold[31]_i_1_n_0 ;
  wire \threshold[7]_i_1_n_0 ;
  wire u_peak_n_10;
  wire u_peak_n_11;
  wire u_peak_n_12;
  wire u_peak_n_13;
  wire u_peak_n_14;
  wire u_peak_n_15;
  wire u_peak_n_16;
  wire u_peak_n_17;
  wire u_peak_n_18;
  wire u_peak_n_19;
  wire u_peak_n_2;
  wire u_peak_n_20;
  wire u_peak_n_21;
  wire u_peak_n_22;
  wire u_peak_n_23;
  wire u_peak_n_24;
  wire u_peak_n_25;
  wire u_peak_n_26;
  wire u_peak_n_27;
  wire u_peak_n_28;
  wire u_peak_n_29;
  wire u_peak_n_30;
  wire u_peak_n_31;
  wire u_peak_n_32;
  wire u_peak_n_33;
  wire u_peak_n_34;
  wire u_peak_n_35;
  wire u_peak_n_4;
  wire u_peak_n_5;
  wire u_peak_n_6;
  wire u_peak_n_7;
  wire u_peak_n_8;
  wire u_peak_n_9;
  wire u_pulse_n_0;
  wire u_pulse_n_10;
  wire u_pulse_n_11;
  wire u_pulse_n_12;
  wire u_pulse_n_13;
  wire u_pulse_n_14;
  wire u_pulse_n_15;
  wire u_pulse_n_16;
  wire u_pulse_n_17;
  wire u_pulse_n_18;
  wire u_pulse_n_19;
  wire u_pulse_n_20;
  wire u_pulse_n_21;
  wire u_pulse_n_22;
  wire u_pulse_n_23;
  wire u_pulse_n_24;
  wire u_pulse_n_25;
  wire u_pulse_n_26;
  wire u_pulse_n_27;
  wire u_pulse_n_28;
  wire u_pulse_n_29;
  wire u_pulse_n_30;
  wire u_pulse_n_31;
  wire u_pulse_n_32;
  wire u_pulse_n_33;
  wire u_pulse_n_34;
  wire u_pulse_n_35;
  wire u_pulse_n_4;
  wire u_pulse_n_5;
  wire u_pulse_n_6;
  wire u_pulse_n_7;
  wire u_pulse_n_8;
  wire u_pulse_n_9;
  wire u_window_n_13;
  wire u_window_n_15;
  wire window_enable_i_1_n_0;
  wire [3:3]\NLW_frame_count_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_hb_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_hb_reg[24]_i_1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0000008000000000)) 
    config_kick_i_1
       (.I0(enable_i_2_n_0),
        .I1(s_axi_wdata[3]),
        .I2(s_axi_wstrb[0]),
        .I3(s_axi_awaddr[4]),
        .I4(s_axi_awaddr[5]),
        .I5(s_axi_awready_i_1_n_0),
        .O(config_kick_i_1_n_0));
  FDRE config_kick_reg
       (.C(aclk),
        .CE(1'b1),
        .D(config_kick_i_1_n_0),
        .Q(config_kick_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    enable_i_1
       (.I0(s_axi_wdata[0]),
        .I1(s_axi_wstrb[0]),
        .I2(enable_i_2_n_0),
        .I3(enable_i_3_n_0),
        .I4(enable_reg_0),
        .O(enable_i_1_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    enable_i_2
       (.I0(s_axi_awaddr[1]),
        .I1(s_axi_awaddr[0]),
        .I2(s_axi_awaddr[3]),
        .I3(s_axi_awaddr[2]),
        .O(enable_i_2_n_0));
  LUT6 #(
    .INIT(64'h000000000000B000)) 
    enable_i_3
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_awvalid),
        .I3(s_axi_wvalid),
        .I4(s_axi_awaddr[4]),
        .I5(s_axi_awaddr[5]),
        .O(enable_i_3_n_0));
  FDRE enable_reg
       (.C(aclk),
        .CE(1'b1),
        .D(enable_i_1_n_0),
        .Q(enable_reg_0),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \fft_size[15]_i_1 
       (.I0(s_axi_awaddr[1]),
        .I1(s_axi_awaddr[0]),
        .I2(s_axi_wstrb[1]),
        .I3(s_axi_awaddr[2]),
        .I4(s_axi_awaddr[3]),
        .I5(enable_i_3_n_0),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \fft_size[7]_i_1 
       (.I0(s_axi_awaddr[1]),
        .I1(s_axi_awaddr[0]),
        .I2(s_axi_wstrb[0]),
        .I3(s_axi_awaddr[2]),
        .I4(s_axi_awaddr[3]),
        .I5(enable_i_3_n_0),
        .O(p_1_in[7]));
  FDRE \fft_size_reg[0] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[0]),
        .Q(fft_size[0]),
        .R(clear));
  FDSE \fft_size_reg[10] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[10]),
        .Q(fft_size[10]),
        .S(clear));
  FDRE \fft_size_reg[11] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[11]),
        .Q(fft_size[11]),
        .R(clear));
  FDRE \fft_size_reg[12] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[12]),
        .Q(fft_size[12]),
        .R(clear));
  FDRE \fft_size_reg[13] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[13]),
        .Q(fft_size[13]),
        .R(clear));
  FDRE \fft_size_reg[14] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[14]),
        .Q(fft_size[14]),
        .R(clear));
  FDRE \fft_size_reg[15] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[15]),
        .Q(fft_size[15]),
        .R(clear));
  FDRE \fft_size_reg[1] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[1]),
        .Q(fft_size[1]),
        .R(clear));
  FDRE \fft_size_reg[2] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[2]),
        .Q(fft_size[2]),
        .R(clear));
  FDRE \fft_size_reg[3] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[3]),
        .Q(fft_size[3]),
        .R(clear));
  FDRE \fft_size_reg[4] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[4]),
        .Q(fft_size[4]),
        .R(clear));
  FDRE \fft_size_reg[5] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[5]),
        .Q(fft_size[5]),
        .R(clear));
  FDRE \fft_size_reg[6] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[6]),
        .Q(fft_size[6]),
        .R(clear));
  FDRE \fft_size_reg[7] 
       (.C(aclk),
        .CE(p_1_in[7]),
        .D(s_axi_wdata[7]),
        .Q(fft_size[7]),
        .R(clear));
  FDRE \fft_size_reg[8] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[8]),
        .Q(fft_size[8]),
        .R(clear));
  FDRE \fft_size_reg[9] 
       (.C(aclk),
        .CE(p_1_in[15]),
        .D(s_axi_wdata[9]),
        .Q(fft_size[9]),
        .R(clear));
  LUT1 #(
    .INIT(2'h1)) 
    \frame_count[0]_i_3 
       (.I0(frame_count_reg[0]),
        .O(\frame_count[0]_i_3_n_0 ));
  FDRE \frame_count_reg[0] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[0]_i_2_n_7 ),
        .Q(frame_count_reg[0]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\frame_count_reg[0]_i_2_n_0 ,\frame_count_reg[0]_i_2_n_1 ,\frame_count_reg[0]_i_2_n_2 ,\frame_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\frame_count_reg[0]_i_2_n_4 ,\frame_count_reg[0]_i_2_n_5 ,\frame_count_reg[0]_i_2_n_6 ,\frame_count_reg[0]_i_2_n_7 }),
        .S({frame_count_reg[3:1],\frame_count[0]_i_3_n_0 }));
  FDRE \frame_count_reg[10] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[8]_i_1_n_5 ),
        .Q(frame_count_reg[10]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[11] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[8]_i_1_n_4 ),
        .Q(frame_count_reg[11]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[12] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[12]_i_1_n_7 ),
        .Q(frame_count_reg[12]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[12]_i_1 
       (.CI(\frame_count_reg[8]_i_1_n_0 ),
        .CO({\frame_count_reg[12]_i_1_n_0 ,\frame_count_reg[12]_i_1_n_1 ,\frame_count_reg[12]_i_1_n_2 ,\frame_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[12]_i_1_n_4 ,\frame_count_reg[12]_i_1_n_5 ,\frame_count_reg[12]_i_1_n_6 ,\frame_count_reg[12]_i_1_n_7 }),
        .S(frame_count_reg[15:12]));
  FDRE \frame_count_reg[13] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[12]_i_1_n_6 ),
        .Q(frame_count_reg[13]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[14] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[12]_i_1_n_5 ),
        .Q(frame_count_reg[14]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[15] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[12]_i_1_n_4 ),
        .Q(frame_count_reg[15]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[16] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[16]_i_1_n_7 ),
        .Q(frame_count_reg[16]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[16]_i_1 
       (.CI(\frame_count_reg[12]_i_1_n_0 ),
        .CO({\frame_count_reg[16]_i_1_n_0 ,\frame_count_reg[16]_i_1_n_1 ,\frame_count_reg[16]_i_1_n_2 ,\frame_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[16]_i_1_n_4 ,\frame_count_reg[16]_i_1_n_5 ,\frame_count_reg[16]_i_1_n_6 ,\frame_count_reg[16]_i_1_n_7 }),
        .S(frame_count_reg[19:16]));
  FDRE \frame_count_reg[17] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[16]_i_1_n_6 ),
        .Q(frame_count_reg[17]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[18] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[16]_i_1_n_5 ),
        .Q(frame_count_reg[18]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[19] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[16]_i_1_n_4 ),
        .Q(frame_count_reg[19]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[1] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[0]_i_2_n_6 ),
        .Q(frame_count_reg[1]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[20] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[20]_i_1_n_7 ),
        .Q(frame_count_reg[20]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[20]_i_1 
       (.CI(\frame_count_reg[16]_i_1_n_0 ),
        .CO({\frame_count_reg[20]_i_1_n_0 ,\frame_count_reg[20]_i_1_n_1 ,\frame_count_reg[20]_i_1_n_2 ,\frame_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[20]_i_1_n_4 ,\frame_count_reg[20]_i_1_n_5 ,\frame_count_reg[20]_i_1_n_6 ,\frame_count_reg[20]_i_1_n_7 }),
        .S(frame_count_reg[23:20]));
  FDRE \frame_count_reg[21] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[20]_i_1_n_6 ),
        .Q(frame_count_reg[21]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[22] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[20]_i_1_n_5 ),
        .Q(frame_count_reg[22]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[23] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[20]_i_1_n_4 ),
        .Q(frame_count_reg[23]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[24] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[24]_i_1_n_7 ),
        .Q(frame_count_reg[24]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[24]_i_1 
       (.CI(\frame_count_reg[20]_i_1_n_0 ),
        .CO({\frame_count_reg[24]_i_1_n_0 ,\frame_count_reg[24]_i_1_n_1 ,\frame_count_reg[24]_i_1_n_2 ,\frame_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[24]_i_1_n_4 ,\frame_count_reg[24]_i_1_n_5 ,\frame_count_reg[24]_i_1_n_6 ,\frame_count_reg[24]_i_1_n_7 }),
        .S(frame_count_reg[27:24]));
  FDRE \frame_count_reg[25] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[24]_i_1_n_6 ),
        .Q(frame_count_reg[25]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[26] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[24]_i_1_n_5 ),
        .Q(frame_count_reg[26]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[27] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[24]_i_1_n_4 ),
        .Q(frame_count_reg[27]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[28] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[28]_i_1_n_7 ),
        .Q(frame_count_reg[28]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[28]_i_1 
       (.CI(\frame_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_frame_count_reg[28]_i_1_CO_UNCONNECTED [3],\frame_count_reg[28]_i_1_n_1 ,\frame_count_reg[28]_i_1_n_2 ,\frame_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[28]_i_1_n_4 ,\frame_count_reg[28]_i_1_n_5 ,\frame_count_reg[28]_i_1_n_6 ,\frame_count_reg[28]_i_1_n_7 }),
        .S(frame_count_reg[31:28]));
  FDRE \frame_count_reg[29] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[28]_i_1_n_6 ),
        .Q(frame_count_reg[29]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[2] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[0]_i_2_n_5 ),
        .Q(frame_count_reg[2]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[30] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[28]_i_1_n_5 ),
        .Q(frame_count_reg[30]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[31] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[28]_i_1_n_4 ),
        .Q(frame_count_reg[31]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[3] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[0]_i_2_n_4 ),
        .Q(frame_count_reg[3]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[4] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[4]_i_1_n_7 ),
        .Q(frame_count_reg[4]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[4]_i_1 
       (.CI(\frame_count_reg[0]_i_2_n_0 ),
        .CO({\frame_count_reg[4]_i_1_n_0 ,\frame_count_reg[4]_i_1_n_1 ,\frame_count_reg[4]_i_1_n_2 ,\frame_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[4]_i_1_n_4 ,\frame_count_reg[4]_i_1_n_5 ,\frame_count_reg[4]_i_1_n_6 ,\frame_count_reg[4]_i_1_n_7 }),
        .S(frame_count_reg[7:4]));
  FDRE \frame_count_reg[5] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[4]_i_1_n_6 ),
        .Q(frame_count_reg[5]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[6] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[4]_i_1_n_5 ),
        .Q(frame_count_reg[6]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[7] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[4]_i_1_n_4 ),
        .Q(frame_count_reg[7]),
        .R(u_pulse_n_0));
  FDRE \frame_count_reg[8] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[8]_i_1_n_7 ),
        .Q(frame_count_reg[8]),
        .R(u_pulse_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \frame_count_reg[8]_i_1 
       (.CI(\frame_count_reg[4]_i_1_n_0 ),
        .CO({\frame_count_reg[8]_i_1_n_0 ,\frame_count_reg[8]_i_1_n_1 ,\frame_count_reg[8]_i_1_n_2 ,\frame_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\frame_count_reg[8]_i_1_n_4 ,\frame_count_reg[8]_i_1_n_5 ,\frame_count_reg[8]_i_1_n_6 ,\frame_count_reg[8]_i_1_n_7 }),
        .S(frame_count_reg[11:8]));
  FDRE \frame_count_reg[9] 
       (.C(aclk),
        .CE(frame_count0),
        .D(\frame_count_reg[8]_i_1_n_6 ),
        .Q(frame_count_reg[9]),
        .R(u_pulse_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \hb[0]_i_2 
       (.I0(\hb_reg_n_0_[0] ),
        .O(\hb[0]_i_2_n_0 ));
  FDRE \hb_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[0]_i_1_n_7 ),
        .Q(\hb_reg_n_0_[0] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\hb_reg[0]_i_1_n_0 ,\hb_reg[0]_i_1_n_1 ,\hb_reg[0]_i_1_n_2 ,\hb_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\hb_reg[0]_i_1_n_4 ,\hb_reg[0]_i_1_n_5 ,\hb_reg[0]_i_1_n_6 ,\hb_reg[0]_i_1_n_7 }),
        .S({\hb_reg_n_0_[3] ,\hb_reg_n_0_[2] ,\hb_reg_n_0_[1] ,\hb[0]_i_2_n_0 }));
  FDRE \hb_reg[10] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[8]_i_1_n_5 ),
        .Q(\hb_reg_n_0_[10] ),
        .R(clear));
  FDRE \hb_reg[11] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[8]_i_1_n_4 ),
        .Q(\hb_reg_n_0_[11] ),
        .R(clear));
  FDRE \hb_reg[12] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[12]_i_1_n_7 ),
        .Q(\hb_reg_n_0_[12] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[12]_i_1 
       (.CI(\hb_reg[8]_i_1_n_0 ),
        .CO({\hb_reg[12]_i_1_n_0 ,\hb_reg[12]_i_1_n_1 ,\hb_reg[12]_i_1_n_2 ,\hb_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hb_reg[12]_i_1_n_4 ,\hb_reg[12]_i_1_n_5 ,\hb_reg[12]_i_1_n_6 ,\hb_reg[12]_i_1_n_7 }),
        .S({\hb_reg_n_0_[15] ,\hb_reg_n_0_[14] ,\hb_reg_n_0_[13] ,\hb_reg_n_0_[12] }));
  FDRE \hb_reg[13] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[12]_i_1_n_6 ),
        .Q(\hb_reg_n_0_[13] ),
        .R(clear));
  FDRE \hb_reg[14] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[12]_i_1_n_5 ),
        .Q(\hb_reg_n_0_[14] ),
        .R(clear));
  FDRE \hb_reg[15] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[12]_i_1_n_4 ),
        .Q(\hb_reg_n_0_[15] ),
        .R(clear));
  FDRE \hb_reg[16] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[16]_i_1_n_7 ),
        .Q(\hb_reg_n_0_[16] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[16]_i_1 
       (.CI(\hb_reg[12]_i_1_n_0 ),
        .CO({\hb_reg[16]_i_1_n_0 ,\hb_reg[16]_i_1_n_1 ,\hb_reg[16]_i_1_n_2 ,\hb_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hb_reg[16]_i_1_n_4 ,\hb_reg[16]_i_1_n_5 ,\hb_reg[16]_i_1_n_6 ,\hb_reg[16]_i_1_n_7 }),
        .S({\hb_reg_n_0_[19] ,\hb_reg_n_0_[18] ,\hb_reg_n_0_[17] ,\hb_reg_n_0_[16] }));
  FDRE \hb_reg[17] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[16]_i_1_n_6 ),
        .Q(\hb_reg_n_0_[17] ),
        .R(clear));
  FDRE \hb_reg[18] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[16]_i_1_n_5 ),
        .Q(\hb_reg_n_0_[18] ),
        .R(clear));
  FDRE \hb_reg[19] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[16]_i_1_n_4 ),
        .Q(\hb_reg_n_0_[19] ),
        .R(clear));
  FDRE \hb_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[0]_i_1_n_6 ),
        .Q(\hb_reg_n_0_[1] ),
        .R(clear));
  FDRE \hb_reg[20] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[20]_i_1_n_7 ),
        .Q(\hb_reg_n_0_[20] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[20]_i_1 
       (.CI(\hb_reg[16]_i_1_n_0 ),
        .CO({\hb_reg[20]_i_1_n_0 ,\hb_reg[20]_i_1_n_1 ,\hb_reg[20]_i_1_n_2 ,\hb_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hb_reg[20]_i_1_n_4 ,\hb_reg[20]_i_1_n_5 ,\hb_reg[20]_i_1_n_6 ,\hb_reg[20]_i_1_n_7 }),
        .S({\hb_reg_n_0_[23] ,\hb_reg_n_0_[22] ,\hb_reg_n_0_[21] ,\hb_reg_n_0_[20] }));
  FDRE \hb_reg[21] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[20]_i_1_n_6 ),
        .Q(\hb_reg_n_0_[21] ),
        .R(clear));
  FDRE \hb_reg[22] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[20]_i_1_n_5 ),
        .Q(\hb_reg_n_0_[22] ),
        .R(clear));
  FDRE \hb_reg[23] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[20]_i_1_n_4 ),
        .Q(\hb_reg_n_0_[23] ),
        .R(clear));
  FDRE \hb_reg[24] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[24]_i_1_n_7 ),
        .Q(leds),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[24]_i_1 
       (.CI(\hb_reg[20]_i_1_n_0 ),
        .CO(\NLW_hb_reg[24]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_hb_reg[24]_i_1_O_UNCONNECTED [3:1],\hb_reg[24]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,leds}));
  FDRE \hb_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[0]_i_1_n_5 ),
        .Q(\hb_reg_n_0_[2] ),
        .R(clear));
  FDRE \hb_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[0]_i_1_n_4 ),
        .Q(\hb_reg_n_0_[3] ),
        .R(clear));
  FDRE \hb_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[4]_i_1_n_7 ),
        .Q(\hb_reg_n_0_[4] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[4]_i_1 
       (.CI(\hb_reg[0]_i_1_n_0 ),
        .CO({\hb_reg[4]_i_1_n_0 ,\hb_reg[4]_i_1_n_1 ,\hb_reg[4]_i_1_n_2 ,\hb_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hb_reg[4]_i_1_n_4 ,\hb_reg[4]_i_1_n_5 ,\hb_reg[4]_i_1_n_6 ,\hb_reg[4]_i_1_n_7 }),
        .S({\hb_reg_n_0_[7] ,\hb_reg_n_0_[6] ,\hb_reg_n_0_[5] ,\hb_reg_n_0_[4] }));
  FDRE \hb_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[4]_i_1_n_6 ),
        .Q(\hb_reg_n_0_[5] ),
        .R(clear));
  FDRE \hb_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[4]_i_1_n_5 ),
        .Q(\hb_reg_n_0_[6] ),
        .R(clear));
  FDRE \hb_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[4]_i_1_n_4 ),
        .Q(\hb_reg_n_0_[7] ),
        .R(clear));
  FDRE \hb_reg[8] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[8]_i_1_n_7 ),
        .Q(\hb_reg_n_0_[8] ),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \hb_reg[8]_i_1 
       (.CI(\hb_reg[4]_i_1_n_0 ),
        .CO({\hb_reg[8]_i_1_n_0 ,\hb_reg[8]_i_1_n_1 ,\hb_reg[8]_i_1_n_2 ,\hb_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\hb_reg[8]_i_1_n_4 ,\hb_reg[8]_i_1_n_5 ,\hb_reg[8]_i_1_n_6 ,\hb_reg[8]_i_1_n_7 }),
        .S({\hb_reg_n_0_[11] ,\hb_reg_n_0_[10] ,\hb_reg_n_0_[9] ,\hb_reg_n_0_[8] }));
  FDRE \hb_reg[9] 
       (.C(aclk),
        .CE(1'b1),
        .D(\hb_reg[8]_i_1_n_6 ),
        .Q(\hb_reg_n_0_[9] ),
        .R(clear));
  FDRE peak_valid_d_reg
       (.C(aclk),
        .CE(1'b1),
        .D(u_peak_n_2),
        .Q(peak_valid_d),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hA2)) 
    s_axi_arready0
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid),
        .I2(s_axi_rready),
        .O(s_axi_arready0__0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) 
  FDRE s_axi_arready_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axi_arready0__0),
        .Q(s_axi_arready),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h8A000000)) 
    s_axi_awready_i_1
       (.I0(aresetn),
        .I1(s_axi_bready),
        .I2(s_axi_bvalid_reg_0),
        .I3(s_axi_awvalid),
        .I4(s_axi_wvalid),
        .O(s_axi_awready_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) 
  FDRE s_axi_awready_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axi_awready_i_1_n_0),
        .Q(s_axi_awready),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hF444)) 
    s_axi_bvalid_i_2
       (.I0(s_axi_bready),
        .I1(s_axi_bvalid_reg_0),
        .I2(s_axi_awvalid),
        .I3(s_axi_wvalid),
        .O(s_axi_bvalid_i_2_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) 
  FDRE s_axi_bvalid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axi_bvalid_i_2_n_0),
        .Q(s_axi_bvalid_reg_0),
        .R(clear));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0AC0000)) 
    \s_axi_rdata[0]_i_3 
       (.I0(scratch[0]),
        .I1(frame_count_reg[0]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(\s_axi_rdata[3]_i_6_n_0 ),
        .I5(\s_axi_rdata[31]_i_4_n_0 ),
        .O(\s_axi_rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[10]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[10]),
        .I5(scratch[10]),
        .O(\s_axi_rdata[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[11]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[11]),
        .I5(scratch[11]),
        .O(\s_axi_rdata[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[12]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[12]),
        .I5(scratch[12]),
        .O(\s_axi_rdata[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[13]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[13]),
        .I5(scratch[13]),
        .O(\s_axi_rdata[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0888008808800080)) 
    \s_axi_rdata[14]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(scratch[14]),
        .I5(frame_count_reg[14]),
        .O(\s_axi_rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[15]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[15]),
        .I5(scratch[15]),
        .O(\s_axi_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[16]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[16]),
        .I5(scratch[16]),
        .O(\s_axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888088000)) 
    \s_axi_rdata[18]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(scratch[18]),
        .I4(frame_count_reg[18]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[19]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[19]),
        .I5(scratch[19]),
        .O(\s_axi_rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFAEE0000)) 
    \s_axi_rdata[1]_i_3 
       (.I0(s_axi_araddr[0]),
        .I1(frame_count_reg[1]),
        .I2(scratch[1]),
        .I3(s_axi_araddr[1]),
        .I4(\s_axi_rdata[3]_i_6_n_0 ),
        .I5(\s_axi_rdata[31]_i_4_n_0 ),
        .O(\s_axi_rdata[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[21]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[21]),
        .I5(scratch[21]),
        .O(\s_axi_rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0888008808800080)) 
    \s_axi_rdata[22]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(scratch[22]),
        .I5(frame_count_reg[22]),
        .O(\s_axi_rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[23]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[23]),
        .I5(scratch[23]),
        .O(\s_axi_rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888088000)) 
    \s_axi_rdata[25]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(scratch[25]),
        .I4(frame_count_reg[25]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[26]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[26]),
        .I5(scratch[26]),
        .O(\s_axi_rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[27]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[27]),
        .I5(scratch[27]),
        .O(\s_axi_rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888088000)) 
    \s_axi_rdata[28]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(scratch[28]),
        .I4(frame_count_reg[28]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0AC0000)) 
    \s_axi_rdata[2]_i_3 
       (.I0(scratch[2]),
        .I1(frame_count_reg[2]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(\s_axi_rdata[3]_i_6_n_0 ),
        .I5(\s_axi_rdata[31]_i_4_n_0 ),
        .O(\s_axi_rdata[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888088000)) 
    \s_axi_rdata[30]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(scratch[30]),
        .I4(frame_count_reg[30]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[31]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[31]),
        .I5(scratch[31]),
        .O(\s_axi_rdata[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \s_axi_rdata[31]_i_3 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[1]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[3]),
        .O(\s_axi_rdata[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \s_axi_rdata[31]_i_4 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_araddr[4]),
        .O(\s_axi_rdata[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[31]_i_7 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .O(\s_axi_rdata[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \s_axi_rdata[31]_i_8 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .O(\s_axi_rdata[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0AC0000)) 
    \s_axi_rdata[3]_i_3 
       (.I0(scratch[3]),
        .I1(frame_count_reg[3]),
        .I2(s_axi_araddr[1]),
        .I3(s_axi_araddr[0]),
        .I4(\s_axi_rdata[3]_i_6_n_0 ),
        .I5(\s_axi_rdata[31]_i_4_n_0 ),
        .O(\s_axi_rdata[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_axi_rdata[3]_i_6 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_araddr[2]),
        .O(\s_axi_rdata[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0888008808800080)) 
    \s_axi_rdata[4]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(scratch[4]),
        .I5(frame_count_reg[4]),
        .O(\s_axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[5]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[5]),
        .I5(scratch[5]),
        .O(\s_axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888088000)) 
    \s_axi_rdata[6]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[1]),
        .I3(scratch[6]),
        .I4(frame_count_reg[6]),
        .I5(s_axi_araddr[0]),
        .O(\s_axi_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[7]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[7]),
        .I5(scratch[7]),
        .O(\s_axi_rdata[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0888008808800080)) 
    \s_axi_rdata[8]_i_2 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(scratch[8]),
        .I5(frame_count_reg[8]),
        .O(\s_axi_rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8808880080088000)) 
    \s_axi_rdata[9]_i_4 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_araddr[3]),
        .I2(s_axi_araddr[0]),
        .I3(s_axi_araddr[1]),
        .I4(frame_count_reg[9]),
        .I5(scratch[9]),
        .O(\s_axi_rdata[9]_i_4_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[0] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_15),
        .Q(s_axi_rdata[0]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[10] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_9),
        .Q(s_axi_rdata[10]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[11] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_8),
        .Q(s_axi_rdata[11]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[12] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_7),
        .Q(s_axi_rdata[12]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[13] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_6),
        .Q(s_axi_rdata[13]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[14] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_20),
        .Q(s_axi_rdata[14]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[15] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_5),
        .Q(s_axi_rdata[15]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[16] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_19),
        .Q(s_axi_rdata[16]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[17] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_18),
        .Q(s_axi_rdata[17]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[18] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_17),
        .Q(s_axi_rdata[18]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[19] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_16),
        .Q(s_axi_rdata[19]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[1] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_24),
        .Q(s_axi_rdata[1]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[20] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_15),
        .Q(s_axi_rdata[20]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[21] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_14),
        .Q(s_axi_rdata[21]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[22] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_4),
        .Q(s_axi_rdata[22]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[23] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_13),
        .Q(s_axi_rdata[23]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[24] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_12),
        .Q(s_axi_rdata[24]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[25] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_11),
        .Q(s_axi_rdata[25]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[26] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_10),
        .Q(s_axi_rdata[26]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[27] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_9),
        .Q(s_axi_rdata[27]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[28] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_8),
        .Q(s_axi_rdata[28]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[29] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_7),
        .Q(s_axi_rdata[29]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[2] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_23),
        .Q(s_axi_rdata[2]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[30] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_6),
        .Q(s_axi_rdata[30]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[31] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_5),
        .Q(s_axi_rdata[31]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[3] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_14),
        .Q(s_axi_rdata[3]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[4] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_22),
        .Q(s_axi_rdata[4]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[5] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_13),
        .Q(s_axi_rdata[5]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[6] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_12),
        .Q(s_axi_rdata[6]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[7] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_11),
        .Q(s_axi_rdata[7]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[8] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_pulse_n_21),
        .Q(s_axi_rdata[8]),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) 
  FDRE \s_axi_rdata_reg[9] 
       (.C(aclk),
        .CE(s_axi_arready0__0),
        .D(u_peak_n_10),
        .Q(s_axi_rdata[9]),
        .R(clear));
  LUT3 #(
    .INIT(8'hBA)) 
    s_axi_rvalid_i_1
       (.I0(s_axi_arvalid),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid),
        .O(s_axi_rvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) 
  FDRE s_axi_rvalid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axi_rvalid_i_1_n_0),
        .Q(s_axi_rvalid),
        .R(clear));
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE s_axi_wready_reg
       (.C(aclk),
        .CE(1'b1),
        .D(s_axi_awready_i_1_n_0),
        .Q(s_axi_wready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \scratch[15]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_axi_awaddr[2]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(enable_i_3_n_0),
        .I5(s_axi_wstrb[1]),
        .O(\scratch[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \scratch[23]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_axi_awaddr[2]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(enable_i_3_n_0),
        .I5(s_axi_wstrb[2]),
        .O(\scratch[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \scratch[31]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_axi_awaddr[2]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(enable_i_3_n_0),
        .I5(s_axi_wstrb[3]),
        .O(\scratch[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \scratch[7]_i_1 
       (.I0(s_axi_awaddr[3]),
        .I1(s_axi_awaddr[2]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(enable_i_3_n_0),
        .I5(s_axi_wstrb[0]),
        .O(\scratch[7]_i_1_n_0 ));
  FDSE \scratch_reg[0] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[0]),
        .Q(scratch[0]),
        .S(clear));
  FDRE \scratch_reg[10] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[10]),
        .Q(scratch[10]),
        .R(clear));
  FDRE \scratch_reg[11] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[11]),
        .Q(scratch[11]),
        .R(clear));
  FDRE \scratch_reg[12] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[12]),
        .Q(scratch[12]),
        .R(clear));
  FDRE \scratch_reg[13] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[13]),
        .Q(scratch[13]),
        .R(clear));
  FDRE \scratch_reg[14] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[14]),
        .Q(scratch[14]),
        .R(clear));
  FDRE \scratch_reg[15] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[15]),
        .Q(scratch[15]),
        .R(clear));
  FDSE \scratch_reg[16] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[16]),
        .Q(scratch[16]),
        .S(clear));
  FDRE \scratch_reg[17] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[17]),
        .Q(scratch[17]),
        .R(clear));
  FDSE \scratch_reg[18] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[18]),
        .Q(scratch[18]),
        .S(clear));
  FDRE \scratch_reg[19] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[19]),
        .Q(scratch[19]),
        .R(clear));
  FDRE \scratch_reg[1] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[1]),
        .Q(scratch[1]),
        .R(clear));
  FDRE \scratch_reg[20] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[20]),
        .Q(scratch[20]),
        .R(clear));
  FDSE \scratch_reg[21] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[21]),
        .Q(scratch[21]),
        .S(clear));
  FDRE \scratch_reg[22] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[22]),
        .Q(scratch[22]),
        .R(clear));
  FDSE \scratch_reg[23] 
       (.C(aclk),
        .CE(\scratch[23]_i_1_n_0 ),
        .D(s_axi_wdata[23]),
        .Q(scratch[23]),
        .S(clear));
  FDSE \scratch_reg[24] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[24]),
        .Q(scratch[24]),
        .S(clear));
  FDRE \scratch_reg[25] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[25]),
        .Q(scratch[25]),
        .R(clear));
  FDSE \scratch_reg[26] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[26]),
        .Q(scratch[26]),
        .S(clear));
  FDRE \scratch_reg[27] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[27]),
        .Q(scratch[27]),
        .R(clear));
  FDRE \scratch_reg[28] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[28]),
        .Q(scratch[28]),
        .R(clear));
  FDSE \scratch_reg[29] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[29]),
        .Q(scratch[29]),
        .S(clear));
  FDRE \scratch_reg[2] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[2]),
        .Q(scratch[2]),
        .R(clear));
  FDRE \scratch_reg[30] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[30]),
        .Q(scratch[30]),
        .R(clear));
  FDSE \scratch_reg[31] 
       (.C(aclk),
        .CE(\scratch[31]_i_1_n_0 ),
        .D(s_axi_wdata[31]),
        .Q(scratch[31]),
        .S(clear));
  FDRE \scratch_reg[3] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[3]),
        .Q(scratch[3]),
        .R(clear));
  FDRE \scratch_reg[4] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[4]),
        .Q(scratch[4]),
        .R(clear));
  FDRE \scratch_reg[5] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[5]),
        .Q(scratch[5]),
        .R(clear));
  FDRE \scratch_reg[6] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[6]),
        .Q(scratch[6]),
        .R(clear));
  FDRE \scratch_reg[7] 
       (.C(aclk),
        .CE(\scratch[7]_i_1_n_0 ),
        .D(s_axi_wdata[7]),
        .Q(scratch[7]),
        .R(clear));
  FDRE \scratch_reg[8] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[8]),
        .Q(scratch[8]),
        .R(clear));
  FDRE \scratch_reg[9] 
       (.C(aclk),
        .CE(\scratch[15]_i_1_n_0 ),
        .D(s_axi_wdata[9]),
        .Q(scratch[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    soft_reset_r_i_1
       (.I0(enable_i_2_n_0),
        .I1(s_axi_wdata[1]),
        .I2(s_axi_wstrb[0]),
        .I3(s_axi_awaddr[4]),
        .I4(s_axi_awaddr[5]),
        .I5(s_axi_awready_i_1_n_0),
        .O(soft_reset_r_i_1_n_0));
  FDRE soft_reset_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(soft_reset_r_i_1_n_0),
        .Q(soft_reset_r_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \threshold[15]_i_1 
       (.I0(enable_i_3_n_0),
        .I1(s_axi_awaddr[3]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(s_axi_awaddr[2]),
        .I5(s_axi_wstrb[1]),
        .O(\threshold[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \threshold[23]_i_1 
       (.I0(enable_i_3_n_0),
        .I1(s_axi_awaddr[3]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(s_axi_awaddr[2]),
        .I5(s_axi_wstrb[2]),
        .O(\threshold[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \threshold[31]_i_1 
       (.I0(enable_i_3_n_0),
        .I1(s_axi_awaddr[3]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(s_axi_awaddr[2]),
        .I5(s_axi_wstrb[3]),
        .O(\threshold[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \threshold[7]_i_1 
       (.I0(enable_i_3_n_0),
        .I1(s_axi_awaddr[3]),
        .I2(s_axi_awaddr[0]),
        .I3(s_axi_awaddr[1]),
        .I4(s_axi_awaddr[2]),
        .I5(s_axi_wstrb[0]),
        .O(\threshold[7]_i_1_n_0 ));
  FDRE \threshold_reg[0] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[0]),
        .Q(threshold[0]),
        .R(clear));
  FDRE \threshold_reg[10] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[10]),
        .Q(threshold[10]),
        .R(clear));
  FDRE \threshold_reg[11] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[11]),
        .Q(threshold[11]),
        .R(clear));
  FDRE \threshold_reg[12] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[12]),
        .Q(threshold[12]),
        .R(clear));
  FDRE \threshold_reg[13] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[13]),
        .Q(threshold[13]),
        .R(clear));
  FDSE \threshold_reg[14] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[14]),
        .Q(threshold[14]),
        .S(clear));
  FDRE \threshold_reg[15] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[15]),
        .Q(threshold[15]),
        .R(clear));
  FDSE \threshold_reg[16] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[16]),
        .Q(threshold[16]),
        .S(clear));
  FDSE \threshold_reg[17] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[17]),
        .Q(threshold[17]),
        .S(clear));
  FDSE \threshold_reg[18] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[18]),
        .Q(threshold[18]),
        .S(clear));
  FDSE \threshold_reg[19] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[19]),
        .Q(threshold[19]),
        .S(clear));
  FDRE \threshold_reg[1] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[1]),
        .Q(threshold[1]),
        .R(clear));
  FDRE \threshold_reg[20] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[20]),
        .Q(threshold[20]),
        .R(clear));
  FDRE \threshold_reg[21] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[21]),
        .Q(threshold[21]),
        .R(clear));
  FDRE \threshold_reg[22] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[22]),
        .Q(threshold[22]),
        .R(clear));
  FDRE \threshold_reg[23] 
       (.C(aclk),
        .CE(\threshold[23]_i_1_n_0 ),
        .D(s_axi_wdata[23]),
        .Q(threshold[23]),
        .R(clear));
  FDRE \threshold_reg[24] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[24]),
        .Q(threshold[24]),
        .R(clear));
  FDRE \threshold_reg[25] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[25]),
        .Q(threshold[25]),
        .R(clear));
  FDRE \threshold_reg[26] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[26]),
        .Q(threshold[26]),
        .R(clear));
  FDRE \threshold_reg[27] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[27]),
        .Q(threshold[27]),
        .R(clear));
  FDRE \threshold_reg[28] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[28]),
        .Q(threshold[28]),
        .R(clear));
  FDRE \threshold_reg[29] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[29]),
        .Q(threshold[29]),
        .R(clear));
  FDRE \threshold_reg[2] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[2]),
        .Q(threshold[2]),
        .R(clear));
  FDRE \threshold_reg[30] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[30]),
        .Q(threshold[30]),
        .R(clear));
  FDRE \threshold_reg[31] 
       (.C(aclk),
        .CE(\threshold[31]_i_1_n_0 ),
        .D(s_axi_wdata[31]),
        .Q(threshold[31]),
        .R(clear));
  FDRE \threshold_reg[3] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[3]),
        .Q(threshold[3]),
        .R(clear));
  FDRE \threshold_reg[4] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[4]),
        .Q(threshold[4]),
        .R(clear));
  FDRE \threshold_reg[5] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[5]),
        .Q(threshold[5]),
        .R(clear));
  FDSE \threshold_reg[6] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[6]),
        .Q(threshold[6]),
        .S(clear));
  FDRE \threshold_reg[7] 
       (.C(aclk),
        .CE(\threshold[7]_i_1_n_0 ),
        .D(s_axi_wdata[7]),
        .Q(threshold[7]),
        .R(clear));
  FDRE \threshold_reg[8] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[8]),
        .Q(threshold[8]),
        .R(clear));
  FDSE \threshold_reg[9] 
       (.C(aclk),
        .CE(\threshold[15]_i_1_n_0 ),
        .D(s_axi_wdata[9]),
        .Q(threshold[9]),
        .S(clear));
  radar_system_radar_core_0_0_fft_config_master u_fft_cfg
       (.aclk(aclk),
        .aresetn(aresetn),
        .clear(clear),
        .kicked_reg_0(config_kick_reg_n_0),
        .m_axis_fft_config_tready(m_axis_fft_config_tready),
        .m_axis_fft_config_tvalid(m_axis_fft_config_tvalid));
  radar_system_radar_core_0_0_axis_peak_detect u_peak
       (.D({u_peak_n_4,u_peak_n_5,u_peak_n_6,u_peak_n_7,u_peak_n_8,u_peak_n_9,u_peak_n_10,u_peak_n_11,u_peak_n_12,u_peak_n_13,u_peak_n_14,u_peak_n_15}),
        .Q({threshold[22],threshold[15:5],threshold[3],threshold[0]}),
        .aclk(aclk),
        .aresetn(aresetn),
        .\bins_seen_reg[15]_0 (bins_seen),
        .clear(clear),
        .frame_count0(frame_count0),
        .\peak_mag2_reg[1]_0 (u_peak_n_16),
        .\peak_mag2_reg[2]_0 (u_peak_n_17),
        .\peak_mag2_reg[4]_0 (u_peak_n_18),
        .peak_valid_d(peak_valid_d),
        .peak_valid_d_reg(u_peak_n_2),
        .peak_valid_d_reg_0(u_pulse_n_0),
        .peak_valid_reg_0(peak_valid_reg),
        .pw_samples(pw_samples),
        .re2_pipe_reg_0(enable_reg_0),
        .s_axi_araddr(s_axi_araddr[3:0]),
        .\s_axi_araddr[2]_0 (u_peak_n_22),
        .\s_axi_araddr[2]_1 (u_peak_n_23),
        .\s_axi_araddr[2]_10 (u_peak_n_32),
        .\s_axi_araddr[2]_11 (u_peak_n_33),
        .\s_axi_araddr[2]_12 (u_peak_n_34),
        .\s_axi_araddr[2]_13 (u_peak_n_35),
        .\s_axi_araddr[2]_2 (u_peak_n_24),
        .\s_axi_araddr[2]_3 (u_peak_n_25),
        .\s_axi_araddr[2]_4 (u_peak_n_26),
        .\s_axi_araddr[2]_5 (u_peak_n_27),
        .\s_axi_araddr[2]_6 (u_peak_n_28),
        .\s_axi_araddr[2]_7 (u_peak_n_29),
        .\s_axi_araddr[2]_8 (u_peak_n_30),
        .\s_axi_araddr[2]_9 (u_peak_n_31),
        .\s_axi_araddr[3]_0 (u_peak_n_20),
        .s_axi_araddr_2_sp_1(u_peak_n_21),
        .s_axi_araddr_3_sp_1(u_peak_n_19),
        .\s_axi_rdata_reg[0] (\s_axi_rdata[0]_i_3_n_0 ),
        .\s_axi_rdata_reg[0]_0 (u_pulse_n_4),
        .\s_axi_rdata_reg[10] (u_pulse_n_30),
        .\s_axi_rdata_reg[10]_0 (\s_axi_rdata[10]_i_4_n_0 ),
        .\s_axi_rdata_reg[11] (u_pulse_n_31),
        .\s_axi_rdata_reg[11]_0 (\s_axi_rdata[11]_i_4_n_0 ),
        .\s_axi_rdata_reg[12] (u_pulse_n_32),
        .\s_axi_rdata_reg[12]_0 (\s_axi_rdata[12]_i_4_n_0 ),
        .\s_axi_rdata_reg[13] (u_pulse_n_33),
        .\s_axi_rdata_reg[13]_0 (\s_axi_rdata[13]_i_4_n_0 ),
        .\s_axi_rdata_reg[15] ({fft_size[15:5],fft_size[3],fft_size[0]}),
        .\s_axi_rdata_reg[15]_0 (u_pulse_n_34),
        .\s_axi_rdata_reg[15]_1 (\s_axi_rdata[15]_i_4_n_0 ),
        .\s_axi_rdata_reg[16] (\s_axi_rdata[31]_i_8_n_0 ),
        .\s_axi_rdata_reg[22] (\s_axi_rdata[22]_i_2_n_0 ),
        .\s_axi_rdata_reg[22]_0 (\s_axi_rdata[31]_i_3_n_0 ),
        .\s_axi_rdata_reg[22]_1 (u_pulse_n_35),
        .\s_axi_rdata_reg[3] (\s_axi_rdata[3]_i_3_n_0 ),
        .\s_axi_rdata_reg[3]_0 (u_pulse_n_25),
        .\s_axi_rdata_reg[5] (u_pulse_n_26),
        .\s_axi_rdata_reg[5]_0 (\s_axi_rdata[31]_i_4_n_0 ),
        .\s_axi_rdata_reg[5]_1 (\s_axi_rdata[5]_i_4_n_0 ),
        .\s_axi_rdata_reg[6] (u_pulse_n_27),
        .\s_axi_rdata_reg[6]_0 (\s_axi_rdata[6]_i_4_n_0 ),
        .\s_axi_rdata_reg[7] (u_pulse_n_28),
        .\s_axi_rdata_reg[7]_0 (\s_axi_rdata[7]_i_4_n_0 ),
        .\s_axi_rdata_reg[9] (u_pulse_n_29),
        .\s_axi_rdata_reg[9]_0 (\s_axi_rdata[9]_i_4_n_0 ),
        .s_axis_fft_tdata(s_axis_fft_tdata),
        .s_axis_fft_tlast(s_axis_fft_tlast),
        .s_axis_fft_tvalid(s_axis_fft_tvalid));
  radar_system_radar_core_0_0_axis_pulse_detect u_pulse
       (.D({u_pulse_n_5,u_pulse_n_6,u_pulse_n_7,u_pulse_n_8,u_pulse_n_9,u_pulse_n_10,u_pulse_n_11,u_pulse_n_12,u_pulse_n_13,u_pulse_n_14,u_pulse_n_15,u_pulse_n_16,u_pulse_n_17,u_pulse_n_18,u_pulse_n_19,u_pulse_n_20,u_pulse_n_21,u_pulse_n_22,u_pulse_n_23,u_pulse_n_24}),
        .E(u_window_n_15),
        .Q(threshold),
        .SR(u_window_n_13),
        .aclk(aclk),
        .aresetn(aresetn),
        .frame_count_reg({frame_count_reg[29],frame_count_reg[24],frame_count_reg[20],frame_count_reg[17]}),
        .have_rise(have_rise),
        .in_pulse012_out(in_pulse012_out),
        .in_pulse_reg_0(in_pulse_reg),
        .m_axis_fft_tready(m_axis_fft_tready),
        .p_4_in(p_4_in),
        .\pri_samples_reg[0]_0 (enable_reg_0),
        .\pri_samples_reg[0]_1 (m_tvalid_reg),
        .\pulse_count_reg[0]_0 (u_pulse_n_4),
        .\pulse_count_reg[10]_0 (u_pulse_n_30),
        .\pulse_count_reg[11]_0 (u_pulse_n_31),
        .\pulse_count_reg[12]_0 (u_pulse_n_32),
        .\pulse_count_reg[13]_0 (u_pulse_n_33),
        .\pulse_count_reg[15]_0 (u_pulse_n_34),
        .\pulse_count_reg[31]_0 (soft_reset_r_reg_n_0),
        .\pulse_count_reg[3]_0 (u_pulse_n_25),
        .\pulse_count_reg[5]_0 (u_pulse_n_26),
        .\pulse_count_reg[6]_0 (u_pulse_n_27),
        .\pulse_count_reg[7]_0 (u_pulse_n_28),
        .\pulse_count_reg[9]_0 (u_pulse_n_29),
        .pw_samples(pw_samples),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_araddr_2_sp_1(u_pulse_n_35),
        .\s_axi_rdata[4]_i_2_0 ({fft_size[4],fft_size[2:1]}),
        .\s_axi_rdata_reg[14] (\s_axi_rdata[14]_i_2_n_0 ),
        .\s_axi_rdata_reg[14]_0 (u_peak_n_20),
        .\s_axi_rdata_reg[15] (bins_seen),
        .\s_axi_rdata_reg[16] (\s_axi_rdata[16]_i_2_n_0 ),
        .\s_axi_rdata_reg[16]_0 (\s_axi_rdata[31]_i_3_n_0 ),
        .\s_axi_rdata_reg[16]_1 (u_peak_n_21),
        .\s_axi_rdata_reg[16]_2 (\s_axi_rdata[31]_i_7_n_0 ),
        .\s_axi_rdata_reg[17] (u_peak_n_22),
        .\s_axi_rdata_reg[18] (\s_axi_rdata[18]_i_2_n_0 ),
        .\s_axi_rdata_reg[18]_0 (u_peak_n_23),
        .\s_axi_rdata_reg[19] (\s_axi_rdata[19]_i_2_n_0 ),
        .\s_axi_rdata_reg[19]_0 (u_peak_n_24),
        .\s_axi_rdata_reg[1] (u_peak_n_16),
        .\s_axi_rdata_reg[1]_0 (\s_axi_rdata[1]_i_3_n_0 ),
        .\s_axi_rdata_reg[20] (u_peak_n_25),
        .\s_axi_rdata_reg[21] (\s_axi_rdata[21]_i_2_n_0 ),
        .\s_axi_rdata_reg[21]_0 (u_peak_n_26),
        .\s_axi_rdata_reg[23] (\s_axi_rdata[23]_i_2_n_0 ),
        .\s_axi_rdata_reg[23]_0 (u_peak_n_27),
        .\s_axi_rdata_reg[24] (u_peak_n_28),
        .\s_axi_rdata_reg[25] (\s_axi_rdata[25]_i_2_n_0 ),
        .\s_axi_rdata_reg[25]_0 (u_peak_n_29),
        .\s_axi_rdata_reg[26] (\s_axi_rdata[26]_i_2_n_0 ),
        .\s_axi_rdata_reg[26]_0 (u_peak_n_30),
        .\s_axi_rdata_reg[27] (\s_axi_rdata[27]_i_2_n_0 ),
        .\s_axi_rdata_reg[27]_0 (u_peak_n_31),
        .\s_axi_rdata_reg[28] (\s_axi_rdata[28]_i_2_n_0 ),
        .\s_axi_rdata_reg[28]_0 (u_peak_n_32),
        .\s_axi_rdata_reg[29] ({scratch[29],scratch[24],scratch[20],scratch[17]}),
        .\s_axi_rdata_reg[29]_0 (u_peak_n_33),
        .\s_axi_rdata_reg[2] (u_peak_n_17),
        .\s_axi_rdata_reg[2]_0 (\s_axi_rdata[2]_i_3_n_0 ),
        .\s_axi_rdata_reg[30] (\s_axi_rdata[30]_i_2_n_0 ),
        .\s_axi_rdata_reg[30]_0 (u_peak_n_34),
        .\s_axi_rdata_reg[31] (\s_axi_rdata[31]_i_2_n_0 ),
        .\s_axi_rdata_reg[31]_0 (u_peak_n_35),
        .\s_axi_rdata_reg[4] (u_peak_n_18),
        .\s_axi_rdata_reg[4]_0 (\s_axi_rdata[4]_i_4_n_0 ),
        .\s_axi_rdata_reg[8] (\s_axi_rdata[8]_i_2_n_0 ),
        .\s_axi_rdata_reg[8]_0 (u_peak_n_19),
        .\s_axi_rdata_reg[8]_1 (\s_axi_rdata[31]_i_4_n_0 ),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid),
        .sample_fire(sample_fire),
        .\since_rise_reg[31]_0 (since_rise),
        .soft_reset_r_reg(u_pulse_n_0));
  radar_system_radar_core_0_0_axis_window u_window
       (.ADDRARDADDR(ADDRARDADDR),
        .DOADO(DOADO),
        .E(u_window_n_15),
        .SR(u_window_n_13),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(aresetn_0),
        .clear(clear),
        .have_rise(have_rise),
        .in_pulse012_out(in_pulse012_out),
        .m_axis_fft_tdata(m_axis_fft_tdata),
        .m_axis_fft_tlast(m_axis_fft_tlast),
        .m_axis_fft_tready(m_axis_fft_tready),
        .m_axis_fft_tready_0(since_rise),
        .\m_tdata_reg[31]_0 (enable_reg_0),
        .m_tvalid_reg_0(m_tvalid_reg),
        .p_4_in(p_4_in),
        .\pw_acc_reg[1] (in_pulse_reg),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .sample_fire(sample_fire),
        .\since_rise_reg[1] (u_pulse_n_0));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    window_enable_i_1
       (.I0(s_axi_wdata[2]),
        .I1(s_axi_wstrb[0]),
        .I2(enable_i_2_n_0),
        .I3(enable_i_3_n_0),
        .I4(p_4_in),
        .O(window_enable_i_1_n_0));
  FDSE window_enable_reg
       (.C(aclk),
        .CE(1'b1),
        .D(window_enable_i_1_n_0),
        .Q(p_4_in),
        .S(clear));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
