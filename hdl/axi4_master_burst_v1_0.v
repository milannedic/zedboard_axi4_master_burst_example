
`timescale 1 ns / 1 ps

	module axi4_master_burst_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line



		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4,

		// Parameters of Axi Master Bus Interface M00_AXI
		parameter  C_M00_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M00_AXI_BURST_LEN	= 16,
		parameter integer C_M00_AXI_ID_WIDTH	= 1,
		parameter integer C_M00_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M00_AXI_DATA_WIDTH	= 32,
		parameter integer C_M00_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_WUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_RUSER_WIDTH	= 0,
		parameter integer C_M00_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire                                  s00_axi_aclk,
		input wire                                  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_awaddr,
		input wire [2 : 0]                          s00_axi_awprot,
		input wire                                  s00_axi_awvalid,
		output wire                                 s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0]     s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire                                  s00_axi_wvalid,
		output wire                                 s00_axi_wready,
		output wire [1 : 0]                         s00_axi_bresp,
		output wire                                 s00_axi_bvalid,
		input wire                                  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0]     s00_axi_araddr,
		input wire [2 : 0]                          s00_axi_arprot,
		input wire                                  s00_axi_arvalid,
		output wire                                 s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0]    s00_axi_rdata,
		output wire [1 : 0]                         s00_axi_rresp,
		output wire                                 s00_axi_rvalid,
		input wire                                  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXI
		// input wire  m00_axi_init_axi_txn,
		// output wire  m00_axi_txn_done,
		// output wire  m00_axi_error,
		input wire                                  m00_axi_aclk,
		input wire                                  m00_axi_aresetn,
		output wire [C_M00_AXI_ID_WIDTH-1 : 0]      m00_axi_awid,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0]    m00_axi_awaddr,
		output wire [7 : 0]                         m00_axi_awlen,
		output wire [2 : 0]                         m00_axi_awsize,
		output wire [1 : 0]                         m00_axi_awburst,
		output wire                                 m00_axi_awlock,
		output wire [3 : 0]                         m00_axi_awcache,
		output wire [2 : 0]                         m00_axi_awprot,
		output wire [3 : 0]                         m00_axi_awqos,
		output wire [C_M00_AXI_AWUSER_WIDTH-1 : 0]  m00_axi_awuser,
		output wire                                 m00_axi_awvalid,
		input wire                                  m00_axi_awready,
		output wire [C_M00_AXI_DATA_WIDTH-1 : 0]    m00_axi_wdata,
		output wire [C_M00_AXI_DATA_WIDTH/8-1 : 0]  m00_axi_wstrb,
		output wire                                 m00_axi_wlast,
		output wire [C_M00_AXI_WUSER_WIDTH-1 : 0]   m00_axi_wuser,
		output wire                                 m00_axi_wvalid,
		input wire                                  m00_axi_wready,
		input wire [C_M00_AXI_ID_WIDTH-1 : 0]       m00_axi_bid,
		input wire [1 : 0]                          m00_axi_bresp,
		input wire [C_M00_AXI_BUSER_WIDTH-1 : 0]    m00_axi_buser,
		input wire                                  m00_axi_bvalid,
		output wire                                 m00_axi_bready,
		output wire [C_M00_AXI_ID_WIDTH-1 : 0]      m00_axi_arid,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0]    m00_axi_araddr,
		output wire [7 : 0]                         m00_axi_arlen,
		output wire [2 : 0]                         m00_axi_arsize,
		output wire [1 : 0]                         m00_axi_arburst,
		output wire                                 m00_axi_arlock,
		output wire [3 : 0]                         m00_axi_arcache,
		output wire [2 : 0]                         m00_axi_arprot,
		output wire [3 : 0]                         m00_axi_arqos,
		output wire [C_M00_AXI_ARUSER_WIDTH-1 : 0]  m00_axi_aruser,
		output wire                                 m00_axi_arvalid,
		input wire                                  m00_axi_arready,
		input wire [C_M00_AXI_ID_WIDTH-1 : 0]       m00_axi_rid,
		input wire [C_M00_AXI_DATA_WIDTH-1 : 0]     m00_axi_rdata,
		input wire [1 : 0]                          m00_axi_rresp,
		input wire                                  m00_axi_rlast,
		input wire [C_M00_AXI_RUSER_WIDTH-1 : 0]    m00_axi_ruser,
		input wire                                  m00_axi_rvalid,
		output wire                                 m00_axi_rready
	);

   /*AUTOOUTPUT*/
   /*AUTOOUTPUT*/
   /*AUTOTIEOFF*/
   /*AUTOLOGIC*/

    wire m00_axi_init_axi_txn;
    wire m00_axi_txn_done;
    wire m00_axi_error;

   // Instantiation of Axi Bus Interface S00_AXI

   /* axi4_master_burst_v1_0_S00_AXI AUTO_TEMPLATE (
    .S_AXI_\(.*\) (s00_axi_@"(downcase (substring vl-name 6))"),
		.init_txn((m00_axi_init_axi_txn)),
    .txn_error ((m00_axi_txn_error)),
    .\(.*\) (m00_axi_@"(downcase vl-name)"[]),

    )*/
	 axi4_master_burst_v1_0_S00_AXI
   # (
      // Parameters
		  .C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		  .C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH))
   I_axi4_master_burst_v1_0_S00_AXI
     (/*AUTOINST*/
      // Outputs
      .init_txn                         ((m00_axi_init_axi_txn)), // Templated
      .S_AXI_AWREADY                    (s00_axi_awready),       // Templated
      .S_AXI_WREADY                     (s00_axi_wready),        // Templated
      .S_AXI_BRESP                      (s00_axi_bresp),         // Templated
      .S_AXI_BVALID                     (s00_axi_bvalid),        // Templated
      .S_AXI_ARREADY                    (s00_axi_arready),       // Templated
      .S_AXI_RDATA                      (s00_axi_rdata),         // Templated
      .S_AXI_RRESP                      (s00_axi_rresp),         // Templated
      .S_AXI_RVALID                     (s00_axi_rvalid),        // Templated
      // Inputs
      .txn_done                         (m00_axi_txn_done),      // Templated
      .txn_error                        ((m00_axi_txn_error)),   // Templated
      .S_AXI_ACLK                       (s00_axi_aclk),          // Templated
      .S_AXI_ARESETN                    (s00_axi_aresetn),       // Templated
      .S_AXI_AWADDR                     (s00_axi_awaddr),        // Templated
      .S_AXI_AWPROT                     (s00_axi_awprot),        // Templated
      .S_AXI_AWVALID                    (s00_axi_awvalid),       // Templated
      .S_AXI_WDATA                      (s00_axi_wdata),         // Templated
      .S_AXI_WSTRB                      (s00_axi_wstrb),         // Templated
      .S_AXI_WVALID                     (s00_axi_wvalid),        // Templated
      .S_AXI_BREADY                     (s00_axi_bready),        // Templated
      .S_AXI_ARADDR                     (s00_axi_araddr),        // Templated
      .S_AXI_ARPROT                     (s00_axi_arprot),        // Templated
      .S_AXI_ARVALID                    (s00_axi_arvalid),       // Templated
      .S_AXI_RREADY                     (s00_axi_rready));        // Templated


   // Instantiation of Axi Bus Interface M00_AXI

   /* axi4_master_burst_v1_0_M00_AXI AUTO_TEMPLATE (

    .M_AXI_\(.*\) (m00_axi_@"(downcase (substring vl-name 6))"),
    .\(.*\) ((m00_axi_@"(downcase vl-name)"[])),

    // .ERROR (m00_axi_error),
    // .TXN_DONE (m00_axi_txn_done),
    // .TXN_ERROR (m00_axi_error),
    // .INIT_AXI_TXN (m00_axi_init_axi_txn),
    // .\(.*\) (@"(downcase vl-name)"[]), --> downcase the whole name

    )*/
	 axi4_master_burst_v1_0_M00_AXI
   # (
      // Parameters
      .C_M_TARGET_SLAVE_BASE_ADDR       (C_M00_AXI_TARGET_SLAVE_BASE_ADDR),
      .C_M_AXI_BURST_LEN                (C_M00_AXI_BURST_LEN),
      .C_M_AXI_ID_WIDTH                 (C_M00_AXI_ID_WIDTH),
      .C_M_AXI_ADDR_WIDTH               (C_M00_AXI_ADDR_WIDTH),
      .C_M_AXI_DATA_WIDTH               (C_M00_AXI_DATA_WIDTH),
      .C_M_AXI_AWUSER_WIDTH             (C_M00_AXI_AWUSER_WIDTH),
      .C_M_AXI_ARUSER_WIDTH             (C_M00_AXI_ARUSER_WIDTH),
      .C_M_AXI_WUSER_WIDTH              (C_M00_AXI_WUSER_WIDTH),
      .C_M_AXI_RUSER_WIDTH              (C_M00_AXI_RUSER_WIDTH),
      .C_M_AXI_BUSER_WIDTH              (C_M00_AXI_BUSER_WIDTH))
   I_axi4_master_burst_v1_0_M00_AXI
     (/*AUTOINST*/
      // Outputs
      .TXN_DONE                         ((m00_axi_txn_done)),    // Templated
      .ERROR                            ((m00_axi_error)),       // Templated
      .M_AXI_AWID                       (m00_axi_awid),          // Templated
      .M_AXI_AWADDR                     (m00_axi_awaddr),        // Templated
      .M_AXI_AWLEN                      (m00_axi_awlen),         // Templated
      .M_AXI_AWSIZE                     (m00_axi_awsize),        // Templated
      .M_AXI_AWBURST                    (m00_axi_awburst),       // Templated
      .M_AXI_AWLOCK                     (m00_axi_awlock),        // Templated
      .M_AXI_AWCACHE                    (m00_axi_awcache),       // Templated
      .M_AXI_AWPROT                     (m00_axi_awprot),        // Templated
      .M_AXI_AWQOS                      (m00_axi_awqos),         // Templated
      .M_AXI_AWUSER                     (m00_axi_awuser),        // Templated
      .M_AXI_AWVALID                    (m00_axi_awvalid),       // Templated
      .M_AXI_WDATA                      (m00_axi_wdata),         // Templated
      .M_AXI_WSTRB                      (m00_axi_wstrb),         // Templated
      .M_AXI_WLAST                      (m00_axi_wlast),         // Templated
      .M_AXI_WUSER                      (m00_axi_wuser),         // Templated
      .M_AXI_WVALID                     (m00_axi_wvalid),        // Templated
      .M_AXI_BREADY                     (m00_axi_bready),        // Templated
      .M_AXI_ARID                       (m00_axi_arid),          // Templated
      .M_AXI_ARADDR                     (m00_axi_araddr),        // Templated
      .M_AXI_ARLEN                      (m00_axi_arlen),         // Templated
      .M_AXI_ARSIZE                     (m00_axi_arsize),        // Templated
      .M_AXI_ARBURST                    (m00_axi_arburst),       // Templated
      .M_AXI_ARLOCK                     (m00_axi_arlock),        // Templated
      .M_AXI_ARCACHE                    (m00_axi_arcache),       // Templated
      .M_AXI_ARPROT                     (m00_axi_arprot),        // Templated
      .M_AXI_ARQOS                      (m00_axi_arqos),         // Templated
      .M_AXI_ARUSER                     (m00_axi_aruser),        // Templated
      .M_AXI_ARVALID                    (m00_axi_arvalid),       // Templated
      .M_AXI_RREADY                     (m00_axi_rready),        // Templated
      // Inputs
      .INIT_AXI_TXN                     ((m00_axi_init_axi_txn)), // Templated
      .M_AXI_ACLK                       (m00_axi_aclk),          // Templated
      .M_AXI_ARESETN                    (m00_axi_aresetn),       // Templated
      .M_AXI_AWREADY                    (m00_axi_awready),       // Templated
      .M_AXI_WREADY                     (m00_axi_wready),        // Templated
      .M_AXI_BID                        (m00_axi_bid),           // Templated
      .M_AXI_BRESP                      (m00_axi_bresp),         // Templated
      .M_AXI_BUSER                      (m00_axi_buser),         // Templated
      .M_AXI_BVALID                     (m00_axi_bvalid),        // Templated
      .M_AXI_ARREADY                    (m00_axi_arready),       // Templated
      .M_AXI_RID                        (m00_axi_rid),           // Templated
      .M_AXI_RDATA                      (m00_axi_rdata),         // Templated
      .M_AXI_RRESP                      (m00_axi_rresp),         // Templated
      .M_AXI_RLAST                      (m00_axi_rlast),         // Templated
      .M_AXI_RUSER                      (m00_axi_ruser),         // Templated
      .M_AXI_RVALID                     (m00_axi_rvalid));        // Templated

	// Add user logic here

	// User logic ends

	endmodule
