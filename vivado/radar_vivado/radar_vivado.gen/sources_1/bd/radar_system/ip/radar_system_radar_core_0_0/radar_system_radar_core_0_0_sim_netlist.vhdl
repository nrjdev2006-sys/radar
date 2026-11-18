-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Nov  3 10:27:41 2026
-- Host        : DESKTOP-FKE42VV running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Dell/zynq-radar-sp/vivado/radar_vivado/radar_vivado.gen/sources_1/bd/radar_system/ip/radar_system_radar_core_0_0/radar_system_radar_core_0_0_sim_netlist.vhdl
-- Design      : radar_system_radar_core_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity radar_system_radar_core_0_0_axis_peak_detect is
  port (
    clear : out STD_LOGIC;
    peak_valid_reg_0 : out STD_LOGIC;
    peak_valid_d_reg : out STD_LOGIC;
    frame_count0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \peak_mag2_reg[1]_0\ : out STD_LOGIC;
    \peak_mag2_reg[2]_0\ : out STD_LOGIC;
    \peak_mag2_reg[4]_0\ : out STD_LOGIC;
    s_axi_araddr_3_sp_1 : out STD_LOGIC;
    \s_axi_araddr[3]_0\ : out STD_LOGIC;
    s_axi_araddr_2_sp_1 : out STD_LOGIC;
    \s_axi_araddr[2]_0\ : out STD_LOGIC;
    \s_axi_araddr[2]_1\ : out STD_LOGIC;
    \s_axi_araddr[2]_2\ : out STD_LOGIC;
    \s_axi_araddr[2]_3\ : out STD_LOGIC;
    \s_axi_araddr[2]_4\ : out STD_LOGIC;
    \s_axi_araddr[2]_5\ : out STD_LOGIC;
    \s_axi_araddr[2]_6\ : out STD_LOGIC;
    \s_axi_araddr[2]_7\ : out STD_LOGIC;
    \s_axi_araddr[2]_8\ : out STD_LOGIC;
    \s_axi_araddr[2]_9\ : out STD_LOGIC;
    \s_axi_araddr[2]_10\ : out STD_LOGIC;
    \s_axi_araddr[2]_11\ : out STD_LOGIC;
    \s_axi_araddr[2]_12\ : out STD_LOGIC;
    \s_axi_araddr[2]_13\ : out STD_LOGIC;
    \bins_seen_reg[15]_0\ : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_fft_tlast : in STD_LOGIC;
    aclk : in STD_LOGIC;
    s_axis_fft_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    peak_valid_d : in STD_LOGIC;
    peak_valid_d_reg_0 : in STD_LOGIC;
    s_axis_fft_tvalid : in STD_LOGIC;
    re2_pipe_reg_0 : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    \s_axi_rdata_reg[0]\ : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \s_axi_rdata_reg[0]_0\ : in STD_LOGIC;
    pw_samples : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 13 downto 0 );
    \s_axi_rdata_reg[15]\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \s_axi_rdata_reg[3]\ : in STD_LOGIC;
    \s_axi_rdata_reg[3]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[5]\ : in STD_LOGIC;
    \s_axi_rdata_reg[5]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[5]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[6]\ : in STD_LOGIC;
    \s_axi_rdata_reg[6]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[7]\ : in STD_LOGIC;
    \s_axi_rdata_reg[7]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[9]\ : in STD_LOGIC;
    \s_axi_rdata_reg[9]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[10]\ : in STD_LOGIC;
    \s_axi_rdata_reg[10]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[11]\ : in STD_LOGIC;
    \s_axi_rdata_reg[11]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[12]\ : in STD_LOGIC;
    \s_axi_rdata_reg[12]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[13]\ : in STD_LOGIC;
    \s_axi_rdata_reg[13]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[15]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[15]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[16]\ : in STD_LOGIC;
    \s_axi_rdata_reg[22]\ : in STD_LOGIC;
    \s_axi_rdata_reg[22]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[22]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of radar_system_radar_core_0_0_axis_peak_detect : entity is "axis_peak_detect";
end radar_system_radar_core_0_0_axis_peak_detect;

architecture STRUCTURE of radar_system_radar_core_0_0_axis_peak_detect is
  signal \bin_idx[0]_i_1_n_0\ : STD_LOGIC;
  signal \bin_idx[0]_i_3_n_0\ : STD_LOGIC;
  signal bin_idx_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \bin_idx_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \bin_idx_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \bin_idx_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \bin_idx_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \bin_idx_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal bin_pipe : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \bins_seen0_carry__0_n_0\ : STD_LOGIC;
  signal \bins_seen0_carry__0_n_1\ : STD_LOGIC;
  signal \bins_seen0_carry__0_n_2\ : STD_LOGIC;
  signal \bins_seen0_carry__0_n_3\ : STD_LOGIC;
  signal \bins_seen0_carry__1_n_0\ : STD_LOGIC;
  signal \bins_seen0_carry__1_n_1\ : STD_LOGIC;
  signal \bins_seen0_carry__1_n_2\ : STD_LOGIC;
  signal \bins_seen0_carry__1_n_3\ : STD_LOGIC;
  signal \bins_seen0_carry__2_n_2\ : STD_LOGIC;
  signal \bins_seen0_carry__2_n_3\ : STD_LOGIC;
  signal bins_seen0_carry_n_0 : STD_LOGIC;
  signal bins_seen0_carry_n_1 : STD_LOGIC;
  signal bins_seen0_carry_n_2 : STD_LOGIC;
  signal bins_seen0_carry_n_3 : STD_LOGIC;
  signal \^clear\ : STD_LOGIC;
  signal dc_mag2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \dc_mag2[31]_i_1_n_0\ : STD_LOGIC;
  signal \dc_mag2[31]_i_2_n_0\ : STD_LOGIC;
  signal \dc_mag2[31]_i_3_n_0\ : STD_LOGIC;
  signal \dc_mag2[31]_i_4_n_0\ : STD_LOGIC;
  signal \dc_mag2[31]_i_5_n_0\ : STD_LOGIC;
  signal fire : STD_LOGIC;
  signal frame_busy : STD_LOGIC;
  signal frame_busy_i_1_n_0 : STD_LOGIC;
  signal last_pipe : STD_LOGIC;
  signal mag2_pipe_n_100 : STD_LOGIC;
  signal mag2_pipe_n_101 : STD_LOGIC;
  signal mag2_pipe_n_102 : STD_LOGIC;
  signal mag2_pipe_n_103 : STD_LOGIC;
  signal mag2_pipe_n_104 : STD_LOGIC;
  signal mag2_pipe_n_105 : STD_LOGIC;
  signal mag2_pipe_n_74 : STD_LOGIC;
  signal mag2_pipe_n_75 : STD_LOGIC;
  signal mag2_pipe_n_76 : STD_LOGIC;
  signal mag2_pipe_n_77 : STD_LOGIC;
  signal mag2_pipe_n_78 : STD_LOGIC;
  signal mag2_pipe_n_79 : STD_LOGIC;
  signal mag2_pipe_n_80 : STD_LOGIC;
  signal mag2_pipe_n_81 : STD_LOGIC;
  signal mag2_pipe_n_82 : STD_LOGIC;
  signal mag2_pipe_n_83 : STD_LOGIC;
  signal mag2_pipe_n_84 : STD_LOGIC;
  signal mag2_pipe_n_85 : STD_LOGIC;
  signal mag2_pipe_n_86 : STD_LOGIC;
  signal mag2_pipe_n_87 : STD_LOGIC;
  signal mag2_pipe_n_88 : STD_LOGIC;
  signal mag2_pipe_n_89 : STD_LOGIC;
  signal mag2_pipe_n_90 : STD_LOGIC;
  signal mag2_pipe_n_91 : STD_LOGIC;
  signal mag2_pipe_n_92 : STD_LOGIC;
  signal mag2_pipe_n_93 : STD_LOGIC;
  signal mag2_pipe_n_94 : STD_LOGIC;
  signal mag2_pipe_n_95 : STD_LOGIC;
  signal mag2_pipe_n_96 : STD_LOGIC;
  signal mag2_pipe_n_97 : STD_LOGIC;
  signal mag2_pipe_n_98 : STD_LOGIC;
  signal mag2_pipe_n_99 : STD_LOGIC;
  signal new_peak0 : STD_LOGIC;
  signal \new_peak0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__0_n_1\ : STD_LOGIC;
  signal \new_peak0_carry__0_n_2\ : STD_LOGIC;
  signal \new_peak0_carry__0_n_3\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__1_n_1\ : STD_LOGIC;
  signal \new_peak0_carry__1_n_2\ : STD_LOGIC;
  signal \new_peak0_carry__1_n_3\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \new_peak0_carry__2_n_1\ : STD_LOGIC;
  signal \new_peak0_carry__2_n_2\ : STD_LOGIC;
  signal \new_peak0_carry__2_n_3\ : STD_LOGIC;
  signal new_peak0_carry_i_1_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_2_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_3_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_4_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_5_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_6_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_7_n_0 : STD_LOGIC;
  signal new_peak0_carry_i_8_n_0 : STD_LOGIC;
  signal new_peak0_carry_n_0 : STD_LOGIC;
  signal new_peak0_carry_n_1 : STD_LOGIC;
  signal new_peak0_carry_n_2 : STD_LOGIC;
  signal new_peak0_carry_n_3 : STD_LOGIC;
  signal \new_peak__15\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal peak_bin : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \peak_bin[15]_i_1_n_0\ : STD_LOGIC;
  signal peak_mag2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal peak_valid_i_1_n_0 : STD_LOGIC;
  signal \^peak_valid_reg_0\ : STD_LOGIC;
  signal re2_pipe_reg_n_100 : STD_LOGIC;
  signal re2_pipe_reg_n_101 : STD_LOGIC;
  signal re2_pipe_reg_n_102 : STD_LOGIC;
  signal re2_pipe_reg_n_103 : STD_LOGIC;
  signal re2_pipe_reg_n_104 : STD_LOGIC;
  signal re2_pipe_reg_n_105 : STD_LOGIC;
  signal re2_pipe_reg_n_106 : STD_LOGIC;
  signal re2_pipe_reg_n_107 : STD_LOGIC;
  signal re2_pipe_reg_n_108 : STD_LOGIC;
  signal re2_pipe_reg_n_109 : STD_LOGIC;
  signal re2_pipe_reg_n_110 : STD_LOGIC;
  signal re2_pipe_reg_n_111 : STD_LOGIC;
  signal re2_pipe_reg_n_112 : STD_LOGIC;
  signal re2_pipe_reg_n_113 : STD_LOGIC;
  signal re2_pipe_reg_n_114 : STD_LOGIC;
  signal re2_pipe_reg_n_115 : STD_LOGIC;
  signal re2_pipe_reg_n_116 : STD_LOGIC;
  signal re2_pipe_reg_n_117 : STD_LOGIC;
  signal re2_pipe_reg_n_118 : STD_LOGIC;
  signal re2_pipe_reg_n_119 : STD_LOGIC;
  signal re2_pipe_reg_n_120 : STD_LOGIC;
  signal re2_pipe_reg_n_121 : STD_LOGIC;
  signal re2_pipe_reg_n_122 : STD_LOGIC;
  signal re2_pipe_reg_n_123 : STD_LOGIC;
  signal re2_pipe_reg_n_124 : STD_LOGIC;
  signal re2_pipe_reg_n_125 : STD_LOGIC;
  signal re2_pipe_reg_n_126 : STD_LOGIC;
  signal re2_pipe_reg_n_127 : STD_LOGIC;
  signal re2_pipe_reg_n_128 : STD_LOGIC;
  signal re2_pipe_reg_n_129 : STD_LOGIC;
  signal re2_pipe_reg_n_130 : STD_LOGIC;
  signal re2_pipe_reg_n_131 : STD_LOGIC;
  signal re2_pipe_reg_n_132 : STD_LOGIC;
  signal re2_pipe_reg_n_133 : STD_LOGIC;
  signal re2_pipe_reg_n_134 : STD_LOGIC;
  signal re2_pipe_reg_n_135 : STD_LOGIC;
  signal re2_pipe_reg_n_136 : STD_LOGIC;
  signal re2_pipe_reg_n_137 : STD_LOGIC;
  signal re2_pipe_reg_n_138 : STD_LOGIC;
  signal re2_pipe_reg_n_139 : STD_LOGIC;
  signal re2_pipe_reg_n_140 : STD_LOGIC;
  signal re2_pipe_reg_n_141 : STD_LOGIC;
  signal re2_pipe_reg_n_142 : STD_LOGIC;
  signal re2_pipe_reg_n_143 : STD_LOGIC;
  signal re2_pipe_reg_n_144 : STD_LOGIC;
  signal re2_pipe_reg_n_145 : STD_LOGIC;
  signal re2_pipe_reg_n_146 : STD_LOGIC;
  signal re2_pipe_reg_n_147 : STD_LOGIC;
  signal re2_pipe_reg_n_148 : STD_LOGIC;
  signal re2_pipe_reg_n_149 : STD_LOGIC;
  signal re2_pipe_reg_n_150 : STD_LOGIC;
  signal re2_pipe_reg_n_151 : STD_LOGIC;
  signal re2_pipe_reg_n_152 : STD_LOGIC;
  signal re2_pipe_reg_n_153 : STD_LOGIC;
  signal re2_pipe_reg_n_74 : STD_LOGIC;
  signal re2_pipe_reg_n_75 : STD_LOGIC;
  signal re2_pipe_reg_n_76 : STD_LOGIC;
  signal re2_pipe_reg_n_77 : STD_LOGIC;
  signal re2_pipe_reg_n_78 : STD_LOGIC;
  signal re2_pipe_reg_n_79 : STD_LOGIC;
  signal re2_pipe_reg_n_80 : STD_LOGIC;
  signal re2_pipe_reg_n_81 : STD_LOGIC;
  signal re2_pipe_reg_n_82 : STD_LOGIC;
  signal re2_pipe_reg_n_83 : STD_LOGIC;
  signal re2_pipe_reg_n_84 : STD_LOGIC;
  signal re2_pipe_reg_n_85 : STD_LOGIC;
  signal re2_pipe_reg_n_86 : STD_LOGIC;
  signal re2_pipe_reg_n_87 : STD_LOGIC;
  signal re2_pipe_reg_n_88 : STD_LOGIC;
  signal re2_pipe_reg_n_89 : STD_LOGIC;
  signal re2_pipe_reg_n_90 : STD_LOGIC;
  signal re2_pipe_reg_n_91 : STD_LOGIC;
  signal re2_pipe_reg_n_92 : STD_LOGIC;
  signal re2_pipe_reg_n_93 : STD_LOGIC;
  signal re2_pipe_reg_n_94 : STD_LOGIC;
  signal re2_pipe_reg_n_95 : STD_LOGIC;
  signal re2_pipe_reg_n_96 : STD_LOGIC;
  signal re2_pipe_reg_n_97 : STD_LOGIC;
  signal re2_pipe_reg_n_98 : STD_LOGIC;
  signal re2_pipe_reg_n_99 : STD_LOGIC;
  signal run_bin : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal run_bin1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal run_mag2 : STD_LOGIC;
  signal \run_mag2[0]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[10]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[11]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[12]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[13]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[14]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[15]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[16]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[17]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[18]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[19]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[1]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[20]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[21]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[22]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[23]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[24]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[25]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[26]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[27]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[28]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[29]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[2]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[30]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[31]_i_2_n_0\ : STD_LOGIC;
  signal \run_mag2[31]_i_4_n_0\ : STD_LOGIC;
  signal \run_mag2[31]_i_5_n_0\ : STD_LOGIC;
  signal \run_mag2[31]_i_6_n_0\ : STD_LOGIC;
  signal \run_mag2[31]_i_7_n_0\ : STD_LOGIC;
  signal \run_mag2[3]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[4]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[5]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[6]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[7]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[8]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2[9]_i_1_n_0\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[0]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[10]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[11]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[12]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[13]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[14]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[15]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[16]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[17]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[18]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[19]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[1]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[20]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[21]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[22]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[23]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[24]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[25]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[26]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[27]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[28]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[29]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[2]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[30]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[31]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[3]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[4]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[5]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[6]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[7]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[8]\ : STD_LOGIC;
  signal \run_mag2_reg_n_0_[9]\ : STD_LOGIC;
  signal s_axi_araddr_2_sn_1 : STD_LOGIC;
  signal s_axi_araddr_3_sn_1 : STD_LOGIC;
  signal \s_axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal valid_pipe : STD_LOGIC;
  signal \NLW_bin_idx_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_bins_seen0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_bins_seen0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_mag2_pipe_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_pipe_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_pipe_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_pipe_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_pipe_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_pipe_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_pipe_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_mag2_pipe_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_mag2_pipe_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mag2_pipe_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_mag2_pipe_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_new_peak0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_new_peak0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_new_peak0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_new_peak0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_re2_pipe_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_re2_pipe_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_re2_pipe_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_re2_pipe_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_re2_pipe_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_re2_pipe_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_re2_pipe_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_re2_pipe_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_re2_pipe_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_re2_pipe_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \bin_idx_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \bin_idx_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bin_idx_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \bin_idx_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of bins_seen0_carry : label is 35;
  attribute ADDER_THRESHOLD of \bins_seen0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \bins_seen0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \bins_seen0_carry__2\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bins_seen[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \frame_count[0]_i_1\ : label is "soft_lutpair1";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mag2_pipe : label is "{SYNTH-12 {cell *THIS*}}";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of new_peak0_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \new_peak0_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \new_peak0_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \new_peak0_carry__2\ : label is 11;
  attribute SOFT_HLUTNM of peak_valid_d_i_1 : label is "soft_lutpair1";
  attribute METHODOLOGY_DRC_VIOS of re2_pipe_reg : label is "{SYNTH-12 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \run_bin[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \run_bin[10]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \run_bin[11]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \run_bin[12]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \run_bin[13]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \run_bin[14]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \run_bin[15]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \run_bin[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \run_bin[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \run_bin[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \run_bin[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \run_bin[5]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \run_bin[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \run_bin[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \run_bin[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \run_bin[9]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \run_mag2[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \run_mag2[10]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \run_mag2[11]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \run_mag2[12]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \run_mag2[13]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \run_mag2[14]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \run_mag2[15]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \run_mag2[16]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \run_mag2[17]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \run_mag2[18]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \run_mag2[19]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \run_mag2[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \run_mag2[20]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \run_mag2[21]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \run_mag2[22]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \run_mag2[23]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \run_mag2[24]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \run_mag2[25]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \run_mag2[26]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \run_mag2[27]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \run_mag2[28]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \run_mag2[29]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \run_mag2[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \run_mag2[30]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \run_mag2[31]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \run_mag2[31]_i_6\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \run_mag2[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \run_mag2[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \run_mag2[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \run_mag2[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \run_mag2[7]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \run_mag2[8]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \run_mag2[9]_i_1\ : label is "soft_lutpair15";
begin
  clear <= \^clear\;
  peak_valid_reg_0 <= \^peak_valid_reg_0\;
  s_axi_araddr_2_sp_1 <= s_axi_araddr_2_sn_1;
  s_axi_araddr_3_sp_1 <= s_axi_araddr_3_sn_1;
\bin_idx[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80FF"
    )
        port map (
      I0 => s_axis_fft_tlast,
      I1 => s_axis_fft_tvalid,
      I2 => re2_pipe_reg_0,
      I3 => aresetn,
      O => \bin_idx[0]_i_1_n_0\
    );
\bin_idx[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bin_idx_reg(0),
      O => \bin_idx[0]_i_3_n_0\
    );
\bin_idx_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[0]_i_2_n_7\,
      Q => bin_idx_reg(0),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \bin_idx_reg[0]_i_2_n_0\,
      CO(2) => \bin_idx_reg[0]_i_2_n_1\,
      CO(1) => \bin_idx_reg[0]_i_2_n_2\,
      CO(0) => \bin_idx_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \bin_idx_reg[0]_i_2_n_4\,
      O(2) => \bin_idx_reg[0]_i_2_n_5\,
      O(1) => \bin_idx_reg[0]_i_2_n_6\,
      O(0) => \bin_idx_reg[0]_i_2_n_7\,
      S(3 downto 1) => bin_idx_reg(3 downto 1),
      S(0) => \bin_idx[0]_i_3_n_0\
    );
\bin_idx_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[8]_i_1_n_5\,
      Q => bin_idx_reg(10),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[8]_i_1_n_4\,
      Q => bin_idx_reg(11),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[12]_i_1_n_7\,
      Q => bin_idx_reg(12),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bin_idx_reg[8]_i_1_n_0\,
      CO(3) => \NLW_bin_idx_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \bin_idx_reg[12]_i_1_n_1\,
      CO(1) => \bin_idx_reg[12]_i_1_n_2\,
      CO(0) => \bin_idx_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bin_idx_reg[12]_i_1_n_4\,
      O(2) => \bin_idx_reg[12]_i_1_n_5\,
      O(1) => \bin_idx_reg[12]_i_1_n_6\,
      O(0) => \bin_idx_reg[12]_i_1_n_7\,
      S(3 downto 0) => bin_idx_reg(15 downto 12)
    );
\bin_idx_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[12]_i_1_n_6\,
      Q => bin_idx_reg(13),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[12]_i_1_n_5\,
      Q => bin_idx_reg(14),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[12]_i_1_n_4\,
      Q => bin_idx_reg(15),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[0]_i_2_n_6\,
      Q => bin_idx_reg(1),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[0]_i_2_n_5\,
      Q => bin_idx_reg(2),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[0]_i_2_n_4\,
      Q => bin_idx_reg(3),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[4]_i_1_n_7\,
      Q => bin_idx_reg(4),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bin_idx_reg[0]_i_2_n_0\,
      CO(3) => \bin_idx_reg[4]_i_1_n_0\,
      CO(2) => \bin_idx_reg[4]_i_1_n_1\,
      CO(1) => \bin_idx_reg[4]_i_1_n_2\,
      CO(0) => \bin_idx_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bin_idx_reg[4]_i_1_n_4\,
      O(2) => \bin_idx_reg[4]_i_1_n_5\,
      O(1) => \bin_idx_reg[4]_i_1_n_6\,
      O(0) => \bin_idx_reg[4]_i_1_n_7\,
      S(3 downto 0) => bin_idx_reg(7 downto 4)
    );
\bin_idx_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[4]_i_1_n_6\,
      Q => bin_idx_reg(5),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[4]_i_1_n_5\,
      Q => bin_idx_reg(6),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[4]_i_1_n_4\,
      Q => bin_idx_reg(7),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[8]_i_1_n_7\,
      Q => bin_idx_reg(8),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_idx_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bin_idx_reg[4]_i_1_n_0\,
      CO(3) => \bin_idx_reg[8]_i_1_n_0\,
      CO(2) => \bin_idx_reg[8]_i_1_n_1\,
      CO(1) => \bin_idx_reg[8]_i_1_n_2\,
      CO(0) => \bin_idx_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \bin_idx_reg[8]_i_1_n_4\,
      O(2) => \bin_idx_reg[8]_i_1_n_5\,
      O(1) => \bin_idx_reg[8]_i_1_n_6\,
      O(0) => \bin_idx_reg[8]_i_1_n_7\,
      S(3 downto 0) => bin_idx_reg(11 downto 8)
    );
\bin_idx_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => \bin_idx_reg[8]_i_1_n_6\,
      Q => bin_idx_reg(9),
      R => \bin_idx[0]_i_1_n_0\
    );
\bin_pipe_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(0),
      Q => bin_pipe(0),
      R => \^clear\
    );
\bin_pipe_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(10),
      Q => bin_pipe(10),
      R => \^clear\
    );
\bin_pipe_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(11),
      Q => bin_pipe(11),
      R => \^clear\
    );
\bin_pipe_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(12),
      Q => bin_pipe(12),
      R => \^clear\
    );
\bin_pipe_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(13),
      Q => bin_pipe(13),
      R => \^clear\
    );
\bin_pipe_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(14),
      Q => bin_pipe(14),
      R => \^clear\
    );
\bin_pipe_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(15),
      Q => bin_pipe(15),
      R => \^clear\
    );
\bin_pipe_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(1),
      Q => bin_pipe(1),
      R => \^clear\
    );
\bin_pipe_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(2),
      Q => bin_pipe(2),
      R => \^clear\
    );
\bin_pipe_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(3),
      Q => bin_pipe(3),
      R => \^clear\
    );
\bin_pipe_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(4),
      Q => bin_pipe(4),
      R => \^clear\
    );
\bin_pipe_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(5),
      Q => bin_pipe(5),
      R => \^clear\
    );
\bin_pipe_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(6),
      Q => bin_pipe(6),
      R => \^clear\
    );
\bin_pipe_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(7),
      Q => bin_pipe(7),
      R => \^clear\
    );
\bin_pipe_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(8),
      Q => bin_pipe(8),
      R => \^clear\
    );
\bin_pipe_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => bin_idx_reg(9),
      Q => bin_pipe(9),
      R => \^clear\
    );
bins_seen0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => bins_seen0_carry_n_0,
      CO(2) => bins_seen0_carry_n_1,
      CO(1) => bins_seen0_carry_n_2,
      CO(0) => bins_seen0_carry_n_3,
      CYINIT => bin_pipe(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3 downto 0) => bin_pipe(4 downto 1)
    );
\bins_seen0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => bins_seen0_carry_n_0,
      CO(3) => \bins_seen0_carry__0_n_0\,
      CO(2) => \bins_seen0_carry__0_n_1\,
      CO(1) => \bins_seen0_carry__0_n_2\,
      CO(0) => \bins_seen0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3 downto 0) => bin_pipe(8 downto 5)
    );
\bins_seen0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \bins_seen0_carry__0_n_0\,
      CO(3) => \bins_seen0_carry__1_n_0\,
      CO(2) => \bins_seen0_carry__1_n_1\,
      CO(1) => \bins_seen0_carry__1_n_2\,
      CO(0) => \bins_seen0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3 downto 0) => bin_pipe(12 downto 9)
    );
\bins_seen0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \bins_seen0_carry__1_n_0\,
      CO(3 downto 2) => \NLW_bins_seen0_carry__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \bins_seen0_carry__2_n_2\,
      CO(0) => \bins_seen0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_bins_seen0_carry__2_O_UNCONNECTED\(3),
      O(2 downto 0) => p_1_in(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => bin_pipe(15 downto 13)
    );
\bins_seen[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bin_pipe(0),
      O => p_1_in(0)
    );
\bins_seen_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(0),
      Q => \bins_seen_reg[15]_0\(0),
      R => \^clear\
    );
\bins_seen_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(10),
      Q => \bins_seen_reg[15]_0\(10),
      R => \^clear\
    );
\bins_seen_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(11),
      Q => \bins_seen_reg[15]_0\(11),
      R => \^clear\
    );
\bins_seen_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(12),
      Q => \bins_seen_reg[15]_0\(12),
      R => \^clear\
    );
\bins_seen_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(13),
      Q => \bins_seen_reg[15]_0\(13),
      R => \^clear\
    );
\bins_seen_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(14),
      Q => \bins_seen_reg[15]_0\(14),
      R => \^clear\
    );
\bins_seen_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(15),
      Q => \bins_seen_reg[15]_0\(15),
      R => \^clear\
    );
\bins_seen_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(1),
      Q => \bins_seen_reg[15]_0\(1),
      R => \^clear\
    );
\bins_seen_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(2),
      Q => \bins_seen_reg[15]_0\(2),
      R => \^clear\
    );
\bins_seen_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(3),
      Q => \bins_seen_reg[15]_0\(3),
      R => \^clear\
    );
\bins_seen_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(4),
      Q => \bins_seen_reg[15]_0\(4),
      R => \^clear\
    );
\bins_seen_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(5),
      Q => \bins_seen_reg[15]_0\(5),
      R => \^clear\
    );
\bins_seen_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(6),
      Q => \bins_seen_reg[15]_0\(6),
      R => \^clear\
    );
\bins_seen_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(7),
      Q => \bins_seen_reg[15]_0\(7),
      R => \^clear\
    );
\bins_seen_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(8),
      Q => \bins_seen_reg[15]_0\(8),
      R => \^clear\
    );
\bins_seen_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => p_1_in(9),
      Q => \bins_seen_reg[15]_0\(9),
      R => \^clear\
    );
\dc_mag2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \dc_mag2[31]_i_2_n_0\,
      I1 => \dc_mag2[31]_i_3_n_0\,
      I2 => \dc_mag2[31]_i_4_n_0\,
      I3 => \dc_mag2[31]_i_5_n_0\,
      O => \dc_mag2[31]_i_1_n_0\
    );
\dc_mag2[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => bin_pipe(0),
      I1 => bin_pipe(1),
      I2 => bin_pipe(2),
      I3 => \run_mag2[31]_i_6_n_0\,
      I4 => bin_pipe(7),
      I5 => bin_pipe(8),
      O => \dc_mag2[31]_i_2_n_0\
    );
\dc_mag2[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => bin_pipe(10),
      I1 => bin_pipe(11),
      I2 => bin_pipe(13),
      I3 => bin_pipe(14),
      I4 => bin_pipe(15),
      I5 => valid_pipe,
      O => \dc_mag2[31]_i_3_n_0\
    );
\dc_mag2[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000230000002323"
    )
        port map (
      I0 => bin_pipe(7),
      I1 => bin_pipe(8),
      I2 => bin_pipe(6),
      I3 => bin_pipe(4),
      I4 => bin_pipe(5),
      I5 => bin_pipe(3),
      O => \dc_mag2[31]_i_4_n_0\
    );
\dc_mag2[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000230000002323"
    )
        port map (
      I0 => bin_pipe(13),
      I1 => bin_pipe(14),
      I2 => bin_pipe(12),
      I3 => bin_pipe(10),
      I4 => bin_pipe(11),
      I5 => bin_pipe(9),
      O => \dc_mag2[31]_i_5_n_0\
    );
\dc_mag2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_105,
      Q => dc_mag2(0),
      R => \^clear\
    );
\dc_mag2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_95,
      Q => dc_mag2(10),
      R => \^clear\
    );
\dc_mag2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_94,
      Q => dc_mag2(11),
      R => \^clear\
    );
\dc_mag2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_93,
      Q => dc_mag2(12),
      R => \^clear\
    );
\dc_mag2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_92,
      Q => dc_mag2(13),
      R => \^clear\
    );
\dc_mag2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_91,
      Q => dc_mag2(14),
      R => \^clear\
    );
\dc_mag2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_90,
      Q => dc_mag2(15),
      R => \^clear\
    );
\dc_mag2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_89,
      Q => dc_mag2(16),
      R => \^clear\
    );
\dc_mag2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_88,
      Q => dc_mag2(17),
      R => \^clear\
    );
\dc_mag2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_87,
      Q => dc_mag2(18),
      R => \^clear\
    );
\dc_mag2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_86,
      Q => dc_mag2(19),
      R => \^clear\
    );
\dc_mag2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_104,
      Q => dc_mag2(1),
      R => \^clear\
    );
\dc_mag2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_85,
      Q => dc_mag2(20),
      R => \^clear\
    );
\dc_mag2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_84,
      Q => dc_mag2(21),
      R => \^clear\
    );
\dc_mag2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_83,
      Q => dc_mag2(22),
      R => \^clear\
    );
\dc_mag2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_82,
      Q => dc_mag2(23),
      R => \^clear\
    );
\dc_mag2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_81,
      Q => dc_mag2(24),
      R => \^clear\
    );
\dc_mag2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_80,
      Q => dc_mag2(25),
      R => \^clear\
    );
\dc_mag2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_79,
      Q => dc_mag2(26),
      R => \^clear\
    );
\dc_mag2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_78,
      Q => dc_mag2(27),
      R => \^clear\
    );
\dc_mag2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_77,
      Q => dc_mag2(28),
      R => \^clear\
    );
\dc_mag2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_76,
      Q => dc_mag2(29),
      R => \^clear\
    );
\dc_mag2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_103,
      Q => dc_mag2(2),
      R => \^clear\
    );
\dc_mag2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_75,
      Q => dc_mag2(30),
      R => \^clear\
    );
\dc_mag2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_74,
      Q => dc_mag2(31),
      R => \^clear\
    );
\dc_mag2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_102,
      Q => dc_mag2(3),
      R => \^clear\
    );
\dc_mag2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_101,
      Q => dc_mag2(4),
      R => \^clear\
    );
\dc_mag2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_100,
      Q => dc_mag2(5),
      R => \^clear\
    );
\dc_mag2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_99,
      Q => dc_mag2(6),
      R => \^clear\
    );
\dc_mag2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_98,
      Q => dc_mag2(7),
      R => \^clear\
    );
\dc_mag2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_97,
      Q => dc_mag2(8),
      R => \^clear\
    );
\dc_mag2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \dc_mag2[31]_i_1_n_0\,
      D => mag2_pipe_n_96,
      Q => dc_mag2(9),
      R => \^clear\
    );
frame_busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000EA00EA00EA00"
    )
        port map (
      I0 => frame_busy,
      I1 => s_axis_fft_tvalid,
      I2 => re2_pipe_reg_0,
      I3 => aresetn,
      I4 => valid_pipe,
      I5 => last_pipe,
      O => frame_busy_i_1_n_0
    );
frame_busy_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => frame_busy_i_1_n_0,
      Q => frame_busy,
      R => '0'
    );
\frame_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^peak_valid_reg_0\,
      I1 => peak_valid_d,
      O => frame_count0
    );
last_pipe_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axis_fft_tvalid,
      I1 => re2_pipe_reg_0,
      O => fire
    );
last_pipe_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire,
      D => s_axis_fft_tlast,
      Q => last_pipe,
      R => \^clear\
    );
mag2_pipe: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => s_axis_fft_tdata(31),
      A(28) => s_axis_fft_tdata(31),
      A(27) => s_axis_fft_tdata(31),
      A(26) => s_axis_fft_tdata(31),
      A(25) => s_axis_fft_tdata(31),
      A(24) => s_axis_fft_tdata(31),
      A(23) => s_axis_fft_tdata(31),
      A(22) => s_axis_fft_tdata(31),
      A(21) => s_axis_fft_tdata(31),
      A(20) => s_axis_fft_tdata(31),
      A(19) => s_axis_fft_tdata(31),
      A(18) => s_axis_fft_tdata(31),
      A(17) => s_axis_fft_tdata(31),
      A(16) => s_axis_fft_tdata(31),
      A(15 downto 0) => s_axis_fft_tdata(31 downto 16),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_mag2_pipe_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => s_axis_fft_tdata(31),
      B(16) => s_axis_fft_tdata(31),
      B(15 downto 0) => s_axis_fft_tdata(31 downto 16),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_mag2_pipe_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_mag2_pipe_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_mag2_pipe_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => fire,
      CEP => '0',
      CLK => aclk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_mag2_pipe_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_mag2_pipe_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_mag2_pipe_P_UNCONNECTED(47 downto 32),
      P(31) => mag2_pipe_n_74,
      P(30) => mag2_pipe_n_75,
      P(29) => mag2_pipe_n_76,
      P(28) => mag2_pipe_n_77,
      P(27) => mag2_pipe_n_78,
      P(26) => mag2_pipe_n_79,
      P(25) => mag2_pipe_n_80,
      P(24) => mag2_pipe_n_81,
      P(23) => mag2_pipe_n_82,
      P(22) => mag2_pipe_n_83,
      P(21) => mag2_pipe_n_84,
      P(20) => mag2_pipe_n_85,
      P(19) => mag2_pipe_n_86,
      P(18) => mag2_pipe_n_87,
      P(17) => mag2_pipe_n_88,
      P(16) => mag2_pipe_n_89,
      P(15) => mag2_pipe_n_90,
      P(14) => mag2_pipe_n_91,
      P(13) => mag2_pipe_n_92,
      P(12) => mag2_pipe_n_93,
      P(11) => mag2_pipe_n_94,
      P(10) => mag2_pipe_n_95,
      P(9) => mag2_pipe_n_96,
      P(8) => mag2_pipe_n_97,
      P(7) => mag2_pipe_n_98,
      P(6) => mag2_pipe_n_99,
      P(5) => mag2_pipe_n_100,
      P(4) => mag2_pipe_n_101,
      P(3) => mag2_pipe_n_102,
      P(2) => mag2_pipe_n_103,
      P(1) => mag2_pipe_n_104,
      P(0) => mag2_pipe_n_105,
      PATTERNBDETECT => NLW_mag2_pipe_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_mag2_pipe_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => re2_pipe_reg_n_106,
      PCIN(46) => re2_pipe_reg_n_107,
      PCIN(45) => re2_pipe_reg_n_108,
      PCIN(44) => re2_pipe_reg_n_109,
      PCIN(43) => re2_pipe_reg_n_110,
      PCIN(42) => re2_pipe_reg_n_111,
      PCIN(41) => re2_pipe_reg_n_112,
      PCIN(40) => re2_pipe_reg_n_113,
      PCIN(39) => re2_pipe_reg_n_114,
      PCIN(38) => re2_pipe_reg_n_115,
      PCIN(37) => re2_pipe_reg_n_116,
      PCIN(36) => re2_pipe_reg_n_117,
      PCIN(35) => re2_pipe_reg_n_118,
      PCIN(34) => re2_pipe_reg_n_119,
      PCIN(33) => re2_pipe_reg_n_120,
      PCIN(32) => re2_pipe_reg_n_121,
      PCIN(31) => re2_pipe_reg_n_122,
      PCIN(30) => re2_pipe_reg_n_123,
      PCIN(29) => re2_pipe_reg_n_124,
      PCIN(28) => re2_pipe_reg_n_125,
      PCIN(27) => re2_pipe_reg_n_126,
      PCIN(26) => re2_pipe_reg_n_127,
      PCIN(25) => re2_pipe_reg_n_128,
      PCIN(24) => re2_pipe_reg_n_129,
      PCIN(23) => re2_pipe_reg_n_130,
      PCIN(22) => re2_pipe_reg_n_131,
      PCIN(21) => re2_pipe_reg_n_132,
      PCIN(20) => re2_pipe_reg_n_133,
      PCIN(19) => re2_pipe_reg_n_134,
      PCIN(18) => re2_pipe_reg_n_135,
      PCIN(17) => re2_pipe_reg_n_136,
      PCIN(16) => re2_pipe_reg_n_137,
      PCIN(15) => re2_pipe_reg_n_138,
      PCIN(14) => re2_pipe_reg_n_139,
      PCIN(13) => re2_pipe_reg_n_140,
      PCIN(12) => re2_pipe_reg_n_141,
      PCIN(11) => re2_pipe_reg_n_142,
      PCIN(10) => re2_pipe_reg_n_143,
      PCIN(9) => re2_pipe_reg_n_144,
      PCIN(8) => re2_pipe_reg_n_145,
      PCIN(7) => re2_pipe_reg_n_146,
      PCIN(6) => re2_pipe_reg_n_147,
      PCIN(5) => re2_pipe_reg_n_148,
      PCIN(4) => re2_pipe_reg_n_149,
      PCIN(3) => re2_pipe_reg_n_150,
      PCIN(2) => re2_pipe_reg_n_151,
      PCIN(1) => re2_pipe_reg_n_152,
      PCIN(0) => re2_pipe_reg_n_153,
      PCOUT(47 downto 0) => NLW_mag2_pipe_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => \^clear\,
      RSTP => '0',
      UNDERFLOW => NLW_mag2_pipe_UNDERFLOW_UNCONNECTED
    );
new_peak0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => new_peak0_carry_n_0,
      CO(2) => new_peak0_carry_n_1,
      CO(1) => new_peak0_carry_n_2,
      CO(0) => new_peak0_carry_n_3,
      CYINIT => '0',
      DI(3) => new_peak0_carry_i_1_n_0,
      DI(2) => new_peak0_carry_i_2_n_0,
      DI(1) => new_peak0_carry_i_3_n_0,
      DI(0) => new_peak0_carry_i_4_n_0,
      O(3 downto 0) => NLW_new_peak0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => new_peak0_carry_i_5_n_0,
      S(2) => new_peak0_carry_i_6_n_0,
      S(1) => new_peak0_carry_i_7_n_0,
      S(0) => new_peak0_carry_i_8_n_0
    );
\new_peak0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => new_peak0_carry_n_0,
      CO(3) => \new_peak0_carry__0_n_0\,
      CO(2) => \new_peak0_carry__0_n_1\,
      CO(1) => \new_peak0_carry__0_n_2\,
      CO(0) => \new_peak0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \new_peak0_carry__0_i_1_n_0\,
      DI(2) => \new_peak0_carry__0_i_2_n_0\,
      DI(1) => \new_peak0_carry__0_i_3_n_0\,
      DI(0) => \new_peak0_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_new_peak0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \new_peak0_carry__0_i_5_n_0\,
      S(2) => \new_peak0_carry__0_i_6_n_0\,
      S(1) => \new_peak0_carry__0_i_7_n_0\,
      S(0) => \new_peak0_carry__0_i_8_n_0\
    );
\new_peak0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_91,
      I1 => \run_mag2_reg_n_0_[14]\,
      I2 => \run_mag2_reg_n_0_[15]\,
      I3 => mag2_pipe_n_90,
      O => \new_peak0_carry__0_i_1_n_0\
    );
\new_peak0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_93,
      I1 => \run_mag2_reg_n_0_[12]\,
      I2 => \run_mag2_reg_n_0_[13]\,
      I3 => mag2_pipe_n_92,
      O => \new_peak0_carry__0_i_2_n_0\
    );
\new_peak0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_95,
      I1 => \run_mag2_reg_n_0_[10]\,
      I2 => \run_mag2_reg_n_0_[11]\,
      I3 => mag2_pipe_n_94,
      O => \new_peak0_carry__0_i_3_n_0\
    );
\new_peak0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_97,
      I1 => \run_mag2_reg_n_0_[8]\,
      I2 => \run_mag2_reg_n_0_[9]\,
      I3 => mag2_pipe_n_96,
      O => \new_peak0_carry__0_i_4_n_0\
    );
\new_peak0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[15]\,
      I1 => mag2_pipe_n_90,
      I2 => \run_mag2_reg_n_0_[14]\,
      I3 => mag2_pipe_n_91,
      O => \new_peak0_carry__0_i_5_n_0\
    );
\new_peak0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[13]\,
      I1 => mag2_pipe_n_92,
      I2 => \run_mag2_reg_n_0_[12]\,
      I3 => mag2_pipe_n_93,
      O => \new_peak0_carry__0_i_6_n_0\
    );
\new_peak0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[11]\,
      I1 => mag2_pipe_n_94,
      I2 => \run_mag2_reg_n_0_[10]\,
      I3 => mag2_pipe_n_95,
      O => \new_peak0_carry__0_i_7_n_0\
    );
\new_peak0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[9]\,
      I1 => mag2_pipe_n_96,
      I2 => \run_mag2_reg_n_0_[8]\,
      I3 => mag2_pipe_n_97,
      O => \new_peak0_carry__0_i_8_n_0\
    );
\new_peak0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \new_peak0_carry__0_n_0\,
      CO(3) => \new_peak0_carry__1_n_0\,
      CO(2) => \new_peak0_carry__1_n_1\,
      CO(1) => \new_peak0_carry__1_n_2\,
      CO(0) => \new_peak0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \new_peak0_carry__1_i_1_n_0\,
      DI(2) => \new_peak0_carry__1_i_2_n_0\,
      DI(1) => \new_peak0_carry__1_i_3_n_0\,
      DI(0) => \new_peak0_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_new_peak0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \new_peak0_carry__1_i_5_n_0\,
      S(2) => \new_peak0_carry__1_i_6_n_0\,
      S(1) => \new_peak0_carry__1_i_7_n_0\,
      S(0) => \new_peak0_carry__1_i_8_n_0\
    );
\new_peak0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_83,
      I1 => \run_mag2_reg_n_0_[22]\,
      I2 => \run_mag2_reg_n_0_[23]\,
      I3 => mag2_pipe_n_82,
      O => \new_peak0_carry__1_i_1_n_0\
    );
\new_peak0_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_85,
      I1 => \run_mag2_reg_n_0_[20]\,
      I2 => \run_mag2_reg_n_0_[21]\,
      I3 => mag2_pipe_n_84,
      O => \new_peak0_carry__1_i_2_n_0\
    );
\new_peak0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_87,
      I1 => \run_mag2_reg_n_0_[18]\,
      I2 => \run_mag2_reg_n_0_[19]\,
      I3 => mag2_pipe_n_86,
      O => \new_peak0_carry__1_i_3_n_0\
    );
\new_peak0_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_89,
      I1 => \run_mag2_reg_n_0_[16]\,
      I2 => \run_mag2_reg_n_0_[17]\,
      I3 => mag2_pipe_n_88,
      O => \new_peak0_carry__1_i_4_n_0\
    );
\new_peak0_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[23]\,
      I1 => mag2_pipe_n_82,
      I2 => \run_mag2_reg_n_0_[22]\,
      I3 => mag2_pipe_n_83,
      O => \new_peak0_carry__1_i_5_n_0\
    );
\new_peak0_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[21]\,
      I1 => mag2_pipe_n_84,
      I2 => \run_mag2_reg_n_0_[20]\,
      I3 => mag2_pipe_n_85,
      O => \new_peak0_carry__1_i_6_n_0\
    );
\new_peak0_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[19]\,
      I1 => mag2_pipe_n_86,
      I2 => \run_mag2_reg_n_0_[18]\,
      I3 => mag2_pipe_n_87,
      O => \new_peak0_carry__1_i_7_n_0\
    );
\new_peak0_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[17]\,
      I1 => mag2_pipe_n_88,
      I2 => \run_mag2_reg_n_0_[16]\,
      I3 => mag2_pipe_n_89,
      O => \new_peak0_carry__1_i_8_n_0\
    );
\new_peak0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \new_peak0_carry__1_n_0\,
      CO(3) => new_peak0,
      CO(2) => \new_peak0_carry__2_n_1\,
      CO(1) => \new_peak0_carry__2_n_2\,
      CO(0) => \new_peak0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \new_peak0_carry__2_i_1_n_0\,
      DI(2) => \new_peak0_carry__2_i_2_n_0\,
      DI(1) => \new_peak0_carry__2_i_3_n_0\,
      DI(0) => \new_peak0_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_new_peak0_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \new_peak0_carry__2_i_5_n_0\,
      S(2) => \new_peak0_carry__2_i_6_n_0\,
      S(1) => \new_peak0_carry__2_i_7_n_0\,
      S(0) => \new_peak0_carry__2_i_8_n_0\
    );
\new_peak0_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_75,
      I1 => \run_mag2_reg_n_0_[30]\,
      I2 => \run_mag2_reg_n_0_[31]\,
      I3 => mag2_pipe_n_74,
      O => \new_peak0_carry__2_i_1_n_0\
    );
\new_peak0_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_77,
      I1 => \run_mag2_reg_n_0_[28]\,
      I2 => \run_mag2_reg_n_0_[29]\,
      I3 => mag2_pipe_n_76,
      O => \new_peak0_carry__2_i_2_n_0\
    );
\new_peak0_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_79,
      I1 => \run_mag2_reg_n_0_[26]\,
      I2 => \run_mag2_reg_n_0_[27]\,
      I3 => mag2_pipe_n_78,
      O => \new_peak0_carry__2_i_3_n_0\
    );
\new_peak0_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_81,
      I1 => \run_mag2_reg_n_0_[24]\,
      I2 => \run_mag2_reg_n_0_[25]\,
      I3 => mag2_pipe_n_80,
      O => \new_peak0_carry__2_i_4_n_0\
    );
\new_peak0_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[31]\,
      I1 => mag2_pipe_n_74,
      I2 => \run_mag2_reg_n_0_[30]\,
      I3 => mag2_pipe_n_75,
      O => \new_peak0_carry__2_i_5_n_0\
    );
\new_peak0_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[29]\,
      I1 => mag2_pipe_n_76,
      I2 => \run_mag2_reg_n_0_[28]\,
      I3 => mag2_pipe_n_77,
      O => \new_peak0_carry__2_i_6_n_0\
    );
\new_peak0_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[27]\,
      I1 => mag2_pipe_n_78,
      I2 => \run_mag2_reg_n_0_[26]\,
      I3 => mag2_pipe_n_79,
      O => \new_peak0_carry__2_i_7_n_0\
    );
\new_peak0_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[25]\,
      I1 => mag2_pipe_n_80,
      I2 => \run_mag2_reg_n_0_[24]\,
      I3 => mag2_pipe_n_81,
      O => \new_peak0_carry__2_i_8_n_0\
    );
new_peak0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_99,
      I1 => \run_mag2_reg_n_0_[6]\,
      I2 => \run_mag2_reg_n_0_[7]\,
      I3 => mag2_pipe_n_98,
      O => new_peak0_carry_i_1_n_0
    );
new_peak0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_101,
      I1 => \run_mag2_reg_n_0_[4]\,
      I2 => \run_mag2_reg_n_0_[5]\,
      I3 => mag2_pipe_n_100,
      O => new_peak0_carry_i_2_n_0
    );
new_peak0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_103,
      I1 => \run_mag2_reg_n_0_[2]\,
      I2 => \run_mag2_reg_n_0_[3]\,
      I3 => mag2_pipe_n_102,
      O => new_peak0_carry_i_3_n_0
    );
new_peak0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_pipe_n_105,
      I1 => \run_mag2_reg_n_0_[0]\,
      I2 => \run_mag2_reg_n_0_[1]\,
      I3 => mag2_pipe_n_104,
      O => new_peak0_carry_i_4_n_0
    );
new_peak0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[7]\,
      I1 => mag2_pipe_n_98,
      I2 => \run_mag2_reg_n_0_[6]\,
      I3 => mag2_pipe_n_99,
      O => new_peak0_carry_i_5_n_0
    );
new_peak0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[5]\,
      I1 => mag2_pipe_n_100,
      I2 => \run_mag2_reg_n_0_[4]\,
      I3 => mag2_pipe_n_101,
      O => new_peak0_carry_i_6_n_0
    );
new_peak0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[3]\,
      I1 => mag2_pipe_n_102,
      I2 => \run_mag2_reg_n_0_[2]\,
      I3 => mag2_pipe_n_103,
      O => new_peak0_carry_i_7_n_0
    );
new_peak0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \run_mag2_reg_n_0_[1]\,
      I1 => mag2_pipe_n_104,
      I2 => \run_mag2_reg_n_0_[0]\,
      I3 => mag2_pipe_n_105,
      O => new_peak0_carry_i_8_n_0
    );
\peak_bin[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => valid_pipe,
      I1 => last_pipe,
      O => \peak_bin[15]_i_1_n_0\
    );
\peak_bin_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(0),
      Q => peak_bin(0),
      R => \^clear\
    );
\peak_bin_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(10),
      Q => peak_bin(10),
      R => \^clear\
    );
\peak_bin_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(11),
      Q => peak_bin(11),
      R => \^clear\
    );
\peak_bin_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(12),
      Q => peak_bin(12),
      R => \^clear\
    );
\peak_bin_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(13),
      Q => peak_bin(13),
      R => \^clear\
    );
\peak_bin_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(14),
      Q => peak_bin(14),
      R => \^clear\
    );
\peak_bin_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(15),
      Q => peak_bin(15),
      R => \^clear\
    );
\peak_bin_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(1),
      Q => peak_bin(1),
      R => \^clear\
    );
\peak_bin_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(2),
      Q => peak_bin(2),
      R => \^clear\
    );
\peak_bin_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(3),
      Q => peak_bin(3),
      R => \^clear\
    );
\peak_bin_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(4),
      Q => peak_bin(4),
      R => \^clear\
    );
\peak_bin_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(5),
      Q => peak_bin(5),
      R => \^clear\
    );
\peak_bin_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(6),
      Q => peak_bin(6),
      R => \^clear\
    );
\peak_bin_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(7),
      Q => peak_bin(7),
      R => \^clear\
    );
\peak_bin_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(8),
      Q => peak_bin(8),
      R => \^clear\
    );
\peak_bin_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => run_bin1_in(9),
      Q => peak_bin(9),
      R => \^clear\
    );
\peak_mag2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[0]_i_1_n_0\,
      Q => peak_mag2(0),
      R => \^clear\
    );
\peak_mag2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[10]_i_1_n_0\,
      Q => peak_mag2(10),
      R => \^clear\
    );
\peak_mag2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[11]_i_1_n_0\,
      Q => peak_mag2(11),
      R => \^clear\
    );
\peak_mag2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[12]_i_1_n_0\,
      Q => peak_mag2(12),
      R => \^clear\
    );
\peak_mag2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[13]_i_1_n_0\,
      Q => peak_mag2(13),
      R => \^clear\
    );
\peak_mag2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[14]_i_1_n_0\,
      Q => peak_mag2(14),
      R => \^clear\
    );
\peak_mag2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[15]_i_1_n_0\,
      Q => peak_mag2(15),
      R => \^clear\
    );
\peak_mag2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[16]_i_1_n_0\,
      Q => peak_mag2(16),
      R => \^clear\
    );
\peak_mag2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[17]_i_1_n_0\,
      Q => peak_mag2(17),
      R => \^clear\
    );
\peak_mag2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[18]_i_1_n_0\,
      Q => peak_mag2(18),
      R => \^clear\
    );
\peak_mag2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[19]_i_1_n_0\,
      Q => peak_mag2(19),
      R => \^clear\
    );
\peak_mag2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[1]_i_1_n_0\,
      Q => peak_mag2(1),
      R => \^clear\
    );
\peak_mag2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[20]_i_1_n_0\,
      Q => peak_mag2(20),
      R => \^clear\
    );
\peak_mag2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[21]_i_1_n_0\,
      Q => peak_mag2(21),
      R => \^clear\
    );
\peak_mag2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[22]_i_1_n_0\,
      Q => peak_mag2(22),
      R => \^clear\
    );
\peak_mag2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[23]_i_1_n_0\,
      Q => peak_mag2(23),
      R => \^clear\
    );
\peak_mag2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[24]_i_1_n_0\,
      Q => peak_mag2(24),
      R => \^clear\
    );
\peak_mag2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[25]_i_1_n_0\,
      Q => peak_mag2(25),
      R => \^clear\
    );
\peak_mag2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[26]_i_1_n_0\,
      Q => peak_mag2(26),
      R => \^clear\
    );
\peak_mag2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[27]_i_1_n_0\,
      Q => peak_mag2(27),
      R => \^clear\
    );
\peak_mag2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[28]_i_1_n_0\,
      Q => peak_mag2(28),
      R => \^clear\
    );
\peak_mag2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[29]_i_1_n_0\,
      Q => peak_mag2(29),
      R => \^clear\
    );
\peak_mag2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[2]_i_1_n_0\,
      Q => peak_mag2(2),
      R => \^clear\
    );
\peak_mag2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[30]_i_1_n_0\,
      Q => peak_mag2(30),
      R => \^clear\
    );
\peak_mag2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[31]_i_2_n_0\,
      Q => peak_mag2(31),
      R => \^clear\
    );
\peak_mag2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[3]_i_1_n_0\,
      Q => peak_mag2(3),
      R => \^clear\
    );
\peak_mag2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[4]_i_1_n_0\,
      Q => peak_mag2(4),
      R => \^clear\
    );
\peak_mag2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[5]_i_1_n_0\,
      Q => peak_mag2(5),
      R => \^clear\
    );
\peak_mag2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[6]_i_1_n_0\,
      Q => peak_mag2(6),
      R => \^clear\
    );
\peak_mag2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[7]_i_1_n_0\,
      Q => peak_mag2(7),
      R => \^clear\
    );
\peak_mag2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[8]_i_1_n_0\,
      Q => peak_mag2(8),
      R => \^clear\
    );
\peak_mag2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \peak_bin[15]_i_1_n_0\,
      D => \run_mag2[9]_i_1_n_0\,
      Q => peak_mag2(9),
      R => \^clear\
    );
peak_valid_d_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => peak_valid_d,
      I1 => peak_valid_d_reg_0,
      I2 => \^peak_valid_reg_0\,
      O => peak_valid_d_reg
    );
peak_valid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => last_pipe,
      I1 => valid_pipe,
      I2 => \^peak_valid_reg_0\,
      O => peak_valid_i_1_n_0
    );
peak_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => peak_valid_i_1_n_0,
      Q => \^peak_valid_reg_0\,
      R => \^clear\
    );
re2_pipe_reg: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => s_axis_fft_tdata(15),
      A(28) => s_axis_fft_tdata(15),
      A(27) => s_axis_fft_tdata(15),
      A(26) => s_axis_fft_tdata(15),
      A(25) => s_axis_fft_tdata(15),
      A(24) => s_axis_fft_tdata(15),
      A(23) => s_axis_fft_tdata(15),
      A(22) => s_axis_fft_tdata(15),
      A(21) => s_axis_fft_tdata(15),
      A(20) => s_axis_fft_tdata(15),
      A(19) => s_axis_fft_tdata(15),
      A(18) => s_axis_fft_tdata(15),
      A(17) => s_axis_fft_tdata(15),
      A(16) => s_axis_fft_tdata(15),
      A(15 downto 0) => s_axis_fft_tdata(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_re2_pipe_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => s_axis_fft_tdata(15),
      B(16) => s_axis_fft_tdata(15),
      B(15 downto 0) => s_axis_fft_tdata(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_re2_pipe_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_re2_pipe_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_re2_pipe_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => fire,
      CLK => aclk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_re2_pipe_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_re2_pipe_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_re2_pipe_reg_P_UNCONNECTED(47 downto 32),
      P(31) => re2_pipe_reg_n_74,
      P(30) => re2_pipe_reg_n_75,
      P(29) => re2_pipe_reg_n_76,
      P(28) => re2_pipe_reg_n_77,
      P(27) => re2_pipe_reg_n_78,
      P(26) => re2_pipe_reg_n_79,
      P(25) => re2_pipe_reg_n_80,
      P(24) => re2_pipe_reg_n_81,
      P(23) => re2_pipe_reg_n_82,
      P(22) => re2_pipe_reg_n_83,
      P(21) => re2_pipe_reg_n_84,
      P(20) => re2_pipe_reg_n_85,
      P(19) => re2_pipe_reg_n_86,
      P(18) => re2_pipe_reg_n_87,
      P(17) => re2_pipe_reg_n_88,
      P(16) => re2_pipe_reg_n_89,
      P(15) => re2_pipe_reg_n_90,
      P(14) => re2_pipe_reg_n_91,
      P(13) => re2_pipe_reg_n_92,
      P(12) => re2_pipe_reg_n_93,
      P(11) => re2_pipe_reg_n_94,
      P(10) => re2_pipe_reg_n_95,
      P(9) => re2_pipe_reg_n_96,
      P(8) => re2_pipe_reg_n_97,
      P(7) => re2_pipe_reg_n_98,
      P(6) => re2_pipe_reg_n_99,
      P(5) => re2_pipe_reg_n_100,
      P(4) => re2_pipe_reg_n_101,
      P(3) => re2_pipe_reg_n_102,
      P(2) => re2_pipe_reg_n_103,
      P(1) => re2_pipe_reg_n_104,
      P(0) => re2_pipe_reg_n_105,
      PATTERNBDETECT => NLW_re2_pipe_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_re2_pipe_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => re2_pipe_reg_n_106,
      PCOUT(46) => re2_pipe_reg_n_107,
      PCOUT(45) => re2_pipe_reg_n_108,
      PCOUT(44) => re2_pipe_reg_n_109,
      PCOUT(43) => re2_pipe_reg_n_110,
      PCOUT(42) => re2_pipe_reg_n_111,
      PCOUT(41) => re2_pipe_reg_n_112,
      PCOUT(40) => re2_pipe_reg_n_113,
      PCOUT(39) => re2_pipe_reg_n_114,
      PCOUT(38) => re2_pipe_reg_n_115,
      PCOUT(37) => re2_pipe_reg_n_116,
      PCOUT(36) => re2_pipe_reg_n_117,
      PCOUT(35) => re2_pipe_reg_n_118,
      PCOUT(34) => re2_pipe_reg_n_119,
      PCOUT(33) => re2_pipe_reg_n_120,
      PCOUT(32) => re2_pipe_reg_n_121,
      PCOUT(31) => re2_pipe_reg_n_122,
      PCOUT(30) => re2_pipe_reg_n_123,
      PCOUT(29) => re2_pipe_reg_n_124,
      PCOUT(28) => re2_pipe_reg_n_125,
      PCOUT(27) => re2_pipe_reg_n_126,
      PCOUT(26) => re2_pipe_reg_n_127,
      PCOUT(25) => re2_pipe_reg_n_128,
      PCOUT(24) => re2_pipe_reg_n_129,
      PCOUT(23) => re2_pipe_reg_n_130,
      PCOUT(22) => re2_pipe_reg_n_131,
      PCOUT(21) => re2_pipe_reg_n_132,
      PCOUT(20) => re2_pipe_reg_n_133,
      PCOUT(19) => re2_pipe_reg_n_134,
      PCOUT(18) => re2_pipe_reg_n_135,
      PCOUT(17) => re2_pipe_reg_n_136,
      PCOUT(16) => re2_pipe_reg_n_137,
      PCOUT(15) => re2_pipe_reg_n_138,
      PCOUT(14) => re2_pipe_reg_n_139,
      PCOUT(13) => re2_pipe_reg_n_140,
      PCOUT(12) => re2_pipe_reg_n_141,
      PCOUT(11) => re2_pipe_reg_n_142,
      PCOUT(10) => re2_pipe_reg_n_143,
      PCOUT(9) => re2_pipe_reg_n_144,
      PCOUT(8) => re2_pipe_reg_n_145,
      PCOUT(7) => re2_pipe_reg_n_146,
      PCOUT(6) => re2_pipe_reg_n_147,
      PCOUT(5) => re2_pipe_reg_n_148,
      PCOUT(4) => re2_pipe_reg_n_149,
      PCOUT(3) => re2_pipe_reg_n_150,
      PCOUT(2) => re2_pipe_reg_n_151,
      PCOUT(1) => re2_pipe_reg_n_152,
      PCOUT(0) => re2_pipe_reg_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => \^clear\,
      UNDERFLOW => NLW_re2_pipe_reg_UNDERFLOW_UNCONNECTED
    );
\run_bin[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(0),
      I1 => \new_peak__15\,
      I2 => run_bin(0),
      O => run_bin1_in(0)
    );
\run_bin[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(10),
      I1 => \new_peak__15\,
      I2 => run_bin(10),
      O => run_bin1_in(10)
    );
\run_bin[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(11),
      I1 => \new_peak__15\,
      I2 => run_bin(11),
      O => run_bin1_in(11)
    );
\run_bin[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(12),
      I1 => \new_peak__15\,
      I2 => run_bin(12),
      O => run_bin1_in(12)
    );
\run_bin[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(13),
      I1 => \new_peak__15\,
      I2 => run_bin(13),
      O => run_bin1_in(13)
    );
\run_bin[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(14),
      I1 => \new_peak__15\,
      I2 => run_bin(14),
      O => run_bin1_in(14)
    );
\run_bin[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(15),
      I1 => \new_peak__15\,
      I2 => run_bin(15),
      O => run_bin1_in(15)
    );
\run_bin[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(1),
      I1 => \new_peak__15\,
      I2 => run_bin(1),
      O => run_bin1_in(1)
    );
\run_bin[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(2),
      I1 => \new_peak__15\,
      I2 => run_bin(2),
      O => run_bin1_in(2)
    );
\run_bin[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(3),
      I1 => \new_peak__15\,
      I2 => run_bin(3),
      O => run_bin1_in(3)
    );
\run_bin[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(4),
      I1 => \new_peak__15\,
      I2 => run_bin(4),
      O => run_bin1_in(4)
    );
\run_bin[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(5),
      I1 => \new_peak__15\,
      I2 => run_bin(5),
      O => run_bin1_in(5)
    );
\run_bin[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(6),
      I1 => \new_peak__15\,
      I2 => run_bin(6),
      O => run_bin1_in(6)
    );
\run_bin[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(7),
      I1 => \new_peak__15\,
      I2 => run_bin(7),
      O => run_bin1_in(7)
    );
\run_bin[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(8),
      I1 => \new_peak__15\,
      I2 => run_bin(8),
      O => run_bin1_in(8)
    );
\run_bin[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bin_pipe(9),
      I1 => \new_peak__15\,
      I2 => run_bin(9),
      O => run_bin1_in(9)
    );
\run_bin_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(0),
      Q => run_bin(0),
      R => run_mag2
    );
\run_bin_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(10),
      Q => run_bin(10),
      R => run_mag2
    );
\run_bin_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(11),
      Q => run_bin(11),
      R => run_mag2
    );
\run_bin_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(12),
      Q => run_bin(12),
      R => run_mag2
    );
\run_bin_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(13),
      Q => run_bin(13),
      R => run_mag2
    );
\run_bin_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(14),
      Q => run_bin(14),
      R => run_mag2
    );
\run_bin_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(15),
      Q => run_bin(15),
      R => run_mag2
    );
\run_bin_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(1),
      Q => run_bin(1),
      R => run_mag2
    );
\run_bin_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(2),
      Q => run_bin(2),
      R => run_mag2
    );
\run_bin_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(3),
      Q => run_bin(3),
      R => run_mag2
    );
\run_bin_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(4),
      Q => run_bin(4),
      R => run_mag2
    );
\run_bin_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(5),
      Q => run_bin(5),
      R => run_mag2
    );
\run_bin_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(6),
      Q => run_bin(6),
      R => run_mag2
    );
\run_bin_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(7),
      Q => run_bin(7),
      R => run_mag2
    );
\run_bin_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(8),
      Q => run_bin(8),
      R => run_mag2
    );
\run_bin_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => run_bin1_in(9),
      Q => run_bin(9),
      R => run_mag2
    );
\run_mag2[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_105,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[0]\,
      O => \run_mag2[0]_i_1_n_0\
    );
\run_mag2[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_95,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[10]\,
      O => \run_mag2[10]_i_1_n_0\
    );
\run_mag2[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_94,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[11]\,
      O => \run_mag2[11]_i_1_n_0\
    );
\run_mag2[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_93,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[12]\,
      O => \run_mag2[12]_i_1_n_0\
    );
\run_mag2[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_92,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[13]\,
      O => \run_mag2[13]_i_1_n_0\
    );
\run_mag2[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_91,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[14]\,
      O => \run_mag2[14]_i_1_n_0\
    );
\run_mag2[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_90,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[15]\,
      O => \run_mag2[15]_i_1_n_0\
    );
\run_mag2[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_89,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[16]\,
      O => \run_mag2[16]_i_1_n_0\
    );
\run_mag2[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_88,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[17]\,
      O => \run_mag2[17]_i_1_n_0\
    );
\run_mag2[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_87,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[18]\,
      O => \run_mag2[18]_i_1_n_0\
    );
\run_mag2[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_86,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[19]\,
      O => \run_mag2[19]_i_1_n_0\
    );
\run_mag2[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_104,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[1]\,
      O => \run_mag2[1]_i_1_n_0\
    );
\run_mag2[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_85,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[20]\,
      O => \run_mag2[20]_i_1_n_0\
    );
\run_mag2[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_84,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[21]\,
      O => \run_mag2[21]_i_1_n_0\
    );
\run_mag2[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_83,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[22]\,
      O => \run_mag2[22]_i_1_n_0\
    );
\run_mag2[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_82,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[23]\,
      O => \run_mag2[23]_i_1_n_0\
    );
\run_mag2[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_81,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[24]\,
      O => \run_mag2[24]_i_1_n_0\
    );
\run_mag2[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_80,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[25]\,
      O => \run_mag2[25]_i_1_n_0\
    );
\run_mag2[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_79,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[26]\,
      O => \run_mag2[26]_i_1_n_0\
    );
\run_mag2[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_78,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[27]\,
      O => \run_mag2[27]_i_1_n_0\
    );
\run_mag2[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_77,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[28]\,
      O => \run_mag2[28]_i_1_n_0\
    );
\run_mag2[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_76,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[29]\,
      O => \run_mag2[29]_i_1_n_0\
    );
\run_mag2[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_103,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[2]\,
      O => \run_mag2[2]_i_1_n_0\
    );
\run_mag2[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_75,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[30]\,
      O => \run_mag2[30]_i_1_n_0\
    );
\run_mag2[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => last_pipe,
      I1 => valid_pipe,
      I2 => aresetn,
      O => run_mag2
    );
\run_mag2[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_74,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[31]\,
      O => \run_mag2[31]_i_2_n_0\
    );
\run_mag2[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000000"
    )
        port map (
      I0 => \run_mag2[31]_i_4_n_0\,
      I1 => \run_mag2[31]_i_5_n_0\,
      I2 => \run_mag2[31]_i_6_n_0\,
      I3 => bin_pipe(7),
      I4 => bin_pipe(6),
      I5 => new_peak0,
      O => \new_peak__15\
    );
\run_mag2[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => bin_pipe(10),
      I1 => bin_pipe(11),
      I2 => bin_pipe(9),
      I3 => bin_pipe(8),
      I4 => \run_mag2[31]_i_7_n_0\,
      O => \run_mag2[31]_i_4_n_0\
    );
\run_mag2[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => bin_pipe(0),
      I1 => bin_pipe(1),
      I2 => bin_pipe(2),
      I3 => bin_pipe(3),
      O => \run_mag2[31]_i_5_n_0\
    );
\run_mag2[31]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bin_pipe(4),
      I1 => bin_pipe(5),
      O => \run_mag2[31]_i_6_n_0\
    );
\run_mag2[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => bin_pipe(12),
      I1 => bin_pipe(13),
      I2 => bin_pipe(15),
      I3 => bin_pipe(14),
      O => \run_mag2[31]_i_7_n_0\
    );
\run_mag2[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_102,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[3]\,
      O => \run_mag2[3]_i_1_n_0\
    );
\run_mag2[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_101,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[4]\,
      O => \run_mag2[4]_i_1_n_0\
    );
\run_mag2[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_100,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[5]\,
      O => \run_mag2[5]_i_1_n_0\
    );
\run_mag2[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_99,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[6]\,
      O => \run_mag2[6]_i_1_n_0\
    );
\run_mag2[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_98,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[7]\,
      O => \run_mag2[7]_i_1_n_0\
    );
\run_mag2[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_97,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[8]\,
      O => \run_mag2[8]_i_1_n_0\
    );
\run_mag2[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mag2_pipe_n_96,
      I1 => \new_peak__15\,
      I2 => \run_mag2_reg_n_0_[9]\,
      O => \run_mag2[9]_i_1_n_0\
    );
\run_mag2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[0]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[0]\,
      R => run_mag2
    );
\run_mag2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[10]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[10]\,
      R => run_mag2
    );
\run_mag2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[11]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[11]\,
      R => run_mag2
    );
\run_mag2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[12]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[12]\,
      R => run_mag2
    );
\run_mag2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[13]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[13]\,
      R => run_mag2
    );
\run_mag2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[14]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[14]\,
      R => run_mag2
    );
\run_mag2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[15]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[15]\,
      R => run_mag2
    );
\run_mag2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[16]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[16]\,
      R => run_mag2
    );
\run_mag2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[17]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[17]\,
      R => run_mag2
    );
\run_mag2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[18]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[18]\,
      R => run_mag2
    );
\run_mag2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[19]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[19]\,
      R => run_mag2
    );
\run_mag2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[1]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[1]\,
      R => run_mag2
    );
\run_mag2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[20]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[20]\,
      R => run_mag2
    );
\run_mag2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[21]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[21]\,
      R => run_mag2
    );
\run_mag2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[22]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[22]\,
      R => run_mag2
    );
\run_mag2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[23]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[23]\,
      R => run_mag2
    );
\run_mag2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[24]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[24]\,
      R => run_mag2
    );
\run_mag2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[25]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[25]\,
      R => run_mag2
    );
\run_mag2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[26]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[26]\,
      R => run_mag2
    );
\run_mag2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[27]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[27]\,
      R => run_mag2
    );
\run_mag2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[28]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[28]\,
      R => run_mag2
    );
\run_mag2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[29]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[29]\,
      R => run_mag2
    );
\run_mag2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[2]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[2]\,
      R => run_mag2
    );
\run_mag2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[30]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[30]\,
      R => run_mag2
    );
\run_mag2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[31]_i_2_n_0\,
      Q => \run_mag2_reg_n_0_[31]\,
      R => run_mag2
    );
\run_mag2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[3]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[3]\,
      R => run_mag2
    );
\run_mag2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[4]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[4]\,
      R => run_mag2
    );
\run_mag2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[5]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[5]\,
      R => run_mag2
    );
\run_mag2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[6]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[6]\,
      R => run_mag2
    );
\run_mag2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[7]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[7]\,
      R => run_mag2
    );
\run_mag2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[8]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[8]\,
      R => run_mag2
    );
\run_mag2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => valid_pipe,
      D => \run_mag2[9]_i_1_n_0\,
      Q => \run_mag2_reg_n_0_[9]\,
      R => run_mag2
    );
s_axi_bvalid_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => \^clear\
    );
\s_axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFEFCFECCCEFCCEC"
    )
        port map (
      I0 => \s_axi_rdata[0]_i_2_n_0\,
      I1 => \s_axi_rdata_reg[0]\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata[0]_i_4_n_0\,
      I5 => \s_axi_rdata_reg[0]_0\,
      O => D(0)
    );
\s_axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(0),
      I1 => pw_samples(0),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(0),
      I5 => dc_mag2(0),
      O => \s_axi_rdata[0]_i_2_n_0\
    );
\s_axi_rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => \^peak_valid_reg_0\,
      I1 => Q(0),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => re2_pipe_reg_0,
      I5 => \s_axi_rdata_reg[15]\(0),
      O => \s_axi_rdata[0]_i_4_n_0\
    );
\s_axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[10]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[10]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[10]_0\,
      O => D(6)
    );
\s_axi_rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(7),
      I3 => Q(7),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[10]_i_5_n_0\,
      O => \s_axi_rdata[10]_i_2_n_0\
    );
\s_axi_rdata[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(10),
      I1 => pw_samples(10),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(10),
      I5 => dc_mag2(10),
      O => \s_axi_rdata[10]_i_5_n_0\
    );
\s_axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[11]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[11]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[11]_0\,
      O => D(7)
    );
\s_axi_rdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(8),
      I3 => Q(8),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[11]_i_5_n_0\,
      O => \s_axi_rdata[11]_i_2_n_0\
    );
\s_axi_rdata[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(11),
      I1 => pw_samples(11),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(11),
      I5 => dc_mag2(11),
      O => \s_axi_rdata[11]_i_5_n_0\
    );
\s_axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[12]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[12]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[12]_0\,
      O => D(8)
    );
\s_axi_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(9),
      I3 => Q(9),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[12]_i_5_n_0\,
      O => \s_axi_rdata[12]_i_2_n_0\
    );
\s_axi_rdata[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(12),
      I1 => pw_samples(12),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(12),
      I5 => dc_mag2(12),
      O => \s_axi_rdata[12]_i_5_n_0\
    );
\s_axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[13]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[13]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[13]_0\,
      O => D(9)
    );
\s_axi_rdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(10),
      I3 => Q(10),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[13]_i_5_n_0\,
      O => \s_axi_rdata[13]_i_2_n_0\
    );
\s_axi_rdata[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(13),
      I1 => pw_samples(13),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(13),
      I5 => dc_mag2(13),
      O => \s_axi_rdata[13]_i_5_n_0\
    );
\s_axi_rdata[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(11),
      I3 => Q(11),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[14]_i_5_n_0\,
      O => \s_axi_araddr[3]_0\
    );
\s_axi_rdata[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(14),
      I1 => pw_samples(14),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(14),
      I5 => dc_mag2(14),
      O => \s_axi_rdata[14]_i_5_n_0\
    );
\s_axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[15]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[15]_0\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[15]_1\,
      O => D(10)
    );
\s_axi_rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(12),
      I3 => Q(12),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[15]_i_5_n_0\,
      O => \s_axi_rdata[15]_i_2_n_0\
    );
\s_axi_rdata[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(15),
      I1 => pw_samples(15),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(15),
      I5 => dc_mag2(15),
      O => \s_axi_rdata[15]_i_5_n_0\
    );
\s_axi_rdata[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(16),
      I4 => peak_mag2(16),
      I5 => dc_mag2(16),
      O => s_axi_araddr_2_sn_1
    );
\s_axi_rdata[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(17),
      I4 => peak_mag2(17),
      I5 => dc_mag2(17),
      O => \s_axi_araddr[2]_0\
    );
\s_axi_rdata[18]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(18),
      I4 => peak_mag2(18),
      I5 => dc_mag2(18),
      O => \s_axi_araddr[2]_1\
    );
\s_axi_rdata[19]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(19),
      I4 => peak_mag2(19),
      I5 => dc_mag2(19),
      O => \s_axi_araddr[2]_2\
    );
\s_axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(1),
      I1 => pw_samples(1),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(1),
      I5 => dc_mag2(1),
      O => \peak_mag2_reg[1]_0\
    );
\s_axi_rdata[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(20),
      I4 => peak_mag2(20),
      I5 => dc_mag2(20),
      O => \s_axi_araddr[2]_3\
    );
\s_axi_rdata[21]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(21),
      I4 => peak_mag2(21),
      I5 => dc_mag2(21),
      O => \s_axi_araddr[2]_4\
    );
\s_axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[22]\,
      I1 => Q(13),
      I2 => \s_axi_rdata_reg[22]_0\,
      I3 => \s_axi_rdata[22]_i_3_n_0\,
      I4 => \s_axi_rdata_reg[22]_1\,
      I5 => \s_axi_rdata_reg[5]_0\,
      O => D(11)
    );
\s_axi_rdata[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(22),
      I4 => peak_mag2(22),
      I5 => dc_mag2(22),
      O => \s_axi_rdata[22]_i_3_n_0\
    );
\s_axi_rdata[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(23),
      I4 => peak_mag2(23),
      I5 => dc_mag2(23),
      O => \s_axi_araddr[2]_5\
    );
\s_axi_rdata[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(24),
      I4 => peak_mag2(24),
      I5 => dc_mag2(24),
      O => \s_axi_araddr[2]_6\
    );
\s_axi_rdata[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(25),
      I4 => peak_mag2(25),
      I5 => dc_mag2(25),
      O => \s_axi_araddr[2]_7\
    );
\s_axi_rdata[26]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(26),
      I4 => peak_mag2(26),
      I5 => dc_mag2(26),
      O => \s_axi_araddr[2]_8\
    );
\s_axi_rdata[27]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(27),
      I4 => peak_mag2(27),
      I5 => dc_mag2(27),
      O => \s_axi_araddr[2]_9\
    );
\s_axi_rdata[28]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(28),
      I4 => peak_mag2(28),
      I5 => dc_mag2(28),
      O => \s_axi_araddr[2]_10\
    );
\s_axi_rdata[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(29),
      I4 => peak_mag2(29),
      I5 => dc_mag2(29),
      O => \s_axi_araddr[2]_11\
    );
\s_axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(2),
      I1 => pw_samples(2),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(2),
      I5 => dc_mag2(2),
      O => \peak_mag2_reg[2]_0\
    );
\s_axi_rdata[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(30),
      I4 => peak_mag2(30),
      I5 => dc_mag2(30),
      O => \s_axi_araddr[2]_12\
    );
\s_axi_rdata[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A828A02088088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => pw_samples(31),
      I4 => peak_mag2(31),
      I5 => dc_mag2(31),
      O => \s_axi_araddr[2]_13\
    );
\s_axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFEFCFECCCEFCCEC"
    )
        port map (
      I0 => \s_axi_rdata[3]_i_2_n_0\,
      I1 => \s_axi_rdata_reg[3]\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata[3]_i_4_n_0\,
      I5 => \s_axi_rdata_reg[3]_0\,
      O => D(1)
    );
\s_axi_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(3),
      I1 => pw_samples(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(3),
      I5 => dc_mag2(3),
      O => \s_axi_rdata[3]_i_2_n_0\
    );
\s_axi_rdata[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \s_axi_rdata_reg[15]\(1),
      I1 => frame_busy,
      I2 => Q(1),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      O => \s_axi_rdata[3]_i_4_n_0\
    );
\s_axi_rdata[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(4),
      I1 => pw_samples(4),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(4),
      I5 => dc_mag2(4),
      O => \peak_mag2_reg[4]_0\
    );
\s_axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[5]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[5]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[5]_1\,
      O => D(2)
    );
\s_axi_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(2),
      I3 => Q(2),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[5]_i_5_n_0\,
      O => \s_axi_rdata[5]_i_2_n_0\
    );
\s_axi_rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(5),
      I1 => pw_samples(5),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(5),
      I5 => dc_mag2(5),
      O => \s_axi_rdata[5]_i_5_n_0\
    );
\s_axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[6]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[6]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[6]_0\,
      O => D(3)
    );
\s_axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(3),
      I3 => Q(3),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[6]_i_5_n_0\,
      O => \s_axi_rdata[6]_i_2_n_0\
    );
\s_axi_rdata[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(6),
      I1 => pw_samples(6),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(6),
      I5 => dc_mag2(6),
      O => \s_axi_rdata[6]_i_5_n_0\
    );
\s_axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[7]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[7]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[7]_0\,
      O => D(4)
    );
\s_axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(4),
      I3 => Q(4),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[7]_i_5_n_0\,
      O => \s_axi_rdata[7]_i_2_n_0\
    );
\s_axi_rdata[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(7),
      I1 => pw_samples(7),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(7),
      I5 => dc_mag2(7),
      O => \s_axi_rdata[7]_i_5_n_0\
    );
\s_axi_rdata[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(5),
      I3 => Q(5),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[8]_i_5_n_0\,
      O => s_axi_araddr_3_sn_1
    );
\s_axi_rdata[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(8),
      I1 => pw_samples(8),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(8),
      I5 => dc_mag2(8),
      O => \s_axi_rdata[8]_i_5_n_0\
    );
\s_axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF2E22"
    )
        port map (
      I0 => \s_axi_rdata[9]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(2),
      I3 => \s_axi_rdata_reg[9]\,
      I4 => \s_axi_rdata_reg[5]_0\,
      I5 => \s_axi_rdata_reg[9]_0\,
      O => D(5)
    );
\s_axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8200000A820"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_araddr(0),
      I2 => \s_axi_rdata_reg[15]\(6),
      I3 => Q(6),
      I4 => s_axi_araddr(2),
      I5 => \s_axi_rdata[9]_i_5_n_0\,
      O => \s_axi_rdata[9]_i_2_n_0\
    );
\s_axi_rdata[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => peak_mag2(9),
      I1 => pw_samples(9),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => peak_bin(9),
      I5 => dc_mag2(9),
      O => \s_axi_rdata[9]_i_5_n_0\
    );
valid_pipe_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => fire,
      Q => valid_pipe,
      R => \^clear\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity radar_system_radar_core_0_0_axis_pulse_detect is
  port (
    soft_reset_r_reg : out STD_LOGIC;
    in_pulse_reg_0 : out STD_LOGIC;
    have_rise : out STD_LOGIC;
    in_pulse012_out : out STD_LOGIC;
    \pulse_count_reg[0]_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 19 downto 0 );
    \pulse_count_reg[3]_0\ : out STD_LOGIC;
    \pulse_count_reg[5]_0\ : out STD_LOGIC;
    \pulse_count_reg[6]_0\ : out STD_LOGIC;
    \pulse_count_reg[7]_0\ : out STD_LOGIC;
    \pulse_count_reg[9]_0\ : out STD_LOGIC;
    \pulse_count_reg[10]_0\ : out STD_LOGIC;
    \pulse_count_reg[11]_0\ : out STD_LOGIC;
    \pulse_count_reg[12]_0\ : out STD_LOGIC;
    \pulse_count_reg[13]_0\ : out STD_LOGIC;
    \pulse_count_reg[15]_0\ : out STD_LOGIC;
    s_axi_araddr_2_sp_1 : out STD_LOGIC;
    pw_samples : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sample_fire : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \pulse_count_reg[31]_0\ : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    \pri_samples_reg[0]_0\ : in STD_LOGIC;
    \pri_samples_reg[0]_1\ : in STD_LOGIC;
    m_axis_fft_tready : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \s_axi_rdata_reg[15]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \s_axi_rdata_reg[1]\ : in STD_LOGIC;
    \s_axi_rdata_reg[1]_0\ : in STD_LOGIC;
    \s_axi_rdata[4]_i_2_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \s_axi_rdata_reg[2]\ : in STD_LOGIC;
    \s_axi_rdata_reg[2]_0\ : in STD_LOGIC;
    p_4_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \s_axi_rdata_reg[4]\ : in STD_LOGIC;
    \s_axi_rdata_reg[4]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[8]\ : in STD_LOGIC;
    \s_axi_rdata_reg[8]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[8]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[14]\ : in STD_LOGIC;
    \s_axi_rdata_reg[14]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[16]\ : in STD_LOGIC;
    \s_axi_rdata_reg[16]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[16]_1\ : in STD_LOGIC;
    \s_axi_rdata_reg[16]_2\ : in STD_LOGIC;
    \s_axi_rdata_reg[17]\ : in STD_LOGIC;
    frame_count_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \s_axi_rdata_reg[29]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \s_axi_rdata_reg[18]\ : in STD_LOGIC;
    \s_axi_rdata_reg[18]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[19]\ : in STD_LOGIC;
    \s_axi_rdata_reg[19]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[20]\ : in STD_LOGIC;
    \s_axi_rdata_reg[21]\ : in STD_LOGIC;
    \s_axi_rdata_reg[21]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[23]\ : in STD_LOGIC;
    \s_axi_rdata_reg[23]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[24]\ : in STD_LOGIC;
    \s_axi_rdata_reg[25]\ : in STD_LOGIC;
    \s_axi_rdata_reg[25]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[26]\ : in STD_LOGIC;
    \s_axi_rdata_reg[26]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[27]\ : in STD_LOGIC;
    \s_axi_rdata_reg[27]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[28]\ : in STD_LOGIC;
    \s_axi_rdata_reg[28]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[29]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[30]\ : in STD_LOGIC;
    \s_axi_rdata_reg[30]_0\ : in STD_LOGIC;
    \s_axi_rdata_reg[31]\ : in STD_LOGIC;
    \s_axi_rdata_reg[31]_0\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    \since_rise_reg[31]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of radar_system_radar_core_0_0_axis_pulse_detect : entity is "axis_pulse_detect";
end radar_system_radar_core_0_0_axis_pulse_detect;

architecture STRUCTURE of radar_system_radar_core_0_0_axis_pulse_detect is
  signal above : STD_LOGIC;
  signal above013_in : STD_LOGIC;
  signal \above0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \above0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \above0_carry__0_n_0\ : STD_LOGIC;
  signal \above0_carry__0_n_1\ : STD_LOGIC;
  signal \above0_carry__0_n_2\ : STD_LOGIC;
  signal \above0_carry__0_n_3\ : STD_LOGIC;
  signal \above0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \above0_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \above0_carry__1_n_0\ : STD_LOGIC;
  signal \above0_carry__1_n_1\ : STD_LOGIC;
  signal \above0_carry__1_n_2\ : STD_LOGIC;
  signal \above0_carry__1_n_3\ : STD_LOGIC;
  signal \above0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \above0_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \above0_carry__2_n_1\ : STD_LOGIC;
  signal \above0_carry__2_n_2\ : STD_LOGIC;
  signal \above0_carry__2_n_3\ : STD_LOGIC;
  signal above0_carry_i_1_n_0 : STD_LOGIC;
  signal above0_carry_i_2_n_0 : STD_LOGIC;
  signal above0_carry_i_3_n_0 : STD_LOGIC;
  signal above0_carry_i_4_n_0 : STD_LOGIC;
  signal above0_carry_i_5_n_0 : STD_LOGIC;
  signal above0_carry_i_6_n_0 : STD_LOGIC;
  signal above0_carry_i_7_n_0 : STD_LOGIC;
  signal above0_carry_i_8_n_0 : STD_LOGIC;
  signal above0_carry_n_0 : STD_LOGIC;
  signal above0_carry_n_1 : STD_LOGIC;
  signal above0_carry_n_2 : STD_LOGIC;
  signal above0_carry_n_3 : STD_LOGIC;
  signal above_d : STD_LOGIC;
  signal above_d_i_10_n_0 : STD_LOGIC;
  signal above_d_i_3_n_0 : STD_LOGIC;
  signal above_d_i_4_n_0 : STD_LOGIC;
  signal above_d_i_5_n_0 : STD_LOGIC;
  signal above_d_i_6_n_0 : STD_LOGIC;
  signal above_d_i_7_n_0 : STD_LOGIC;
  signal above_d_i_8_n_0 : STD_LOGIC;
  signal above_d_i_9_n_0 : STD_LOGIC;
  signal \^have_rise\ : STD_LOGIC;
  signal have_rise7_out : STD_LOGIC;
  signal have_rise_i_1_n_0 : STD_LOGIC;
  signal i2_n_100 : STD_LOGIC;
  signal i2_n_101 : STD_LOGIC;
  signal i2_n_102 : STD_LOGIC;
  signal i2_n_103 : STD_LOGIC;
  signal i2_n_104 : STD_LOGIC;
  signal i2_n_105 : STD_LOGIC;
  signal i2_n_106 : STD_LOGIC;
  signal i2_n_107 : STD_LOGIC;
  signal i2_n_108 : STD_LOGIC;
  signal i2_n_109 : STD_LOGIC;
  signal i2_n_110 : STD_LOGIC;
  signal i2_n_111 : STD_LOGIC;
  signal i2_n_112 : STD_LOGIC;
  signal i2_n_113 : STD_LOGIC;
  signal i2_n_114 : STD_LOGIC;
  signal i2_n_115 : STD_LOGIC;
  signal i2_n_116 : STD_LOGIC;
  signal i2_n_117 : STD_LOGIC;
  signal i2_n_118 : STD_LOGIC;
  signal i2_n_119 : STD_LOGIC;
  signal i2_n_120 : STD_LOGIC;
  signal i2_n_121 : STD_LOGIC;
  signal i2_n_122 : STD_LOGIC;
  signal i2_n_123 : STD_LOGIC;
  signal i2_n_124 : STD_LOGIC;
  signal i2_n_125 : STD_LOGIC;
  signal i2_n_126 : STD_LOGIC;
  signal i2_n_127 : STD_LOGIC;
  signal i2_n_128 : STD_LOGIC;
  signal i2_n_129 : STD_LOGIC;
  signal i2_n_130 : STD_LOGIC;
  signal i2_n_131 : STD_LOGIC;
  signal i2_n_132 : STD_LOGIC;
  signal i2_n_133 : STD_LOGIC;
  signal i2_n_134 : STD_LOGIC;
  signal i2_n_135 : STD_LOGIC;
  signal i2_n_136 : STD_LOGIC;
  signal i2_n_137 : STD_LOGIC;
  signal i2_n_138 : STD_LOGIC;
  signal i2_n_139 : STD_LOGIC;
  signal i2_n_140 : STD_LOGIC;
  signal i2_n_141 : STD_LOGIC;
  signal i2_n_142 : STD_LOGIC;
  signal i2_n_143 : STD_LOGIC;
  signal i2_n_144 : STD_LOGIC;
  signal i2_n_145 : STD_LOGIC;
  signal i2_n_146 : STD_LOGIC;
  signal i2_n_147 : STD_LOGIC;
  signal i2_n_148 : STD_LOGIC;
  signal i2_n_149 : STD_LOGIC;
  signal i2_n_150 : STD_LOGIC;
  signal i2_n_151 : STD_LOGIC;
  signal i2_n_152 : STD_LOGIC;
  signal i2_n_153 : STD_LOGIC;
  signal i2_n_74 : STD_LOGIC;
  signal i2_n_75 : STD_LOGIC;
  signal i2_n_76 : STD_LOGIC;
  signal i2_n_77 : STD_LOGIC;
  signal i2_n_78 : STD_LOGIC;
  signal i2_n_79 : STD_LOGIC;
  signal i2_n_80 : STD_LOGIC;
  signal i2_n_81 : STD_LOGIC;
  signal i2_n_82 : STD_LOGIC;
  signal i2_n_83 : STD_LOGIC;
  signal i2_n_84 : STD_LOGIC;
  signal i2_n_85 : STD_LOGIC;
  signal i2_n_86 : STD_LOGIC;
  signal i2_n_87 : STD_LOGIC;
  signal i2_n_88 : STD_LOGIC;
  signal i2_n_89 : STD_LOGIC;
  signal i2_n_90 : STD_LOGIC;
  signal i2_n_91 : STD_LOGIC;
  signal i2_n_92 : STD_LOGIC;
  signal i2_n_93 : STD_LOGIC;
  signal i2_n_94 : STD_LOGIC;
  signal i2_n_95 : STD_LOGIC;
  signal i2_n_96 : STD_LOGIC;
  signal i2_n_97 : STD_LOGIC;
  signal i2_n_98 : STD_LOGIC;
  signal i2_n_99 : STD_LOGIC;
  signal \^in_pulse012_out\ : STD_LOGIC;
  signal in_pulse_i_2_n_0 : STD_LOGIC;
  signal \^in_pulse_reg_0\ : STD_LOGIC;
  signal last_mag2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mag2_n_100 : STD_LOGIC;
  signal mag2_n_101 : STD_LOGIC;
  signal mag2_n_102 : STD_LOGIC;
  signal mag2_n_103 : STD_LOGIC;
  signal mag2_n_104 : STD_LOGIC;
  signal mag2_n_105 : STD_LOGIC;
  signal mag2_n_74 : STD_LOGIC;
  signal mag2_n_75 : STD_LOGIC;
  signal mag2_n_76 : STD_LOGIC;
  signal mag2_n_77 : STD_LOGIC;
  signal mag2_n_78 : STD_LOGIC;
  signal mag2_n_79 : STD_LOGIC;
  signal mag2_n_80 : STD_LOGIC;
  signal mag2_n_81 : STD_LOGIC;
  signal mag2_n_82 : STD_LOGIC;
  signal mag2_n_83 : STD_LOGIC;
  signal mag2_n_84 : STD_LOGIC;
  signal mag2_n_85 : STD_LOGIC;
  signal mag2_n_86 : STD_LOGIC;
  signal mag2_n_87 : STD_LOGIC;
  signal mag2_n_88 : STD_LOGIC;
  signal mag2_n_89 : STD_LOGIC;
  signal mag2_n_90 : STD_LOGIC;
  signal mag2_n_91 : STD_LOGIC;
  signal mag2_n_92 : STD_LOGIC;
  signal mag2_n_93 : STD_LOGIC;
  signal mag2_n_94 : STD_LOGIC;
  signal mag2_n_95 : STD_LOGIC;
  signal mag2_n_96 : STD_LOGIC;
  signal mag2_n_97 : STD_LOGIC;
  signal mag2_n_98 : STD_LOGIC;
  signal mag2_n_99 : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal pri_samples : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \pri_samples[31]_i_1_n_0\ : STD_LOGIC;
  signal pri_valid : STD_LOGIC;
  signal pri_valid_i_1_n_0 : STD_LOGIC;
  signal pulse_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \pulse_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pulse_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal pulse_valid : STD_LOGIC;
  signal pulse_valid_i_1_n_0 : STD_LOGIC;
  signal pw_acc : STD_LOGIC_VECTOR ( 2 to 2 );
  signal pw_acc0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \pw_acc0_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__6_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \pw_acc0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \pw_acc[0]_i_1_n_0\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[0]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[10]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[11]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[12]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[13]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[14]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[15]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[16]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[17]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[18]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[19]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[1]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[20]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[21]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[22]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[23]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[24]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[25]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[26]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[27]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[28]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[29]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[2]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[30]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[31]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[3]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[4]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[5]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[6]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[7]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[8]\ : STD_LOGIC;
  signal \pw_acc_reg_n_0_[9]\ : STD_LOGIC;
  signal \^pw_samples\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \pw_samples[0]_i_1_n_0\ : STD_LOGIC;
  signal \pw_samples[0]_i_2_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_10_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_1_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_2_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_3_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_4_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_5_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_6_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_7_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_8_n_0\ : STD_LOGIC;
  signal \pw_samples[31]_i_9_n_0\ : STD_LOGIC;
  signal s_axi_araddr_2_sn_1 : STD_LOGIC;
  signal \s_axi_rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \since_rise[0]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg[31]_i_3_n_2\ : STD_LOGIC;
  signal \since_rise_reg[31]_i_3_n_3\ : STD_LOGIC;
  signal \since_rise_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \since_rise_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \since_rise_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \since_rise_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[0]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[10]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[11]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[12]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[13]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[14]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[15]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[16]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[17]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[18]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[19]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[1]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[20]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[21]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[22]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[23]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[24]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[25]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[26]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[27]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[28]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[29]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[2]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[30]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[31]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[3]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[4]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[5]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[6]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[7]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[8]\ : STD_LOGIC;
  signal \since_rise_reg_n_0_[9]\ : STD_LOGIC;
  signal \^soft_reset_r_reg\ : STD_LOGIC;
  signal NLW_above0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_above0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_above0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_above0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i2_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_i2_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_i2_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_i2_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_i2_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_i2_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_i2_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_i2_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_i2_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i2_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_mag2_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mag2_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_mag2_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_mag2_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mag2_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_mag2_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_pulse_count_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_pw_acc0_inferred__0/i__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_pw_acc0_inferred__0/i__carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_since_rise_reg[31]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_since_rise_reg[31]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of above0_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \above0_carry__0\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \above0_carry__1\ : label is 11;
  attribute COMPARATOR_THRESHOLD of \above0_carry__2\ : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of above_d_i_2 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of have_rise_i_1 : label is "soft_lutpair28";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of i2 : label is "{SYNTH-13 {cell *THIS*}}";
  attribute SOFT_HLUTNM of in_pulse_i_2 : label is "soft_lutpair27";
  attribute METHODOLOGY_DRC_VIOS of mag2 : label is "{SYNTH-13 {cell *THIS*}}";
  attribute SOFT_HLUTNM of pri_valid_i_1 : label is "soft_lutpair28";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \pulse_count_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pulse_count_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \pw_acc0_inferred__0/i__carry__6\ : label is 35;
  attribute SOFT_HLUTNM of \pw_acc[0]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \since_rise[31]_i_4\ : label is "soft_lutpair26";
  attribute ADDER_THRESHOLD of \since_rise_reg[12]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[16]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[20]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[24]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[28]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[31]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \since_rise_reg[8]_i_1\ : label is 35;
begin
  have_rise <= \^have_rise\;
  in_pulse012_out <= \^in_pulse012_out\;
  in_pulse_reg_0 <= \^in_pulse_reg_0\;
  pw_samples(31 downto 0) <= \^pw_samples\(31 downto 0);
  s_axi_araddr_2_sp_1 <= s_axi_araddr_2_sn_1;
  soft_reset_r_reg <= \^soft_reset_r_reg\;
above0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => above0_carry_n_0,
      CO(2) => above0_carry_n_1,
      CO(1) => above0_carry_n_2,
      CO(0) => above0_carry_n_3,
      CYINIT => '1',
      DI(3) => above0_carry_i_1_n_0,
      DI(2) => above0_carry_i_2_n_0,
      DI(1) => above0_carry_i_3_n_0,
      DI(0) => above0_carry_i_4_n_0,
      O(3 downto 0) => NLW_above0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => above0_carry_i_5_n_0,
      S(2) => above0_carry_i_6_n_0,
      S(1) => above0_carry_i_7_n_0,
      S(0) => above0_carry_i_8_n_0
    );
\above0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => above0_carry_n_0,
      CO(3) => \above0_carry__0_n_0\,
      CO(2) => \above0_carry__0_n_1\,
      CO(1) => \above0_carry__0_n_2\,
      CO(0) => \above0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \above0_carry__0_i_1_n_0\,
      DI(2) => \above0_carry__0_i_2_n_0\,
      DI(1) => \above0_carry__0_i_3_n_0\,
      DI(0) => \above0_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_above0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \above0_carry__0_i_5_n_0\,
      S(2) => \above0_carry__0_i_6_n_0\,
      S(1) => \above0_carry__0_i_7_n_0\,
      S(0) => \above0_carry__0_i_8_n_0\
    );
\above0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_91,
      I1 => Q(14),
      I2 => Q(15),
      I3 => mag2_n_90,
      O => \above0_carry__0_i_1_n_0\
    );
\above0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_93,
      I1 => Q(12),
      I2 => Q(13),
      I3 => mag2_n_92,
      O => \above0_carry__0_i_2_n_0\
    );
\above0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_95,
      I1 => Q(10),
      I2 => Q(11),
      I3 => mag2_n_94,
      O => \above0_carry__0_i_3_n_0\
    );
\above0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_97,
      I1 => Q(8),
      I2 => Q(9),
      I3 => mag2_n_96,
      O => \above0_carry__0_i_4_n_0\
    );
\above0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(15),
      I1 => mag2_n_90,
      I2 => Q(14),
      I3 => mag2_n_91,
      O => \above0_carry__0_i_5_n_0\
    );
\above0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(13),
      I1 => mag2_n_92,
      I2 => Q(12),
      I3 => mag2_n_93,
      O => \above0_carry__0_i_6_n_0\
    );
\above0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(11),
      I1 => mag2_n_94,
      I2 => Q(10),
      I3 => mag2_n_95,
      O => \above0_carry__0_i_7_n_0\
    );
\above0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(9),
      I1 => mag2_n_96,
      I2 => Q(8),
      I3 => mag2_n_97,
      O => \above0_carry__0_i_8_n_0\
    );
\above0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \above0_carry__0_n_0\,
      CO(3) => \above0_carry__1_n_0\,
      CO(2) => \above0_carry__1_n_1\,
      CO(1) => \above0_carry__1_n_2\,
      CO(0) => \above0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \above0_carry__1_i_1_n_0\,
      DI(2) => \above0_carry__1_i_2_n_0\,
      DI(1) => \above0_carry__1_i_3_n_0\,
      DI(0) => \above0_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_above0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \above0_carry__1_i_5_n_0\,
      S(2) => \above0_carry__1_i_6_n_0\,
      S(1) => \above0_carry__1_i_7_n_0\,
      S(0) => \above0_carry__1_i_8_n_0\
    );
\above0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_83,
      I1 => Q(22),
      I2 => Q(23),
      I3 => mag2_n_82,
      O => \above0_carry__1_i_1_n_0\
    );
\above0_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_85,
      I1 => Q(20),
      I2 => Q(21),
      I3 => mag2_n_84,
      O => \above0_carry__1_i_2_n_0\
    );
\above0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_87,
      I1 => Q(18),
      I2 => Q(19),
      I3 => mag2_n_86,
      O => \above0_carry__1_i_3_n_0\
    );
\above0_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_89,
      I1 => Q(16),
      I2 => Q(17),
      I3 => mag2_n_88,
      O => \above0_carry__1_i_4_n_0\
    );
\above0_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(23),
      I1 => mag2_n_82,
      I2 => Q(22),
      I3 => mag2_n_83,
      O => \above0_carry__1_i_5_n_0\
    );
\above0_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(21),
      I1 => mag2_n_84,
      I2 => Q(20),
      I3 => mag2_n_85,
      O => \above0_carry__1_i_6_n_0\
    );
\above0_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(19),
      I1 => mag2_n_86,
      I2 => Q(18),
      I3 => mag2_n_87,
      O => \above0_carry__1_i_7_n_0\
    );
\above0_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(17),
      I1 => mag2_n_88,
      I2 => Q(16),
      I3 => mag2_n_89,
      O => \above0_carry__1_i_8_n_0\
    );
\above0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \above0_carry__1_n_0\,
      CO(3) => above013_in,
      CO(2) => \above0_carry__2_n_1\,
      CO(1) => \above0_carry__2_n_2\,
      CO(0) => \above0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \above0_carry__2_i_1_n_0\,
      DI(2) => \above0_carry__2_i_2_n_0\,
      DI(1) => \above0_carry__2_i_3_n_0\,
      DI(0) => \above0_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_above0_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \above0_carry__2_i_5_n_0\,
      S(2) => \above0_carry__2_i_6_n_0\,
      S(1) => \above0_carry__2_i_7_n_0\,
      S(0) => \above0_carry__2_i_8_n_0\
    );
\above0_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_75,
      I1 => Q(30),
      I2 => Q(31),
      I3 => mag2_n_74,
      O => \above0_carry__2_i_1_n_0\
    );
\above0_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_77,
      I1 => Q(28),
      I2 => Q(29),
      I3 => mag2_n_76,
      O => \above0_carry__2_i_2_n_0\
    );
\above0_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_79,
      I1 => Q(26),
      I2 => Q(27),
      I3 => mag2_n_78,
      O => \above0_carry__2_i_3_n_0\
    );
\above0_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_81,
      I1 => Q(24),
      I2 => Q(25),
      I3 => mag2_n_80,
      O => \above0_carry__2_i_4_n_0\
    );
\above0_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(31),
      I1 => mag2_n_74,
      I2 => Q(30),
      I3 => mag2_n_75,
      O => \above0_carry__2_i_5_n_0\
    );
\above0_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(29),
      I1 => mag2_n_76,
      I2 => Q(28),
      I3 => mag2_n_77,
      O => \above0_carry__2_i_6_n_0\
    );
\above0_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(27),
      I1 => mag2_n_78,
      I2 => Q(26),
      I3 => mag2_n_79,
      O => \above0_carry__2_i_7_n_0\
    );
\above0_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(25),
      I1 => mag2_n_80,
      I2 => Q(24),
      I3 => mag2_n_81,
      O => \above0_carry__2_i_8_n_0\
    );
above0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_99,
      I1 => Q(6),
      I2 => Q(7),
      I3 => mag2_n_98,
      O => above0_carry_i_1_n_0
    );
above0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_101,
      I1 => Q(4),
      I2 => Q(5),
      I3 => mag2_n_100,
      O => above0_carry_i_2_n_0
    );
above0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_103,
      I1 => Q(2),
      I2 => Q(3),
      I3 => mag2_n_102,
      O => above0_carry_i_3_n_0
    );
above0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => mag2_n_105,
      I1 => Q(0),
      I2 => Q(1),
      I3 => mag2_n_104,
      O => above0_carry_i_4_n_0
    );
above0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(7),
      I1 => mag2_n_98,
      I2 => Q(6),
      I3 => mag2_n_99,
      O => above0_carry_i_5_n_0
    );
above0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(5),
      I1 => mag2_n_100,
      I2 => Q(4),
      I3 => mag2_n_101,
      O => above0_carry_i_6_n_0
    );
above0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(3),
      I1 => mag2_n_102,
      I2 => Q(2),
      I3 => mag2_n_103,
      O => above0_carry_i_7_n_0
    );
above0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => Q(1),
      I1 => mag2_n_104,
      I2 => Q(0),
      I3 => mag2_n_105,
      O => above0_carry_i_8_n_0
    );
above_d_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Q(13),
      I1 => Q(12),
      I2 => Q(11),
      I3 => Q(10),
      I4 => Q(0),
      I5 => Q(1),
      O => above_d_i_10_n_0
    );
above_d_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => above013_in,
      I1 => above_d_i_3_n_0,
      I2 => above_d_i_4_n_0,
      I3 => above_d_i_5_n_0,
      O => above
    );
above_d_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Q(6),
      I1 => Q(7),
      I2 => Q(8),
      I3 => Q(9),
      O => above_d_i_3_n_0
    );
above_d_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Q(14),
      I1 => Q(15),
      I2 => above_d_i_6_n_0,
      I3 => above_d_i_7_n_0,
      I4 => above_d_i_8_n_0,
      I5 => above_d_i_9_n_0,
      O => above_d_i_4_n_0
    );
above_d_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => above_d_i_10_n_0,
      I1 => Q(5),
      I2 => Q(4),
      I3 => Q(3),
      I4 => Q(2),
      O => above_d_i_5_n_0
    );
above_d_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Q(24),
      I1 => Q(25),
      I2 => Q(26),
      I3 => Q(27),
      O => above_d_i_6_n_0
    );
above_d_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Q(28),
      I1 => Q(29),
      I2 => Q(31),
      I3 => Q(30),
      O => above_d_i_7_n_0
    );
above_d_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Q(16),
      I1 => Q(17),
      I2 => Q(18),
      I3 => Q(19),
      O => above_d_i_8_n_0
    );
above_d_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => Q(20),
      I1 => Q(21),
      I2 => Q(22),
      I3 => Q(23),
      O => above_d_i_9_n_0
    );
above_d_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => above,
      Q => above_d,
      R => \^soft_reset_r_reg\
    );
have_rise_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => have_rise7_out,
      I1 => \^have_rise\,
      O => have_rise_i_1_n_0
    );
have_rise_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => have_rise_i_1_n_0,
      Q => \^have_rise\,
      R => \^soft_reset_r_reg\
    );
i2: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => s_axis_tdata(15),
      A(28) => s_axis_tdata(15),
      A(27) => s_axis_tdata(15),
      A(26) => s_axis_tdata(15),
      A(25) => s_axis_tdata(15),
      A(24) => s_axis_tdata(15),
      A(23) => s_axis_tdata(15),
      A(22) => s_axis_tdata(15),
      A(21) => s_axis_tdata(15),
      A(20) => s_axis_tdata(15),
      A(19) => s_axis_tdata(15),
      A(18) => s_axis_tdata(15),
      A(17) => s_axis_tdata(15),
      A(16) => s_axis_tdata(15),
      A(15 downto 0) => s_axis_tdata(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_i2_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => s_axis_tdata(15),
      B(16) => s_axis_tdata(15),
      B(15 downto 0) => s_axis_tdata(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_i2_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_i2_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_i2_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_i2_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_i2_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_i2_P_UNCONNECTED(47 downto 32),
      P(31) => i2_n_74,
      P(30) => i2_n_75,
      P(29) => i2_n_76,
      P(28) => i2_n_77,
      P(27) => i2_n_78,
      P(26) => i2_n_79,
      P(25) => i2_n_80,
      P(24) => i2_n_81,
      P(23) => i2_n_82,
      P(22) => i2_n_83,
      P(21) => i2_n_84,
      P(20) => i2_n_85,
      P(19) => i2_n_86,
      P(18) => i2_n_87,
      P(17) => i2_n_88,
      P(16) => i2_n_89,
      P(15) => i2_n_90,
      P(14) => i2_n_91,
      P(13) => i2_n_92,
      P(12) => i2_n_93,
      P(11) => i2_n_94,
      P(10) => i2_n_95,
      P(9) => i2_n_96,
      P(8) => i2_n_97,
      P(7) => i2_n_98,
      P(6) => i2_n_99,
      P(5) => i2_n_100,
      P(4) => i2_n_101,
      P(3) => i2_n_102,
      P(2) => i2_n_103,
      P(1) => i2_n_104,
      P(0) => i2_n_105,
      PATTERNBDETECT => NLW_i2_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_i2_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => i2_n_106,
      PCOUT(46) => i2_n_107,
      PCOUT(45) => i2_n_108,
      PCOUT(44) => i2_n_109,
      PCOUT(43) => i2_n_110,
      PCOUT(42) => i2_n_111,
      PCOUT(41) => i2_n_112,
      PCOUT(40) => i2_n_113,
      PCOUT(39) => i2_n_114,
      PCOUT(38) => i2_n_115,
      PCOUT(37) => i2_n_116,
      PCOUT(36) => i2_n_117,
      PCOUT(35) => i2_n_118,
      PCOUT(34) => i2_n_119,
      PCOUT(33) => i2_n_120,
      PCOUT(32) => i2_n_121,
      PCOUT(31) => i2_n_122,
      PCOUT(30) => i2_n_123,
      PCOUT(29) => i2_n_124,
      PCOUT(28) => i2_n_125,
      PCOUT(27) => i2_n_126,
      PCOUT(26) => i2_n_127,
      PCOUT(25) => i2_n_128,
      PCOUT(24) => i2_n_129,
      PCOUT(23) => i2_n_130,
      PCOUT(22) => i2_n_131,
      PCOUT(21) => i2_n_132,
      PCOUT(20) => i2_n_133,
      PCOUT(19) => i2_n_134,
      PCOUT(18) => i2_n_135,
      PCOUT(17) => i2_n_136,
      PCOUT(16) => i2_n_137,
      PCOUT(15) => i2_n_138,
      PCOUT(14) => i2_n_139,
      PCOUT(13) => i2_n_140,
      PCOUT(12) => i2_n_141,
      PCOUT(11) => i2_n_142,
      PCOUT(10) => i2_n_143,
      PCOUT(9) => i2_n_144,
      PCOUT(8) => i2_n_145,
      PCOUT(7) => i2_n_146,
      PCOUT(6) => i2_n_147,
      PCOUT(5) => i2_n_148,
      PCOUT(4) => i2_n_149,
      PCOUT(3) => i2_n_150,
      PCOUT(2) => i2_n_151,
      PCOUT(1) => i2_n_152,
      PCOUT(0) => i2_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_i2_UNDERFLOW_UNCONNECTED
    );
in_pulse_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \pulse_count_reg[31]_0\,
      I1 => aresetn,
      O => \^soft_reset_r_reg\
    );
in_pulse_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF20"
    )
        port map (
      I0 => above,
      I1 => above_d,
      I2 => sample_fire,
      I3 => \^in_pulse_reg_0\,
      O => in_pulse_i_2_n_0
    );
in_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => in_pulse_i_2_n_0,
      Q => \^in_pulse_reg_0\,
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_105,
      Q => last_mag2(0),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_95,
      Q => last_mag2(10),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_94,
      Q => last_mag2(11),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_93,
      Q => last_mag2(12),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_92,
      Q => last_mag2(13),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_91,
      Q => last_mag2(14),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_90,
      Q => last_mag2(15),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_89,
      Q => last_mag2(16),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_88,
      Q => last_mag2(17),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_87,
      Q => last_mag2(18),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_86,
      Q => last_mag2(19),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_104,
      Q => last_mag2(1),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_85,
      Q => last_mag2(20),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_84,
      Q => last_mag2(21),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_83,
      Q => last_mag2(22),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_82,
      Q => last_mag2(23),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_81,
      Q => last_mag2(24),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_80,
      Q => last_mag2(25),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_79,
      Q => last_mag2(26),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_78,
      Q => last_mag2(27),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_77,
      Q => last_mag2(28),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_76,
      Q => last_mag2(29),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_103,
      Q => last_mag2(2),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_75,
      Q => last_mag2(30),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_74,
      Q => last_mag2(31),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_102,
      Q => last_mag2(3),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_101,
      Q => last_mag2(4),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_100,
      Q => last_mag2(5),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_99,
      Q => last_mag2(6),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_98,
      Q => last_mag2(7),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_97,
      Q => last_mag2(8),
      R => \^soft_reset_r_reg\
    );
\last_mag2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => sample_fire,
      D => mag2_n_96,
      Q => last_mag2(9),
      R => \^soft_reset_r_reg\
    );
mag2: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29) => s_axis_tdata(31),
      A(28) => s_axis_tdata(31),
      A(27) => s_axis_tdata(31),
      A(26) => s_axis_tdata(31),
      A(25) => s_axis_tdata(31),
      A(24) => s_axis_tdata(31),
      A(23) => s_axis_tdata(31),
      A(22) => s_axis_tdata(31),
      A(21) => s_axis_tdata(31),
      A(20) => s_axis_tdata(31),
      A(19) => s_axis_tdata(31),
      A(18) => s_axis_tdata(31),
      A(17) => s_axis_tdata(31),
      A(16) => s_axis_tdata(31),
      A(15 downto 0) => s_axis_tdata(31 downto 16),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_mag2_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => s_axis_tdata(31),
      B(16) => s_axis_tdata(31),
      B(15 downto 0) => s_axis_tdata(31 downto 16),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_mag2_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_mag2_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_mag2_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_mag2_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0010101",
      OVERFLOW => NLW_mag2_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_mag2_P_UNCONNECTED(47 downto 32),
      P(31) => mag2_n_74,
      P(30) => mag2_n_75,
      P(29) => mag2_n_76,
      P(28) => mag2_n_77,
      P(27) => mag2_n_78,
      P(26) => mag2_n_79,
      P(25) => mag2_n_80,
      P(24) => mag2_n_81,
      P(23) => mag2_n_82,
      P(22) => mag2_n_83,
      P(21) => mag2_n_84,
      P(20) => mag2_n_85,
      P(19) => mag2_n_86,
      P(18) => mag2_n_87,
      P(17) => mag2_n_88,
      P(16) => mag2_n_89,
      P(15) => mag2_n_90,
      P(14) => mag2_n_91,
      P(13) => mag2_n_92,
      P(12) => mag2_n_93,
      P(11) => mag2_n_94,
      P(10) => mag2_n_95,
      P(9) => mag2_n_96,
      P(8) => mag2_n_97,
      P(7) => mag2_n_98,
      P(6) => mag2_n_99,
      P(5) => mag2_n_100,
      P(4) => mag2_n_101,
      P(3) => mag2_n_102,
      P(2) => mag2_n_103,
      P(1) => mag2_n_104,
      P(0) => mag2_n_105,
      PATTERNBDETECT => NLW_mag2_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_mag2_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => i2_n_106,
      PCIN(46) => i2_n_107,
      PCIN(45) => i2_n_108,
      PCIN(44) => i2_n_109,
      PCIN(43) => i2_n_110,
      PCIN(42) => i2_n_111,
      PCIN(41) => i2_n_112,
      PCIN(40) => i2_n_113,
      PCIN(39) => i2_n_114,
      PCIN(38) => i2_n_115,
      PCIN(37) => i2_n_116,
      PCIN(36) => i2_n_117,
      PCIN(35) => i2_n_118,
      PCIN(34) => i2_n_119,
      PCIN(33) => i2_n_120,
      PCIN(32) => i2_n_121,
      PCIN(31) => i2_n_122,
      PCIN(30) => i2_n_123,
      PCIN(29) => i2_n_124,
      PCIN(28) => i2_n_125,
      PCIN(27) => i2_n_126,
      PCIN(26) => i2_n_127,
      PCIN(25) => i2_n_128,
      PCIN(24) => i2_n_129,
      PCIN(23) => i2_n_130,
      PCIN(22) => i2_n_131,
      PCIN(21) => i2_n_132,
      PCIN(20) => i2_n_133,
      PCIN(19) => i2_n_134,
      PCIN(18) => i2_n_135,
      PCIN(17) => i2_n_136,
      PCIN(16) => i2_n_137,
      PCIN(15) => i2_n_138,
      PCIN(14) => i2_n_139,
      PCIN(13) => i2_n_140,
      PCIN(12) => i2_n_141,
      PCIN(11) => i2_n_142,
      PCIN(10) => i2_n_143,
      PCIN(9) => i2_n_144,
      PCIN(8) => i2_n_145,
      PCIN(7) => i2_n_146,
      PCIN(6) => i2_n_147,
      PCIN(5) => i2_n_148,
      PCIN(4) => i2_n_149,
      PCIN(3) => i2_n_150,
      PCIN(2) => i2_n_151,
      PCIN(1) => i2_n_152,
      PCIN(0) => i2_n_153,
      PCOUT(47 downto 0) => NLW_mag2_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_mag2_UNDERFLOW_UNCONNECTED
    );
\pri_samples[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080008000000000"
    )
        port map (
      I0 => \^have_rise\,
      I1 => s_axis_tvalid,
      I2 => \pri_samples_reg[0]_0\,
      I3 => \pri_samples_reg[0]_1\,
      I4 => m_axis_fft_tready,
      I5 => \^in_pulse012_out\,
      O => \pri_samples[31]_i_1_n_0\
    );
\pri_samples_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[0]\,
      Q => pri_samples(0),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[10]\,
      Q => pri_samples(10),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[11]\,
      Q => pri_samples(11),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[12]\,
      Q => pri_samples(12),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[13]\,
      Q => pri_samples(13),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[14]\,
      Q => pri_samples(14),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[15]\,
      Q => pri_samples(15),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[16]\,
      Q => pri_samples(16),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[17]\,
      Q => pri_samples(17),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[18]\,
      Q => pri_samples(18),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[19]\,
      Q => pri_samples(19),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[1]\,
      Q => pri_samples(1),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[20]\,
      Q => pri_samples(20),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[21]\,
      Q => pri_samples(21),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[22]\,
      Q => pri_samples(22),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[23]\,
      Q => pri_samples(23),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[24]\,
      Q => pri_samples(24),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[25]\,
      Q => pri_samples(25),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[26]\,
      Q => pri_samples(26),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[27]\,
      Q => pri_samples(27),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[28]\,
      Q => pri_samples(28),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[29]\,
      Q => pri_samples(29),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[2]\,
      Q => pri_samples(2),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[30]\,
      Q => pri_samples(30),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[31]\,
      Q => pri_samples(31),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[3]\,
      Q => pri_samples(3),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[4]\,
      Q => pri_samples(4),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[5]\,
      Q => pri_samples(5),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[6]\,
      Q => pri_samples(6),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[7]\,
      Q => pri_samples(7),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[8]\,
      Q => pri_samples(8),
      R => \^soft_reset_r_reg\
    );
\pri_samples_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pri_samples[31]_i_1_n_0\,
      D => \since_rise_reg_n_0_[9]\,
      Q => pri_samples(9),
      R => \^soft_reset_r_reg\
    );
pri_valid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => \^in_pulse012_out\,
      I1 => sample_fire,
      I2 => \^have_rise\,
      I3 => pri_valid,
      O => pri_valid_i_1_n_0
    );
pri_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => pri_valid_i_1_n_0,
      Q => pri_valid,
      R => \^soft_reset_r_reg\
    );
\pulse_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020202020202000"
    )
        port map (
      I0 => sample_fire,
      I1 => above_d,
      I2 => above013_in,
      I3 => above_d_i_3_n_0,
      I4 => above_d_i_4_n_0,
      I5 => above_d_i_5_n_0,
      O => have_rise7_out
    );
\pulse_count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pulse_count(0),
      O => \pulse_count[0]_i_3_n_0\
    );
\pulse_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[0]_i_2_n_7\,
      Q => pulse_count(0),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pulse_count_reg[0]_i_2_n_0\,
      CO(2) => \pulse_count_reg[0]_i_2_n_1\,
      CO(1) => \pulse_count_reg[0]_i_2_n_2\,
      CO(0) => \pulse_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pulse_count_reg[0]_i_2_n_4\,
      O(2) => \pulse_count_reg[0]_i_2_n_5\,
      O(1) => \pulse_count_reg[0]_i_2_n_6\,
      O(0) => \pulse_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => pulse_count(3 downto 1),
      S(0) => \pulse_count[0]_i_3_n_0\
    );
\pulse_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[8]_i_1_n_5\,
      Q => pulse_count(10),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[8]_i_1_n_4\,
      Q => pulse_count(11),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[12]_i_1_n_7\,
      Q => pulse_count(12),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[8]_i_1_n_0\,
      CO(3) => \pulse_count_reg[12]_i_1_n_0\,
      CO(2) => \pulse_count_reg[12]_i_1_n_1\,
      CO(1) => \pulse_count_reg[12]_i_1_n_2\,
      CO(0) => \pulse_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[12]_i_1_n_4\,
      O(2) => \pulse_count_reg[12]_i_1_n_5\,
      O(1) => \pulse_count_reg[12]_i_1_n_6\,
      O(0) => \pulse_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => pulse_count(15 downto 12)
    );
\pulse_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[12]_i_1_n_6\,
      Q => pulse_count(13),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[12]_i_1_n_5\,
      Q => pulse_count(14),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[12]_i_1_n_4\,
      Q => pulse_count(15),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[16]_i_1_n_7\,
      Q => pulse_count(16),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[12]_i_1_n_0\,
      CO(3) => \pulse_count_reg[16]_i_1_n_0\,
      CO(2) => \pulse_count_reg[16]_i_1_n_1\,
      CO(1) => \pulse_count_reg[16]_i_1_n_2\,
      CO(0) => \pulse_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[16]_i_1_n_4\,
      O(2) => \pulse_count_reg[16]_i_1_n_5\,
      O(1) => \pulse_count_reg[16]_i_1_n_6\,
      O(0) => \pulse_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => pulse_count(19 downto 16)
    );
\pulse_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[16]_i_1_n_6\,
      Q => pulse_count(17),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[16]_i_1_n_5\,
      Q => pulse_count(18),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[16]_i_1_n_4\,
      Q => pulse_count(19),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[0]_i_2_n_6\,
      Q => pulse_count(1),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[20]_i_1_n_7\,
      Q => pulse_count(20),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[16]_i_1_n_0\,
      CO(3) => \pulse_count_reg[20]_i_1_n_0\,
      CO(2) => \pulse_count_reg[20]_i_1_n_1\,
      CO(1) => \pulse_count_reg[20]_i_1_n_2\,
      CO(0) => \pulse_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[20]_i_1_n_4\,
      O(2) => \pulse_count_reg[20]_i_1_n_5\,
      O(1) => \pulse_count_reg[20]_i_1_n_6\,
      O(0) => \pulse_count_reg[20]_i_1_n_7\,
      S(3 downto 0) => pulse_count(23 downto 20)
    );
\pulse_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[20]_i_1_n_6\,
      Q => pulse_count(21),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[20]_i_1_n_5\,
      Q => pulse_count(22),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[20]_i_1_n_4\,
      Q => pulse_count(23),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[24]_i_1_n_7\,
      Q => pulse_count(24),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[20]_i_1_n_0\,
      CO(3) => \pulse_count_reg[24]_i_1_n_0\,
      CO(2) => \pulse_count_reg[24]_i_1_n_1\,
      CO(1) => \pulse_count_reg[24]_i_1_n_2\,
      CO(0) => \pulse_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[24]_i_1_n_4\,
      O(2) => \pulse_count_reg[24]_i_1_n_5\,
      O(1) => \pulse_count_reg[24]_i_1_n_6\,
      O(0) => \pulse_count_reg[24]_i_1_n_7\,
      S(3 downto 0) => pulse_count(27 downto 24)
    );
\pulse_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[24]_i_1_n_6\,
      Q => pulse_count(25),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[24]_i_1_n_5\,
      Q => pulse_count(26),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[24]_i_1_n_4\,
      Q => pulse_count(27),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[28]_i_1_n_7\,
      Q => pulse_count(28),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[24]_i_1_n_0\,
      CO(3) => \NLW_pulse_count_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pulse_count_reg[28]_i_1_n_1\,
      CO(1) => \pulse_count_reg[28]_i_1_n_2\,
      CO(0) => \pulse_count_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[28]_i_1_n_4\,
      O(2) => \pulse_count_reg[28]_i_1_n_5\,
      O(1) => \pulse_count_reg[28]_i_1_n_6\,
      O(0) => \pulse_count_reg[28]_i_1_n_7\,
      S(3 downto 0) => pulse_count(31 downto 28)
    );
\pulse_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[28]_i_1_n_6\,
      Q => pulse_count(29),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[0]_i_2_n_5\,
      Q => pulse_count(2),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[28]_i_1_n_5\,
      Q => pulse_count(30),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[28]_i_1_n_4\,
      Q => pulse_count(31),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[0]_i_2_n_4\,
      Q => pulse_count(3),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[4]_i_1_n_7\,
      Q => pulse_count(4),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[0]_i_2_n_0\,
      CO(3) => \pulse_count_reg[4]_i_1_n_0\,
      CO(2) => \pulse_count_reg[4]_i_1_n_1\,
      CO(1) => \pulse_count_reg[4]_i_1_n_2\,
      CO(0) => \pulse_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[4]_i_1_n_4\,
      O(2) => \pulse_count_reg[4]_i_1_n_5\,
      O(1) => \pulse_count_reg[4]_i_1_n_6\,
      O(0) => \pulse_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => pulse_count(7 downto 4)
    );
\pulse_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[4]_i_1_n_6\,
      Q => pulse_count(5),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[4]_i_1_n_5\,
      Q => pulse_count(6),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[4]_i_1_n_4\,
      Q => pulse_count(7),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[8]_i_1_n_7\,
      Q => pulse_count(8),
      R => \^soft_reset_r_reg\
    );
\pulse_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pulse_count_reg[4]_i_1_n_0\,
      CO(3) => \pulse_count_reg[8]_i_1_n_0\,
      CO(2) => \pulse_count_reg[8]_i_1_n_1\,
      CO(1) => \pulse_count_reg[8]_i_1_n_2\,
      CO(0) => \pulse_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pulse_count_reg[8]_i_1_n_4\,
      O(2) => \pulse_count_reg[8]_i_1_n_5\,
      O(1) => \pulse_count_reg[8]_i_1_n_6\,
      O(0) => \pulse_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => pulse_count(11 downto 8)
    );
\pulse_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => have_rise7_out,
      D => \pulse_count_reg[8]_i_1_n_6\,
      Q => pulse_count(9),
      R => \^soft_reset_r_reg\
    );
pulse_valid_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \pw_samples[31]_i_2_n_0\,
      I1 => pulse_valid,
      O => pulse_valid_i_1_n_0
    );
pulse_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => pulse_valid_i_1_n_0,
      Q => pulse_valid,
      R => \^soft_reset_r_reg\
    );
\pw_acc0_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pw_acc0_inferred__0/i__carry_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry_n_3\,
      CYINIT => \pw_acc_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(4 downto 1),
      S(3) => \pw_acc_reg_n_0_[4]\,
      S(2) => \pw_acc_reg_n_0_[3]\,
      S(1) => \pw_acc_reg_n_0_[2]\,
      S(0) => \pw_acc_reg_n_0_[1]\
    );
\pw_acc0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry_n_0\,
      CO(3) => \pw_acc0_inferred__0/i__carry__0_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry__0_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry__0_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(8 downto 5),
      S(3) => \pw_acc_reg_n_0_[8]\,
      S(2) => \pw_acc_reg_n_0_[7]\,
      S(1) => \pw_acc_reg_n_0_[6]\,
      S(0) => \pw_acc_reg_n_0_[5]\
    );
\pw_acc0_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry__0_n_0\,
      CO(3) => \pw_acc0_inferred__0/i__carry__1_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry__1_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry__1_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(12 downto 9),
      S(3) => \pw_acc_reg_n_0_[12]\,
      S(2) => \pw_acc_reg_n_0_[11]\,
      S(1) => \pw_acc_reg_n_0_[10]\,
      S(0) => \pw_acc_reg_n_0_[9]\
    );
\pw_acc0_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry__1_n_0\,
      CO(3) => \pw_acc0_inferred__0/i__carry__2_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry__2_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry__2_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(16 downto 13),
      S(3) => \pw_acc_reg_n_0_[16]\,
      S(2) => \pw_acc_reg_n_0_[15]\,
      S(1) => \pw_acc_reg_n_0_[14]\,
      S(0) => \pw_acc_reg_n_0_[13]\
    );
\pw_acc0_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry__2_n_0\,
      CO(3) => \pw_acc0_inferred__0/i__carry__3_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry__3_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry__3_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(20 downto 17),
      S(3) => \pw_acc_reg_n_0_[20]\,
      S(2) => \pw_acc_reg_n_0_[19]\,
      S(1) => \pw_acc_reg_n_0_[18]\,
      S(0) => \pw_acc_reg_n_0_[17]\
    );
\pw_acc0_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry__3_n_0\,
      CO(3) => \pw_acc0_inferred__0/i__carry__4_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry__4_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry__4_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(24 downto 21),
      S(3) => \pw_acc_reg_n_0_[24]\,
      S(2) => \pw_acc_reg_n_0_[23]\,
      S(1) => \pw_acc_reg_n_0_[22]\,
      S(0) => \pw_acc_reg_n_0_[21]\
    );
\pw_acc0_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry__4_n_0\,
      CO(3) => \pw_acc0_inferred__0/i__carry__5_n_0\,
      CO(2) => \pw_acc0_inferred__0/i__carry__5_n_1\,
      CO(1) => \pw_acc0_inferred__0/i__carry__5_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => pw_acc0(28 downto 25),
      S(3) => \pw_acc_reg_n_0_[28]\,
      S(2) => \pw_acc_reg_n_0_[27]\,
      S(1) => \pw_acc_reg_n_0_[26]\,
      S(0) => \pw_acc_reg_n_0_[25]\
    );
\pw_acc0_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \pw_acc0_inferred__0/i__carry__5_n_0\,
      CO(3 downto 2) => \NLW_pw_acc0_inferred__0/i__carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \pw_acc0_inferred__0/i__carry__6_n_2\,
      CO(0) => \pw_acc0_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_pw_acc0_inferred__0/i__carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => pw_acc0(31 downto 29),
      S(3) => '0',
      S(2) => \pw_acc_reg_n_0_[31]\,
      S(1) => \pw_acc_reg_n_0_[30]\,
      S(0) => \pw_acc_reg_n_0_[29]\
    );
\pw_acc[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F578A08"
    )
        port map (
      I0 => sample_fire,
      I1 => \^in_pulse_reg_0\,
      I2 => above_d,
      I3 => above,
      I4 => \pw_acc_reg_n_0_[0]\,
      O => \pw_acc[0]_i_1_n_0\
    );
\pw_acc[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CEEC"
    )
        port map (
      I0 => sample_fire,
      I1 => \^soft_reset_r_reg\,
      I2 => above,
      I3 => above_d,
      O => pw_acc(2)
    );
\pw_acc_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pw_acc[0]_i_1_n_0\,
      Q => \pw_acc_reg_n_0_[0]\,
      R => \^soft_reset_r_reg\
    );
\pw_acc_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(10),
      Q => \pw_acc_reg_n_0_[10]\,
      R => pw_acc(2)
    );
\pw_acc_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(11),
      Q => \pw_acc_reg_n_0_[11]\,
      R => pw_acc(2)
    );
\pw_acc_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(12),
      Q => \pw_acc_reg_n_0_[12]\,
      R => pw_acc(2)
    );
\pw_acc_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(13),
      Q => \pw_acc_reg_n_0_[13]\,
      R => pw_acc(2)
    );
\pw_acc_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(14),
      Q => \pw_acc_reg_n_0_[14]\,
      R => pw_acc(2)
    );
\pw_acc_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(15),
      Q => \pw_acc_reg_n_0_[15]\,
      R => pw_acc(2)
    );
\pw_acc_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(16),
      Q => \pw_acc_reg_n_0_[16]\,
      R => pw_acc(2)
    );
\pw_acc_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(17),
      Q => \pw_acc_reg_n_0_[17]\,
      R => pw_acc(2)
    );
\pw_acc_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(18),
      Q => \pw_acc_reg_n_0_[18]\,
      R => pw_acc(2)
    );
\pw_acc_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(19),
      Q => \pw_acc_reg_n_0_[19]\,
      R => pw_acc(2)
    );
\pw_acc_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(1),
      Q => \pw_acc_reg_n_0_[1]\,
      R => pw_acc(2)
    );
\pw_acc_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(20),
      Q => \pw_acc_reg_n_0_[20]\,
      R => pw_acc(2)
    );
\pw_acc_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(21),
      Q => \pw_acc_reg_n_0_[21]\,
      R => pw_acc(2)
    );
\pw_acc_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(22),
      Q => \pw_acc_reg_n_0_[22]\,
      R => pw_acc(2)
    );
\pw_acc_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(23),
      Q => \pw_acc_reg_n_0_[23]\,
      R => pw_acc(2)
    );
\pw_acc_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(24),
      Q => \pw_acc_reg_n_0_[24]\,
      R => pw_acc(2)
    );
\pw_acc_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(25),
      Q => \pw_acc_reg_n_0_[25]\,
      R => pw_acc(2)
    );
\pw_acc_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(26),
      Q => \pw_acc_reg_n_0_[26]\,
      R => pw_acc(2)
    );
\pw_acc_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(27),
      Q => \pw_acc_reg_n_0_[27]\,
      R => pw_acc(2)
    );
\pw_acc_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(28),
      Q => \pw_acc_reg_n_0_[28]\,
      R => pw_acc(2)
    );
\pw_acc_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(29),
      Q => \pw_acc_reg_n_0_[29]\,
      R => pw_acc(2)
    );
\pw_acc_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(2),
      Q => \pw_acc_reg_n_0_[2]\,
      R => pw_acc(2)
    );
\pw_acc_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(30),
      Q => \pw_acc_reg_n_0_[30]\,
      R => pw_acc(2)
    );
\pw_acc_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(31),
      Q => \pw_acc_reg_n_0_[31]\,
      R => pw_acc(2)
    );
\pw_acc_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(3),
      Q => \pw_acc_reg_n_0_[3]\,
      R => pw_acc(2)
    );
\pw_acc_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(4),
      Q => \pw_acc_reg_n_0_[4]\,
      R => pw_acc(2)
    );
\pw_acc_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(5),
      Q => \pw_acc_reg_n_0_[5]\,
      R => pw_acc(2)
    );
\pw_acc_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(6),
      Q => \pw_acc_reg_n_0_[6]\,
      R => pw_acc(2)
    );
\pw_acc_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(7),
      Q => \pw_acc_reg_n_0_[7]\,
      R => pw_acc(2)
    );
\pw_acc_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(8),
      Q => \pw_acc_reg_n_0_[8]\,
      R => pw_acc(2)
    );
\pw_acc_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => E(0),
      D => pw_acc0(9),
      Q => \pw_acc_reg_n_0_[9]\,
      R => pw_acc(2)
    );
\pw_samples[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBFBB88888F88"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[0]\,
      I1 => \pw_samples[31]_i_2_n_0\,
      I2 => \pw_samples[0]_i_2_n_0\,
      I3 => \pw_samples[31]_i_3_n_0\,
      I4 => \pw_samples[31]_i_4_n_0\,
      I5 => \^pw_samples\(0),
      O => \pw_samples[0]_i_1_n_0\
    );
\pw_samples[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEAFFFFFFFF"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[1]\,
      I1 => above013_in,
      I2 => above_d_i_3_n_0,
      I3 => above_d_i_4_n_0,
      I4 => above_d_i_5_n_0,
      I5 => above_d,
      O => \pw_samples[0]_i_2_n_0\
    );
\pw_samples[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAABAAAAAA"
    )
        port map (
      I0 => \^soft_reset_r_reg\,
      I1 => \pw_acc_reg_n_0_[1]\,
      I2 => above,
      I3 => above_d,
      I4 => \pw_samples[31]_i_3_n_0\,
      I5 => \pw_samples[31]_i_4_n_0\,
      O => \pw_samples[31]_i_1_n_0\
    );
\pw_samples[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[29]\,
      I1 => \pw_acc_reg_n_0_[30]\,
      I2 => \pw_acc_reg_n_0_[31]\,
      I3 => \pw_acc_reg_n_0_[0]\,
      O => \pw_samples[31]_i_10_n_0\
    );
\pw_samples[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222A00000000"
    )
        port map (
      I0 => sample_fire,
      I1 => above013_in,
      I2 => above_d_i_3_n_0,
      I3 => above_d_i_4_n_0,
      I4 => above_d_i_5_n_0,
      I5 => above_d,
      O => \pw_samples[31]_i_2_n_0\
    );
\pw_samples[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => sample_fire,
      I1 => \pw_acc_reg_n_0_[2]\,
      I2 => \pw_acc_reg_n_0_[3]\,
      I3 => \pw_acc_reg_n_0_[4]\,
      I4 => \pw_samples[31]_i_5_n_0\,
      I5 => \pw_samples[31]_i_6_n_0\,
      O => \pw_samples[31]_i_3_n_0\
    );
\pw_samples[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \pw_samples[31]_i_7_n_0\,
      I1 => \pw_acc_reg_n_0_[17]\,
      I2 => \pw_acc_reg_n_0_[18]\,
      I3 => \pw_acc_reg_n_0_[19]\,
      I4 => \pw_acc_reg_n_0_[20]\,
      I5 => \pw_samples[31]_i_8_n_0\,
      O => \pw_samples[31]_i_4_n_0\
    );
\pw_samples[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[8]\,
      I1 => \pw_acc_reg_n_0_[7]\,
      I2 => \pw_acc_reg_n_0_[6]\,
      I3 => \pw_acc_reg_n_0_[5]\,
      O => \pw_samples[31]_i_5_n_0\
    );
\pw_samples[31]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[13]\,
      I1 => \pw_acc_reg_n_0_[14]\,
      I2 => \pw_acc_reg_n_0_[15]\,
      I3 => \pw_acc_reg_n_0_[16]\,
      I4 => \pw_samples[31]_i_9_n_0\,
      O => \pw_samples[31]_i_6_n_0\
    );
\pw_samples[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[21]\,
      I1 => \pw_acc_reg_n_0_[22]\,
      I2 => \pw_acc_reg_n_0_[23]\,
      I3 => \pw_acc_reg_n_0_[24]\,
      O => \pw_samples[31]_i_7_n_0\
    );
\pw_samples[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[28]\,
      I1 => \pw_acc_reg_n_0_[27]\,
      I2 => \pw_acc_reg_n_0_[26]\,
      I3 => \pw_acc_reg_n_0_[25]\,
      I4 => \pw_samples[31]_i_10_n_0\,
      O => \pw_samples[31]_i_8_n_0\
    );
\pw_samples[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \pw_acc_reg_n_0_[12]\,
      I1 => \pw_acc_reg_n_0_[11]\,
      I2 => \pw_acc_reg_n_0_[10]\,
      I3 => \pw_acc_reg_n_0_[9]\,
      O => \pw_samples[31]_i_9_n_0\
    );
\pw_samples_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pw_samples[0]_i_1_n_0\,
      Q => \^pw_samples\(0),
      R => \^soft_reset_r_reg\
    );
\pw_samples_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[10]\,
      Q => \^pw_samples\(10),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[11]\,
      Q => \^pw_samples\(11),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[12]\,
      Q => \^pw_samples\(12),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[13]\,
      Q => \^pw_samples\(13),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[14]\,
      Q => \^pw_samples\(14),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[15]\,
      Q => \^pw_samples\(15),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[16]\,
      Q => \^pw_samples\(16),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[17]\,
      Q => \^pw_samples\(17),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[18]\,
      Q => \^pw_samples\(18),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[19]\,
      Q => \^pw_samples\(19),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[1]\,
      Q => \^pw_samples\(1),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[20]\,
      Q => \^pw_samples\(20),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[21]\,
      Q => \^pw_samples\(21),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[22]\,
      Q => \^pw_samples\(22),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[23]\,
      Q => \^pw_samples\(23),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[24]\,
      Q => \^pw_samples\(24),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[25]\,
      Q => \^pw_samples\(25),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[26]\,
      Q => \^pw_samples\(26),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[27]\,
      Q => \^pw_samples\(27),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[28]\,
      Q => \^pw_samples\(28),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[29]\,
      Q => \^pw_samples\(29),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[2]\,
      Q => \^pw_samples\(2),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[30]\,
      Q => \^pw_samples\(30),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[31]\,
      Q => \^pw_samples\(31),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[3]\,
      Q => \^pw_samples\(3),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[4]\,
      Q => \^pw_samples\(4),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[5]\,
      Q => \^pw_samples\(5),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[6]\,
      Q => \^pw_samples\(6),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[7]\,
      Q => \^pw_samples\(7),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[8]\,
      Q => \^pw_samples\(8),
      R => \pw_samples[31]_i_1_n_0\
    );
\pw_samples_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \pw_samples[31]_i_2_n_0\,
      D => \pw_acc_reg_n_0_[9]\,
      Q => \^pw_samples\(9),
      R => \pw_samples[31]_i_1_n_0\
    );
\s_axi_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(0),
      I1 => last_mag2(0),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(0),
      I5 => \s_axi_rdata_reg[15]\(0),
      O => \pulse_count_reg[0]_0\
    );
\s_axi_rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(10),
      I1 => last_mag2(10),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(10),
      I5 => \s_axi_rdata_reg[15]\(10),
      O => \pulse_count_reg[10]_0\
    );
\s_axi_rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(11),
      I1 => last_mag2(11),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(11),
      I5 => \s_axi_rdata_reg[15]\(11),
      O => \pulse_count_reg[11]_0\
    );
\s_axi_rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(12),
      I1 => last_mag2(12),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(12),
      I5 => \s_axi_rdata_reg[15]\(12),
      O => \pulse_count_reg[12]_0\
    );
\s_axi_rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(13),
      I1 => last_mag2(13),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(13),
      I5 => \s_axi_rdata_reg[15]\(13),
      O => \pulse_count_reg[13]_0\
    );
\s_axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AEFFAEAA"
    )
        port map (
      I0 => \s_axi_rdata_reg[14]\,
      I1 => \s_axi_rdata[14]_i_3_n_0\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata_reg[14]_0\,
      I5 => \s_axi_rdata_reg[8]_1\,
      O => D(4)
    );
\s_axi_rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(14),
      I1 => last_mag2(14),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(14),
      I5 => \s_axi_rdata_reg[15]\(14),
      O => \s_axi_rdata[14]_i_3_n_0\
    );
\s_axi_rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(15),
      I1 => last_mag2(15),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(15),
      I5 => \s_axi_rdata_reg[15]\(15),
      O => \pulse_count_reg[15]_0\
    );
\s_axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]\,
      I1 => Q(16),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[16]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[16]_1\,
      O => D(5)
    );
\s_axi_rdata[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(16),
      I4 => pulse_count(16),
      I5 => pri_samples(16),
      O => \s_axi_rdata[16]_i_3_n_0\
    );
\s_axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF8F8F8"
    )
        port map (
      I0 => \s_axi_rdata[17]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => \s_axi_rdata_reg[17]\,
      I3 => Q(17),
      I4 => \s_axi_rdata_reg[16]_0\,
      I5 => \s_axi_rdata_reg[8]_1\,
      O => D(6)
    );
\s_axi_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFAAAEEAAAAAAAA"
    )
        port map (
      I0 => \s_axi_rdata[17]_i_4_n_0\,
      I1 => frame_count_reg(0),
      I2 => \s_axi_rdata_reg[29]\(0),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[17]_i_2_n_0\
    );
\s_axi_rdata[17]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B391A280"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => last_mag2(17),
      I3 => pulse_count(17),
      I4 => pri_samples(17),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[17]_i_4_n_0\
    );
\s_axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[18]\,
      I1 => Q(18),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[18]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[18]_0\,
      O => D(7)
    );
\s_axi_rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(18),
      I4 => pulse_count(18),
      I5 => pri_samples(18),
      O => \s_axi_rdata[18]_i_3_n_0\
    );
\s_axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[19]\,
      I1 => Q(19),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[19]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[19]_0\,
      O => D(8)
    );
\s_axi_rdata[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(19),
      I4 => pulse_count(19),
      I5 => pri_samples(19),
      O => \s_axi_rdata[19]_i_3_n_0\
    );
\s_axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFEFCFECCCEFCCEC"
    )
        port map (
      I0 => \s_axi_rdata_reg[1]\,
      I1 => \s_axi_rdata_reg[1]_0\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata[1]_i_4_n_0\,
      I5 => \s_axi_rdata[1]_i_5_n_0\,
      O => D(0)
    );
\s_axi_rdata[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \s_axi_rdata[4]_i_2_0\(0),
      I1 => pulse_valid,
      I2 => Q(1),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      O => \s_axi_rdata[1]_i_4_n_0\
    );
\s_axi_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(1),
      I1 => last_mag2(1),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(1),
      I5 => \s_axi_rdata_reg[15]\(1),
      O => \s_axi_rdata[1]_i_5_n_0\
    );
\s_axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF8F8F8"
    )
        port map (
      I0 => \s_axi_rdata[20]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => \s_axi_rdata_reg[20]\,
      I3 => Q(20),
      I4 => \s_axi_rdata_reg[16]_0\,
      I5 => \s_axi_rdata_reg[8]_1\,
      O => D(9)
    );
\s_axi_rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFAAAEEAAAAAAAA"
    )
        port map (
      I0 => \s_axi_rdata[20]_i_4_n_0\,
      I1 => frame_count_reg(1),
      I2 => \s_axi_rdata_reg[29]\(1),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[20]_i_2_n_0\
    );
\s_axi_rdata[20]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B391A280"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => last_mag2(20),
      I3 => pulse_count(20),
      I4 => pri_samples(20),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[20]_i_4_n_0\
    );
\s_axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[21]\,
      I1 => Q(21),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[21]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[21]_0\,
      O => D(10)
    );
\s_axi_rdata[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(21),
      I4 => pulse_count(21),
      I5 => pri_samples(21),
      O => \s_axi_rdata[21]_i_3_n_0\
    );
\s_axi_rdata[22]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(22),
      I4 => pulse_count(22),
      I5 => pri_samples(22),
      O => s_axi_araddr_2_sn_1
    );
\s_axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[23]\,
      I1 => Q(23),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[23]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[23]_0\,
      O => D(11)
    );
\s_axi_rdata[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(23),
      I4 => pulse_count(23),
      I5 => pri_samples(23),
      O => \s_axi_rdata[23]_i_3_n_0\
    );
\s_axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF8F8F8"
    )
        port map (
      I0 => \s_axi_rdata[24]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => \s_axi_rdata_reg[24]\,
      I3 => Q(24),
      I4 => \s_axi_rdata_reg[16]_0\,
      I5 => \s_axi_rdata_reg[8]_1\,
      O => D(12)
    );
\s_axi_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFAAAEEAAAAAAAA"
    )
        port map (
      I0 => \s_axi_rdata[24]_i_4_n_0\,
      I1 => frame_count_reg(2),
      I2 => \s_axi_rdata_reg[29]\(2),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[24]_i_2_n_0\
    );
\s_axi_rdata[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B391A280"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => last_mag2(24),
      I3 => pulse_count(24),
      I4 => pri_samples(24),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[24]_i_4_n_0\
    );
\s_axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[25]\,
      I1 => Q(25),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[25]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[25]_0\,
      O => D(13)
    );
\s_axi_rdata[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(25),
      I4 => pulse_count(25),
      I5 => pri_samples(25),
      O => \s_axi_rdata[25]_i_3_n_0\
    );
\s_axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[26]\,
      I1 => Q(26),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[26]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[26]_0\,
      O => D(14)
    );
\s_axi_rdata[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(26),
      I4 => pulse_count(26),
      I5 => pri_samples(26),
      O => \s_axi_rdata[26]_i_3_n_0\
    );
\s_axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[27]\,
      I1 => Q(27),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[27]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[27]_0\,
      O => D(15)
    );
\s_axi_rdata[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(27),
      I4 => pulse_count(27),
      I5 => pri_samples(27),
      O => \s_axi_rdata[27]_i_3_n_0\
    );
\s_axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[28]\,
      I1 => Q(28),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[28]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[28]_0\,
      O => D(16)
    );
\s_axi_rdata[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(28),
      I4 => pulse_count(28),
      I5 => pri_samples(28),
      O => \s_axi_rdata[28]_i_3_n_0\
    );
\s_axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF8F8F8"
    )
        port map (
      I0 => \s_axi_rdata[29]_i_2_n_0\,
      I1 => s_axi_araddr(3),
      I2 => \s_axi_rdata_reg[29]_0\,
      I3 => Q(29),
      I4 => \s_axi_rdata_reg[16]_0\,
      I5 => \s_axi_rdata_reg[8]_1\,
      O => D(17)
    );
\s_axi_rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFAAAEEAAAAAAAA"
    )
        port map (
      I0 => \s_axi_rdata[29]_i_4_n_0\,
      I1 => frame_count_reg(3),
      I2 => \s_axi_rdata_reg[29]\(3),
      I3 => s_axi_araddr(0),
      I4 => s_axi_araddr(1),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[29]_i_2_n_0\
    );
\s_axi_rdata[29]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B391A280"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_araddr(1),
      I2 => last_mag2(29),
      I3 => pulse_count(29),
      I4 => pri_samples(29),
      I5 => s_axi_araddr(2),
      O => \s_axi_rdata[29]_i_4_n_0\
    );
\s_axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFEFCFECCCEFCCEC"
    )
        port map (
      I0 => \s_axi_rdata_reg[2]\,
      I1 => \s_axi_rdata_reg[2]_0\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata[2]_i_4_n_0\,
      I5 => \s_axi_rdata[2]_i_5_n_0\,
      O => D(1)
    );
\s_axi_rdata[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pri_valid,
      I1 => Q(2),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => p_4_in(0),
      I5 => \s_axi_rdata[4]_i_2_0\(1),
      O => \s_axi_rdata[2]_i_4_n_0\
    );
\s_axi_rdata[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(2),
      I1 => last_mag2(2),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(2),
      I5 => \s_axi_rdata_reg[15]\(2),
      O => \s_axi_rdata[2]_i_5_n_0\
    );
\s_axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[30]\,
      I1 => Q(30),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[30]_i_3_n_0\,
      I5 => \s_axi_rdata_reg[30]_0\,
      O => D(18)
    );
\s_axi_rdata[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(30),
      I4 => pulse_count(30),
      I5 => pri_samples(30),
      O => \s_axi_rdata[30]_i_3_n_0\
    );
\s_axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEA"
    )
        port map (
      I0 => \s_axi_rdata_reg[31]\,
      I1 => Q(31),
      I2 => \s_axi_rdata_reg[16]_0\,
      I3 => \s_axi_rdata_reg[8]_1\,
      I4 => \s_axi_rdata[31]_i_5_n_0\,
      I5 => \s_axi_rdata_reg[31]_0\,
      O => D(19)
    );
\s_axi_rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8A0A820288088000"
    )
        port map (
      I0 => \s_axi_rdata_reg[16]_2\,
      I1 => s_axi_araddr(0),
      I2 => s_axi_araddr(1),
      I3 => last_mag2(31),
      I4 => pulse_count(31),
      I5 => pri_samples(31),
      O => \s_axi_rdata[31]_i_5_n_0\
    );
\s_axi_rdata[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(3),
      I1 => last_mag2(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(3),
      I5 => \s_axi_rdata_reg[15]\(3),
      O => \pulse_count_reg[3]_0\
    );
\s_axi_rdata[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \s_axi_rdata[4]_i_2_n_0\,
      I1 => s_axi_araddr(4),
      I2 => s_axi_araddr(5),
      O => D(2)
    );
\s_axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFEFCFECCCEFCCEC"
    )
        port map (
      I0 => \s_axi_rdata_reg[4]\,
      I1 => \s_axi_rdata_reg[4]_0\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata[4]_i_5_n_0\,
      I5 => \s_axi_rdata[4]_i_6_n_0\,
      O => \s_axi_rdata[4]_i_2_n_0\
    );
\s_axi_rdata[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAA00"
    )
        port map (
      I0 => \s_axi_rdata[4]_i_2_0\(2),
      I1 => \^in_pulse_reg_0\,
      I2 => Q(4),
      I3 => s_axi_araddr(1),
      I4 => s_axi_araddr(0),
      O => \s_axi_rdata[4]_i_5_n_0\
    );
\s_axi_rdata[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(4),
      I1 => last_mag2(4),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(4),
      I5 => \s_axi_rdata_reg[15]\(4),
      O => \s_axi_rdata[4]_i_6_n_0\
    );
\s_axi_rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(5),
      I1 => last_mag2(5),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(5),
      I5 => \s_axi_rdata_reg[15]\(5),
      O => \pulse_count_reg[5]_0\
    );
\s_axi_rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(6),
      I1 => last_mag2(6),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(6),
      I5 => \s_axi_rdata_reg[15]\(6),
      O => \pulse_count_reg[6]_0\
    );
\s_axi_rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(7),
      I1 => last_mag2(7),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(7),
      I5 => \s_axi_rdata_reg[15]\(7),
      O => \pulse_count_reg[7]_0\
    );
\s_axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AEFFAEAA"
    )
        port map (
      I0 => \s_axi_rdata_reg[8]\,
      I1 => \s_axi_rdata[8]_i_3_n_0\,
      I2 => s_axi_araddr(2),
      I3 => s_axi_araddr(3),
      I4 => \s_axi_rdata_reg[8]_0\,
      I5 => \s_axi_rdata_reg[8]_1\,
      O => D(3)
    );
\s_axi_rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(8),
      I1 => last_mag2(8),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(8),
      I5 => \s_axi_rdata_reg[15]\(8),
      O => \s_axi_rdata[8]_i_3_n_0\
    );
\s_axi_rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => pulse_count(9),
      I1 => last_mag2(9),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => pri_samples(9),
      I5 => \s_axi_rdata_reg[15]\(9),
      O => \pulse_count_reg[9]_0\
    );
\since_rise[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7F8"
    )
        port map (
      I0 => \^have_rise\,
      I1 => sample_fire,
      I2 => have_rise7_out,
      I3 => \since_rise_reg_n_0_[0]\,
      O => \since_rise[0]_i_1_n_0\
    );
\since_rise[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FE00"
    )
        port map (
      I0 => above_d_i_5_n_0,
      I1 => above_d_i_4_n_0,
      I2 => above_d_i_3_n_0,
      I3 => above013_in,
      I4 => above_d,
      O => \^in_pulse012_out\
    );
\since_rise_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \since_rise[0]_i_1_n_0\,
      Q => \since_rise_reg_n_0_[0]\,
      R => \^soft_reset_r_reg\
    );
\since_rise_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(10),
      Q => \since_rise_reg_n_0_[10]\,
      R => SR(0)
    );
\since_rise_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(11),
      Q => \since_rise_reg_n_0_[11]\,
      R => SR(0)
    );
\since_rise_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(12),
      Q => \since_rise_reg_n_0_[12]\,
      R => SR(0)
    );
\since_rise_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[8]_i_1_n_0\,
      CO(3) => \since_rise_reg[12]_i_1_n_0\,
      CO(2) => \since_rise_reg[12]_i_1_n_1\,
      CO(1) => \since_rise_reg[12]_i_1_n_2\,
      CO(0) => \since_rise_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(12 downto 9),
      S(3) => \since_rise_reg_n_0_[12]\,
      S(2) => \since_rise_reg_n_0_[11]\,
      S(1) => \since_rise_reg_n_0_[10]\,
      S(0) => \since_rise_reg_n_0_[9]\
    );
\since_rise_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(13),
      Q => \since_rise_reg_n_0_[13]\,
      R => SR(0)
    );
\since_rise_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(14),
      Q => \since_rise_reg_n_0_[14]\,
      R => SR(0)
    );
\since_rise_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(15),
      Q => \since_rise_reg_n_0_[15]\,
      R => SR(0)
    );
\since_rise_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(16),
      Q => \since_rise_reg_n_0_[16]\,
      R => SR(0)
    );
\since_rise_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[12]_i_1_n_0\,
      CO(3) => \since_rise_reg[16]_i_1_n_0\,
      CO(2) => \since_rise_reg[16]_i_1_n_1\,
      CO(1) => \since_rise_reg[16]_i_1_n_2\,
      CO(0) => \since_rise_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(16 downto 13),
      S(3) => \since_rise_reg_n_0_[16]\,
      S(2) => \since_rise_reg_n_0_[15]\,
      S(1) => \since_rise_reg_n_0_[14]\,
      S(0) => \since_rise_reg_n_0_[13]\
    );
\since_rise_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(17),
      Q => \since_rise_reg_n_0_[17]\,
      R => SR(0)
    );
\since_rise_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(18),
      Q => \since_rise_reg_n_0_[18]\,
      R => SR(0)
    );
\since_rise_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(19),
      Q => \since_rise_reg_n_0_[19]\,
      R => SR(0)
    );
\since_rise_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(1),
      Q => \since_rise_reg_n_0_[1]\,
      R => SR(0)
    );
\since_rise_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(20),
      Q => \since_rise_reg_n_0_[20]\,
      R => SR(0)
    );
\since_rise_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[16]_i_1_n_0\,
      CO(3) => \since_rise_reg[20]_i_1_n_0\,
      CO(2) => \since_rise_reg[20]_i_1_n_1\,
      CO(1) => \since_rise_reg[20]_i_1_n_2\,
      CO(0) => \since_rise_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(20 downto 17),
      S(3) => \since_rise_reg_n_0_[20]\,
      S(2) => \since_rise_reg_n_0_[19]\,
      S(1) => \since_rise_reg_n_0_[18]\,
      S(0) => \since_rise_reg_n_0_[17]\
    );
\since_rise_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(21),
      Q => \since_rise_reg_n_0_[21]\,
      R => SR(0)
    );
\since_rise_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(22),
      Q => \since_rise_reg_n_0_[22]\,
      R => SR(0)
    );
\since_rise_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(23),
      Q => \since_rise_reg_n_0_[23]\,
      R => SR(0)
    );
\since_rise_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(24),
      Q => \since_rise_reg_n_0_[24]\,
      R => SR(0)
    );
\since_rise_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[20]_i_1_n_0\,
      CO(3) => \since_rise_reg[24]_i_1_n_0\,
      CO(2) => \since_rise_reg[24]_i_1_n_1\,
      CO(1) => \since_rise_reg[24]_i_1_n_2\,
      CO(0) => \since_rise_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(24 downto 21),
      S(3) => \since_rise_reg_n_0_[24]\,
      S(2) => \since_rise_reg_n_0_[23]\,
      S(1) => \since_rise_reg_n_0_[22]\,
      S(0) => \since_rise_reg_n_0_[21]\
    );
\since_rise_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(25),
      Q => \since_rise_reg_n_0_[25]\,
      R => SR(0)
    );
\since_rise_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(26),
      Q => \since_rise_reg_n_0_[26]\,
      R => SR(0)
    );
\since_rise_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(27),
      Q => \since_rise_reg_n_0_[27]\,
      R => SR(0)
    );
\since_rise_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(28),
      Q => \since_rise_reg_n_0_[28]\,
      R => SR(0)
    );
\since_rise_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[24]_i_1_n_0\,
      CO(3) => \since_rise_reg[28]_i_1_n_0\,
      CO(2) => \since_rise_reg[28]_i_1_n_1\,
      CO(1) => \since_rise_reg[28]_i_1_n_2\,
      CO(0) => \since_rise_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(28 downto 25),
      S(3) => \since_rise_reg_n_0_[28]\,
      S(2) => \since_rise_reg_n_0_[27]\,
      S(1) => \since_rise_reg_n_0_[26]\,
      S(0) => \since_rise_reg_n_0_[25]\
    );
\since_rise_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(29),
      Q => \since_rise_reg_n_0_[29]\,
      R => SR(0)
    );
\since_rise_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(2),
      Q => \since_rise_reg_n_0_[2]\,
      R => SR(0)
    );
\since_rise_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(30),
      Q => \since_rise_reg_n_0_[30]\,
      R => SR(0)
    );
\since_rise_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(31),
      Q => \since_rise_reg_n_0_[31]\,
      R => SR(0)
    );
\since_rise_reg[31]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[28]_i_1_n_0\,
      CO(3 downto 2) => \NLW_since_rise_reg[31]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \since_rise_reg[31]_i_3_n_2\,
      CO(0) => \since_rise_reg[31]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_since_rise_reg[31]_i_3_O_UNCONNECTED\(3),
      O(2 downto 0) => p_2_in(31 downto 29),
      S(3) => '0',
      S(2) => \since_rise_reg_n_0_[31]\,
      S(1) => \since_rise_reg_n_0_[30]\,
      S(0) => \since_rise_reg_n_0_[29]\
    );
\since_rise_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(3),
      Q => \since_rise_reg_n_0_[3]\,
      R => SR(0)
    );
\since_rise_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(4),
      Q => \since_rise_reg_n_0_[4]\,
      R => SR(0)
    );
\since_rise_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \since_rise_reg[4]_i_1_n_0\,
      CO(2) => \since_rise_reg[4]_i_1_n_1\,
      CO(1) => \since_rise_reg[4]_i_1_n_2\,
      CO(0) => \since_rise_reg[4]_i_1_n_3\,
      CYINIT => \since_rise_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(4 downto 1),
      S(3) => \since_rise_reg_n_0_[4]\,
      S(2) => \since_rise_reg_n_0_[3]\,
      S(1) => \since_rise_reg_n_0_[2]\,
      S(0) => \since_rise_reg_n_0_[1]\
    );
\since_rise_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(5),
      Q => \since_rise_reg_n_0_[5]\,
      R => SR(0)
    );
\since_rise_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(6),
      Q => \since_rise_reg_n_0_[6]\,
      R => SR(0)
    );
\since_rise_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(7),
      Q => \since_rise_reg_n_0_[7]\,
      R => SR(0)
    );
\since_rise_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(8),
      Q => \since_rise_reg_n_0_[8]\,
      R => SR(0)
    );
\since_rise_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \since_rise_reg[4]_i_1_n_0\,
      CO(3) => \since_rise_reg[8]_i_1_n_0\,
      CO(2) => \since_rise_reg[8]_i_1_n_1\,
      CO(1) => \since_rise_reg[8]_i_1_n_2\,
      CO(0) => \since_rise_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(8 downto 5),
      S(3) => \since_rise_reg_n_0_[8]\,
      S(2) => \since_rise_reg_n_0_[7]\,
      S(1) => \since_rise_reg_n_0_[6]\,
      S(0) => \since_rise_reg_n_0_[5]\
    );
\since_rise_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \since_rise_reg[31]_0\(0),
      D => p_2_in(9),
      Q => \since_rise_reg_n_0_[9]\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity radar_system_radar_core_0_0_axis_window is
  port (
    aresetn_0 : out STD_LOGIC;
    m_tvalid_reg_0 : out STD_LOGIC;
    m_axis_fft_tlast : out STD_LOGIC;
    ADDRARDADDR : out STD_LOGIC_VECTOR ( 9 downto 0 );
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_fft_tready_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    sample_fire : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    m_axis_fft_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    aresetn : in STD_LOGIC;
    m_axis_fft_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DOADO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clear : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    aclk : in STD_LOGIC;
    \m_tdata_reg[31]_0\ : in STD_LOGIC;
    in_pulse012_out : in STD_LOGIC;
    \since_rise_reg[1]\ : in STD_LOGIC;
    have_rise : in STD_LOGIC;
    \pw_acc_reg[1]\ : in STD_LOGIC;
    p_4_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of radar_system_radar_core_0_0_axis_window : entity is "axis_window";
end radar_system_radar_core_0_0_axis_window;

architecture STRUCTURE of radar_system_radar_core_0_0_axis_window is
  signal fire_in : STD_LOGIC;
  signal i_w_n_100 : STD_LOGIC;
  signal i_w_n_101 : STD_LOGIC;
  signal i_w_n_102 : STD_LOGIC;
  signal i_w_n_103 : STD_LOGIC;
  signal i_w_n_104 : STD_LOGIC;
  signal i_w_n_105 : STD_LOGIC;
  signal i_w_n_73 : STD_LOGIC;
  signal i_w_n_74 : STD_LOGIC;
  signal i_w_n_75 : STD_LOGIC;
  signal i_w_n_76 : STD_LOGIC;
  signal i_w_n_77 : STD_LOGIC;
  signal i_w_n_78 : STD_LOGIC;
  signal i_w_n_79 : STD_LOGIC;
  signal i_w_n_80 : STD_LOGIC;
  signal i_w_n_81 : STD_LOGIC;
  signal i_w_n_82 : STD_LOGIC;
  signal i_w_n_83 : STD_LOGIC;
  signal i_w_n_84 : STD_LOGIC;
  signal i_w_n_85 : STD_LOGIC;
  signal i_w_n_86 : STD_LOGIC;
  signal i_w_n_87 : STD_LOGIC;
  signal i_w_n_88 : STD_LOGIC;
  signal i_w_n_89 : STD_LOGIC;
  signal i_w_n_90 : STD_LOGIC;
  signal i_w_n_91 : STD_LOGIC;
  signal i_w_n_92 : STD_LOGIC;
  signal i_w_n_93 : STD_LOGIC;
  signal i_w_n_94 : STD_LOGIC;
  signal i_w_n_95 : STD_LOGIC;
  signal i_w_n_96 : STD_LOGIC;
  signal i_w_n_97 : STD_LOGIC;
  signal i_w_n_98 : STD_LOGIC;
  signal i_w_n_99 : STD_LOGIC;
  signal \m_tvalid_i_1__0_n_0\ : STD_LOGIC;
  signal \^m_tvalid_reg_0\ : STD_LOGIC;
  signal \n_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \n_count[0]_i_3_n_0\ : STD_LOGIC;
  signal n_count_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \n_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \n_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \n_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \n_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \n_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \n_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal n_count_reg_rep_i_12_n_7 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_0 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_1 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_2 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_3 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_4 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_5 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_6 : STD_LOGIC;
  signal n_count_reg_rep_i_13_n_7 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_0 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_1 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_2 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_3 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_4 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_5 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_6 : STD_LOGIC;
  signal n_count_reg_rep_i_14_n_7 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal q_w_n_100 : STD_LOGIC;
  signal q_w_n_101 : STD_LOGIC;
  signal q_w_n_102 : STD_LOGIC;
  signal q_w_n_103 : STD_LOGIC;
  signal q_w_n_104 : STD_LOGIC;
  signal q_w_n_105 : STD_LOGIC;
  signal q_w_n_73 : STD_LOGIC;
  signal q_w_n_74 : STD_LOGIC;
  signal q_w_n_75 : STD_LOGIC;
  signal q_w_n_76 : STD_LOGIC;
  signal q_w_n_77 : STD_LOGIC;
  signal q_w_n_78 : STD_LOGIC;
  signal q_w_n_79 : STD_LOGIC;
  signal q_w_n_80 : STD_LOGIC;
  signal q_w_n_81 : STD_LOGIC;
  signal q_w_n_82 : STD_LOGIC;
  signal q_w_n_83 : STD_LOGIC;
  signal q_w_n_84 : STD_LOGIC;
  signal q_w_n_85 : STD_LOGIC;
  signal q_w_n_86 : STD_LOGIC;
  signal q_w_n_87 : STD_LOGIC;
  signal q_w_n_88 : STD_LOGIC;
  signal q_w_n_89 : STD_LOGIC;
  signal q_w_n_90 : STD_LOGIC;
  signal q_w_n_91 : STD_LOGIC;
  signal q_w_n_92 : STD_LOGIC;
  signal q_w_n_93 : STD_LOGIC;
  signal q_w_n_94 : STD_LOGIC;
  signal q_w_n_95 : STD_LOGIC;
  signal q_w_n_96 : STD_LOGIC;
  signal q_w_n_97 : STD_LOGIC;
  signal q_w_n_98 : STD_LOGIC;
  signal q_w_n_99 : STD_LOGIC;
  signal NLW_i_w_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_i_w_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_i_w_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_i_w_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_i_w_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_i_w_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_i_w_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_i_w_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_i_w_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_w_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 33 );
  signal NLW_i_w_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_n_count_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_n_count_reg[8]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_n_count_reg_rep_i_12_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_n_count_reg_rep_i_12_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_q_w_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_q_w_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_q_w_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_q_w_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_q_w_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_q_w_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_q_w_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_q_w_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_q_w_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_q_w_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 33 );
  signal NLW_q_w_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of above_d_i_1 : label is "soft_lutpair29";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of i_w : label is "{SYNTH-13 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \m_tvalid_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \pw_acc[31]_i_2\ : label is "soft_lutpair30";
  attribute METHODOLOGY_DRC_VIOS of q_w : label is "{SYNTH-13 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \since_rise[31]_i_2\ : label is "soft_lutpair29";
begin
  m_tvalid_reg_0 <= \^m_tvalid_reg_0\;
above_d_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => \m_tdata_reg[31]_0\,
      I2 => \^m_tvalid_reg_0\,
      I3 => m_axis_fft_tready,
      O => sample_fire
    );
i_w: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => DOADO(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_i_w_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => s_axis_tdata(15),
      B(16) => s_axis_tdata(15),
      B(15 downto 0) => s_axis_tdata(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_i_w_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_i_w_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_i_w_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_i_w_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_i_w_OVERFLOW_UNCONNECTED,
      P(47 downto 33) => NLW_i_w_P_UNCONNECTED(47 downto 33),
      P(32) => i_w_n_73,
      P(31) => i_w_n_74,
      P(30) => i_w_n_75,
      P(29) => i_w_n_76,
      P(28) => i_w_n_77,
      P(27) => i_w_n_78,
      P(26) => i_w_n_79,
      P(25) => i_w_n_80,
      P(24) => i_w_n_81,
      P(23) => i_w_n_82,
      P(22) => i_w_n_83,
      P(21) => i_w_n_84,
      P(20) => i_w_n_85,
      P(19) => i_w_n_86,
      P(18) => i_w_n_87,
      P(17) => i_w_n_88,
      P(16) => i_w_n_89,
      P(15) => i_w_n_90,
      P(14) => i_w_n_91,
      P(13) => i_w_n_92,
      P(12) => i_w_n_93,
      P(11) => i_w_n_94,
      P(10) => i_w_n_95,
      P(9) => i_w_n_96,
      P(8) => i_w_n_97,
      P(7) => i_w_n_98,
      P(6) => i_w_n_99,
      P(5) => i_w_n_100,
      P(4) => i_w_n_101,
      P(3) => i_w_n_102,
      P(2) => i_w_n_103,
      P(1) => i_w_n_104,
      P(0) => i_w_n_105,
      PATTERNBDETECT => NLW_i_w_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_i_w_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_i_w_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_i_w_UNDERFLOW_UNCONNECTED
    );
\m_tdata[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(0),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_90,
      O => p_1_in(0)
    );
\m_tdata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(10),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_80,
      O => p_1_in(10)
    );
\m_tdata[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(11),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_79,
      O => p_1_in(11)
    );
\m_tdata[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(12),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_78,
      O => p_1_in(12)
    );
\m_tdata[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(13),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_77,
      O => p_1_in(13)
    );
\m_tdata[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(14),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_76,
      O => p_1_in(14)
    );
\m_tdata[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(15),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_75,
      O => p_1_in(15)
    );
\m_tdata[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(16),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_90,
      O => p_1_in(16)
    );
\m_tdata[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(17),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_89,
      O => p_1_in(17)
    );
\m_tdata[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(18),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_88,
      O => p_1_in(18)
    );
\m_tdata[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(19),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_87,
      O => p_1_in(19)
    );
\m_tdata[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(1),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_89,
      O => p_1_in(1)
    );
\m_tdata[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(20),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_86,
      O => p_1_in(20)
    );
\m_tdata[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(21),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_85,
      O => p_1_in(21)
    );
\m_tdata[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(22),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_84,
      O => p_1_in(22)
    );
\m_tdata[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(23),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_83,
      O => p_1_in(23)
    );
\m_tdata[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(24),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_82,
      O => p_1_in(24)
    );
\m_tdata[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(25),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_81,
      O => p_1_in(25)
    );
\m_tdata[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(26),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_80,
      O => p_1_in(26)
    );
\m_tdata[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(27),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_79,
      O => p_1_in(27)
    );
\m_tdata[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(28),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_78,
      O => p_1_in(28)
    );
\m_tdata[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(29),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_77,
      O => p_1_in(29)
    );
\m_tdata[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(2),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_88,
      O => p_1_in(2)
    );
\m_tdata[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(30),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_76,
      O => p_1_in(30)
    );
\m_tdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => \^m_tvalid_reg_0\,
      I2 => m_axis_fft_tready,
      O => fire_in
    );
\m_tdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(31),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => q_w_n_75,
      O => p_1_in(31)
    );
\m_tdata[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(3),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_87,
      O => p_1_in(3)
    );
\m_tdata[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(4),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_86,
      O => p_1_in(4)
    );
\m_tdata[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(5),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_85,
      O => p_1_in(5)
    );
\m_tdata[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(6),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_84,
      O => p_1_in(6)
    );
\m_tdata[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(7),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_83,
      O => p_1_in(7)
    );
\m_tdata[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(8),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_82,
      O => p_1_in(8)
    );
\m_tdata[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA2A"
    )
        port map (
      I0 => s_axis_tdata(9),
      I1 => p_4_in(0),
      I2 => \m_tdata_reg[31]_0\,
      I3 => i_w_n_81,
      O => p_1_in(9)
    );
\m_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(0),
      Q => m_axis_fft_tdata(0),
      R => clear
    );
\m_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(10),
      Q => m_axis_fft_tdata(10),
      R => clear
    );
\m_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(11),
      Q => m_axis_fft_tdata(11),
      R => clear
    );
\m_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(12),
      Q => m_axis_fft_tdata(12),
      R => clear
    );
\m_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(13),
      Q => m_axis_fft_tdata(13),
      R => clear
    );
\m_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(14),
      Q => m_axis_fft_tdata(14),
      R => clear
    );
\m_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(15),
      Q => m_axis_fft_tdata(15),
      R => clear
    );
\m_tdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(16),
      Q => m_axis_fft_tdata(16),
      R => clear
    );
\m_tdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(17),
      Q => m_axis_fft_tdata(17),
      R => clear
    );
\m_tdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(18),
      Q => m_axis_fft_tdata(18),
      R => clear
    );
\m_tdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(19),
      Q => m_axis_fft_tdata(19),
      R => clear
    );
\m_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(1),
      Q => m_axis_fft_tdata(1),
      R => clear
    );
\m_tdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(20),
      Q => m_axis_fft_tdata(20),
      R => clear
    );
\m_tdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(21),
      Q => m_axis_fft_tdata(21),
      R => clear
    );
\m_tdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(22),
      Q => m_axis_fft_tdata(22),
      R => clear
    );
\m_tdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(23),
      Q => m_axis_fft_tdata(23),
      R => clear
    );
\m_tdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(24),
      Q => m_axis_fft_tdata(24),
      R => clear
    );
\m_tdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(25),
      Q => m_axis_fft_tdata(25),
      R => clear
    );
\m_tdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(26),
      Q => m_axis_fft_tdata(26),
      R => clear
    );
\m_tdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(27),
      Q => m_axis_fft_tdata(27),
      R => clear
    );
\m_tdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(28),
      Q => m_axis_fft_tdata(28),
      R => clear
    );
\m_tdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(29),
      Q => m_axis_fft_tdata(29),
      R => clear
    );
\m_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(2),
      Q => m_axis_fft_tdata(2),
      R => clear
    );
\m_tdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(30),
      Q => m_axis_fft_tdata(30),
      R => clear
    );
\m_tdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(31),
      Q => m_axis_fft_tdata(31),
      R => clear
    );
\m_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(3),
      Q => m_axis_fft_tdata(3),
      R => clear
    );
\m_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(4),
      Q => m_axis_fft_tdata(4),
      R => clear
    );
\m_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(5),
      Q => m_axis_fft_tdata(5),
      R => clear
    );
\m_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(6),
      Q => m_axis_fft_tdata(6),
      R => clear
    );
\m_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(7),
      Q => m_axis_fft_tdata(7),
      R => clear
    );
\m_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(8),
      Q => m_axis_fft_tdata(8),
      R => clear
    );
\m_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => p_1_in(9),
      Q => m_axis_fft_tdata(9),
      R => clear
    );
m_tlast_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => s_axis_tlast,
      Q => m_axis_fft_tlast,
      R => clear
    );
\m_tvalid_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => m_axis_fft_tready,
      I1 => \^m_tvalid_reg_0\,
      I2 => s_axis_tvalid,
      O => \m_tvalid_i_1__0_n_0\
    );
m_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \m_tvalid_i_1__0_n_0\,
      Q => \^m_tvalid_reg_0\,
      R => clear
    );
\n_count[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8808FFFF"
    )
        port map (
      I0 => s_axis_tlast,
      I1 => s_axis_tvalid,
      I2 => \^m_tvalid_reg_0\,
      I3 => m_axis_fft_tready,
      I4 => aresetn,
      O => \n_count[0]_i_1_n_0\
    );
\n_count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => n_count_reg(0),
      O => \n_count[0]_i_3_n_0\
    );
\n_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[0]_i_2_n_7\,
      Q => n_count_reg(0),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \n_count_reg[0]_i_2_n_0\,
      CO(2) => \n_count_reg[0]_i_2_n_1\,
      CO(1) => \n_count_reg[0]_i_2_n_2\,
      CO(0) => \n_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \n_count_reg[0]_i_2_n_4\,
      O(2) => \n_count_reg[0]_i_2_n_5\,
      O(1) => \n_count_reg[0]_i_2_n_6\,
      O(0) => \n_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => n_count_reg(3 downto 1),
      S(0) => \n_count[0]_i_3_n_0\
    );
\n_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[0]_i_2_n_6\,
      Q => n_count_reg(1),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[0]_i_2_n_5\,
      Q => n_count_reg(2),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[0]_i_2_n_4\,
      Q => n_count_reg(3),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[4]_i_1_n_7\,
      Q => n_count_reg(4),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \n_count_reg[0]_i_2_n_0\,
      CO(3) => \n_count_reg[4]_i_1_n_0\,
      CO(2) => \n_count_reg[4]_i_1_n_1\,
      CO(1) => \n_count_reg[4]_i_1_n_2\,
      CO(0) => \n_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \n_count_reg[4]_i_1_n_4\,
      O(2) => \n_count_reg[4]_i_1_n_5\,
      O(1) => \n_count_reg[4]_i_1_n_6\,
      O(0) => \n_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => n_count_reg(7 downto 4)
    );
\n_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[4]_i_1_n_6\,
      Q => n_count_reg(5),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[4]_i_1_n_5\,
      Q => n_count_reg(6),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[4]_i_1_n_4\,
      Q => n_count_reg(7),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[8]_i_1_n_7\,
      Q => n_count_reg(8),
      R => \n_count[0]_i_1_n_0\
    );
\n_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \n_count_reg[4]_i_1_n_0\,
      CO(3 downto 1) => \NLW_n_count_reg[8]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \n_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_n_count_reg[8]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \n_count_reg[8]_i_1_n_6\,
      O(0) => \n_count_reg[8]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => n_count_reg(9 downto 8)
    );
\n_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => fire_in,
      D => \n_count_reg[8]_i_1_n_6\,
      Q => n_count_reg(9),
      R => \n_count[0]_i_1_n_0\
    );
n_count_reg_rep_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF55"
    )
        port map (
      I0 => aresetn,
      I1 => m_axis_fft_tready,
      I2 => \^m_tvalid_reg_0\,
      I3 => s_axis_tvalid,
      O => aresetn_0
    );
n_count_reg_rep_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_14_n_7,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(1)
    );
n_count_reg_rep_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400444444444444"
    )
        port map (
      I0 => n_count_reg(0),
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(0)
    );
n_count_reg_rep_i_12: unisim.vcomponents.CARRY4
     port map (
      CI => n_count_reg_rep_i_13_n_0,
      CO(3 downto 0) => NLW_n_count_reg_rep_i_12_CO_UNCONNECTED(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => NLW_n_count_reg_rep_i_12_O_UNCONNECTED(3 downto 1),
      O(0) => n_count_reg_rep_i_12_n_7,
      S(3 downto 1) => B"000",
      S(0) => n_count_reg(9)
    );
n_count_reg_rep_i_13: unisim.vcomponents.CARRY4
     port map (
      CI => n_count_reg_rep_i_14_n_0,
      CO(3) => n_count_reg_rep_i_13_n_0,
      CO(2) => n_count_reg_rep_i_13_n_1,
      CO(1) => n_count_reg_rep_i_13_n_2,
      CO(0) => n_count_reg_rep_i_13_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => n_count_reg_rep_i_13_n_4,
      O(2) => n_count_reg_rep_i_13_n_5,
      O(1) => n_count_reg_rep_i_13_n_6,
      O(0) => n_count_reg_rep_i_13_n_7,
      S(3 downto 0) => n_count_reg(8 downto 5)
    );
n_count_reg_rep_i_14: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => n_count_reg_rep_i_14_n_0,
      CO(2) => n_count_reg_rep_i_14_n_1,
      CO(1) => n_count_reg_rep_i_14_n_2,
      CO(0) => n_count_reg_rep_i_14_n_3,
      CYINIT => n_count_reg(0),
      DI(3 downto 0) => B"0000",
      O(3) => n_count_reg_rep_i_14_n_4,
      O(2) => n_count_reg_rep_i_14_n_5,
      O(1) => n_count_reg_rep_i_14_n_6,
      O(0) => n_count_reg_rep_i_14_n_7,
      S(3 downto 0) => n_count_reg(4 downto 1)
    );
n_count_reg_rep_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_12_n_7,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(9)
    );
n_count_reg_rep_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_13_n_4,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(8)
    );
n_count_reg_rep_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_13_n_5,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(7)
    );
n_count_reg_rep_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_13_n_6,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(6)
    );
n_count_reg_rep_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_13_n_7,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(5)
    );
n_count_reg_rep_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_14_n_4,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(4)
    );
n_count_reg_rep_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_14_n_5,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(3)
    );
n_count_reg_rep_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800888888888888"
    )
        port map (
      I0 => n_count_reg_rep_i_14_n_6,
      I1 => aresetn,
      I2 => m_axis_fft_tready,
      I3 => \^m_tvalid_reg_0\,
      I4 => s_axis_tvalid,
      I5 => s_axis_tlast,
      O => ADDRARDADDR(2)
    );
\pw_acc[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0000000"
    )
        port map (
      I0 => m_axis_fft_tready,
      I1 => \^m_tvalid_reg_0\,
      I2 => \m_tdata_reg[31]_0\,
      I3 => s_axis_tvalid,
      I4 => \pw_acc_reg[1]\,
      O => E(0)
    );
q_w: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => DOADO(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_q_w_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => s_axis_tdata(31),
      B(16) => s_axis_tdata(31),
      B(15 downto 0) => s_axis_tdata(31 downto 16),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_q_w_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_q_w_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_q_w_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_q_w_MULTSIGNOUT_UNCONNECTED,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => NLW_q_w_OVERFLOW_UNCONNECTED,
      P(47 downto 33) => NLW_q_w_P_UNCONNECTED(47 downto 33),
      P(32) => q_w_n_73,
      P(31) => q_w_n_74,
      P(30) => q_w_n_75,
      P(29) => q_w_n_76,
      P(28) => q_w_n_77,
      P(27) => q_w_n_78,
      P(26) => q_w_n_79,
      P(25) => q_w_n_80,
      P(24) => q_w_n_81,
      P(23) => q_w_n_82,
      P(22) => q_w_n_83,
      P(21) => q_w_n_84,
      P(20) => q_w_n_85,
      P(19) => q_w_n_86,
      P(18) => q_w_n_87,
      P(17) => q_w_n_88,
      P(16) => q_w_n_89,
      P(15) => q_w_n_90,
      P(14) => q_w_n_91,
      P(13) => q_w_n_92,
      P(12) => q_w_n_93,
      P(11) => q_w_n_94,
      P(10) => q_w_n_95,
      P(9) => q_w_n_96,
      P(8) => q_w_n_97,
      P(7) => q_w_n_98,
      P(6) => q_w_n_99,
      P(5) => q_w_n_100,
      P(4) => q_w_n_101,
      P(3) => q_w_n_102,
      P(2) => q_w_n_103,
      P(1) => q_w_n_104,
      P(0) => q_w_n_105,
      PATTERNBDETECT => NLW_q_w_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_q_w_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_q_w_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_q_w_UNDERFLOW_UNCONNECTED
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m_axis_fft_tready,
      I1 => \^m_tvalid_reg_0\,
      O => s_axis_tready
    );
\since_rise[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF88080000"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => \m_tdata_reg[31]_0\,
      I2 => \^m_tvalid_reg_0\,
      I3 => m_axis_fft_tready,
      I4 => in_pulse012_out,
      I5 => \since_rise_reg[1]\,
      O => SR(0)
    );
\since_rise[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0000000"
    )
        port map (
      I0 => m_axis_fft_tready,
      I1 => \^m_tvalid_reg_0\,
      I2 => \m_tdata_reg[31]_0\,
      I3 => s_axis_tvalid,
      I4 => have_rise,
      O => m_axis_fft_tready_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity radar_system_radar_core_0_0_fft_config_master is
  port (
    m_axis_fft_config_tvalid : out STD_LOGIC;
    clear : in STD_LOGIC;
    kicked_reg_0 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_fft_config_tready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of radar_system_radar_core_0_0_fft_config_master : entity is "fft_config_master";
end radar_system_radar_core_0_0_fft_config_master;

architecture STRUCTURE of radar_system_radar_core_0_0_fft_config_master is
  signal kicked : STD_LOGIC;
  signal \^m_axis_fft_config_tvalid\ : STD_LOGIC;
  signal m_tvalid_i_1_n_0 : STD_LOGIC;
begin
  m_axis_fft_config_tvalid <= \^m_axis_fft_config_tvalid\;
kicked_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => kicked_reg_0,
      Q => kicked,
      R => clear
    );
m_tvalid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75FF7575"
    )
        port map (
      I0 => aresetn,
      I1 => m_axis_fft_config_tready,
      I2 => \^m_axis_fft_config_tvalid\,
      I3 => kicked,
      I4 => kicked_reg_0,
      O => m_tvalid_i_1_n_0
    );
m_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => m_tvalid_i_1_n_0,
      Q => \^m_axis_fft_config_tvalid\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity radar_system_radar_core_0_0_radar_core is
  port (
    aresetn_0 : out STD_LOGIC;
    m_tvalid_reg : out STD_LOGIC;
    m_axis_fft_tlast : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    in_pulse_reg : out STD_LOGIC;
    peak_valid_reg : out STD_LOGIC;
    m_axis_fft_config_tvalid : out STD_LOGIC;
    s_axi_bvalid_reg_0 : out STD_LOGIC;
    enable_reg_0 : out STD_LOGIC;
    ADDRARDADDR : out STD_LOGIC_VECTOR ( 9 downto 0 );
    m_axis_fft_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    leds : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_fft_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    DOADO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_fft_tlast : in STD_LOGIC;
    s_axis_fft_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axis_fft_config_tready : in STD_LOGIC;
    s_axis_fft_tvalid : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of radar_system_radar_core_0_0_radar_core : entity is "radar_core";
end radar_system_radar_core_0_0_radar_core;

architecture STRUCTURE of radar_system_radar_core_0_0_radar_core is
  signal bins_seen : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clear : STD_LOGIC;
  signal config_kick_i_1_n_0 : STD_LOGIC;
  signal config_kick_reg_n_0 : STD_LOGIC;
  signal enable_i_1_n_0 : STD_LOGIC;
  signal enable_i_2_n_0 : STD_LOGIC;
  signal enable_i_3_n_0 : STD_LOGIC;
  signal \^enable_reg_0\ : STD_LOGIC;
  signal fft_size : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal frame_count0 : STD_LOGIC;
  signal \frame_count[0]_i_3_n_0\ : STD_LOGIC;
  signal frame_count_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \frame_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \frame_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \frame_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal have_rise : STD_LOGIC;
  signal \hb[0]_i_2_n_0\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \hb_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \hb_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \hb_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \hb_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \hb_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \hb_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \hb_reg_n_0_[0]\ : STD_LOGIC;
  signal \hb_reg_n_0_[10]\ : STD_LOGIC;
  signal \hb_reg_n_0_[11]\ : STD_LOGIC;
  signal \hb_reg_n_0_[12]\ : STD_LOGIC;
  signal \hb_reg_n_0_[13]\ : STD_LOGIC;
  signal \hb_reg_n_0_[14]\ : STD_LOGIC;
  signal \hb_reg_n_0_[15]\ : STD_LOGIC;
  signal \hb_reg_n_0_[16]\ : STD_LOGIC;
  signal \hb_reg_n_0_[17]\ : STD_LOGIC;
  signal \hb_reg_n_0_[18]\ : STD_LOGIC;
  signal \hb_reg_n_0_[19]\ : STD_LOGIC;
  signal \hb_reg_n_0_[1]\ : STD_LOGIC;
  signal \hb_reg_n_0_[20]\ : STD_LOGIC;
  signal \hb_reg_n_0_[21]\ : STD_LOGIC;
  signal \hb_reg_n_0_[22]\ : STD_LOGIC;
  signal \hb_reg_n_0_[23]\ : STD_LOGIC;
  signal \hb_reg_n_0_[2]\ : STD_LOGIC;
  signal \hb_reg_n_0_[3]\ : STD_LOGIC;
  signal \hb_reg_n_0_[4]\ : STD_LOGIC;
  signal \hb_reg_n_0_[5]\ : STD_LOGIC;
  signal \hb_reg_n_0_[6]\ : STD_LOGIC;
  signal \hb_reg_n_0_[7]\ : STD_LOGIC;
  signal \hb_reg_n_0_[8]\ : STD_LOGIC;
  signal \hb_reg_n_0_[9]\ : STD_LOGIC;
  signal in_pulse012_out : STD_LOGIC;
  signal \^in_pulse_reg\ : STD_LOGIC;
  signal \^leds\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_tvalid_reg\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 7 );
  signal p_4_in : STD_LOGIC_VECTOR ( 2 to 2 );
  signal peak_valid_d : STD_LOGIC;
  signal pw_samples : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \s_axi_arready0__0\ : STD_LOGIC;
  signal s_axi_awready_i_1_n_0 : STD_LOGIC;
  signal s_axi_bvalid_i_2_n_0 : STD_LOGIC;
  signal \^s_axi_bvalid_reg_0\ : STD_LOGIC;
  signal \s_axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_8_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_6_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal s_axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal sample_fire : STD_LOGIC;
  signal scratch : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \scratch[15]_i_1_n_0\ : STD_LOGIC;
  signal \scratch[23]_i_1_n_0\ : STD_LOGIC;
  signal \scratch[31]_i_1_n_0\ : STD_LOGIC;
  signal \scratch[7]_i_1_n_0\ : STD_LOGIC;
  signal since_rise : STD_LOGIC;
  signal soft_reset_r_i_1_n_0 : STD_LOGIC;
  signal soft_reset_r_reg_n_0 : STD_LOGIC;
  signal threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \threshold[15]_i_1_n_0\ : STD_LOGIC;
  signal \threshold[23]_i_1_n_0\ : STD_LOGIC;
  signal \threshold[31]_i_1_n_0\ : STD_LOGIC;
  signal \threshold[7]_i_1_n_0\ : STD_LOGIC;
  signal u_peak_n_10 : STD_LOGIC;
  signal u_peak_n_11 : STD_LOGIC;
  signal u_peak_n_12 : STD_LOGIC;
  signal u_peak_n_13 : STD_LOGIC;
  signal u_peak_n_14 : STD_LOGIC;
  signal u_peak_n_15 : STD_LOGIC;
  signal u_peak_n_16 : STD_LOGIC;
  signal u_peak_n_17 : STD_LOGIC;
  signal u_peak_n_18 : STD_LOGIC;
  signal u_peak_n_19 : STD_LOGIC;
  signal u_peak_n_2 : STD_LOGIC;
  signal u_peak_n_20 : STD_LOGIC;
  signal u_peak_n_21 : STD_LOGIC;
  signal u_peak_n_22 : STD_LOGIC;
  signal u_peak_n_23 : STD_LOGIC;
  signal u_peak_n_24 : STD_LOGIC;
  signal u_peak_n_25 : STD_LOGIC;
  signal u_peak_n_26 : STD_LOGIC;
  signal u_peak_n_27 : STD_LOGIC;
  signal u_peak_n_28 : STD_LOGIC;
  signal u_peak_n_29 : STD_LOGIC;
  signal u_peak_n_30 : STD_LOGIC;
  signal u_peak_n_31 : STD_LOGIC;
  signal u_peak_n_32 : STD_LOGIC;
  signal u_peak_n_33 : STD_LOGIC;
  signal u_peak_n_34 : STD_LOGIC;
  signal u_peak_n_35 : STD_LOGIC;
  signal u_peak_n_4 : STD_LOGIC;
  signal u_peak_n_5 : STD_LOGIC;
  signal u_peak_n_6 : STD_LOGIC;
  signal u_peak_n_7 : STD_LOGIC;
  signal u_peak_n_8 : STD_LOGIC;
  signal u_peak_n_9 : STD_LOGIC;
  signal u_pulse_n_0 : STD_LOGIC;
  signal u_pulse_n_10 : STD_LOGIC;
  signal u_pulse_n_11 : STD_LOGIC;
  signal u_pulse_n_12 : STD_LOGIC;
  signal u_pulse_n_13 : STD_LOGIC;
  signal u_pulse_n_14 : STD_LOGIC;
  signal u_pulse_n_15 : STD_LOGIC;
  signal u_pulse_n_16 : STD_LOGIC;
  signal u_pulse_n_17 : STD_LOGIC;
  signal u_pulse_n_18 : STD_LOGIC;
  signal u_pulse_n_19 : STD_LOGIC;
  signal u_pulse_n_20 : STD_LOGIC;
  signal u_pulse_n_21 : STD_LOGIC;
  signal u_pulse_n_22 : STD_LOGIC;
  signal u_pulse_n_23 : STD_LOGIC;
  signal u_pulse_n_24 : STD_LOGIC;
  signal u_pulse_n_25 : STD_LOGIC;
  signal u_pulse_n_26 : STD_LOGIC;
  signal u_pulse_n_27 : STD_LOGIC;
  signal u_pulse_n_28 : STD_LOGIC;
  signal u_pulse_n_29 : STD_LOGIC;
  signal u_pulse_n_30 : STD_LOGIC;
  signal u_pulse_n_31 : STD_LOGIC;
  signal u_pulse_n_32 : STD_LOGIC;
  signal u_pulse_n_33 : STD_LOGIC;
  signal u_pulse_n_34 : STD_LOGIC;
  signal u_pulse_n_35 : STD_LOGIC;
  signal u_pulse_n_4 : STD_LOGIC;
  signal u_pulse_n_5 : STD_LOGIC;
  signal u_pulse_n_6 : STD_LOGIC;
  signal u_pulse_n_7 : STD_LOGIC;
  signal u_pulse_n_8 : STD_LOGIC;
  signal u_pulse_n_9 : STD_LOGIC;
  signal u_window_n_13 : STD_LOGIC;
  signal u_window_n_15 : STD_LOGIC;
  signal window_enable_i_1_n_0 : STD_LOGIC;
  signal \NLW_frame_count_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_hb_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_hb_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \frame_count_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \frame_count_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \hb_reg[8]_i_1\ : label is 11;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_axi_arready_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of s_axi_awready_i_1 : label is "soft_lutpair31";
  attribute X_INTERFACE_INFO of s_axi_awready_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute SOFT_HLUTNM of s_axi_bvalid_i_2 : label is "soft_lutpair31";
  attribute X_INTERFACE_INFO of s_axi_bvalid_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_7\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \s_axi_rdata[31]_i_8\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \s_axi_rdata[3]_i_6\ : label is "soft_lutpair33";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[0]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[10]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[11]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[12]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[13]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[14]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[15]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[16]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[17]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[18]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[19]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[1]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[20]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[21]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[22]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[23]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[24]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[25]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[26]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[27]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[28]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[29]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[2]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[30]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[31]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[3]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[4]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[5]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[6]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[7]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[8]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of \s_axi_rdata_reg[9]\ : label is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of s_axi_rvalid_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready_reg : label is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of s_axi_wready_reg : label is "no";
begin
  enable_reg_0 <= \^enable_reg_0\;
  in_pulse_reg <= \^in_pulse_reg\;
  leds(0) <= \^leds\(0);
  m_tvalid_reg <= \^m_tvalid_reg\;
  s_axi_bvalid_reg_0 <= \^s_axi_bvalid_reg_0\;
  s_axi_rvalid <= \^s_axi_rvalid\;
config_kick_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => enable_i_2_n_0,
      I1 => s_axi_wdata(3),
      I2 => s_axi_wstrb(0),
      I3 => s_axi_awaddr(4),
      I4 => s_axi_awaddr(5),
      I5 => s_axi_awready_i_1_n_0,
      O => config_kick_i_1_n_0
    );
config_kick_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => config_kick_i_1_n_0,
      Q => config_kick_reg_n_0,
      R => '0'
    );
enable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => s_axi_wdata(0),
      I1 => s_axi_wstrb(0),
      I2 => enable_i_2_n_0,
      I3 => enable_i_3_n_0,
      I4 => \^enable_reg_0\,
      O => enable_i_1_n_0
    );
enable_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_awaddr(1),
      I1 => s_axi_awaddr(0),
      I2 => s_axi_awaddr(3),
      I3 => s_axi_awaddr(2),
      O => enable_i_2_n_0
    );
enable_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000B000"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^s_axi_bvalid_reg_0\,
      I2 => s_axi_awvalid,
      I3 => s_axi_wvalid,
      I4 => s_axi_awaddr(4),
      I5 => s_axi_awaddr(5),
      O => enable_i_3_n_0
    );
enable_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => enable_i_1_n_0,
      Q => \^enable_reg_0\,
      R => clear
    );
\fft_size[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => s_axi_awaddr(1),
      I1 => s_axi_awaddr(0),
      I2 => s_axi_wstrb(1),
      I3 => s_axi_awaddr(2),
      I4 => s_axi_awaddr(3),
      I5 => enable_i_3_n_0,
      O => p_1_in(15)
    );
\fft_size[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => s_axi_awaddr(1),
      I1 => s_axi_awaddr(0),
      I2 => s_axi_wstrb(0),
      I3 => s_axi_awaddr(2),
      I4 => s_axi_awaddr(3),
      I5 => enable_i_3_n_0,
      O => p_1_in(7)
    );
\fft_size_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(0),
      Q => fft_size(0),
      R => clear
    );
\fft_size_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(10),
      Q => fft_size(10),
      S => clear
    );
\fft_size_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(11),
      Q => fft_size(11),
      R => clear
    );
\fft_size_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(12),
      Q => fft_size(12),
      R => clear
    );
\fft_size_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(13),
      Q => fft_size(13),
      R => clear
    );
\fft_size_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(14),
      Q => fft_size(14),
      R => clear
    );
\fft_size_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(15),
      Q => fft_size(15),
      R => clear
    );
\fft_size_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(1),
      Q => fft_size(1),
      R => clear
    );
\fft_size_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(2),
      Q => fft_size(2),
      R => clear
    );
\fft_size_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(3),
      Q => fft_size(3),
      R => clear
    );
\fft_size_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(4),
      Q => fft_size(4),
      R => clear
    );
\fft_size_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(5),
      Q => fft_size(5),
      R => clear
    );
\fft_size_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(6),
      Q => fft_size(6),
      R => clear
    );
\fft_size_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(7),
      D => s_axi_wdata(7),
      Q => fft_size(7),
      R => clear
    );
\fft_size_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(8),
      Q => fft_size(8),
      R => clear
    );
\fft_size_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => p_1_in(15),
      D => s_axi_wdata(9),
      Q => fft_size(9),
      R => clear
    );
\frame_count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => frame_count_reg(0),
      O => \frame_count[0]_i_3_n_0\
    );
\frame_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[0]_i_2_n_7\,
      Q => frame_count_reg(0),
      R => u_pulse_n_0
    );
\frame_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \frame_count_reg[0]_i_2_n_0\,
      CO(2) => \frame_count_reg[0]_i_2_n_1\,
      CO(1) => \frame_count_reg[0]_i_2_n_2\,
      CO(0) => \frame_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \frame_count_reg[0]_i_2_n_4\,
      O(2) => \frame_count_reg[0]_i_2_n_5\,
      O(1) => \frame_count_reg[0]_i_2_n_6\,
      O(0) => \frame_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => frame_count_reg(3 downto 1),
      S(0) => \frame_count[0]_i_3_n_0\
    );
\frame_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[8]_i_1_n_5\,
      Q => frame_count_reg(10),
      R => u_pulse_n_0
    );
\frame_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[8]_i_1_n_4\,
      Q => frame_count_reg(11),
      R => u_pulse_n_0
    );
\frame_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[12]_i_1_n_7\,
      Q => frame_count_reg(12),
      R => u_pulse_n_0
    );
\frame_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[8]_i_1_n_0\,
      CO(3) => \frame_count_reg[12]_i_1_n_0\,
      CO(2) => \frame_count_reg[12]_i_1_n_1\,
      CO(1) => \frame_count_reg[12]_i_1_n_2\,
      CO(0) => \frame_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[12]_i_1_n_4\,
      O(2) => \frame_count_reg[12]_i_1_n_5\,
      O(1) => \frame_count_reg[12]_i_1_n_6\,
      O(0) => \frame_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(15 downto 12)
    );
\frame_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[12]_i_1_n_6\,
      Q => frame_count_reg(13),
      R => u_pulse_n_0
    );
\frame_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[12]_i_1_n_5\,
      Q => frame_count_reg(14),
      R => u_pulse_n_0
    );
\frame_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[12]_i_1_n_4\,
      Q => frame_count_reg(15),
      R => u_pulse_n_0
    );
\frame_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[16]_i_1_n_7\,
      Q => frame_count_reg(16),
      R => u_pulse_n_0
    );
\frame_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[12]_i_1_n_0\,
      CO(3) => \frame_count_reg[16]_i_1_n_0\,
      CO(2) => \frame_count_reg[16]_i_1_n_1\,
      CO(1) => \frame_count_reg[16]_i_1_n_2\,
      CO(0) => \frame_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[16]_i_1_n_4\,
      O(2) => \frame_count_reg[16]_i_1_n_5\,
      O(1) => \frame_count_reg[16]_i_1_n_6\,
      O(0) => \frame_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(19 downto 16)
    );
\frame_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[16]_i_1_n_6\,
      Q => frame_count_reg(17),
      R => u_pulse_n_0
    );
\frame_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[16]_i_1_n_5\,
      Q => frame_count_reg(18),
      R => u_pulse_n_0
    );
\frame_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[16]_i_1_n_4\,
      Q => frame_count_reg(19),
      R => u_pulse_n_0
    );
\frame_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[0]_i_2_n_6\,
      Q => frame_count_reg(1),
      R => u_pulse_n_0
    );
\frame_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[20]_i_1_n_7\,
      Q => frame_count_reg(20),
      R => u_pulse_n_0
    );
\frame_count_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[16]_i_1_n_0\,
      CO(3) => \frame_count_reg[20]_i_1_n_0\,
      CO(2) => \frame_count_reg[20]_i_1_n_1\,
      CO(1) => \frame_count_reg[20]_i_1_n_2\,
      CO(0) => \frame_count_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[20]_i_1_n_4\,
      O(2) => \frame_count_reg[20]_i_1_n_5\,
      O(1) => \frame_count_reg[20]_i_1_n_6\,
      O(0) => \frame_count_reg[20]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(23 downto 20)
    );
\frame_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[20]_i_1_n_6\,
      Q => frame_count_reg(21),
      R => u_pulse_n_0
    );
\frame_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[20]_i_1_n_5\,
      Q => frame_count_reg(22),
      R => u_pulse_n_0
    );
\frame_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[20]_i_1_n_4\,
      Q => frame_count_reg(23),
      R => u_pulse_n_0
    );
\frame_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[24]_i_1_n_7\,
      Q => frame_count_reg(24),
      R => u_pulse_n_0
    );
\frame_count_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[20]_i_1_n_0\,
      CO(3) => \frame_count_reg[24]_i_1_n_0\,
      CO(2) => \frame_count_reg[24]_i_1_n_1\,
      CO(1) => \frame_count_reg[24]_i_1_n_2\,
      CO(0) => \frame_count_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[24]_i_1_n_4\,
      O(2) => \frame_count_reg[24]_i_1_n_5\,
      O(1) => \frame_count_reg[24]_i_1_n_6\,
      O(0) => \frame_count_reg[24]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(27 downto 24)
    );
\frame_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[24]_i_1_n_6\,
      Q => frame_count_reg(25),
      R => u_pulse_n_0
    );
\frame_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[24]_i_1_n_5\,
      Q => frame_count_reg(26),
      R => u_pulse_n_0
    );
\frame_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[24]_i_1_n_4\,
      Q => frame_count_reg(27),
      R => u_pulse_n_0
    );
\frame_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[28]_i_1_n_7\,
      Q => frame_count_reg(28),
      R => u_pulse_n_0
    );
\frame_count_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[24]_i_1_n_0\,
      CO(3) => \NLW_frame_count_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \frame_count_reg[28]_i_1_n_1\,
      CO(1) => \frame_count_reg[28]_i_1_n_2\,
      CO(0) => \frame_count_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[28]_i_1_n_4\,
      O(2) => \frame_count_reg[28]_i_1_n_5\,
      O(1) => \frame_count_reg[28]_i_1_n_6\,
      O(0) => \frame_count_reg[28]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(31 downto 28)
    );
\frame_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[28]_i_1_n_6\,
      Q => frame_count_reg(29),
      R => u_pulse_n_0
    );
\frame_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[0]_i_2_n_5\,
      Q => frame_count_reg(2),
      R => u_pulse_n_0
    );
\frame_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[28]_i_1_n_5\,
      Q => frame_count_reg(30),
      R => u_pulse_n_0
    );
\frame_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[28]_i_1_n_4\,
      Q => frame_count_reg(31),
      R => u_pulse_n_0
    );
\frame_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[0]_i_2_n_4\,
      Q => frame_count_reg(3),
      R => u_pulse_n_0
    );
\frame_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[4]_i_1_n_7\,
      Q => frame_count_reg(4),
      R => u_pulse_n_0
    );
\frame_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[0]_i_2_n_0\,
      CO(3) => \frame_count_reg[4]_i_1_n_0\,
      CO(2) => \frame_count_reg[4]_i_1_n_1\,
      CO(1) => \frame_count_reg[4]_i_1_n_2\,
      CO(0) => \frame_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[4]_i_1_n_4\,
      O(2) => \frame_count_reg[4]_i_1_n_5\,
      O(1) => \frame_count_reg[4]_i_1_n_6\,
      O(0) => \frame_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(7 downto 4)
    );
\frame_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[4]_i_1_n_6\,
      Q => frame_count_reg(5),
      R => u_pulse_n_0
    );
\frame_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[4]_i_1_n_5\,
      Q => frame_count_reg(6),
      R => u_pulse_n_0
    );
\frame_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[4]_i_1_n_4\,
      Q => frame_count_reg(7),
      R => u_pulse_n_0
    );
\frame_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[8]_i_1_n_7\,
      Q => frame_count_reg(8),
      R => u_pulse_n_0
    );
\frame_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \frame_count_reg[4]_i_1_n_0\,
      CO(3) => \frame_count_reg[8]_i_1_n_0\,
      CO(2) => \frame_count_reg[8]_i_1_n_1\,
      CO(1) => \frame_count_reg[8]_i_1_n_2\,
      CO(0) => \frame_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \frame_count_reg[8]_i_1_n_4\,
      O(2) => \frame_count_reg[8]_i_1_n_5\,
      O(1) => \frame_count_reg[8]_i_1_n_6\,
      O(0) => \frame_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => frame_count_reg(11 downto 8)
    );
\frame_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => frame_count0,
      D => \frame_count_reg[8]_i_1_n_6\,
      Q => frame_count_reg(9),
      R => u_pulse_n_0
    );
\hb[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \hb_reg_n_0_[0]\,
      O => \hb[0]_i_2_n_0\
    );
\hb_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[0]_i_1_n_7\,
      Q => \hb_reg_n_0_[0]\,
      R => clear
    );
\hb_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \hb_reg[0]_i_1_n_0\,
      CO(2) => \hb_reg[0]_i_1_n_1\,
      CO(1) => \hb_reg[0]_i_1_n_2\,
      CO(0) => \hb_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \hb_reg[0]_i_1_n_4\,
      O(2) => \hb_reg[0]_i_1_n_5\,
      O(1) => \hb_reg[0]_i_1_n_6\,
      O(0) => \hb_reg[0]_i_1_n_7\,
      S(3) => \hb_reg_n_0_[3]\,
      S(2) => \hb_reg_n_0_[2]\,
      S(1) => \hb_reg_n_0_[1]\,
      S(0) => \hb[0]_i_2_n_0\
    );
\hb_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[8]_i_1_n_5\,
      Q => \hb_reg_n_0_[10]\,
      R => clear
    );
\hb_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[8]_i_1_n_4\,
      Q => \hb_reg_n_0_[11]\,
      R => clear
    );
\hb_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[12]_i_1_n_7\,
      Q => \hb_reg_n_0_[12]\,
      R => clear
    );
\hb_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hb_reg[8]_i_1_n_0\,
      CO(3) => \hb_reg[12]_i_1_n_0\,
      CO(2) => \hb_reg[12]_i_1_n_1\,
      CO(1) => \hb_reg[12]_i_1_n_2\,
      CO(0) => \hb_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hb_reg[12]_i_1_n_4\,
      O(2) => \hb_reg[12]_i_1_n_5\,
      O(1) => \hb_reg[12]_i_1_n_6\,
      O(0) => \hb_reg[12]_i_1_n_7\,
      S(3) => \hb_reg_n_0_[15]\,
      S(2) => \hb_reg_n_0_[14]\,
      S(1) => \hb_reg_n_0_[13]\,
      S(0) => \hb_reg_n_0_[12]\
    );
\hb_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[12]_i_1_n_6\,
      Q => \hb_reg_n_0_[13]\,
      R => clear
    );
\hb_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[12]_i_1_n_5\,
      Q => \hb_reg_n_0_[14]\,
      R => clear
    );
\hb_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[12]_i_1_n_4\,
      Q => \hb_reg_n_0_[15]\,
      R => clear
    );
\hb_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[16]_i_1_n_7\,
      Q => \hb_reg_n_0_[16]\,
      R => clear
    );
\hb_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hb_reg[12]_i_1_n_0\,
      CO(3) => \hb_reg[16]_i_1_n_0\,
      CO(2) => \hb_reg[16]_i_1_n_1\,
      CO(1) => \hb_reg[16]_i_1_n_2\,
      CO(0) => \hb_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hb_reg[16]_i_1_n_4\,
      O(2) => \hb_reg[16]_i_1_n_5\,
      O(1) => \hb_reg[16]_i_1_n_6\,
      O(0) => \hb_reg[16]_i_1_n_7\,
      S(3) => \hb_reg_n_0_[19]\,
      S(2) => \hb_reg_n_0_[18]\,
      S(1) => \hb_reg_n_0_[17]\,
      S(0) => \hb_reg_n_0_[16]\
    );
\hb_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[16]_i_1_n_6\,
      Q => \hb_reg_n_0_[17]\,
      R => clear
    );
\hb_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[16]_i_1_n_5\,
      Q => \hb_reg_n_0_[18]\,
      R => clear
    );
\hb_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[16]_i_1_n_4\,
      Q => \hb_reg_n_0_[19]\,
      R => clear
    );
\hb_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[0]_i_1_n_6\,
      Q => \hb_reg_n_0_[1]\,
      R => clear
    );
\hb_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[20]_i_1_n_7\,
      Q => \hb_reg_n_0_[20]\,
      R => clear
    );
\hb_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hb_reg[16]_i_1_n_0\,
      CO(3) => \hb_reg[20]_i_1_n_0\,
      CO(2) => \hb_reg[20]_i_1_n_1\,
      CO(1) => \hb_reg[20]_i_1_n_2\,
      CO(0) => \hb_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hb_reg[20]_i_1_n_4\,
      O(2) => \hb_reg[20]_i_1_n_5\,
      O(1) => \hb_reg[20]_i_1_n_6\,
      O(0) => \hb_reg[20]_i_1_n_7\,
      S(3) => \hb_reg_n_0_[23]\,
      S(2) => \hb_reg_n_0_[22]\,
      S(1) => \hb_reg_n_0_[21]\,
      S(0) => \hb_reg_n_0_[20]\
    );
\hb_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[20]_i_1_n_6\,
      Q => \hb_reg_n_0_[21]\,
      R => clear
    );
\hb_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[20]_i_1_n_5\,
      Q => \hb_reg_n_0_[22]\,
      R => clear
    );
\hb_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[20]_i_1_n_4\,
      Q => \hb_reg_n_0_[23]\,
      R => clear
    );
\hb_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[24]_i_1_n_7\,
      Q => \^leds\(0),
      R => clear
    );
\hb_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hb_reg[20]_i_1_n_0\,
      CO(3 downto 0) => \NLW_hb_reg[24]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_hb_reg[24]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \hb_reg[24]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \^leds\(0)
    );
\hb_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[0]_i_1_n_5\,
      Q => \hb_reg_n_0_[2]\,
      R => clear
    );
\hb_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[0]_i_1_n_4\,
      Q => \hb_reg_n_0_[3]\,
      R => clear
    );
\hb_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[4]_i_1_n_7\,
      Q => \hb_reg_n_0_[4]\,
      R => clear
    );
\hb_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hb_reg[0]_i_1_n_0\,
      CO(3) => \hb_reg[4]_i_1_n_0\,
      CO(2) => \hb_reg[4]_i_1_n_1\,
      CO(1) => \hb_reg[4]_i_1_n_2\,
      CO(0) => \hb_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hb_reg[4]_i_1_n_4\,
      O(2) => \hb_reg[4]_i_1_n_5\,
      O(1) => \hb_reg[4]_i_1_n_6\,
      O(0) => \hb_reg[4]_i_1_n_7\,
      S(3) => \hb_reg_n_0_[7]\,
      S(2) => \hb_reg_n_0_[6]\,
      S(1) => \hb_reg_n_0_[5]\,
      S(0) => \hb_reg_n_0_[4]\
    );
\hb_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[4]_i_1_n_6\,
      Q => \hb_reg_n_0_[5]\,
      R => clear
    );
\hb_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[4]_i_1_n_5\,
      Q => \hb_reg_n_0_[6]\,
      R => clear
    );
\hb_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[4]_i_1_n_4\,
      Q => \hb_reg_n_0_[7]\,
      R => clear
    );
\hb_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[8]_i_1_n_7\,
      Q => \hb_reg_n_0_[8]\,
      R => clear
    );
\hb_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \hb_reg[4]_i_1_n_0\,
      CO(3) => \hb_reg[8]_i_1_n_0\,
      CO(2) => \hb_reg[8]_i_1_n_1\,
      CO(1) => \hb_reg[8]_i_1_n_2\,
      CO(0) => \hb_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \hb_reg[8]_i_1_n_4\,
      O(2) => \hb_reg[8]_i_1_n_5\,
      O(1) => \hb_reg[8]_i_1_n_6\,
      O(0) => \hb_reg[8]_i_1_n_7\,
      S(3) => \hb_reg_n_0_[11]\,
      S(2) => \hb_reg_n_0_[10]\,
      S(1) => \hb_reg_n_0_[9]\,
      S(0) => \hb_reg_n_0_[8]\
    );
\hb_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \hb_reg[8]_i_1_n_6\,
      Q => \hb_reg_n_0_[9]\,
      R => clear
    );
peak_valid_d_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => u_peak_n_2,
      Q => peak_valid_d,
      R => '0'
    );
s_axi_arready0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \^s_axi_rvalid\,
      I2 => s_axi_rready,
      O => \s_axi_arready0__0\
    );
s_axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \s_axi_arready0__0\,
      Q => s_axi_arready,
      R => clear
    );
s_axi_awready_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A000000"
    )
        port map (
      I0 => aresetn,
      I1 => s_axi_bready,
      I2 => \^s_axi_bvalid_reg_0\,
      I3 => s_axi_awvalid,
      I4 => s_axi_wvalid,
      O => s_axi_awready_i_1_n_0
    );
s_axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => s_axi_awready_i_1_n_0,
      Q => s_axi_awready,
      R => '0'
    );
s_axi_bvalid_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^s_axi_bvalid_reg_0\,
      I2 => s_axi_awvalid,
      I3 => s_axi_wvalid,
      O => s_axi_bvalid_i_2_n_0
    );
s_axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => s_axi_bvalid_i_2_n_0,
      Q => \^s_axi_bvalid_reg_0\,
      R => clear
    );
\s_axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF0AC0000"
    )
        port map (
      I0 => scratch(0),
      I1 => frame_count_reg(0),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => \s_axi_rdata[3]_i_6_n_0\,
      I5 => \s_axi_rdata[31]_i_4_n_0\,
      O => \s_axi_rdata[0]_i_3_n_0\
    );
\s_axi_rdata[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(10),
      I5 => scratch(10),
      O => \s_axi_rdata[10]_i_4_n_0\
    );
\s_axi_rdata[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(11),
      I5 => scratch(11),
      O => \s_axi_rdata[11]_i_4_n_0\
    );
\s_axi_rdata[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(12),
      I5 => scratch(12),
      O => \s_axi_rdata[12]_i_4_n_0\
    );
\s_axi_rdata[13]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(13),
      I5 => scratch(13),
      O => \s_axi_rdata[13]_i_4_n_0\
    );
\s_axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888008808800080"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => scratch(14),
      I5 => frame_count_reg(14),
      O => \s_axi_rdata[14]_i_2_n_0\
    );
\s_axi_rdata[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(15),
      I5 => scratch(15),
      O => \s_axi_rdata[15]_i_4_n_0\
    );
\s_axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(16),
      I5 => scratch(16),
      O => \s_axi_rdata[16]_i_2_n_0\
    );
\s_axi_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => scratch(18),
      I4 => frame_count_reg(18),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[18]_i_2_n_0\
    );
\s_axi_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(19),
      I5 => scratch(19),
      O => \s_axi_rdata[19]_i_2_n_0\
    );
\s_axi_rdata[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFAEE0000"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => frame_count_reg(1),
      I2 => scratch(1),
      I3 => s_axi_araddr(1),
      I4 => \s_axi_rdata[3]_i_6_n_0\,
      I5 => \s_axi_rdata[31]_i_4_n_0\,
      O => \s_axi_rdata[1]_i_3_n_0\
    );
\s_axi_rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(21),
      I5 => scratch(21),
      O => \s_axi_rdata[21]_i_2_n_0\
    );
\s_axi_rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888008808800080"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => scratch(22),
      I5 => frame_count_reg(22),
      O => \s_axi_rdata[22]_i_2_n_0\
    );
\s_axi_rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(23),
      I5 => scratch(23),
      O => \s_axi_rdata[23]_i_2_n_0\
    );
\s_axi_rdata[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => scratch(25),
      I4 => frame_count_reg(25),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[25]_i_2_n_0\
    );
\s_axi_rdata[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(26),
      I5 => scratch(26),
      O => \s_axi_rdata[26]_i_2_n_0\
    );
\s_axi_rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(27),
      I5 => scratch(27),
      O => \s_axi_rdata[27]_i_2_n_0\
    );
\s_axi_rdata[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => scratch(28),
      I4 => frame_count_reg(28),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[28]_i_2_n_0\
    );
\s_axi_rdata[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF0AC0000"
    )
        port map (
      I0 => scratch(2),
      I1 => frame_count_reg(2),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => \s_axi_rdata[3]_i_6_n_0\,
      I5 => \s_axi_rdata[31]_i_4_n_0\,
      O => \s_axi_rdata[2]_i_3_n_0\
    );
\s_axi_rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => scratch(30),
      I4 => frame_count_reg(30),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[30]_i_2_n_0\
    );
\s_axi_rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(31),
      I5 => scratch(31),
      O => \s_axi_rdata[31]_i_2_n_0\
    );
\s_axi_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(1),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(3),
      O => \s_axi_rdata[31]_i_3_n_0\
    );
\s_axi_rdata[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => s_axi_araddr(4),
      O => \s_axi_rdata[31]_i_4_n_0\
    );
\s_axi_rdata[31]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(2),
      O => \s_axi_rdata[31]_i_7_n_0\
    );
\s_axi_rdata[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      O => \s_axi_rdata[31]_i_8_n_0\
    );
\s_axi_rdata[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF0AC0000"
    )
        port map (
      I0 => scratch(3),
      I1 => frame_count_reg(3),
      I2 => s_axi_araddr(1),
      I3 => s_axi_araddr(0),
      I4 => \s_axi_rdata[3]_i_6_n_0\,
      I5 => \s_axi_rdata[31]_i_4_n_0\,
      O => \s_axi_rdata[3]_i_3_n_0\
    );
\s_axi_rdata[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_araddr(2),
      O => \s_axi_rdata[3]_i_6_n_0\
    );
\s_axi_rdata[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888008808800080"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => scratch(4),
      I5 => frame_count_reg(4),
      O => \s_axi_rdata[4]_i_4_n_0\
    );
\s_axi_rdata[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(5),
      I5 => scratch(5),
      O => \s_axi_rdata[5]_i_4_n_0\
    );
\s_axi_rdata[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(1),
      I3 => scratch(6),
      I4 => frame_count_reg(6),
      I5 => s_axi_araddr(0),
      O => \s_axi_rdata[6]_i_4_n_0\
    );
\s_axi_rdata[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(7),
      I5 => scratch(7),
      O => \s_axi_rdata[7]_i_4_n_0\
    );
\s_axi_rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888008808800080"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => scratch(8),
      I5 => frame_count_reg(8),
      O => \s_axi_rdata[8]_i_2_n_0\
    );
\s_axi_rdata[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8808880080088000"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_araddr(3),
      I2 => s_axi_araddr(0),
      I3 => s_axi_araddr(1),
      I4 => frame_count_reg(9),
      I5 => scratch(9),
      O => \s_axi_rdata[9]_i_4_n_0\
    );
\s_axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_15,
      Q => s_axi_rdata(0),
      R => clear
    );
\s_axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_9,
      Q => s_axi_rdata(10),
      R => clear
    );
\s_axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_8,
      Q => s_axi_rdata(11),
      R => clear
    );
\s_axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_7,
      Q => s_axi_rdata(12),
      R => clear
    );
\s_axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_6,
      Q => s_axi_rdata(13),
      R => clear
    );
\s_axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_20,
      Q => s_axi_rdata(14),
      R => clear
    );
\s_axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_5,
      Q => s_axi_rdata(15),
      R => clear
    );
\s_axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_19,
      Q => s_axi_rdata(16),
      R => clear
    );
\s_axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_18,
      Q => s_axi_rdata(17),
      R => clear
    );
\s_axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_17,
      Q => s_axi_rdata(18),
      R => clear
    );
\s_axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_16,
      Q => s_axi_rdata(19),
      R => clear
    );
\s_axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_24,
      Q => s_axi_rdata(1),
      R => clear
    );
\s_axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_15,
      Q => s_axi_rdata(20),
      R => clear
    );
\s_axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_14,
      Q => s_axi_rdata(21),
      R => clear
    );
\s_axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_4,
      Q => s_axi_rdata(22),
      R => clear
    );
\s_axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_13,
      Q => s_axi_rdata(23),
      R => clear
    );
\s_axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_12,
      Q => s_axi_rdata(24),
      R => clear
    );
\s_axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_11,
      Q => s_axi_rdata(25),
      R => clear
    );
\s_axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_10,
      Q => s_axi_rdata(26),
      R => clear
    );
\s_axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_9,
      Q => s_axi_rdata(27),
      R => clear
    );
\s_axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_8,
      Q => s_axi_rdata(28),
      R => clear
    );
\s_axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_7,
      Q => s_axi_rdata(29),
      R => clear
    );
\s_axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_23,
      Q => s_axi_rdata(2),
      R => clear
    );
\s_axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_6,
      Q => s_axi_rdata(30),
      R => clear
    );
\s_axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_5,
      Q => s_axi_rdata(31),
      R => clear
    );
\s_axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_14,
      Q => s_axi_rdata(3),
      R => clear
    );
\s_axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_22,
      Q => s_axi_rdata(4),
      R => clear
    );
\s_axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_13,
      Q => s_axi_rdata(5),
      R => clear
    );
\s_axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_12,
      Q => s_axi_rdata(6),
      R => clear
    );
\s_axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_11,
      Q => s_axi_rdata(7),
      R => clear
    );
\s_axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_pulse_n_21,
      Q => s_axi_rdata(8),
      R => clear
    );
\s_axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \s_axi_arready0__0\,
      D => u_peak_n_10,
      Q => s_axi_rdata(9),
      R => clear
    );
s_axi_rvalid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_rready,
      I2 => \^s_axi_rvalid\,
      O => s_axi_rvalid_i_1_n_0
    );
s_axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => s_axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => clear
    );
s_axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => s_axi_awready_i_1_n_0,
      Q => s_axi_wready,
      R => '0'
    );
\scratch[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => s_axi_awaddr(3),
      I1 => s_axi_awaddr(2),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => enable_i_3_n_0,
      I5 => s_axi_wstrb(1),
      O => \scratch[15]_i_1_n_0\
    );
\scratch[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => s_axi_awaddr(3),
      I1 => s_axi_awaddr(2),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => enable_i_3_n_0,
      I5 => s_axi_wstrb(2),
      O => \scratch[23]_i_1_n_0\
    );
\scratch[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => s_axi_awaddr(3),
      I1 => s_axi_awaddr(2),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => enable_i_3_n_0,
      I5 => s_axi_wstrb(3),
      O => \scratch[31]_i_1_n_0\
    );
\scratch[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => s_axi_awaddr(3),
      I1 => s_axi_awaddr(2),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => enable_i_3_n_0,
      I5 => s_axi_wstrb(0),
      O => \scratch[7]_i_1_n_0\
    );
\scratch_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(0),
      Q => scratch(0),
      S => clear
    );
\scratch_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(10),
      Q => scratch(10),
      R => clear
    );
\scratch_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(11),
      Q => scratch(11),
      R => clear
    );
\scratch_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(12),
      Q => scratch(12),
      R => clear
    );
\scratch_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(13),
      Q => scratch(13),
      R => clear
    );
\scratch_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(14),
      Q => scratch(14),
      R => clear
    );
\scratch_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(15),
      Q => scratch(15),
      R => clear
    );
\scratch_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(16),
      Q => scratch(16),
      S => clear
    );
\scratch_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(17),
      Q => scratch(17),
      R => clear
    );
\scratch_reg[18]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(18),
      Q => scratch(18),
      S => clear
    );
\scratch_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(19),
      Q => scratch(19),
      R => clear
    );
\scratch_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(1),
      Q => scratch(1),
      R => clear
    );
\scratch_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(20),
      Q => scratch(20),
      R => clear
    );
\scratch_reg[21]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(21),
      Q => scratch(21),
      S => clear
    );
\scratch_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(22),
      Q => scratch(22),
      R => clear
    );
\scratch_reg[23]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[23]_i_1_n_0\,
      D => s_axi_wdata(23),
      Q => scratch(23),
      S => clear
    );
\scratch_reg[24]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(24),
      Q => scratch(24),
      S => clear
    );
\scratch_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(25),
      Q => scratch(25),
      R => clear
    );
\scratch_reg[26]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(26),
      Q => scratch(26),
      S => clear
    );
\scratch_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(27),
      Q => scratch(27),
      R => clear
    );
\scratch_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(28),
      Q => scratch(28),
      R => clear
    );
\scratch_reg[29]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(29),
      Q => scratch(29),
      S => clear
    );
\scratch_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(2),
      Q => scratch(2),
      R => clear
    );
\scratch_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(30),
      Q => scratch(30),
      R => clear
    );
\scratch_reg[31]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \scratch[31]_i_1_n_0\,
      D => s_axi_wdata(31),
      Q => scratch(31),
      S => clear
    );
\scratch_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(3),
      Q => scratch(3),
      R => clear
    );
\scratch_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(4),
      Q => scratch(4),
      R => clear
    );
\scratch_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(5),
      Q => scratch(5),
      R => clear
    );
\scratch_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(6),
      Q => scratch(6),
      R => clear
    );
\scratch_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[7]_i_1_n_0\,
      D => s_axi_wdata(7),
      Q => scratch(7),
      R => clear
    );
\scratch_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(8),
      Q => scratch(8),
      R => clear
    );
\scratch_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \scratch[15]_i_1_n_0\,
      D => s_axi_wdata(9),
      Q => scratch(9),
      R => clear
    );
soft_reset_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => enable_i_2_n_0,
      I1 => s_axi_wdata(1),
      I2 => s_axi_wstrb(0),
      I3 => s_axi_awaddr(4),
      I4 => s_axi_awaddr(5),
      I5 => s_axi_awready_i_1_n_0,
      O => soft_reset_r_i_1_n_0
    );
soft_reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => soft_reset_r_i_1_n_0,
      Q => soft_reset_r_reg_n_0,
      R => '0'
    );
\threshold[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => enable_i_3_n_0,
      I1 => s_axi_awaddr(3),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => s_axi_awaddr(2),
      I5 => s_axi_wstrb(1),
      O => \threshold[15]_i_1_n_0\
    );
\threshold[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => enable_i_3_n_0,
      I1 => s_axi_awaddr(3),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => s_axi_awaddr(2),
      I5 => s_axi_wstrb(2),
      O => \threshold[23]_i_1_n_0\
    );
\threshold[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => enable_i_3_n_0,
      I1 => s_axi_awaddr(3),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => s_axi_awaddr(2),
      I5 => s_axi_wstrb(3),
      O => \threshold[31]_i_1_n_0\
    );
\threshold[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => enable_i_3_n_0,
      I1 => s_axi_awaddr(3),
      I2 => s_axi_awaddr(0),
      I3 => s_axi_awaddr(1),
      I4 => s_axi_awaddr(2),
      I5 => s_axi_wstrb(0),
      O => \threshold[7]_i_1_n_0\
    );
\threshold_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(0),
      Q => threshold(0),
      R => clear
    );
\threshold_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(10),
      Q => threshold(10),
      R => clear
    );
\threshold_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(11),
      Q => threshold(11),
      R => clear
    );
\threshold_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(12),
      Q => threshold(12),
      R => clear
    );
\threshold_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(13),
      Q => threshold(13),
      R => clear
    );
\threshold_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(14),
      Q => threshold(14),
      S => clear
    );
\threshold_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(15),
      Q => threshold(15),
      R => clear
    );
\threshold_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(16),
      Q => threshold(16),
      S => clear
    );
\threshold_reg[17]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(17),
      Q => threshold(17),
      S => clear
    );
\threshold_reg[18]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(18),
      Q => threshold(18),
      S => clear
    );
\threshold_reg[19]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(19),
      Q => threshold(19),
      S => clear
    );
\threshold_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(1),
      Q => threshold(1),
      R => clear
    );
\threshold_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(20),
      Q => threshold(20),
      R => clear
    );
\threshold_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(21),
      Q => threshold(21),
      R => clear
    );
\threshold_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(22),
      Q => threshold(22),
      R => clear
    );
\threshold_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[23]_i_1_n_0\,
      D => s_axi_wdata(23),
      Q => threshold(23),
      R => clear
    );
\threshold_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(24),
      Q => threshold(24),
      R => clear
    );
\threshold_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(25),
      Q => threshold(25),
      R => clear
    );
\threshold_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(26),
      Q => threshold(26),
      R => clear
    );
\threshold_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(27),
      Q => threshold(27),
      R => clear
    );
\threshold_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(28),
      Q => threshold(28),
      R => clear
    );
\threshold_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(29),
      Q => threshold(29),
      R => clear
    );
\threshold_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(2),
      Q => threshold(2),
      R => clear
    );
\threshold_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(30),
      Q => threshold(30),
      R => clear
    );
\threshold_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[31]_i_1_n_0\,
      D => s_axi_wdata(31),
      Q => threshold(31),
      R => clear
    );
\threshold_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(3),
      Q => threshold(3),
      R => clear
    );
\threshold_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(4),
      Q => threshold(4),
      R => clear
    );
\threshold_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(5),
      Q => threshold(5),
      R => clear
    );
\threshold_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(6),
      Q => threshold(6),
      S => clear
    );
\threshold_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[7]_i_1_n_0\,
      D => s_axi_wdata(7),
      Q => threshold(7),
      R => clear
    );
\threshold_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(8),
      Q => threshold(8),
      R => clear
    );
\threshold_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => \threshold[15]_i_1_n_0\,
      D => s_axi_wdata(9),
      Q => threshold(9),
      S => clear
    );
u_fft_cfg: entity work.radar_system_radar_core_0_0_fft_config_master
     port map (
      aclk => aclk,
      aresetn => aresetn,
      clear => clear,
      kicked_reg_0 => config_kick_reg_n_0,
      m_axis_fft_config_tready => m_axis_fft_config_tready,
      m_axis_fft_config_tvalid => m_axis_fft_config_tvalid
    );
u_peak: entity work.radar_system_radar_core_0_0_axis_peak_detect
     port map (
      D(11) => u_peak_n_4,
      D(10) => u_peak_n_5,
      D(9) => u_peak_n_6,
      D(8) => u_peak_n_7,
      D(7) => u_peak_n_8,
      D(6) => u_peak_n_9,
      D(5) => u_peak_n_10,
      D(4) => u_peak_n_11,
      D(3) => u_peak_n_12,
      D(2) => u_peak_n_13,
      D(1) => u_peak_n_14,
      D(0) => u_peak_n_15,
      Q(13) => threshold(22),
      Q(12 downto 2) => threshold(15 downto 5),
      Q(1) => threshold(3),
      Q(0) => threshold(0),
      aclk => aclk,
      aresetn => aresetn,
      \bins_seen_reg[15]_0\(15 downto 0) => bins_seen(15 downto 0),
      clear => clear,
      frame_count0 => frame_count0,
      \peak_mag2_reg[1]_0\ => u_peak_n_16,
      \peak_mag2_reg[2]_0\ => u_peak_n_17,
      \peak_mag2_reg[4]_0\ => u_peak_n_18,
      peak_valid_d => peak_valid_d,
      peak_valid_d_reg => u_peak_n_2,
      peak_valid_d_reg_0 => u_pulse_n_0,
      peak_valid_reg_0 => peak_valid_reg,
      pw_samples(31 downto 0) => pw_samples(31 downto 0),
      re2_pipe_reg_0 => \^enable_reg_0\,
      s_axi_araddr(3 downto 0) => s_axi_araddr(3 downto 0),
      \s_axi_araddr[2]_0\ => u_peak_n_22,
      \s_axi_araddr[2]_1\ => u_peak_n_23,
      \s_axi_araddr[2]_10\ => u_peak_n_32,
      \s_axi_araddr[2]_11\ => u_peak_n_33,
      \s_axi_araddr[2]_12\ => u_peak_n_34,
      \s_axi_araddr[2]_13\ => u_peak_n_35,
      \s_axi_araddr[2]_2\ => u_peak_n_24,
      \s_axi_araddr[2]_3\ => u_peak_n_25,
      \s_axi_araddr[2]_4\ => u_peak_n_26,
      \s_axi_araddr[2]_5\ => u_peak_n_27,
      \s_axi_araddr[2]_6\ => u_peak_n_28,
      \s_axi_araddr[2]_7\ => u_peak_n_29,
      \s_axi_araddr[2]_8\ => u_peak_n_30,
      \s_axi_araddr[2]_9\ => u_peak_n_31,
      \s_axi_araddr[3]_0\ => u_peak_n_20,
      s_axi_araddr_2_sp_1 => u_peak_n_21,
      s_axi_araddr_3_sp_1 => u_peak_n_19,
      \s_axi_rdata_reg[0]\ => \s_axi_rdata[0]_i_3_n_0\,
      \s_axi_rdata_reg[0]_0\ => u_pulse_n_4,
      \s_axi_rdata_reg[10]\ => u_pulse_n_30,
      \s_axi_rdata_reg[10]_0\ => \s_axi_rdata[10]_i_4_n_0\,
      \s_axi_rdata_reg[11]\ => u_pulse_n_31,
      \s_axi_rdata_reg[11]_0\ => \s_axi_rdata[11]_i_4_n_0\,
      \s_axi_rdata_reg[12]\ => u_pulse_n_32,
      \s_axi_rdata_reg[12]_0\ => \s_axi_rdata[12]_i_4_n_0\,
      \s_axi_rdata_reg[13]\ => u_pulse_n_33,
      \s_axi_rdata_reg[13]_0\ => \s_axi_rdata[13]_i_4_n_0\,
      \s_axi_rdata_reg[15]\(12 downto 2) => fft_size(15 downto 5),
      \s_axi_rdata_reg[15]\(1) => fft_size(3),
      \s_axi_rdata_reg[15]\(0) => fft_size(0),
      \s_axi_rdata_reg[15]_0\ => u_pulse_n_34,
      \s_axi_rdata_reg[15]_1\ => \s_axi_rdata[15]_i_4_n_0\,
      \s_axi_rdata_reg[16]\ => \s_axi_rdata[31]_i_8_n_0\,
      \s_axi_rdata_reg[22]\ => \s_axi_rdata[22]_i_2_n_0\,
      \s_axi_rdata_reg[22]_0\ => \s_axi_rdata[31]_i_3_n_0\,
      \s_axi_rdata_reg[22]_1\ => u_pulse_n_35,
      \s_axi_rdata_reg[3]\ => \s_axi_rdata[3]_i_3_n_0\,
      \s_axi_rdata_reg[3]_0\ => u_pulse_n_25,
      \s_axi_rdata_reg[5]\ => u_pulse_n_26,
      \s_axi_rdata_reg[5]_0\ => \s_axi_rdata[31]_i_4_n_0\,
      \s_axi_rdata_reg[5]_1\ => \s_axi_rdata[5]_i_4_n_0\,
      \s_axi_rdata_reg[6]\ => u_pulse_n_27,
      \s_axi_rdata_reg[6]_0\ => \s_axi_rdata[6]_i_4_n_0\,
      \s_axi_rdata_reg[7]\ => u_pulse_n_28,
      \s_axi_rdata_reg[7]_0\ => \s_axi_rdata[7]_i_4_n_0\,
      \s_axi_rdata_reg[9]\ => u_pulse_n_29,
      \s_axi_rdata_reg[9]_0\ => \s_axi_rdata[9]_i_4_n_0\,
      s_axis_fft_tdata(31 downto 0) => s_axis_fft_tdata(31 downto 0),
      s_axis_fft_tlast => s_axis_fft_tlast,
      s_axis_fft_tvalid => s_axis_fft_tvalid
    );
u_pulse: entity work.radar_system_radar_core_0_0_axis_pulse_detect
     port map (
      D(19) => u_pulse_n_5,
      D(18) => u_pulse_n_6,
      D(17) => u_pulse_n_7,
      D(16) => u_pulse_n_8,
      D(15) => u_pulse_n_9,
      D(14) => u_pulse_n_10,
      D(13) => u_pulse_n_11,
      D(12) => u_pulse_n_12,
      D(11) => u_pulse_n_13,
      D(10) => u_pulse_n_14,
      D(9) => u_pulse_n_15,
      D(8) => u_pulse_n_16,
      D(7) => u_pulse_n_17,
      D(6) => u_pulse_n_18,
      D(5) => u_pulse_n_19,
      D(4) => u_pulse_n_20,
      D(3) => u_pulse_n_21,
      D(2) => u_pulse_n_22,
      D(1) => u_pulse_n_23,
      D(0) => u_pulse_n_24,
      E(0) => u_window_n_15,
      Q(31 downto 0) => threshold(31 downto 0),
      SR(0) => u_window_n_13,
      aclk => aclk,
      aresetn => aresetn,
      frame_count_reg(3) => frame_count_reg(29),
      frame_count_reg(2) => frame_count_reg(24),
      frame_count_reg(1) => frame_count_reg(20),
      frame_count_reg(0) => frame_count_reg(17),
      have_rise => have_rise,
      in_pulse012_out => in_pulse012_out,
      in_pulse_reg_0 => \^in_pulse_reg\,
      m_axis_fft_tready => m_axis_fft_tready,
      p_4_in(0) => p_4_in(2),
      \pri_samples_reg[0]_0\ => \^enable_reg_0\,
      \pri_samples_reg[0]_1\ => \^m_tvalid_reg\,
      \pulse_count_reg[0]_0\ => u_pulse_n_4,
      \pulse_count_reg[10]_0\ => u_pulse_n_30,
      \pulse_count_reg[11]_0\ => u_pulse_n_31,
      \pulse_count_reg[12]_0\ => u_pulse_n_32,
      \pulse_count_reg[13]_0\ => u_pulse_n_33,
      \pulse_count_reg[15]_0\ => u_pulse_n_34,
      \pulse_count_reg[31]_0\ => soft_reset_r_reg_n_0,
      \pulse_count_reg[3]_0\ => u_pulse_n_25,
      \pulse_count_reg[5]_0\ => u_pulse_n_26,
      \pulse_count_reg[6]_0\ => u_pulse_n_27,
      \pulse_count_reg[7]_0\ => u_pulse_n_28,
      \pulse_count_reg[9]_0\ => u_pulse_n_29,
      pw_samples(31 downto 0) => pw_samples(31 downto 0),
      s_axi_araddr(5 downto 0) => s_axi_araddr(5 downto 0),
      s_axi_araddr_2_sp_1 => u_pulse_n_35,
      \s_axi_rdata[4]_i_2_0\(2) => fft_size(4),
      \s_axi_rdata[4]_i_2_0\(1 downto 0) => fft_size(2 downto 1),
      \s_axi_rdata_reg[14]\ => \s_axi_rdata[14]_i_2_n_0\,
      \s_axi_rdata_reg[14]_0\ => u_peak_n_20,
      \s_axi_rdata_reg[15]\(15 downto 0) => bins_seen(15 downto 0),
      \s_axi_rdata_reg[16]\ => \s_axi_rdata[16]_i_2_n_0\,
      \s_axi_rdata_reg[16]_0\ => \s_axi_rdata[31]_i_3_n_0\,
      \s_axi_rdata_reg[16]_1\ => u_peak_n_21,
      \s_axi_rdata_reg[16]_2\ => \s_axi_rdata[31]_i_7_n_0\,
      \s_axi_rdata_reg[17]\ => u_peak_n_22,
      \s_axi_rdata_reg[18]\ => \s_axi_rdata[18]_i_2_n_0\,
      \s_axi_rdata_reg[18]_0\ => u_peak_n_23,
      \s_axi_rdata_reg[19]\ => \s_axi_rdata[19]_i_2_n_0\,
      \s_axi_rdata_reg[19]_0\ => u_peak_n_24,
      \s_axi_rdata_reg[1]\ => u_peak_n_16,
      \s_axi_rdata_reg[1]_0\ => \s_axi_rdata[1]_i_3_n_0\,
      \s_axi_rdata_reg[20]\ => u_peak_n_25,
      \s_axi_rdata_reg[21]\ => \s_axi_rdata[21]_i_2_n_0\,
      \s_axi_rdata_reg[21]_0\ => u_peak_n_26,
      \s_axi_rdata_reg[23]\ => \s_axi_rdata[23]_i_2_n_0\,
      \s_axi_rdata_reg[23]_0\ => u_peak_n_27,
      \s_axi_rdata_reg[24]\ => u_peak_n_28,
      \s_axi_rdata_reg[25]\ => \s_axi_rdata[25]_i_2_n_0\,
      \s_axi_rdata_reg[25]_0\ => u_peak_n_29,
      \s_axi_rdata_reg[26]\ => \s_axi_rdata[26]_i_2_n_0\,
      \s_axi_rdata_reg[26]_0\ => u_peak_n_30,
      \s_axi_rdata_reg[27]\ => \s_axi_rdata[27]_i_2_n_0\,
      \s_axi_rdata_reg[27]_0\ => u_peak_n_31,
      \s_axi_rdata_reg[28]\ => \s_axi_rdata[28]_i_2_n_0\,
      \s_axi_rdata_reg[28]_0\ => u_peak_n_32,
      \s_axi_rdata_reg[29]\(3) => scratch(29),
      \s_axi_rdata_reg[29]\(2) => scratch(24),
      \s_axi_rdata_reg[29]\(1) => scratch(20),
      \s_axi_rdata_reg[29]\(0) => scratch(17),
      \s_axi_rdata_reg[29]_0\ => u_peak_n_33,
      \s_axi_rdata_reg[2]\ => u_peak_n_17,
      \s_axi_rdata_reg[2]_0\ => \s_axi_rdata[2]_i_3_n_0\,
      \s_axi_rdata_reg[30]\ => \s_axi_rdata[30]_i_2_n_0\,
      \s_axi_rdata_reg[30]_0\ => u_peak_n_34,
      \s_axi_rdata_reg[31]\ => \s_axi_rdata[31]_i_2_n_0\,
      \s_axi_rdata_reg[31]_0\ => u_peak_n_35,
      \s_axi_rdata_reg[4]\ => u_peak_n_18,
      \s_axi_rdata_reg[4]_0\ => \s_axi_rdata[4]_i_4_n_0\,
      \s_axi_rdata_reg[8]\ => \s_axi_rdata[8]_i_2_n_0\,
      \s_axi_rdata_reg[8]_0\ => u_peak_n_19,
      \s_axi_rdata_reg[8]_1\ => \s_axi_rdata[31]_i_4_n_0\,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tvalid => s_axis_tvalid,
      sample_fire => sample_fire,
      \since_rise_reg[31]_0\(0) => since_rise,
      soft_reset_r_reg => u_pulse_n_0
    );
u_window: entity work.radar_system_radar_core_0_0_axis_window
     port map (
      ADDRARDADDR(9 downto 0) => ADDRARDADDR(9 downto 0),
      DOADO(15 downto 0) => DOADO(15 downto 0),
      E(0) => u_window_n_15,
      SR(0) => u_window_n_13,
      aclk => aclk,
      aresetn => aresetn,
      aresetn_0 => aresetn_0,
      clear => clear,
      have_rise => have_rise,
      in_pulse012_out => in_pulse012_out,
      m_axis_fft_tdata(31 downto 0) => m_axis_fft_tdata(31 downto 0),
      m_axis_fft_tlast => m_axis_fft_tlast,
      m_axis_fft_tready => m_axis_fft_tready,
      m_axis_fft_tready_0(0) => since_rise,
      \m_tdata_reg[31]_0\ => \^enable_reg_0\,
      m_tvalid_reg_0 => \^m_tvalid_reg\,
      p_4_in(0) => p_4_in(2),
      \pw_acc_reg[1]\ => \^in_pulse_reg\,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid,
      sample_fire => sample_fire,
      \since_rise_reg[1]\ => u_pulse_n_0
    );
window_enable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => s_axi_wdata(2),
      I1 => s_axi_wstrb(0),
      I2 => enable_i_2_n_0,
      I3 => enable_i_3_n_0,
      I4 => p_4_in(2),
      O => window_enable_i_1_n_0
    );
window_enable_reg: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => window_enable_i_1_n_0,
      Q => p_4_in(2),
      S => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity radar_system_radar_core_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    m_axis_fft_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_fft_tvalid : out STD_LOGIC;
    m_axis_fft_tready : in STD_LOGIC;
    m_axis_fft_tlast : out STD_LOGIC;
    m_axis_fft_config_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_fft_config_tvalid : out STD_LOGIC;
    m_axis_fft_config_tready : in STD_LOGIC;
    s_axis_fft_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_fft_tvalid : in STD_LOGIC;
    s_axis_fft_tready : out STD_LOGIC;
    s_axis_fft_tlast : in STD_LOGIC;
    leds : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of radar_system_radar_core_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of radar_system_radar_core_0_0 : entity is "radar_system_radar_core_0_0,radar_core,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of radar_system_radar_core_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of radar_system_radar_core_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of radar_system_radar_core_0_0 : entity is "radar_core,Vivado 2024.2";
end radar_system_radar_core_0_0;

architecture STRUCTURE of radar_system_radar_core_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal inst_n_0 : STD_LOGIC;
  signal inst_n_12 : STD_LOGIC;
  signal inst_n_13 : STD_LOGIC;
  signal inst_n_14 : STD_LOGIC;
  signal inst_n_15 : STD_LOGIC;
  signal inst_n_16 : STD_LOGIC;
  signal inst_n_17 : STD_LOGIC;
  signal inst_n_18 : STD_LOGIC;
  signal inst_n_19 : STD_LOGIC;
  signal inst_n_20 : STD_LOGIC;
  signal inst_n_21 : STD_LOGIC;
  signal n_count_reg_rep_n_0 : STD_LOGIC;
  signal n_count_reg_rep_n_1 : STD_LOGIC;
  signal n_count_reg_rep_n_10 : STD_LOGIC;
  signal n_count_reg_rep_n_11 : STD_LOGIC;
  signal n_count_reg_rep_n_12 : STD_LOGIC;
  signal n_count_reg_rep_n_13 : STD_LOGIC;
  signal n_count_reg_rep_n_14 : STD_LOGIC;
  signal n_count_reg_rep_n_15 : STD_LOGIC;
  signal n_count_reg_rep_n_2 : STD_LOGIC;
  signal n_count_reg_rep_n_3 : STD_LOGIC;
  signal n_count_reg_rep_n_4 : STD_LOGIC;
  signal n_count_reg_rep_n_5 : STD_LOGIC;
  signal n_count_reg_rep_n_6 : STD_LOGIC;
  signal n_count_reg_rep_n_7 : STD_LOGIC;
  signal n_count_reg_rep_n_8 : STD_LOGIC;
  signal n_count_reg_rep_n_9 : STD_LOGIC;
  signal NLW_n_count_reg_rep_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_n_count_reg_rep_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_n_count_reg_rep_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of n_count_reg_rep : label is "p0_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of n_count_reg_rep : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of n_count_reg_rep : label is 16384;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of n_count_reg_rep : label is "axis_window/n_count_reg_rep";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of n_count_reg_rep : label is "NONE";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of n_count_reg_rep : label is "RAM_SP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of n_count_reg_rep : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of n_count_reg_rep : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of n_count_reg_rep : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of n_count_reg_rep : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of n_count_reg_rep : label is 15;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF S_AXI:S_AXIS:M_AXIS_FFT:S_AXIS_FFT:M_AXIS_FFT_CONFIG, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_fft_config_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TREADY";
  attribute X_INTERFACE_INFO of m_axis_fft_config_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TVALID";
  attribute X_INTERFACE_INFO of m_axis_fft_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT TLAST";
  attribute X_INTERFACE_INFO of m_axis_fft_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT TREADY";
  attribute X_INTERFACE_INFO of m_axis_fft_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT TVALID";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of s_axis_fft_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS_FFT TLAST";
  attribute X_INTERFACE_INFO of s_axis_fft_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS_FFT TREADY";
  attribute X_INTERFACE_INFO of s_axis_fft_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_FFT TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_INFO of m_axis_fft_config_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT_CONFIG TDATA";
  attribute X_INTERFACE_MODE of m_axis_fft_config_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_fft_config_tdata : signal is "XIL_INTERFACENAME M_AXIS_FFT_CONFIG, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_fft_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_FFT TDATA";
  attribute X_INTERFACE_MODE of m_axis_fft_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_fft_tdata : signal is "XIL_INTERFACENAME M_AXIS_FFT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_MODE of s_axi_awaddr : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_awaddr : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, ADDR_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
  attribute X_INTERFACE_INFO of s_axis_fft_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_FFT TDATA";
  attribute X_INTERFACE_MODE of s_axis_fft_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_fft_tdata : signal is "XIL_INTERFACENAME S_AXIS_FFT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value vect} size {attribs {resolve_type generated dependency vect_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency vect_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32768} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_xn_re {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xn_re} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32752} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency frame_size format long minimum {} maximum {}} value 1024} stride {attribs {resolve_type generated dependency frame_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xn_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency xn_fractwidth format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} field_xn_im {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xn_im} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 32752} bitoffset {attribs {resolve_type generated dependency xn_im_offset format long minimum {} maximum {}} value 16} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency frame_size format long minimum {} maximum {}} value 1024} stride {attribs {resolve_type generated dependency frame_stride format long minimum {} maximum {}} value 32} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xn_width format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency xn_fractwidth format long minimum {} maximum {}} value 15} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}}}}} TDATA_WIDTH 32 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_xk_index {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xk_index} enabled {attribs {resolve_type generated dependency xk_index_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency xk_index_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_blk_exp {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value blk_exp} enabled {attribs {resolve_type generated dependency blk_exp_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type generated dependency blk_exp_offset format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} field_ovflo {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value ovflo} enabled {attribs {resolve_type generated dependency ovflo_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type generated dependency ovflo_offset format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}}}} TUSER_WIDTH 8}, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute X_INTERFACE_MODE of s_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_tdata : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN radar_system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
  m_axis_fft_config_tdata(7) <= \<const0>\;
  m_axis_fft_config_tdata(6) <= \<const0>\;
  m_axis_fft_config_tdata(5) <= \<const0>\;
  m_axis_fft_config_tdata(4) <= \<const0>\;
  m_axis_fft_config_tdata(3) <= \<const0>\;
  m_axis_fft_config_tdata(2) <= \<const0>\;
  m_axis_fft_config_tdata(1) <= \<const0>\;
  m_axis_fft_config_tdata(0) <= \<const1>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axis_fft_tready <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.radar_system_radar_core_0_0_radar_core
     port map (
      ADDRARDADDR(9) => inst_n_12,
      ADDRARDADDR(8) => inst_n_13,
      ADDRARDADDR(7) => inst_n_14,
      ADDRARDADDR(6) => inst_n_15,
      ADDRARDADDR(5) => inst_n_16,
      ADDRARDADDR(4) => inst_n_17,
      ADDRARDADDR(3) => inst_n_18,
      ADDRARDADDR(2) => inst_n_19,
      ADDRARDADDR(1) => inst_n_20,
      ADDRARDADDR(0) => inst_n_21,
      DOADO(15) => n_count_reg_rep_n_0,
      DOADO(14) => n_count_reg_rep_n_1,
      DOADO(13) => n_count_reg_rep_n_2,
      DOADO(12) => n_count_reg_rep_n_3,
      DOADO(11) => n_count_reg_rep_n_4,
      DOADO(10) => n_count_reg_rep_n_5,
      DOADO(9) => n_count_reg_rep_n_6,
      DOADO(8) => n_count_reg_rep_n_7,
      DOADO(7) => n_count_reg_rep_n_8,
      DOADO(6) => n_count_reg_rep_n_9,
      DOADO(5) => n_count_reg_rep_n_10,
      DOADO(4) => n_count_reg_rep_n_11,
      DOADO(3) => n_count_reg_rep_n_12,
      DOADO(2) => n_count_reg_rep_n_13,
      DOADO(1) => n_count_reg_rep_n_14,
      DOADO(0) => n_count_reg_rep_n_15,
      aclk => aclk,
      aresetn => aresetn,
      aresetn_0 => inst_n_0,
      enable_reg_0 => leds(0),
      in_pulse_reg => leds(2),
      leds(0) => leds(3),
      m_axis_fft_config_tready => m_axis_fft_config_tready,
      m_axis_fft_config_tvalid => m_axis_fft_config_tvalid,
      m_axis_fft_tdata(31 downto 0) => m_axis_fft_tdata(31 downto 0),
      m_axis_fft_tlast => m_axis_fft_tlast,
      m_axis_fft_tready => m_axis_fft_tready,
      m_tvalid_reg => m_axis_fft_tvalid,
      peak_valid_reg => leds(1),
      s_axi_araddr(5 downto 0) => s_axi_araddr(7 downto 2),
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(5 downto 0) => s_axi_awaddr(7 downto 2),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bvalid_reg_0 => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      s_axis_fft_tdata(31 downto 0) => s_axis_fft_tdata(31 downto 0),
      s_axis_fft_tlast => s_axis_fft_tlast,
      s_axis_fft_tvalid => s_axis_fft_tvalid,
      s_axis_tdata(31 downto 0) => s_axis_tdata(31 downto 0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
n_count_reg_rep: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0045003D0034002C0025001F00190014000F000B000800050003000100000000",
      INIT_01 => X"01280115010300F200E100D000C100B200A300950088007B006F00640059004F",
      INIT_02 => X"02A6028A026E02530238021E020501EC01D401BC01A5018F01790164014F013B",
      INIT_03 => X"04BB04960470044C0428040503E203C0039E037D035C033D031D02FE02E002C3",
      INIT_04 => X"07630734070606D906AC067F0653062805FD05D305A9058005580530050804E2",
      INIT_05 => X"0A970A5F0A2909F309BD09880953091F08EC08B908860855082307F207C20792",
      INIT_06 => X"0E4E0E0F0DD00D920D540D170CDA0C9E0C620C270BED0BB20B790B3F0B070ACE",
      INIT_07 => X"1281123A11F411AE1169112410E0109C105910160FD30F910F500F0F0ECE0E8E",
      INIT_08 => X"172316D61689163D15F115A5155A150F14C5147B143113E8139F1357130F12C8",
      INIT_09 => X"1C2B1BD81B851B321AE01A8E1A3D19EC199B194B18FB18AB185C180D17BF1771",
      INIT_0A => X"218B213320DB2083202B1FD41F7D1F271ED11E7B1E251DD01D7B1D271CD21C7E",
      INIT_0B => X"273626DA267D262125C5256A250E24B3245823FE23A3234922EF2296223D21E4",
      INIT_0C => X"2D1F2CBF2C5F2BFF2BA02B412AE12A832A2429C52967290928AB284E27F02793",
      INIT_0D => X"333632D43271320F31AD314B30E9308730262FC42F632F022EA12E402DE02D7F",
      INIT_0E => X"396D390938A5384137DD3779371636B2364F35EB3588352534C2345F33FC3399",
      INIT_0F => X"3FB43F4F3EEB3E863E223DBD3D583CF43C8F3C2B3BC73B623AFE3A9A3A3539D1",
      INIT_10 => X"45FC4598453344CF446B440643A2433D42D94274421041AB414740E2407D4019",
      INIT_11 => X"4C354BD24B6F4B0C4AA94A4649E2497F491B48B7485447F0478C472846C44660",
      INIT_12 => X"525051EF518E512E50CD506B500A4FA94F474EE54E834E214DBF4D5D4CFA4C98",
      INIT_13 => X"583D57E05783572556C75669560A55AC554D54EE548F542F53D05370531052B0",
      INIT_14 => X"5DEF5D965D3C5CE35C895C2F5BD45B795B1E5AC35A685A0C59B0595458F7589A",
      INIT_15 => X"6357630362AE625A620461AF6159610360AD60565FFF5FA85F505EF85EA05E48",
      INIT_16 => X"6867681967CA677B672C66DC668C663C65EB6599654864F664A4645163FE63AA",
      INIT_17 => X"6D146CCC6C846C3C6BF36BA96B606B156ACB6A806A3469E8699C6950690268B5",
      INIT_18 => X"7151711170D0708F704D700B6FC86F856F416EFD6EB86E736E2E6DE86DA26D5B",
      INIT_19 => X"751574DC74A3746A743073F573BA737F7343730672C9728C724E720F71D07191",
      INIT_1A => X"7855782577F477C37792775F772D76F976C67691765D762775F175BB7584754D",
      INIT_1B => X"7B0A7AE37ABB7A937A6A7A417A1779EC79C17996796A793D791078E278B37884",
      INIT_1C => X"7D2D7D107CF17CD27CB37C927C727C507C2E7C0C7BE97BC57BA17B7C7B577B31",
      INIT_1D => X"7EBA7EA57E917E7B7E657E4E7E377E1F7E077DEE7DD47DBA7D9F7D837D677D4B",
      INIT_1E => X"7FAB7FA07F957F8A7F7D7F707F637F557F467F367F267F167F057EF37EE07ECD",
      INIT_1F => X"7FFF7FFE7FFD7FFB7FF97FF67FF27FEE7FE97FE37FDD7FD67FCF7FC77FBE7FB5",
      INIT_20 => X"7FB57FBE7FC77FCF7FD67FDD7FE37FE97FEE7FF27FF67FF97FFB7FFD7FFE7FFF",
      INIT_21 => X"7ECD7EE07EF37F057F167F267F367F467F557F637F707F7D7F8A7F957FA07FAB",
      INIT_22 => X"7D4B7D677D837D9F7DBA7DD47DEE7E077E1F7E377E4E7E657E7B7E917EA57EBA",
      INIT_23 => X"7B317B577B7C7BA17BC57BE97C0C7C2E7C507C727C927CB37CD27CF17D107D2D",
      INIT_24 => X"788478B378E27910793D796A799679C179EC7A177A417A6A7A937ABB7AE37B0A",
      INIT_25 => X"754D758475BB75F17627765D769176C676F9772D775F779277C377F478257855",
      INIT_26 => X"719171D0720F724E728C72C973067343737F73BA73F57430746A74A374DC7515",
      INIT_27 => X"6D5B6DA26DE86E2E6E736EB86EFD6F416F856FC8700B704D708F70D071117151",
      INIT_28 => X"68B569026950699C69E86A346A806ACB6B156B606BA96BF36C3C6C846CCC6D14",
      INIT_29 => X"63AA63FE645164A464F66548659965EB663C668C66DC672C677B67CA68196867",
      INIT_2A => X"5E485EA05EF85F505FA85FFF605660AD6103615961AF6204625A62AE63036357",
      INIT_2B => X"589A58F7595459B05A0C5A685AC35B1E5B795BD45C2F5C895CE35D3C5D965DEF",
      INIT_2C => X"52B05310537053D0542F548F54EE554D55AC560A566956C75725578357E0583D",
      INIT_2D => X"4C984CFA4D5D4DBF4E214E834EE54F474FA9500A506B50CD512E518E51EF5250",
      INIT_2E => X"466046C44728478C47F0485448B7491B497F49E24A464AA94B0C4B6F4BD24C35",
      INIT_2F => X"4019407D40E2414741AB4210427442D9433D43A24406446B44CF4533459845FC",
      INIT_30 => X"39D13A353A9A3AFE3B623BC73C2B3C8F3CF43D583DBD3E223E863EEB3F4F3FB4",
      INIT_31 => X"339933FC345F34C23525358835EB364F36B23716377937DD384138A53909396D",
      INIT_32 => X"2D7F2DE02E402EA12F022F632FC43026308730E9314B31AD320F327132D43336",
      INIT_33 => X"279327F0284E28AB2909296729C52A242A832AE12B412BA02BFF2C5F2CBF2D1F",
      INIT_34 => X"21E4223D229622EF234923A323FE245824B3250E256A25C52621267D26DA2736",
      INIT_35 => X"1C7E1CD21D271D7B1DD01E251E7B1ED11F271F7D1FD4202B208320DB2133218B",
      INIT_36 => X"177117BF180D185C18AB18FB194B199B19EC1A3D1A8E1AE01B321B851BD81C2B",
      INIT_37 => X"12C8130F1357139F13E81431147B14C5150F155A15A515F1163D168916D61723",
      INIT_38 => X"0E8E0ECE0F0F0F500F910FD310161059109C10E01124116911AE11F4123A1281",
      INIT_39 => X"0ACE0B070B3F0B790BB20BED0C270C620C9E0CDA0D170D540D920DD00E0F0E4E",
      INIT_3A => X"079207C207F208230855088608B908EC091F0953098809BD09F30A290A5F0A97",
      INIT_3B => X"04E2050805300558058005A905D305FD06280653067F06AC06D9070607340763",
      INIT_3C => X"02C302E002FE031D033D035C037D039E03C003E204050428044C0470049604BB",
      INIT_3D => X"013B014F01640179018F01A501BC01D401EC0205021E02380253026E028A02A6",
      INIT_3E => X"004F00590064006F007B0088009500A300B200C100D000E100F2010301150128",
      INIT_3F => X"000000000001000300050008000B000F00140019001F0025002C0034003D0045",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13) => inst_n_12,
      ADDRARDADDR(12) => inst_n_13,
      ADDRARDADDR(11) => inst_n_14,
      ADDRARDADDR(10) => inst_n_15,
      ADDRARDADDR(9) => inst_n_16,
      ADDRARDADDR(8) => inst_n_17,
      ADDRARDADDR(7) => inst_n_18,
      ADDRARDADDR(6) => inst_n_19,
      ADDRARDADDR(5) => inst_n_20,
      ADDRARDADDR(4) => inst_n_21,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => aclk,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"1111111111111111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15) => n_count_reg_rep_n_0,
      DOADO(14) => n_count_reg_rep_n_1,
      DOADO(13) => n_count_reg_rep_n_2,
      DOADO(12) => n_count_reg_rep_n_3,
      DOADO(11) => n_count_reg_rep_n_4,
      DOADO(10) => n_count_reg_rep_n_5,
      DOADO(9) => n_count_reg_rep_n_6,
      DOADO(8) => n_count_reg_rep_n_7,
      DOADO(7) => n_count_reg_rep_n_8,
      DOADO(6) => n_count_reg_rep_n_9,
      DOADO(5) => n_count_reg_rep_n_10,
      DOADO(4) => n_count_reg_rep_n_11,
      DOADO(3) => n_count_reg_rep_n_12,
      DOADO(2) => n_count_reg_rep_n_13,
      DOADO(1) => n_count_reg_rep_n_14,
      DOADO(0) => n_count_reg_rep_n_15,
      DOBDO(15 downto 0) => NLW_n_count_reg_rep_DOBDO_UNCONNECTED(15 downto 0),
      DOPADOP(1 downto 0) => NLW_n_count_reg_rep_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_n_count_reg_rep_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => inst_n_0,
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
