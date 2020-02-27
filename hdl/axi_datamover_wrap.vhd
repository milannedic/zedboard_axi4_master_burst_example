-- (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


library unisim;
use unisim.vcomponents.all;
library work;

entity axi_datamover_wrap is
--   generic (
--        USE_ATG : integer range 0 to 1 := 0
--   );
   port (
         -- clk_in1_p : in std_logic;
         -- clk_in1_n : in std_logic;
         -- reset : in std_logic;
         -- start : in std_logic;
         -- done : out std_logic;
         -- status : out std_logic
          m_axi_mm2s_aclk            : IN  STD_LOGIC;
          m_axi_mm2s_aresetn         : IN  STD_LOGIC;
          m_axis_mm2s_cmdsts_aclk    : IN  STD_LOGIC;
          m_axis_mm2s_cmdsts_aresetn : IN  STD_LOGIC;
          s_axis_mm2s_cmd_tvalid     : IN  STD_LOGIC;
          s_axis_mm2s_cmd_tready     : OUT STD_LOGIC;
          s_axis_mm2s_cmd_tdata      : IN  STD_LOGIC_VECTOR(40+32-1 DOWNTO 0);
          m_axis_mm2s_sts_tvalid     : OUT STD_LOGIC;
          m_axis_mm2s_sts_tready     : IN  STD_LOGIC;
          m_axis_mm2s_sts_tdata      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          m_axis_mm2s_sts_tkeep      : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
          m_axis_mm2s_sts_tlast      : OUT STD_LOGIC;
          m_axi_mm2s_arid            : OUT STD_LOGIC_VECTOR(4-1 DOWNTO 0);
          m_axi_mm2s_araddr          : OUT STD_LOGIC_VECTOR(32-1 DOWNTO 0);
          m_axi_mm2s_arlen           : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          m_axi_mm2s_arsize          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          m_axi_mm2s_arburst         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          m_axi_mm2s_arprot          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          m_axi_mm2s_arcache         : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
          m_axi_mm2s_aruser          : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
          m_axi_mm2s_arvalid         : OUT STD_LOGIC;
          m_axi_mm2s_arready         : IN  STD_LOGIC;
          m_axi_mm2s_rdata           : IN  STD_LOGIC_VECTOR(64-1 DOWNTO 0);
          m_axi_mm2s_rresp           : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          m_axi_mm2s_rlast           : IN  STD_LOGIC;
          m_axi_mm2s_rvalid          : IN  STD_LOGIC;
          m_axi_mm2s_rready          : OUT STD_LOGIC;
          m_axis_mm2s_tdata          : OUT STD_LOGIC_VECTOR(64-1 DOWNTO 0);
          m_axis_mm2s_tkeep          : OUT STD_LOGIC_VECTOR((64/8)-1 DOWNTO 0);
          m_axis_mm2s_tlast          : OUT STD_LOGIC;
          m_axis_mm2s_tvalid         : OUT STD_LOGIC;
          m_axis_mm2s_tready         : IN  STD_LOGIC;
          mm2s_err                   : OUT STD_LOGIC;
          m_axi_s2mm_aclk            : IN  STD_LOGIC;
          m_axi_s2mm_aresetn         : IN  STD_LOGIC;
          m_axis_s2mm_cmdsts_awclk   : IN  STD_LOGIC;
          m_axis_s2mm_cmdsts_aresetn : IN  STD_LOGIC;
          s_axis_s2mm_cmd_tvalid     : IN  STD_LOGIC;
          s_axis_s2mm_cmd_tready     : OUT STD_LOGIC;
          s_axis_s2mm_cmd_tdata      : IN  STD_LOGIC_VECTOR(40+32-1 DOWNTO 0);
          m_axis_s2mm_sts_tvalid     : OUT STD_LOGIC;
          m_axis_s2mm_sts_tready     : IN  STD_LOGIC;
          m_axis_s2mm_sts_tdata      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          m_axis_s2mm_sts_tkeep      : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
          m_axis_s2mm_sts_tlast      : OUT STD_LOGIC;
          m_axi_s2mm_awid            : OUT STD_LOGIC_VECTOR(4-1 DOWNTO 0);
          m_axi_s2mm_awaddr          : OUT STD_LOGIC_VECTOR(32-1 DOWNTO 0);
          m_axi_s2mm_awlen           : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          m_axi_s2mm_awsize          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          m_axi_s2mm_awburst         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          m_axi_s2mm_awprot          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          m_axi_s2mm_awcache         : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
          m_axi_s2mm_awuser          : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
          m_axi_s2mm_awvalid         : OUT STD_LOGIC;
          m_axi_s2mm_awready         : IN  STD_LOGIC;
          m_axi_s2mm_wdata           : OUT STD_LOGIC_VECTOR(64-1 DOWNTO 0);
          m_axi_s2mm_wstrb           : OUT STD_LOGIC_VECTOR((64/8)-1 DOWNTO 0);
          m_axi_s2mm_wlast           : OUT STD_LOGIC;
          m_axi_s2mm_wvalid          : OUT STD_LOGIC;
          m_axi_s2mm_wready          : IN  STD_LOGIC;
          m_axi_s2mm_bresp           : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          m_axi_s2mm_bvalid          : IN  STD_LOGIC;
          m_axi_s2mm_bready          : OUT STD_LOGIC;
          s_axis_s2mm_tdata          : IN  STD_LOGIC_VECTOR(64-1 DOWNTO 0);
          s_axis_s2mm_tkeep          : IN  STD_LOGIC_VECTOR((64/8)-1 DOWNTO 0);
          s_axis_s2mm_tlast          : IN  STD_LOGIC;
          s_axis_s2mm_tvalid         : IN  STD_LOGIC;
          s_axis_s2mm_tready         : OUT STD_LOGIC;
          s2mm_err                   : OUT STD_LOGIC
         );


end entity;

architecture impl of axi_datamover_wrap is
  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of impl : architecture is "yes";

COMPONENT axi_datamover_0 is
  PORT (
    m_axi_mm2s_aclk : IN STD_LOGIC;
    m_axi_mm2s_aresetn : IN STD_LOGIC;
    m_axis_mm2s_cmdsts_aclk : IN STD_LOGIC;
    m_axis_mm2s_cmdsts_aresetn : IN STD_LOGIC;
    s_axis_mm2s_cmd_tvalid : IN STD_LOGIC;
    s_axis_mm2s_cmd_tready : OUT STD_LOGIC;
    s_axis_mm2s_cmd_tdata : IN STD_LOGIC_VECTOR(40+32-1 DOWNTO 0);
    m_axis_mm2s_sts_tvalid : OUT STD_LOGIC;
    m_axis_mm2s_sts_tready : IN STD_LOGIC;
    m_axis_mm2s_sts_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_mm2s_sts_tkeep : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_mm2s_sts_tlast : OUT STD_LOGIC;
    m_axi_mm2s_arid : OUT STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    m_axi_mm2s_araddr : OUT STD_LOGIC_VECTOR(32-1 DOWNTO 0);
    m_axi_mm2s_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_mm2s_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_mm2s_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_mm2s_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_mm2s_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_mm2s_aruser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_mm2s_arvalid : OUT STD_LOGIC;
    m_axi_mm2s_arready : IN STD_LOGIC;
    m_axi_mm2s_rdata : IN STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    m_axi_mm2s_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_mm2s_rlast : IN STD_LOGIC;
    m_axi_mm2s_rvalid : IN STD_LOGIC;
    m_axi_mm2s_rready : OUT STD_LOGIC;
    m_axis_mm2s_tdata : OUT STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    m_axis_mm2s_tkeep : OUT STD_LOGIC_VECTOR((64/8)-1 DOWNTO 0);
    m_axis_mm2s_tlast : OUT STD_LOGIC;
    m_axis_mm2s_tvalid : OUT STD_LOGIC;
    m_axis_mm2s_tready : IN STD_LOGIC;
    mm2s_err : OUT STD_LOGIC;
    m_axi_s2mm_aclk : IN STD_LOGIC;
    m_axi_s2mm_aresetn : IN STD_LOGIC;
    m_axis_s2mm_cmdsts_awclk : IN STD_LOGIC;
    m_axis_s2mm_cmdsts_aresetn : IN STD_LOGIC;
    s_axis_s2mm_cmd_tvalid : IN STD_LOGIC;
    s_axis_s2mm_cmd_tready : OUT STD_LOGIC;
    s_axis_s2mm_cmd_tdata : IN STD_LOGIC_VECTOR(40+32-1 DOWNTO 0);
    m_axis_s2mm_sts_tvalid : OUT STD_LOGIC;
    m_axis_s2mm_sts_tready : IN STD_LOGIC;
    m_axis_s2mm_sts_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_s2mm_sts_tkeep : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_s2mm_sts_tlast : OUT STD_LOGIC;
    m_axi_s2mm_awid : OUT STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    m_axi_s2mm_awaddr : OUT STD_LOGIC_VECTOR(32-1 DOWNTO 0);
    m_axi_s2mm_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_s2mm_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_s2mm_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_s2mm_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_s2mm_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_s2mm_awuser : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_s2mm_awvalid : OUT STD_LOGIC;
    m_axi_s2mm_awready : IN STD_LOGIC;
    m_axi_s2mm_wdata : OUT STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    m_axi_s2mm_wstrb : OUT STD_LOGIC_VECTOR((64/8)-1 DOWNTO 0);
    m_axi_s2mm_wlast : OUT STD_LOGIC;
    m_axi_s2mm_wvalid : OUT STD_LOGIC;
    m_axi_s2mm_wready : IN STD_LOGIC;
    m_axi_s2mm_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_s2mm_bvalid : IN STD_LOGIC;
    m_axi_s2mm_bready : OUT STD_LOGIC;
    s_axis_s2mm_tdata : IN STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    s_axis_s2mm_tkeep : IN STD_LOGIC_VECTOR((64/8)-1 DOWNTO 0);
    s_axis_s2mm_tlast : IN STD_LOGIC;
    s_axis_s2mm_tvalid : IN STD_LOGIC;
    s_axis_s2mm_tready : OUT STD_LOGIC;
    s2mm_err : OUT STD_LOGIC
  );
END COMPONENT;


constant BRAM_ADDR_WIDTH : integer := 13;
constant BRAM_ADDR_WIDTH_S2MM : integer := 13;
constant MM2S_CMD_WIDTH : integer := 40+32;
constant S2MM_CMD_WIDTH : integer := 40+32;
constant MM2S_STS_WIDTH : integer := 8;
constant S2MM_STS_WIDTH : integer := 8;

constant MM2S_AXI_DATA_WIDTH : integer := 64;
constant MM2S_AXIS_DATA_WIDTH : integer := 64;
constant S2MM_AXI_DATA_WIDTH : integer := 64;
constant S2MM_AXIS_DATA_WIDTH : integer := 64;

signal    m_axi_arready               :  std_logic                         ;-- AXI4
signal    m_axi_arvalid               :  std_logic                         ;-- AXI4
signal    m_axi_araddr                :  std_logic_vector (32-1 downto 0)   ;-- AXI4
signal    m_axi_arlen                 :  std_logic_vector(7 downto 0)      ;-- AXI4
signal    m_axi_arsize                :  std_logic_vector(2 downto 0)      ;-- AXI4
signal    m_axi_arburst               :  std_logic_vector(1 downto 0)      ;-- AXI4
signal    m_axi_arprot                :  std_logic_vector(2 downto 0)      ;-- AXI4
signal    m_axi_arcache               :  std_logic_vector(3 downto 0)      ;-- AXI4
signal    m_axi_aruser                :  std_logic_vector(3 downto 0)      ;-- AXI4
signal    m_axi_rready                :  std_logic                         ;-- AXI4
signal    m_axi_rvalid                :  std_logic                         ;-- AXI4
signal    m_axi_rdata                 :  std_logic_vector    (MM2S_AXI_DATA_WIDTH-1 downto 0)   ;-- AXI4
signal    m_axi_rresp                 :  std_logic_vector(1 downto 0)      ;-- AXI4
signal    m_axi_rlast                 :  std_logic                         ;-- AXI4
signal    s_axi_awready               :  std_logic                          ;-- AXI4
signal    s_axi_awvalid               :  std_logic                          ;-- AXI4
signal    s_axi_awaddr                :  std_logic_vector  (32-1 downto 0)    ;-- AXI4
signal    s_axi_awlen                 :  std_logic_vector(7 downto 0)       ;-- AXI4
signal    s_axi_awsize                :  std_logic_vector(2 downto 0)       ;-- AXI4
signal    s_axi_awburst               :  std_logic_vector(1 downto 0)       ;-- AXI4
signal    s_axi_awprot                :  std_logic_vector(2 downto 0)       ;-- AXI4
signal    s_axi_awcache               :  std_logic_vector(3 downto 0)       ;-- AXI4
signal    s_axi_wready                :  std_logic                          ;-- AXI4
signal    s_axi_wvalid                :  std_logic                          ;-- AXI4
signal    s_axi_wdata                 :  std_logic_vector  (MM2S_AXI_DATA_WIDTH-1 downto 0)    ;-- AXI4
signal    s_axi_wstrb                 :  std_logic_vector  ((MM2S_AXI_DATA_WIDTH/8)-1 downto 0);-- AXI4
signal    s_axi_wlast                 :  std_logic                          ;-- AXI4
signal    s_axi_bready                :  std_logic                          ;-- AXI4
signal    s_axi_bvalid                :  std_logic                          ;-- AXI4
signal    s_axi_bresp                 :  std_logic_vector(1 downto 0)       ;-- AXI4

signal    s_axi_arready               :  std_logic                         ;-- AXI4
signal    s_axi_arvalid               :  std_logic                         ;-- AXI4
signal    s_axi_araddr                :  std_logic_vector (32-1 downto 0)   ;-- AXI4
signal    s_axi_arlen                 :  std_logic_vector(7 downto 0)      ;-- AXI4
signal    s_axi_arsize                :  std_logic_vector(2 downto 0)      ;-- AXI4
signal    s_axi_arburst               :  std_logic_vector(1 downto 0)      ;-- AXI4
signal    s_axi_arprot                :  std_logic_vector(2 downto 0)      ;-- AXI4
signal    s_axi_arcache               :  std_logic_vector(3 downto 0)      ;-- AXI4
signal    s_axi_rready                :  std_logic                         ;-- AXI4
signal    s_axi_rvalid                :  std_logic                         ;-- AXI4
signal    s_axi_rdata                 :  std_logic_vector    (S2MM_AXI_DATA_WIDTH-1 downto 0)   ;-- AXI4
signal    s_axi_rresp                 :  std_logic_vector(1 downto 0)      ;-- AXI4
signal    s_axi_rlast                 :  std_logic                         ;-- AXI4

signal    m_axi_awready               :  std_logic                          ;-- AXI4
signal    m_axi_awvalid               :  std_logic                          ;-- AXI4
signal    m_axi_awaddr                :  std_logic_vector  (32-1 downto 0)    ;-- AXI4
signal    m_axi_awlen                 :  std_logic_vector(7 downto 0)       ;-- AXI4
signal    m_axi_awsize                :  std_logic_vector(2 downto 0)       ;-- AXI4
signal    m_axi_awburst               :  std_logic_vector(1 downto 0)       ;-- AXI4
signal    m_axi_awprot                :  std_logic_vector(2 downto 0)       ;-- AXI4
signal    m_axi_awcache               :  std_logic_vector(3 downto 0)       ;-- AXI4
signal    m_axi_awuser                :  std_logic_vector(3 downto 0)       ;-- AXI4
signal    m_axi_wready                :  std_logic                          ;-- AXI4
signal    m_axi_wvalid                :  std_logic                          ;-- AXI4
signal    m_axi_wdata                 :  std_logic_vector  (S2MM_AXI_DATA_WIDTH-1 downto 0)    ;-- AXI4
signal    m_axi_wstrb                 :  std_logic_vector  ((S2MM_AXI_DATA_WIDTH/8)-1 downto 0);-- AXI4
signal    m_axi_wlast                 :  std_logic                          ;-- AXI4
signal    m_axi_bready                :  std_logic                          ;-- AXI4
signal    m_axi_bvalid                :  std_logic                          ;-- AXI4
signal    m_axi_bresp                 :  std_logic_vector(1 downto 0)       ;-- AXI4

  -- signal locked   : std_logic;
  -- signal clock_lite : std_logic;
  -- signal clock : std_logic;
  -- signal reset_lock : std_logic;

---
signal address : std_logic_vector (11 downto 0);
signal awlen : std_logic_vector (7 downto 0);
signal awvalid : std_logic;
signal init_done : std_logic;
signal counter : std_logic_vector (7 downto 0);
signal wvalid : std_logic;
---
signal m_axis_tdata   : std_logic_vector (MM2S_AXIS_DATA_WIDTH-1 downto 0);
signal m_axis_tkeep   : std_logic_vector (MM2S_AXIS_DATA_WIDTH/8-1 downto 0);
signal m_axis_tvalid   : std_logic;
signal m_axis_tready   : std_logic;
signal m_axis_tlast  : std_logic;
signal m_axis_tuser   : std_logic_vector (3 downto 0);
signal m_axis_tid   : std_logic_vector (4 downto 0);
signal m_axis_tdest  : std_logic_vector (4 downto 0);

signal m_axis_ctrl_tdata   : std_logic_vector (31 downto 0);
signal m_axis_ctrl_tkeep   : std_logic_vector (3 downto 0);
signal m_axis_ctrl_tvalid   : std_logic;
signal m_axis_ctrl_tready   : std_logic;
signal m_axis_ctrl_tlast   : std_logic;

signal s_axis_tdata   : std_logic_vector (S2MM_AXIS_DATA_WIDTH-1 downto 0);
signal s_axis_tkeep   : std_logic_vector (S2MM_AXIS_DATA_WIDTH/8-1 downto 0);
signal s_axis_tvalid   : std_logic;
signal s_axis_tready   : std_logic;
signal s_axis_tlast  : std_logic;
signal s_axis_tuser   : std_logic_vector (3 downto 0);
signal s_axis_tid   : std_logic_vector (4 downto 0);
signal s_axis_tdest  : std_logic_vector (4 downto 0);
signal s2mm_writes_done : std_logic;

signal s_axis_ctrl_tdata   : std_logic_vector (31 downto 0);
signal s_axis_ctrl_tkeep   : std_logic_vector (3 downto 0);
signal s_axis_ctrl_tvalid   : std_logic;
signal s_axis_ctrl_tready   : std_logic;
signal s_axis_ctrl_tlast   : std_logic;

signal pass, fail : std_logic;
signal pass_ctrl, fail_ctrl : std_logic;
signal pass_s2mm, fail_s2mm : std_logic;
signal mm2s_intr : std_logic;
signal s2mm_intr : std_logic;
signal done_int : std_logic;

signal mm2s_cmd_tvalid : std_logic;
signal mm2s_cmd_tready : std_logic;
signal mm2s_cmd_tdata  : std_logic_vector (MM2S_CMD_WIDTH-1 downto 0);
signal mm2s_cmd_issued : std_logic;
signal mm2s_sts_tvalid : std_logic;
signal mm2s_sts_tready : std_logic;
signal mm2s_sts_tdata  : std_logic_vector (MM2S_STS_WIDTH-1 downto 0);
signal mm2s_sts_tkeep  : std_logic_vector (MM2S_STS_WIDTH/8 -1 downto 0);
signal mm2s_sts_tlast  : std_logic;

signal s2mm_cmd_tvalid : std_logic;
signal s2mm_cmd_tready : std_logic;
signal s2mm_cmd_tdata  : std_logic_vector (S2MM_CMD_WIDTH-1 downto 0);
signal s2mm_cmd_issued : std_logic;
signal s2mm_sts_tvalid : std_logic;
signal s2mm_sts_tready : std_logic;
signal s2mm_sts_tdata  : std_logic_vector (S2MM_STS_WIDTH-1 downto 0);
signal s2mm_sts_tkeep  : std_logic_vector (S2MM_STS_WIDTH/8 -1 downto 0);
signal s2mm_sts_tlast  : std_logic;

signal s2mm_error, mm2s_error : std_logic;
begin

DUT : axi_datamover_0
    PORT MAP (
    m_axi_mm2s_aclk            => m_axi_mm2s_aclk,          --clock_lite,
    m_axis_mm2s_cmdsts_aclk    => m_axis_mm2s_cmdsts_aclk,
    m_axi_mm2s_aresetn         => m_axi_mm2s_aresetn,
    m_axis_mm2s_cmdsts_aresetn => m_axis_mm2s_cmdsts_aresetn,
    s_axis_mm2s_cmd_tvalid     => s_axis_mm2s_cmd_tvalid,
    s_axis_mm2s_cmd_tready     => s_axis_mm2s_cmd_tready,
    s_axis_mm2s_cmd_tdata      => s_axis_mm2s_cmd_tdata,
    m_axis_mm2s_sts_tvalid     => s_axis_mm2s_sts_tvalid,
    m_axis_mm2s_sts_tready     => s_axis_mm2s_sts_tready,
    m_axis_mm2s_sts_tdata      => s_axis_mm2s_sts_tdata,
    m_axis_mm2s_sts_tkeep      => s_axis_mm2s_sts_tkeep,
    m_axis_mm2s_sts_tlast      => s_axis_mm2s_sts_tlast,
    m_axi_mm2s_arid            => open,
    m_axi_mm2s_araddr          => m_axi_mm2s_araddr,
    m_axi_mm2s_arlen           => m_axi_mm2s_arlen,
    m_axi_mm2s_arsize          => m_axi_mm2s_arsize,
    m_axi_mm2s_arburst         => m_axi_mm2s_arburst,
    m_axi_mm2s_arprot          => m_axi_mm2s_arprot,
    m_axi_mm2s_arcache         => m_axi_mm2s_arcache,
    m_axi_mm2s_aruser          => m_axi_mm2s_aruser,
    m_axi_mm2s_arvalid         => m_axi_mm2s_arvalid,
    m_axi_mm2s_arready         => m_axi_mm2s_arready,
    m_axi_mm2s_rdata           => m_axi_mm2s_rdata,
    m_axi_mm2s_rresp           => m_axi_mm2s_rresp,
    m_axi_mm2s_rlast           => m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid          => m_axi_mm2s_rvalid,
    m_axi_mm2s_rready          => m_axi_mm2s_rready,
    m_axis_mm2s_tdata          => m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep          => m_axis_mm2s_tkeep,
    m_axis_mm2s_tlast          => m_axis_mm2s_tlast,
    m_axis_mm2s_tvalid         => m_axis_mm2s_tvalid,
    m_axis_mm2s_tready         => m_axis_mm2s_tready,
    m_axi_s2mm_aclk            => m_axi_s2mm_aclk,
    m_axis_s2mm_cmdsts_awclk   => m_axis_s2mm_cmdsts_awclk,
    m_axi_s2mm_aresetn         => m_axi_s2mm_aresetn,
    m_axis_s2mm_cmdsts_aresetn => m_axis_s2mm_cmdsts_aresetn,
    s_axis_s2mm_cmd_tvalid     => s_axis_s2mm_cmd_tvalid,
    s_axis_s2mm_cmd_tready     => s_axis_s2mm_cmd_tready,
    s_axis_s2mm_cmd_tdata      => s_axis_s2mm_cmd_tdata,
    m_axis_s2mm_sts_tvalid     => s_axis_s2mm_sts_tvalid,
    m_axis_s2mm_sts_tready     => s_axis_s2mm_sts_tready,
    m_axis_s2mm_sts_tdata      => s_axis_s2mm_sts_tdata,
    m_axis_s2mm_sts_tkeep      => s_axis_s2mm_sts_tkeep,
    m_axis_s2mm_sts_tlast      => s_axis_s2mm_sts_tlast,
    m_axi_s2mm_awid            => open,
    m_axi_s2mm_awaddr          => m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen           => m_axi_s2mm_awlen,
    m_axi_s2mm_awsize          => m_axi_s2mm_awsize,
    m_axi_s2mm_awburst         => m_axi_s2mm_awburst,
    m_axi_s2mm_awprot          => m_axi_s2mm_awprot,
    m_axi_s2mm_awcache         => m_axi_s2mm_awcache,
    m_axi_s2mm_awuser          => m_axi_s2mm_awuser,
    m_axi_s2mm_awvalid         => m_axi_s2mm_awvalid,
    m_axi_s2mm_awready         => m_axi_s2mm_awready,
    m_axi_s2mm_wready          => m_axi_s2mm_wready,
    m_axi_s2mm_wvalid          => m_axi_s2mm_wvalid,
    m_axi_s2mm_wdata           => m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb           => m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast           => m_axi_s2mm_wlast,
    m_axi_s2mm_bready          => m_axi_s2mm_bready,
    m_axi_s2mm_bvalid          => m_axi_s2mm_bvalid,
    m_axi_s2mm_bresp           => m_axi_s2mm_bresp,
    s_axis_s2mm_tdata          => s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep          => s_axis_s2mm_tkeep,
    s_axis_s2mm_tlast          => s_axis_s2mm_tlast,
    s_axis_s2mm_tvalid         => s_axis_s2mm_tvalid,
    s_axis_s2mm_tready         => s_axis_s2mm_s2mm_tready,  --s_axis_tready,
    s2mm_err                   => s2mm_err,
    mm2s_err                   => mm2s_err);

end impl;
