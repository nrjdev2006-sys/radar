# =============================================================================
# create_bd.tcl — sourced by create_project.tcl
#
# Block design:
#   Zynq PS (ENET0, UART1, HP0, GP0, FCLK0=100 MHz, IRQ_F2P)
#     GP0  -> AXI Interconnect -> AXI DMA Lite + radar_core AXI-Lite
#     HP0  <- AXI DMA MM2S
#     DMA MM2S AXIS -> radar_core -> FFT -> radar_core peak
#     eth_rst_n tied high, leds from radar_core
# =============================================================================

proc create_radar_bd {fft_size board} {
    create_bd_design "radar_system"

    # ----- Zynq PS -----------------------------------------------------------
    create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0

    # Board automation brings in DDR, FIXED_IO, ENET, UART when board_part is set.
    apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
        -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} \
        [get_bd_cells processing_system7_0]

    set_property -dict [list \
        CONFIG.PCW_USE_S_AXI_HP0 {1} \
        CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {32} \
        CONFIG.PCW_USE_M_AXI_GP0 {1} \
        CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
        CONFIG.PCW_IRQ_F2P_INTR {1} \
        CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
        CONFIG.PCW_EN_CLK0_PORT {1} \
        CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
        CONFIG.PCW_EN_RST0_PORT {1} \
        CONFIG.PCW_USE_S_AXI_HP1 {0} \
        CONFIG.PCW_USE_S_AXI_ACP {0} \
    ] [get_bd_cells processing_system7_0]

    # If board files were missing, force the peripherals we need.
    catch {
        set_property -dict [list \
            CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
            CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
            CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
            CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
            CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
            CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
            CONFIG.PCW_UART1_BAUD_RATE {115200} \
        ] [get_bd_cells processing_system7_0]
    }

    # ----- Reset -------------------------------------------------------------
    create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0

    # ----- AXI DMA (MM2S only, simple mode) ----------------------------------
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
    set_property -dict [list \
        CONFIG.c_include_sg {0} \
        CONFIG.c_sg_include_stscntrl_strm {0} \
        CONFIG.c_include_mm2s {1} \
        CONFIG.c_include_s2mm {0} \
        CONFIG.c_include_mm2s_dre {0} \
        CONFIG.c_m_axi_mm2s_data_width {32} \
        CONFIG.c_m_axis_mm2s_tdata_width {32} \
        CONFIG.c_mm2s_burst_size {256} \
        CONFIG.c_micro_dma {0} \
    ] [get_bd_cells axi_dma_0]

    # ----- Xilinx FFT --------------------------------------------------------
    create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0
    set_property -dict [list \
        CONFIG.transform_length           $fft_size \
        CONFIG.implementation_options     {pipelined_streaming_io} \
        CONFIG.run_time_configurable      {false} \
        CONFIG.data_format                {fixed_point} \
        CONFIG.input_width                {16} \
        CONFIG.phase_factor_width         {16} \
        CONFIG.scaling_options            {scaled} \
        CONFIG.rounding_modes             {convergent_rounding} \
        CONFIG.output_ordering            {natural_order} \
        CONFIG.throttle_scheme            {nonrealtime} \
        CONFIG.complex_mult_type          {use_mults_resources} \
        CONFIG.butterfly_type             {use_luts} \
        CONFIG.pipeline_options           {hybrid} \
        CONFIG.aresetn                    {true} \
        CONFIG.ovflo                      {true} \
        CONFIG.xk_index                   {false} \
        CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {5} \
    ] [get_bd_cells xfft_0]

    # ----- Custom radar_core (module reference) ------------------------------
    create_bd_cell -type module -reference radar_core radar_core_0

    # ----- Ethernet PHY reset held high --------------------------------------
    create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_eth_rst
    set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] \
        [get_bd_cells xlconstant_eth_rst]
    create_bd_port -dir O eth_rst_n
    connect_bd_net [get_bd_pins xlconstant_eth_rst/dout] [get_bd_ports eth_rst_n]

    # LEDs
    create_bd_port -dir O -from 3 -to 0 leds
    connect_bd_net [get_bd_pins radar_core_0/leds] [get_bd_ports leds]

    # ----- Clocks / resets ---------------------------------------------------
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
                   [get_bd_pins proc_sys_reset_0/ext_reset_in]

    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins axi_dma_0/s_axi_lite_aclk]
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins axi_dma_0/m_axi_mm2s_aclk]
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins xfft_0/aclk]
    connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
                   [get_bd_pins radar_core_0/aclk]

    connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] \
                   [get_bd_pins axi_dma_0/axi_resetn]
    connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] \
                   [get_bd_pins xfft_0/aresetn]
    connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] \
                   [get_bd_pins radar_core_0/aresetn]

    # ----- AXI-Lite (GP0 -> DMA + radar_core) --------------------------------
    apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
        -config {Clk_master {/processing_system7_0/FCLK_CLK0} \
                 Clk_slave  {/processing_system7_0/FCLK_CLK0} \
                 Clk_xbar   {/processing_system7_0/FCLK_CLK0} \
                 Master     {/processing_system7_0/M_AXI_GP0} \
                 Slave      {/axi_dma_0/S_AXI_LITE} \
                 ddr_seg    {Auto} \
                 intc_ip    {New AXI Interconnect} \
                 master_apm {0}} \
        [get_bd_intf_pins axi_dma_0/S_AXI_LITE]

    apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
        -config {Clk_master {/processing_system7_0/FCLK_CLK0} \
                 Clk_slave  {/processing_system7_0/FCLK_CLK0} \
                 Clk_xbar   {/processing_system7_0/FCLK_CLK0} \
                 Master     {/processing_system7_0/M_AXI_GP0} \
                 Slave      {/radar_core_0/S_AXI} \
                 ddr_seg    {Auto} \
                 intc_ip    {Auto} \
                 master_apm {0}} \
        [get_bd_intf_pins radar_core_0/S_AXI]

    # ----- AXI HP0 (DMA MM2S memory-mapped) ----------------------------------
    apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
        -config {Clk_master {/processing_system7_0/FCLK_CLK0} \
                 Clk_slave  {/processing_system7_0/FCLK_CLK0} \
                 Clk_xbar   {/processing_system7_0/FCLK_CLK0} \
                 Master     {/axi_dma_0/M_AXI_MM2S} \
                 Slave      {/processing_system7_0/S_AXI_HP0} \
                 ddr_seg    {Auto} \
                 intc_ip    {New AXI Interconnect} \
                 master_apm {0}} \
        [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

    # ----- AXI-Stream datapath -----------------------------------------------
    connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] \
                        [get_bd_intf_pins radar_core_0/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins radar_core_0/M_AXIS_FFT] \
                        [get_bd_intf_pins xfft_0/S_AXIS_DATA]
    connect_bd_intf_net [get_bd_intf_pins xfft_0/M_AXIS_DATA] \
                        [get_bd_intf_pins radar_core_0/S_AXIS_FFT]
    connect_bd_intf_net [get_bd_intf_pins radar_core_0/M_AXIS_FFT_CONFIG] \
                        [get_bd_intf_pins xfft_0/S_AXIS_CONFIG]

    # ----- Interrupt: DMA MM2S -> IRQ_F2P[0] ---------------------------------
    create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
    set_property -dict [list CONFIG.NUM_PORTS {1}] [get_bd_cells xlconcat_0]
    connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
    connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]

    # ----- Address map -------------------------------------------------------
    assign_bd_address
    # Prefer well-known bases if the assigner picked something else.
    catch { set_property offset 0x40400000 [get_bd_addr_segs -of_objects [get_bd_intf_pins axi_dma_0/S_AXI_LITE] -filter {NAME =~ "*Reg*"}] }
    catch { set_property offset 0x43C00000 [get_bd_addr_segs {processing_system7_0/Data/SEG_radar_core_0_S_AXI_reg}] }
    catch { set_property offset 0x43C00000 [get_bd_addr_segs -regexp .*radar_core.*] }

    regenerate_bd_layout
    save_bd_design
    puts "Block design radar_system saved (FFT_SIZE=$fft_size, BOARD=$board)."
}
