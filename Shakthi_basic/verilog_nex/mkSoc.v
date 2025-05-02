`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkSoc(
    CLK,
    RST_N,

    main_mem_master_AWVALID,
    main_mem_master_AWADDR,
    main_mem_master_AWPROT,
    main_mem_master_AWLEN,
    main_mem_master_AWSIZE,
    main_mem_master_AWBURST,
    main_mem_master_AWID,
    main_mem_master_AWREADY,
    main_mem_master_WVALID,
    main_mem_master_WDATA,
    main_mem_master_WSTRB,
    main_mem_master_WLAST,
    main_mem_master_WID,
    main_mem_master_WREADY,
    main_mem_master_BVALID,
    main_mem_master_BRESP,
    main_mem_master_BID,
    main_mem_master_BREADY,
    main_mem_master_ARVALID,
    main_mem_master_ARADDR,
    main_mem_master_ARPROT,
    main_mem_master_ARLEN,
    main_mem_master_ARSIZE,
    main_mem_master_ARBURST,
    main_mem_master_ARID,
    main_mem_master_ARREADY,
    main_mem_master_RVALID,
    main_mem_master_RRESP,
    main_mem_master_RDATA,
    main_mem_master_RLAST,
    main_mem_master_RID,
    main_mem_master_RREADY,

    boot_mem_master_AWVALID,
    boot_mem_master_AWADDR,
    boot_mem_master_AWPROT,
    boot_mem_master_AWLEN,
    boot_mem_master_AWSIZE,
    boot_mem_master_AWBURST,
    boot_mem_master_AWID,
    boot_mem_master_AWREADY,
    boot_mem_master_WVALID,
    boot_mem_master_WDATA,
    boot_mem_master_WSTRB,
    boot_mem_master_WLAST,
    boot_mem_master_WID,
    boot_mem_master_WREADY,
    boot_mem_master_BVALID,
    boot_mem_master_BRESP,
    boot_mem_master_BID,
    boot_mem_master_BREADY,
    boot_mem_master_ARVALID,
    boot_mem_master_ARADDR,
    boot_mem_master_ARPROT,
    boot_mem_master_ARLEN,
    boot_mem_master_ARSIZE,
    boot_mem_master_ARBURST,
    boot_mem_master_ARID,
    boot_mem_master_ARREADY,
    boot_mem_master_RVALID,
    boot_mem_master_RRESP,
    boot_mem_master_RDATA,
    boot_mem_master_RLAST,
    boot_mem_master_RID,
    boot_mem_master_RREADY,

    uart_io_SIN,
    uart_io_SOUT
);

  input  CLK;
  input  RST_N;

  output main_mem_master_AWVALID;
  output [31 : 0] main_mem_master_AWADDR;
  output [2 : 0] main_mem_master_AWPROT;
  output [7 : 0] main_mem_master_AWLEN;
  output [2 : 0] main_mem_master_AWSIZE;
  output [1 : 0] main_mem_master_AWBURST;
  output [3 : 0] main_mem_master_AWID;
  input  main_mem_master_AWREADY;
  output main_mem_master_WVALID;
  output [31 : 0] main_mem_master_WDATA;
  output [3 : 0] main_mem_master_WSTRB;
  output main_mem_master_WLAST;
  output [3 : 0] main_mem_master_WID;
  input  main_mem_master_WREADY;
  input  main_mem_master_BVALID;
  input  [1 : 0] main_mem_master_BRESP;
  input  [3 : 0] main_mem_master_BID;
  output main_mem_master_BREADY;
  output main_mem_master_ARVALID;
  output [31 : 0] main_mem_master_ARADDR;
  output [2 : 0] main_mem_master_ARPROT;
  output [7 : 0] main_mem_master_ARLEN;
  output [2 : 0] main_mem_master_ARSIZE;
  output [1 : 0] main_mem_master_ARBURST;
  output [3 : 0] main_mem_master_ARID;
  input  main_mem_master_ARREADY;
  input  main_mem_master_RVALID;
  input  [1 : 0] main_mem_master_RRESP;
  input  [31 : 0] main_mem_master_RDATA;
  input  main_mem_master_RLAST;
  input  [3 : 0] main_mem_master_RID;
  output main_mem_master_RREADY;

  output boot_mem_master_AWVALID;
  output [31 : 0] boot_mem_master_AWADDR;
  output [2 : 0] boot_mem_master_AWPROT;
  output [7 : 0] boot_mem_master_AWLEN;
  output [2 : 0] boot_mem_master_AWSIZE;
  output [1 : 0] boot_mem_master_AWBURST;
  output [3 : 0] boot_mem_master_AWID;
  input  boot_mem_master_AWREADY;
  output boot_mem_master_WVALID;
  output [31 : 0] boot_mem_master_WDATA;
  output [3 : 0] boot_mem_master_WSTRB;
  output boot_mem_master_WLAST;
  output [3 : 0] boot_mem_master_WID;
  input  boot_mem_master_WREADY;
  input  boot_mem_master_BVALID;
  input  [1 : 0] boot_mem_master_BRESP;
  input  [3 : 0] boot_mem_master_BID;
  output boot_mem_master_BREADY;
  output boot_mem_master_ARVALID;
  output [31 : 0] boot_mem_master_ARADDR;
  output [2 : 0] boot_mem_master_ARPROT;
  output [7 : 0] boot_mem_master_ARLEN;
  output [2 : 0] boot_mem_master_ARSIZE;
  output [1 : 0] boot_mem_master_ARBURST;
  output [3 : 0] boot_mem_master_ARID;
  input  boot_mem_master_ARREADY;
  input  boot_mem_master_RVALID;
  input  [1 : 0] boot_mem_master_RRESP;
  input  [31 : 0] boot_mem_master_RDATA;
  input  boot_mem_master_RLAST;
  input  [3 : 0] boot_mem_master_RID;
  output boot_mem_master_RREADY;

  input  uart_io_SIN;
  output uart_io_SOUT;

  // signals for module outputs
  wire [31 : 0] boot_mem_master_ARADDR,
		boot_mem_master_AWADDR,
		boot_mem_master_WDATA,
		main_mem_master_ARADDR,
		main_mem_master_AWADDR,
		main_mem_master_WDATA;
  wire [7 : 0] boot_mem_master_ARLEN,
	       boot_mem_master_AWLEN,
	       main_mem_master_ARLEN,
	       main_mem_master_AWLEN;
  wire [3 : 0] boot_mem_master_ARID,
	       boot_mem_master_AWID,
	       boot_mem_master_WID,
	       boot_mem_master_WSTRB,
	       main_mem_master_ARID,
	       main_mem_master_AWID,
	       main_mem_master_WID,
	       main_mem_master_WSTRB;
  wire [2 : 0] boot_mem_master_ARPROT,
	       boot_mem_master_ARSIZE,
	       boot_mem_master_AWPROT,
	       boot_mem_master_AWSIZE,
	       main_mem_master_ARPROT,
	       main_mem_master_ARSIZE,
	       main_mem_master_AWPROT,
	       main_mem_master_AWSIZE;
  wire [1 : 0] boot_mem_master_ARBURST,
	       boot_mem_master_AWBURST,
	       main_mem_master_ARBURST,
	       main_mem_master_AWBURST;
  wire RDY_io_dump_get,
       RDY_mv_end_simulation,
       boot_mem_master_ARVALID,
       boot_mem_master_AWVALID,
       boot_mem_master_BREADY,
       boot_mem_master_RREADY,
       boot_mem_master_WLAST,
       boot_mem_master_WVALID,
       main_mem_master_ARVALID,
       main_mem_master_AWVALID,
       main_mem_master_BREADY,
       main_mem_master_RREADY,
       main_mem_master_WLAST,
       main_mem_master_WVALID,
       mv_end_simulation,
       uart_io_SOUT;

  // inlined wires
  wire clint_clint_wr_mtimecmp_written_whas,
       uart_user_ifc_uart_fifoRecv_r_deq_whas,
       uart_user_ifc_uart_fifoXmit_r_enq_whas,
       uart_user_ifc_uart_pwRecvCellCountReset_whas,
       uart_user_ifc_uart_pwRecvEnableBitCount_whas,
       uart_user_ifc_uart_pwRecvResetBitCount_whas,
       uart_user_ifc_uart_pwXmitCellCountReset_whas,
       uart_user_ifc_uart_pwXmitEnableBitCount_whas,
       uart_user_ifc_uart_pwXmitLoadBuffer_whas;

  // register clint_clint_msip
  reg clint_clint_msip;
  wire clint_clint_msip_D_IN, clint_clint_msip_EN;

  // register clint_clint_mtip
  reg clint_clint_mtip;
  wire clint_clint_mtip_D_IN, clint_clint_mtip_EN;

  // register clint_clint_rg_tick
  reg [3 : 0] clint_clint_rg_tick;
  wire [3 : 0] clint_clint_rg_tick_D_IN;
  wire clint_clint_rg_tick_EN;

  // register clint_clint_rgmtime
  reg [63 : 0] clint_clint_rgmtime;
  wire [63 : 0] clint_clint_rgmtime_D_IN;
  wire clint_clint_rgmtime_EN;

  // register clint_clint_rgmtimecmp
  reg [63 : 0] clint_clint_rgmtimecmp;
  wire [63 : 0] clint_clint_rgmtimecmp_D_IN;
  wire clint_clint_rgmtimecmp_EN;

  // register clint_rg_rdburst_count
  reg [7 : 0] clint_rg_rdburst_count;
  wire [7 : 0] clint_rg_rdburst_count_D_IN;
  wire clint_rg_rdburst_count_EN;

  // register clint_rg_rdpacket
  reg [51 : 0] clint_rg_rdpacket;
  wire [51 : 0] clint_rg_rdpacket_D_IN;
  wire clint_rg_rdpacket_EN;

  // register clint_rg_wrburst_count
  reg [7 : 0] clint_rg_wrburst_count;
  wire [7 : 0] clint_rg_wrburst_count_D_IN;
  wire clint_rg_wrburst_count_EN;

  // register clint_rg_wrpacket
  reg [51 : 0] clint_rg_wrpacket;
  wire [51 : 0] clint_rg_wrpacket_D_IN;
  wire clint_rg_wrpacket_EN;

  // register err_slave_read_state
  reg err_slave_read_state;
  wire err_slave_read_state_D_IN, err_slave_read_state_EN;

  // register err_slave_rg_rd_id
  reg [3 : 0] err_slave_rg_rd_id;
  wire [3 : 0] err_slave_rg_rd_id_D_IN;
  wire err_slave_rg_rd_id_EN;

  // register err_slave_rg_read_length
  reg [7 : 0] err_slave_rg_read_length;
  wire [7 : 0] err_slave_rg_read_length_D_IN;
  wire err_slave_rg_read_length_EN;

  // register err_slave_rg_readburst_counter
  reg [7 : 0] err_slave_rg_readburst_counter;
  wire [7 : 0] err_slave_rg_readburst_counter_D_IN;
  wire err_slave_rg_readburst_counter_EN;

  // register err_slave_rg_write_response
  reg [5 : 0] err_slave_rg_write_response;
  wire [5 : 0] err_slave_rg_write_response_D_IN;
  wire err_slave_rg_write_response_EN;

  // register err_slave_write_state
  reg err_slave_write_state;
  wire err_slave_write_state_D_IN, err_slave_write_state_EN;

  // register uart_rg_rdburst_count
  reg [7 : 0] uart_rg_rdburst_count;
  wire [7 : 0] uart_rg_rdburst_count_D_IN;
  wire uart_rg_rdburst_count_EN;

  // register uart_rg_rdpacket
  reg [51 : 0] uart_rg_rdpacket;
  wire [51 : 0] uart_rg_rdpacket_D_IN;
  wire uart_rg_rdpacket_EN;

  // register uart_rg_wrburst_count
  reg [7 : 0] uart_rg_wrburst_count;
  wire [7 : 0] uart_rg_wrburst_count_D_IN;
  wire uart_rg_wrburst_count_EN;

  // register uart_rg_wrpacket
  reg [51 : 0] uart_rg_wrpacket;
  wire [51 : 0] uart_rg_wrpacket_D_IN;
  wire uart_rg_wrpacket_EN;

  // register uart_user_ifc_baud_value
  reg [15 : 0] uart_user_ifc_baud_value;
  wire [15 : 0] uart_user_ifc_baud_value_D_IN;
  wire uart_user_ifc_baud_value_EN;

  // register uart_user_ifc_uart_fifoRecv_countReg
  reg [4 : 0] uart_user_ifc_uart_fifoRecv_countReg;
  wire [4 : 0] uart_user_ifc_uart_fifoRecv_countReg_D_IN;
  wire uart_user_ifc_uart_fifoRecv_countReg_EN;

  // register uart_user_ifc_uart_fifoXmit_countReg
  reg [4 : 0] uart_user_ifc_uart_fifoXmit_countReg;
  wire [4 : 0] uart_user_ifc_uart_fifoXmit_countReg_D_IN;
  wire uart_user_ifc_uart_fifoXmit_countReg_EN;

  // register uart_user_ifc_uart_rRecvBitCount
  reg [3 : 0] uart_user_ifc_uart_rRecvBitCount;
  wire [3 : 0] uart_user_ifc_uart_rRecvBitCount_D_IN;
  wire uart_user_ifc_uart_rRecvBitCount_EN;

  // register uart_user_ifc_uart_rRecvCellCount
  reg [3 : 0] uart_user_ifc_uart_rRecvCellCount;
  wire [3 : 0] uart_user_ifc_uart_rRecvCellCount_D_IN;
  wire uart_user_ifc_uart_rRecvCellCount_EN;

  // register uart_user_ifc_uart_rRecvData
  reg uart_user_ifc_uart_rRecvData;
  wire uart_user_ifc_uart_rRecvData_D_IN, uart_user_ifc_uart_rRecvData_EN;

  // register uart_user_ifc_uart_rRecvParity
  reg uart_user_ifc_uart_rRecvParity;
  wire uart_user_ifc_uart_rRecvParity_D_IN, uart_user_ifc_uart_rRecvParity_EN;

  // register uart_user_ifc_uart_rRecvState
  reg [2 : 0] uart_user_ifc_uart_rRecvState;
  reg [2 : 0] uart_user_ifc_uart_rRecvState_D_IN;
  wire uart_user_ifc_uart_rRecvState_EN;

  // register uart_user_ifc_uart_rXmitBitCount
  reg [3 : 0] uart_user_ifc_uart_rXmitBitCount;
  wire [3 : 0] uart_user_ifc_uart_rXmitBitCount_D_IN;
  wire uart_user_ifc_uart_rXmitBitCount_EN;

  // register uart_user_ifc_uart_rXmitCellCount
  reg [3 : 0] uart_user_ifc_uart_rXmitCellCount;
  wire [3 : 0] uart_user_ifc_uart_rXmitCellCount_D_IN;
  wire uart_user_ifc_uart_rXmitCellCount_EN;

  // register uart_user_ifc_uart_rXmitDataOut
  reg uart_user_ifc_uart_rXmitDataOut;
  reg uart_user_ifc_uart_rXmitDataOut_D_IN;
  wire uart_user_ifc_uart_rXmitDataOut_EN;

  // register uart_user_ifc_uart_rXmitParity
  reg uart_user_ifc_uart_rXmitParity;
  wire uart_user_ifc_uart_rXmitParity_D_IN, uart_user_ifc_uart_rXmitParity_EN;

  // register uart_user_ifc_uart_rXmitState
  reg [2 : 0] uart_user_ifc_uart_rXmitState;
  reg [2 : 0] uart_user_ifc_uart_rXmitState_D_IN;
  wire uart_user_ifc_uart_rXmitState_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_0
  reg uart_user_ifc_uart_vrRecvBuffer_0;
  wire uart_user_ifc_uart_vrRecvBuffer_0_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_0_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_1
  reg uart_user_ifc_uart_vrRecvBuffer_1;
  wire uart_user_ifc_uart_vrRecvBuffer_1_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_1_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_2
  reg uart_user_ifc_uart_vrRecvBuffer_2;
  wire uart_user_ifc_uart_vrRecvBuffer_2_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_2_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_3
  reg uart_user_ifc_uart_vrRecvBuffer_3;
  wire uart_user_ifc_uart_vrRecvBuffer_3_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_3_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_4
  reg uart_user_ifc_uart_vrRecvBuffer_4;
  wire uart_user_ifc_uart_vrRecvBuffer_4_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_4_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_5
  reg uart_user_ifc_uart_vrRecvBuffer_5;
  wire uart_user_ifc_uart_vrRecvBuffer_5_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_5_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_6
  reg uart_user_ifc_uart_vrRecvBuffer_6;
  wire uart_user_ifc_uart_vrRecvBuffer_6_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_6_EN;

  // register uart_user_ifc_uart_vrRecvBuffer_7
  reg uart_user_ifc_uart_vrRecvBuffer_7;
  wire uart_user_ifc_uart_vrRecvBuffer_7_D_IN,
       uart_user_ifc_uart_vrRecvBuffer_7_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_0
  reg uart_user_ifc_uart_vrXmitBuffer_0;
  wire uart_user_ifc_uart_vrXmitBuffer_0_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_0_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_1
  reg uart_user_ifc_uart_vrXmitBuffer_1;
  wire uart_user_ifc_uart_vrXmitBuffer_1_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_1_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_2
  reg uart_user_ifc_uart_vrXmitBuffer_2;
  wire uart_user_ifc_uart_vrXmitBuffer_2_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_2_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_3
  reg uart_user_ifc_uart_vrXmitBuffer_3;
  wire uart_user_ifc_uart_vrXmitBuffer_3_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_3_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_4
  reg uart_user_ifc_uart_vrXmitBuffer_4;
  wire uart_user_ifc_uart_vrXmitBuffer_4_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_4_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_5
  reg uart_user_ifc_uart_vrXmitBuffer_5;
  wire uart_user_ifc_uart_vrXmitBuffer_5_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_5_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_6
  reg uart_user_ifc_uart_vrXmitBuffer_6;
  wire uart_user_ifc_uart_vrXmitBuffer_6_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_6_EN;

  // register uart_user_ifc_uart_vrXmitBuffer_7
  reg uart_user_ifc_uart_vrXmitBuffer_7;
  wire uart_user_ifc_uart_vrXmitBuffer_7_D_IN,
       uart_user_ifc_uart_vrXmitBuffer_7_EN;

  // ports of submodule clint_s_xactor_f_rd_addr
  wire [51 : 0] clint_s_xactor_f_rd_addr_D_IN, clint_s_xactor_f_rd_addr_D_OUT;
  wire clint_s_xactor_f_rd_addr_CLR,
       clint_s_xactor_f_rd_addr_DEQ,
       clint_s_xactor_f_rd_addr_EMPTY_N,
       clint_s_xactor_f_rd_addr_ENQ,
       clint_s_xactor_f_rd_addr_FULL_N;

  // ports of submodule clint_s_xactor_f_rd_data
  wire [38 : 0] clint_s_xactor_f_rd_data_D_IN, clint_s_xactor_f_rd_data_D_OUT;
  wire clint_s_xactor_f_rd_data_CLR,
       clint_s_xactor_f_rd_data_DEQ,
       clint_s_xactor_f_rd_data_EMPTY_N,
       clint_s_xactor_f_rd_data_ENQ,
       clint_s_xactor_f_rd_data_FULL_N;

  // ports of submodule clint_s_xactor_f_wr_addr
  wire [51 : 0] clint_s_xactor_f_wr_addr_D_IN, clint_s_xactor_f_wr_addr_D_OUT;
  wire clint_s_xactor_f_wr_addr_CLR,
       clint_s_xactor_f_wr_addr_DEQ,
       clint_s_xactor_f_wr_addr_EMPTY_N,
       clint_s_xactor_f_wr_addr_ENQ,
       clint_s_xactor_f_wr_addr_FULL_N;

  // ports of submodule clint_s_xactor_f_wr_data
  wire [40 : 0] clint_s_xactor_f_wr_data_D_IN, clint_s_xactor_f_wr_data_D_OUT;
  wire clint_s_xactor_f_wr_data_CLR,
       clint_s_xactor_f_wr_data_DEQ,
       clint_s_xactor_f_wr_data_EMPTY_N,
       clint_s_xactor_f_wr_data_ENQ,
       clint_s_xactor_f_wr_data_FULL_N;

  // ports of submodule clint_s_xactor_f_wr_resp
  wire [5 : 0] clint_s_xactor_f_wr_resp_D_IN, clint_s_xactor_f_wr_resp_D_OUT;
  wire clint_s_xactor_f_wr_resp_CLR,
       clint_s_xactor_f_wr_resp_DEQ,
       clint_s_xactor_f_wr_resp_EMPTY_N,
       clint_s_xactor_f_wr_resp_ENQ,
       clint_s_xactor_f_wr_resp_FULL_N;

  // ports of submodule eclass
  wire [102 : 0] eclass_io_dump_get;
  wire [63 : 0] eclass_sb_clint_mtime_put;
  wire [31 : 0] eclass_master_d_ARADDR,
		eclass_master_d_AWADDR,
		eclass_master_d_RDATA,
		eclass_master_d_WDATA,
		eclass_master_i_ARADDR,
		eclass_master_i_AWADDR,
		eclass_master_i_RDATA,
		eclass_master_i_WDATA;
  wire [7 : 0] eclass_master_d_ARLEN,
	       eclass_master_d_AWLEN,
	       eclass_master_i_ARLEN,
	       eclass_master_i_AWLEN;
  wire [3 : 0] eclass_master_d_ARID,
	       eclass_master_d_AWID,
	       eclass_master_d_BID,
	       eclass_master_d_RID,
	       eclass_master_d_WID,
	       eclass_master_d_WSTRB,
	       eclass_master_i_ARID,
	       eclass_master_i_AWID,
	       eclass_master_i_BID,
	       eclass_master_i_RID,
	       eclass_master_i_WID,
	       eclass_master_i_WSTRB;
  wire [2 : 0] eclass_master_d_ARPROT,
	       eclass_master_d_ARSIZE,
	       eclass_master_d_AWPROT,
	       eclass_master_d_AWSIZE,
	       eclass_master_i_ARPROT,
	       eclass_master_i_ARSIZE,
	       eclass_master_i_AWPROT,
	       eclass_master_i_AWSIZE;
  wire [1 : 0] eclass_master_d_ARBURST,
	       eclass_master_d_AWBURST,
	       eclass_master_d_BRESP,
	       eclass_master_d_RRESP,
	       eclass_master_i_ARBURST,
	       eclass_master_i_AWBURST,
	       eclass_master_i_BRESP,
	       eclass_master_i_RRESP;
  wire eclass_EN_io_dump_get,
       eclass_EN_sb_clint_msip_put,
       eclass_EN_sb_clint_mtime_put,
       eclass_EN_sb_clint_mtip_put,
       eclass_EN_sb_ext_interrupt_put,
       eclass_RDY_io_dump_get,
       eclass_master_d_ARREADY,
       eclass_master_d_ARVALID,
       eclass_master_d_AWREADY,
       eclass_master_d_AWVALID,
       eclass_master_d_BREADY,
       eclass_master_d_BVALID,
       eclass_master_d_RLAST,
       eclass_master_d_RREADY,
       eclass_master_d_RVALID,
       eclass_master_d_WLAST,
       eclass_master_d_WREADY,
       eclass_master_d_WVALID,
       eclass_master_i_ARREADY,
       eclass_master_i_ARVALID,
       eclass_master_i_AWREADY,
       eclass_master_i_AWVALID,
       eclass_master_i_BREADY,
       eclass_master_i_BVALID,
       eclass_master_i_RLAST,
       eclass_master_i_RREADY,
       eclass_master_i_RVALID,
       eclass_master_i_WLAST,
       eclass_master_i_WREADY,
       eclass_master_i_WVALID,
       eclass_sb_clint_msip_put,
       eclass_sb_clint_mtip_put,
       eclass_sb_ext_interrupt_put;

  // ports of submodule err_slave_s_xactor_f_rd_addr
  wire [51 : 0] err_slave_s_xactor_f_rd_addr_D_IN,
		err_slave_s_xactor_f_rd_addr_D_OUT;
  wire err_slave_s_xactor_f_rd_addr_CLR,
       err_slave_s_xactor_f_rd_addr_DEQ,
       err_slave_s_xactor_f_rd_addr_EMPTY_N,
       err_slave_s_xactor_f_rd_addr_ENQ,
       err_slave_s_xactor_f_rd_addr_FULL_N;

  // ports of submodule err_slave_s_xactor_f_rd_data
  wire [38 : 0] err_slave_s_xactor_f_rd_data_D_IN,
		err_slave_s_xactor_f_rd_data_D_OUT;
  wire err_slave_s_xactor_f_rd_data_CLR,
       err_slave_s_xactor_f_rd_data_DEQ,
       err_slave_s_xactor_f_rd_data_EMPTY_N,
       err_slave_s_xactor_f_rd_data_ENQ,
       err_slave_s_xactor_f_rd_data_FULL_N;

  // ports of submodule err_slave_s_xactor_f_wr_addr
  wire [51 : 0] err_slave_s_xactor_f_wr_addr_D_IN;
  wire err_slave_s_xactor_f_wr_addr_CLR,
       err_slave_s_xactor_f_wr_addr_DEQ,
       err_slave_s_xactor_f_wr_addr_EMPTY_N,
       err_slave_s_xactor_f_wr_addr_ENQ,
       err_slave_s_xactor_f_wr_addr_FULL_N;

  // ports of submodule err_slave_s_xactor_f_wr_data
  wire [40 : 0] err_slave_s_xactor_f_wr_data_D_IN,
		err_slave_s_xactor_f_wr_data_D_OUT;
  wire err_slave_s_xactor_f_wr_data_CLR,
       err_slave_s_xactor_f_wr_data_DEQ,
       err_slave_s_xactor_f_wr_data_EMPTY_N,
       err_slave_s_xactor_f_wr_data_ENQ,
       err_slave_s_xactor_f_wr_data_FULL_N;

  // ports of submodule err_slave_s_xactor_f_wr_resp
  wire [5 : 0] err_slave_s_xactor_f_wr_resp_D_IN,
	       err_slave_s_xactor_f_wr_resp_D_OUT;
  wire err_slave_s_xactor_f_wr_resp_CLR,
       err_slave_s_xactor_f_wr_resp_DEQ,
       err_slave_s_xactor_f_wr_resp_EMPTY_N,
       err_slave_s_xactor_f_wr_resp_ENQ,
       err_slave_s_xactor_f_wr_resp_FULL_N;

  // ports of submodule fabric_v_f_rd_err_user_0
  wire fabric_v_f_rd_err_user_0_CLR,
       fabric_v_f_rd_err_user_0_DEQ,
       fabric_v_f_rd_err_user_0_ENQ;

  // ports of submodule fabric_v_f_rd_err_user_1
  wire fabric_v_f_rd_err_user_1_CLR,
       fabric_v_f_rd_err_user_1_DEQ,
       fabric_v_f_rd_err_user_1_ENQ;

  // ports of submodule fabric_v_f_rd_err_user_2
  wire fabric_v_f_rd_err_user_2_CLR,
       fabric_v_f_rd_err_user_2_DEQ,
       fabric_v_f_rd_err_user_2_ENQ;

  // ports of submodule fabric_v_f_rd_mis_0
  reg [1 : 0] fabric_v_f_rd_mis_0_D_IN;
  wire [1 : 0] fabric_v_f_rd_mis_0_D_OUT;
  wire fabric_v_f_rd_mis_0_CLR,
       fabric_v_f_rd_mis_0_DEQ,
       fabric_v_f_rd_mis_0_EMPTY_N,
       fabric_v_f_rd_mis_0_ENQ,
       fabric_v_f_rd_mis_0_FULL_N;

  // ports of submodule fabric_v_f_rd_mis_1
  reg [1 : 0] fabric_v_f_rd_mis_1_D_IN;
  wire [1 : 0] fabric_v_f_rd_mis_1_D_OUT;
  wire fabric_v_f_rd_mis_1_CLR,
       fabric_v_f_rd_mis_1_DEQ,
       fabric_v_f_rd_mis_1_EMPTY_N,
       fabric_v_f_rd_mis_1_ENQ,
       fabric_v_f_rd_mis_1_FULL_N;

  // ports of submodule fabric_v_f_rd_mis_2
  reg [1 : 0] fabric_v_f_rd_mis_2_D_IN;
  wire [1 : 0] fabric_v_f_rd_mis_2_D_OUT;
  wire fabric_v_f_rd_mis_2_CLR,
       fabric_v_f_rd_mis_2_DEQ,
       fabric_v_f_rd_mis_2_EMPTY_N,
       fabric_v_f_rd_mis_2_ENQ,
       fabric_v_f_rd_mis_2_FULL_N;

  // ports of submodule fabric_v_f_rd_mis_3
  reg [1 : 0] fabric_v_f_rd_mis_3_D_IN;
  wire [1 : 0] fabric_v_f_rd_mis_3_D_OUT;
  wire fabric_v_f_rd_mis_3_CLR,
       fabric_v_f_rd_mis_3_DEQ,
       fabric_v_f_rd_mis_3_EMPTY_N,
       fabric_v_f_rd_mis_3_ENQ,
       fabric_v_f_rd_mis_3_FULL_N;

  // ports of submodule fabric_v_f_rd_mis_4
  reg [1 : 0] fabric_v_f_rd_mis_4_D_IN;
  wire [1 : 0] fabric_v_f_rd_mis_4_D_OUT;
  wire fabric_v_f_rd_mis_4_CLR,
       fabric_v_f_rd_mis_4_DEQ,
       fabric_v_f_rd_mis_4_EMPTY_N,
       fabric_v_f_rd_mis_4_ENQ,
       fabric_v_f_rd_mis_4_FULL_N;

  // ports of submodule fabric_v_f_rd_mis_5
  reg [1 : 0] fabric_v_f_rd_mis_5_D_IN;
  wire [1 : 0] fabric_v_f_rd_mis_5_D_OUT;
  wire fabric_v_f_rd_mis_5_CLR,
       fabric_v_f_rd_mis_5_DEQ,
       fabric_v_f_rd_mis_5_EMPTY_N,
       fabric_v_f_rd_mis_5_ENQ,
       fabric_v_f_rd_mis_5_FULL_N;

  // ports of submodule fabric_v_f_rd_sjs_0
  reg [2 : 0] fabric_v_f_rd_sjs_0_D_IN;
  wire [2 : 0] fabric_v_f_rd_sjs_0_D_OUT;
  wire fabric_v_f_rd_sjs_0_CLR,
       fabric_v_f_rd_sjs_0_DEQ,
       fabric_v_f_rd_sjs_0_EMPTY_N,
       fabric_v_f_rd_sjs_0_ENQ,
       fabric_v_f_rd_sjs_0_FULL_N;

  // ports of submodule fabric_v_f_rd_sjs_1
  reg [2 : 0] fabric_v_f_rd_sjs_1_D_IN;
  wire [2 : 0] fabric_v_f_rd_sjs_1_D_OUT;
  wire fabric_v_f_rd_sjs_1_CLR,
       fabric_v_f_rd_sjs_1_DEQ,
       fabric_v_f_rd_sjs_1_EMPTY_N,
       fabric_v_f_rd_sjs_1_ENQ,
       fabric_v_f_rd_sjs_1_FULL_N;

  // ports of submodule fabric_v_f_rd_sjs_2
  reg [2 : 0] fabric_v_f_rd_sjs_2_D_IN;
  wire [2 : 0] fabric_v_f_rd_sjs_2_D_OUT;
  wire fabric_v_f_rd_sjs_2_CLR,
       fabric_v_f_rd_sjs_2_DEQ,
       fabric_v_f_rd_sjs_2_EMPTY_N,
       fabric_v_f_rd_sjs_2_ENQ,
       fabric_v_f_rd_sjs_2_FULL_N;

  // ports of submodule fabric_v_f_wr_err_user_0
  wire fabric_v_f_wr_err_user_0_CLR,
       fabric_v_f_wr_err_user_0_DEQ,
       fabric_v_f_wr_err_user_0_ENQ;

  // ports of submodule fabric_v_f_wr_err_user_1
  wire fabric_v_f_wr_err_user_1_CLR,
       fabric_v_f_wr_err_user_1_DEQ,
       fabric_v_f_wr_err_user_1_ENQ;

  // ports of submodule fabric_v_f_wr_err_user_2
  wire fabric_v_f_wr_err_user_2_CLR,
       fabric_v_f_wr_err_user_2_DEQ,
       fabric_v_f_wr_err_user_2_ENQ;

  // ports of submodule fabric_v_f_wr_mis_0
  reg [1 : 0] fabric_v_f_wr_mis_0_D_IN;
  wire [1 : 0] fabric_v_f_wr_mis_0_D_OUT;
  wire fabric_v_f_wr_mis_0_CLR,
       fabric_v_f_wr_mis_0_DEQ,
       fabric_v_f_wr_mis_0_EMPTY_N,
       fabric_v_f_wr_mis_0_ENQ,
       fabric_v_f_wr_mis_0_FULL_N;

  // ports of submodule fabric_v_f_wr_mis_1
  reg [1 : 0] fabric_v_f_wr_mis_1_D_IN;
  wire [1 : 0] fabric_v_f_wr_mis_1_D_OUT;
  wire fabric_v_f_wr_mis_1_CLR,
       fabric_v_f_wr_mis_1_DEQ,
       fabric_v_f_wr_mis_1_EMPTY_N,
       fabric_v_f_wr_mis_1_ENQ,
       fabric_v_f_wr_mis_1_FULL_N;

  // ports of submodule fabric_v_f_wr_mis_2
  reg [1 : 0] fabric_v_f_wr_mis_2_D_IN;
  wire [1 : 0] fabric_v_f_wr_mis_2_D_OUT;
  wire fabric_v_f_wr_mis_2_CLR,
       fabric_v_f_wr_mis_2_DEQ,
       fabric_v_f_wr_mis_2_EMPTY_N,
       fabric_v_f_wr_mis_2_ENQ,
       fabric_v_f_wr_mis_2_FULL_N;

  // ports of submodule fabric_v_f_wr_mis_3
  reg [1 : 0] fabric_v_f_wr_mis_3_D_IN;
  wire [1 : 0] fabric_v_f_wr_mis_3_D_OUT;
  wire fabric_v_f_wr_mis_3_CLR,
       fabric_v_f_wr_mis_3_DEQ,
       fabric_v_f_wr_mis_3_EMPTY_N,
       fabric_v_f_wr_mis_3_ENQ,
       fabric_v_f_wr_mis_3_FULL_N;

  // ports of submodule fabric_v_f_wr_mis_4
  reg [1 : 0] fabric_v_f_wr_mis_4_D_IN;
  wire [1 : 0] fabric_v_f_wr_mis_4_D_OUT;
  wire fabric_v_f_wr_mis_4_CLR,
       fabric_v_f_wr_mis_4_DEQ,
       fabric_v_f_wr_mis_4_EMPTY_N,
       fabric_v_f_wr_mis_4_ENQ,
       fabric_v_f_wr_mis_4_FULL_N;

  // ports of submodule fabric_v_f_wr_mis_5
  reg [1 : 0] fabric_v_f_wr_mis_5_D_IN;
  wire [1 : 0] fabric_v_f_wr_mis_5_D_OUT;
  wire fabric_v_f_wr_mis_5_CLR,
       fabric_v_f_wr_mis_5_DEQ,
       fabric_v_f_wr_mis_5_EMPTY_N,
       fabric_v_f_wr_mis_5_ENQ,
       fabric_v_f_wr_mis_5_FULL_N;

  // ports of submodule fabric_v_f_wr_sjs_0
  reg [2 : 0] fabric_v_f_wr_sjs_0_D_IN;
  wire [2 : 0] fabric_v_f_wr_sjs_0_D_OUT;
  wire fabric_v_f_wr_sjs_0_CLR,
       fabric_v_f_wr_sjs_0_DEQ,
       fabric_v_f_wr_sjs_0_EMPTY_N,
       fabric_v_f_wr_sjs_0_ENQ,
       fabric_v_f_wr_sjs_0_FULL_N;

  // ports of submodule fabric_v_f_wr_sjs_1
  reg [2 : 0] fabric_v_f_wr_sjs_1_D_IN;
  wire [2 : 0] fabric_v_f_wr_sjs_1_D_OUT;
  wire fabric_v_f_wr_sjs_1_CLR,
       fabric_v_f_wr_sjs_1_DEQ,
       fabric_v_f_wr_sjs_1_EMPTY_N,
       fabric_v_f_wr_sjs_1_ENQ,
       fabric_v_f_wr_sjs_1_FULL_N;

  // ports of submodule fabric_v_f_wr_sjs_2
  reg [2 : 0] fabric_v_f_wr_sjs_2_D_IN;
  wire [2 : 0] fabric_v_f_wr_sjs_2_D_OUT;
  wire fabric_v_f_wr_sjs_2_CLR,
       fabric_v_f_wr_sjs_2_DEQ,
       fabric_v_f_wr_sjs_2_EMPTY_N,
       fabric_v_f_wr_sjs_2_ENQ,
       fabric_v_f_wr_sjs_2_FULL_N;

  // ports of submodule fabric_v_f_wrd_err_user_0
  wire fabric_v_f_wrd_err_user_0_CLR,
       fabric_v_f_wrd_err_user_0_DEQ,
       fabric_v_f_wrd_err_user_0_ENQ;

  // ports of submodule fabric_v_f_wrd_err_user_1
  wire fabric_v_f_wrd_err_user_1_CLR,
       fabric_v_f_wrd_err_user_1_DEQ,
       fabric_v_f_wrd_err_user_1_ENQ;

  // ports of submodule fabric_v_f_wrd_err_user_2
  wire fabric_v_f_wrd_err_user_2_CLR,
       fabric_v_f_wrd_err_user_2_DEQ,
       fabric_v_f_wrd_err_user_2_ENQ;

  // ports of submodule fabric_v_f_wrd_mis_0
  reg [1 : 0] fabric_v_f_wrd_mis_0_D_IN;
  wire [1 : 0] fabric_v_f_wrd_mis_0_D_OUT;
  wire fabric_v_f_wrd_mis_0_CLR,
       fabric_v_f_wrd_mis_0_DEQ,
       fabric_v_f_wrd_mis_0_EMPTY_N,
       fabric_v_f_wrd_mis_0_ENQ,
       fabric_v_f_wrd_mis_0_FULL_N;

  // ports of submodule fabric_v_f_wrd_mis_1
  reg [1 : 0] fabric_v_f_wrd_mis_1_D_IN;
  wire [1 : 0] fabric_v_f_wrd_mis_1_D_OUT;
  wire fabric_v_f_wrd_mis_1_CLR,
       fabric_v_f_wrd_mis_1_DEQ,
       fabric_v_f_wrd_mis_1_EMPTY_N,
       fabric_v_f_wrd_mis_1_ENQ,
       fabric_v_f_wrd_mis_1_FULL_N;

  // ports of submodule fabric_v_f_wrd_mis_2
  reg [1 : 0] fabric_v_f_wrd_mis_2_D_IN;
  wire [1 : 0] fabric_v_f_wrd_mis_2_D_OUT;
  wire fabric_v_f_wrd_mis_2_CLR,
       fabric_v_f_wrd_mis_2_DEQ,
       fabric_v_f_wrd_mis_2_EMPTY_N,
       fabric_v_f_wrd_mis_2_ENQ,
       fabric_v_f_wrd_mis_2_FULL_N;

  // ports of submodule fabric_v_f_wrd_mis_3
  reg [1 : 0] fabric_v_f_wrd_mis_3_D_IN;
  wire [1 : 0] fabric_v_f_wrd_mis_3_D_OUT;
  wire fabric_v_f_wrd_mis_3_CLR,
       fabric_v_f_wrd_mis_3_DEQ,
       fabric_v_f_wrd_mis_3_EMPTY_N,
       fabric_v_f_wrd_mis_3_ENQ,
       fabric_v_f_wrd_mis_3_FULL_N;

  // ports of submodule fabric_v_f_wrd_mis_4
  reg [1 : 0] fabric_v_f_wrd_mis_4_D_IN;
  wire [1 : 0] fabric_v_f_wrd_mis_4_D_OUT;
  wire fabric_v_f_wrd_mis_4_CLR,
       fabric_v_f_wrd_mis_4_DEQ,
       fabric_v_f_wrd_mis_4_EMPTY_N,
       fabric_v_f_wrd_mis_4_ENQ,
       fabric_v_f_wrd_mis_4_FULL_N;

  // ports of submodule fabric_v_f_wrd_mis_5
  reg [1 : 0] fabric_v_f_wrd_mis_5_D_IN;
  wire [1 : 0] fabric_v_f_wrd_mis_5_D_OUT;
  wire fabric_v_f_wrd_mis_5_CLR,
       fabric_v_f_wrd_mis_5_DEQ,
       fabric_v_f_wrd_mis_5_EMPTY_N,
       fabric_v_f_wrd_mis_5_ENQ,
       fabric_v_f_wrd_mis_5_FULL_N;

  // ports of submodule fabric_v_f_wrd_sjs_0
  reg [2 : 0] fabric_v_f_wrd_sjs_0_D_IN;
  wire [2 : 0] fabric_v_f_wrd_sjs_0_D_OUT;
  wire fabric_v_f_wrd_sjs_0_CLR,
       fabric_v_f_wrd_sjs_0_DEQ,
       fabric_v_f_wrd_sjs_0_EMPTY_N,
       fabric_v_f_wrd_sjs_0_ENQ,
       fabric_v_f_wrd_sjs_0_FULL_N;

  // ports of submodule fabric_v_f_wrd_sjs_1
  reg [2 : 0] fabric_v_f_wrd_sjs_1_D_IN;
  wire [2 : 0] fabric_v_f_wrd_sjs_1_D_OUT;
  wire fabric_v_f_wrd_sjs_1_CLR,
       fabric_v_f_wrd_sjs_1_DEQ,
       fabric_v_f_wrd_sjs_1_EMPTY_N,
       fabric_v_f_wrd_sjs_1_ENQ,
       fabric_v_f_wrd_sjs_1_FULL_N;

  // ports of submodule fabric_v_f_wrd_sjs_2
  reg [2 : 0] fabric_v_f_wrd_sjs_2_D_IN;
  wire [2 : 0] fabric_v_f_wrd_sjs_2_D_OUT;
  wire fabric_v_f_wrd_sjs_2_CLR,
       fabric_v_f_wrd_sjs_2_DEQ,
       fabric_v_f_wrd_sjs_2_EMPTY_N,
       fabric_v_f_wrd_sjs_2_ENQ,
       fabric_v_f_wrd_sjs_2_FULL_N;

  // ports of submodule fabric_xactors_from_masters_0_f_rd_addr
  wire [51 : 0] fabric_xactors_from_masters_0_f_rd_addr_D_IN,
		fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
  wire fabric_xactors_from_masters_0_f_rd_addr_CLR,
       fabric_xactors_from_masters_0_f_rd_addr_DEQ,
       fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N,
       fabric_xactors_from_masters_0_f_rd_addr_ENQ,
       fabric_xactors_from_masters_0_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_from_masters_0_f_rd_data
  reg [38 : 0] fabric_xactors_from_masters_0_f_rd_data_D_IN;
  wire [38 : 0] fabric_xactors_from_masters_0_f_rd_data_D_OUT;
  wire fabric_xactors_from_masters_0_f_rd_data_CLR,
       fabric_xactors_from_masters_0_f_rd_data_DEQ,
       fabric_xactors_from_masters_0_f_rd_data_EMPTY_N,
       fabric_xactors_from_masters_0_f_rd_data_ENQ,
       fabric_xactors_from_masters_0_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_from_masters_0_f_wr_addr
  wire [51 : 0] fabric_xactors_from_masters_0_f_wr_addr_D_IN,
		fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_addr_CLR,
       fabric_xactors_from_masters_0_f_wr_addr_DEQ,
       fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_addr_ENQ,
       fabric_xactors_from_masters_0_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_from_masters_0_f_wr_data
  wire [40 : 0] fabric_xactors_from_masters_0_f_wr_data_D_IN,
		fabric_xactors_from_masters_0_f_wr_data_D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_data_CLR,
       fabric_xactors_from_masters_0_f_wr_data_DEQ,
       fabric_xactors_from_masters_0_f_wr_data_EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_data_ENQ,
       fabric_xactors_from_masters_0_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_from_masters_0_f_wr_resp
  reg [5 : 0] fabric_xactors_from_masters_0_f_wr_resp_D_IN;
  wire [5 : 0] fabric_xactors_from_masters_0_f_wr_resp_D_OUT;
  wire fabric_xactors_from_masters_0_f_wr_resp_CLR,
       fabric_xactors_from_masters_0_f_wr_resp_DEQ,
       fabric_xactors_from_masters_0_f_wr_resp_EMPTY_N,
       fabric_xactors_from_masters_0_f_wr_resp_ENQ,
       fabric_xactors_from_masters_0_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_from_masters_1_f_rd_addr
  wire [51 : 0] fabric_xactors_from_masters_1_f_rd_addr_D_IN,
		fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
  wire fabric_xactors_from_masters_1_f_rd_addr_CLR,
       fabric_xactors_from_masters_1_f_rd_addr_DEQ,
       fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N,
       fabric_xactors_from_masters_1_f_rd_addr_ENQ,
       fabric_xactors_from_masters_1_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_from_masters_1_f_rd_data
  reg [38 : 0] fabric_xactors_from_masters_1_f_rd_data_D_IN;
  wire [38 : 0] fabric_xactors_from_masters_1_f_rd_data_D_OUT;
  wire fabric_xactors_from_masters_1_f_rd_data_CLR,
       fabric_xactors_from_masters_1_f_rd_data_DEQ,
       fabric_xactors_from_masters_1_f_rd_data_EMPTY_N,
       fabric_xactors_from_masters_1_f_rd_data_ENQ,
       fabric_xactors_from_masters_1_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_from_masters_1_f_wr_addr
  wire [51 : 0] fabric_xactors_from_masters_1_f_wr_addr_D_IN,
		fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
  wire fabric_xactors_from_masters_1_f_wr_addr_CLR,
       fabric_xactors_from_masters_1_f_wr_addr_DEQ,
       fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N,
       fabric_xactors_from_masters_1_f_wr_addr_ENQ,
       fabric_xactors_from_masters_1_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_from_masters_1_f_wr_data
  wire [40 : 0] fabric_xactors_from_masters_1_f_wr_data_D_IN,
		fabric_xactors_from_masters_1_f_wr_data_D_OUT;
  wire fabric_xactors_from_masters_1_f_wr_data_CLR,
       fabric_xactors_from_masters_1_f_wr_data_DEQ,
       fabric_xactors_from_masters_1_f_wr_data_EMPTY_N,
       fabric_xactors_from_masters_1_f_wr_data_ENQ,
       fabric_xactors_from_masters_1_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_from_masters_1_f_wr_resp
  reg [5 : 0] fabric_xactors_from_masters_1_f_wr_resp_D_IN;
  wire [5 : 0] fabric_xactors_from_masters_1_f_wr_resp_D_OUT;
  wire fabric_xactors_from_masters_1_f_wr_resp_CLR,
       fabric_xactors_from_masters_1_f_wr_resp_DEQ,
       fabric_xactors_from_masters_1_f_wr_resp_EMPTY_N,
       fabric_xactors_from_masters_1_f_wr_resp_ENQ,
       fabric_xactors_from_masters_1_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_from_masters_2_f_rd_addr
  wire [51 : 0] fabric_xactors_from_masters_2_f_rd_addr_D_IN,
		fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
  wire fabric_xactors_from_masters_2_f_rd_addr_CLR,
       fabric_xactors_from_masters_2_f_rd_addr_DEQ,
       fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N,
       fabric_xactors_from_masters_2_f_rd_addr_ENQ,
       fabric_xactors_from_masters_2_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_from_masters_2_f_rd_data
  reg [38 : 0] fabric_xactors_from_masters_2_f_rd_data_D_IN;
  wire [38 : 0] fabric_xactors_from_masters_2_f_rd_data_D_OUT;
  wire fabric_xactors_from_masters_2_f_rd_data_CLR,
       fabric_xactors_from_masters_2_f_rd_data_DEQ,
       fabric_xactors_from_masters_2_f_rd_data_EMPTY_N,
       fabric_xactors_from_masters_2_f_rd_data_ENQ,
       fabric_xactors_from_masters_2_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_from_masters_2_f_wr_addr
  wire [51 : 0] fabric_xactors_from_masters_2_f_wr_addr_D_IN,
		fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
  wire fabric_xactors_from_masters_2_f_wr_addr_CLR,
       fabric_xactors_from_masters_2_f_wr_addr_DEQ,
       fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N,
       fabric_xactors_from_masters_2_f_wr_addr_ENQ,
       fabric_xactors_from_masters_2_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_from_masters_2_f_wr_data
  wire [40 : 0] fabric_xactors_from_masters_2_f_wr_data_D_IN,
		fabric_xactors_from_masters_2_f_wr_data_D_OUT;
  wire fabric_xactors_from_masters_2_f_wr_data_CLR,
       fabric_xactors_from_masters_2_f_wr_data_DEQ,
       fabric_xactors_from_masters_2_f_wr_data_EMPTY_N,
       fabric_xactors_from_masters_2_f_wr_data_ENQ,
       fabric_xactors_from_masters_2_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_from_masters_2_f_wr_resp
  reg [5 : 0] fabric_xactors_from_masters_2_f_wr_resp_D_IN;
  wire [5 : 0] fabric_xactors_from_masters_2_f_wr_resp_D_OUT;
  wire fabric_xactors_from_masters_2_f_wr_resp_CLR,
       fabric_xactors_from_masters_2_f_wr_resp_DEQ,
       fabric_xactors_from_masters_2_f_wr_resp_EMPTY_N,
       fabric_xactors_from_masters_2_f_wr_resp_ENQ,
       fabric_xactors_from_masters_2_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_0_f_rd_addr
  reg [51 : 0] fabric_xactors_to_slaves_0_f_rd_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_0_f_rd_addr_D_OUT;
  wire fabric_xactors_to_slaves_0_f_rd_addr_CLR,
       fabric_xactors_to_slaves_0_f_rd_addr_DEQ,
       fabric_xactors_to_slaves_0_f_rd_addr_EMPTY_N,
       fabric_xactors_to_slaves_0_f_rd_addr_ENQ,
       fabric_xactors_to_slaves_0_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_0_f_rd_data
  wire [38 : 0] fabric_xactors_to_slaves_0_f_rd_data_D_IN,
		fabric_xactors_to_slaves_0_f_rd_data_D_OUT;
  wire fabric_xactors_to_slaves_0_f_rd_data_CLR,
       fabric_xactors_to_slaves_0_f_rd_data_DEQ,
       fabric_xactors_to_slaves_0_f_rd_data_EMPTY_N,
       fabric_xactors_to_slaves_0_f_rd_data_ENQ,
       fabric_xactors_to_slaves_0_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_0_f_wr_addr
  reg [51 : 0] fabric_xactors_to_slaves_0_f_wr_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_0_f_wr_addr_D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_addr_CLR,
       fabric_xactors_to_slaves_0_f_wr_addr_DEQ,
       fabric_xactors_to_slaves_0_f_wr_addr_EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_addr_ENQ,
       fabric_xactors_to_slaves_0_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_0_f_wr_data
  reg [40 : 0] fabric_xactors_to_slaves_0_f_wr_data_D_IN;
  wire [40 : 0] fabric_xactors_to_slaves_0_f_wr_data_D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_data_CLR,
       fabric_xactors_to_slaves_0_f_wr_data_DEQ,
       fabric_xactors_to_slaves_0_f_wr_data_EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_data_ENQ,
       fabric_xactors_to_slaves_0_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_0_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_0_f_wr_resp_D_IN,
	       fabric_xactors_to_slaves_0_f_wr_resp_D_OUT;
  wire fabric_xactors_to_slaves_0_f_wr_resp_CLR,
       fabric_xactors_to_slaves_0_f_wr_resp_DEQ,
       fabric_xactors_to_slaves_0_f_wr_resp_EMPTY_N,
       fabric_xactors_to_slaves_0_f_wr_resp_ENQ,
       fabric_xactors_to_slaves_0_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_1_f_rd_addr
  reg [51 : 0] fabric_xactors_to_slaves_1_f_rd_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_1_f_rd_addr_D_OUT;
  wire fabric_xactors_to_slaves_1_f_rd_addr_CLR,
       fabric_xactors_to_slaves_1_f_rd_addr_DEQ,
       fabric_xactors_to_slaves_1_f_rd_addr_EMPTY_N,
       fabric_xactors_to_slaves_1_f_rd_addr_ENQ,
       fabric_xactors_to_slaves_1_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_1_f_rd_data
  wire [38 : 0] fabric_xactors_to_slaves_1_f_rd_data_D_IN,
		fabric_xactors_to_slaves_1_f_rd_data_D_OUT;
  wire fabric_xactors_to_slaves_1_f_rd_data_CLR,
       fabric_xactors_to_slaves_1_f_rd_data_DEQ,
       fabric_xactors_to_slaves_1_f_rd_data_EMPTY_N,
       fabric_xactors_to_slaves_1_f_rd_data_ENQ,
       fabric_xactors_to_slaves_1_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_1_f_wr_addr
  reg [51 : 0] fabric_xactors_to_slaves_1_f_wr_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_1_f_wr_addr_D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_addr_CLR,
       fabric_xactors_to_slaves_1_f_wr_addr_DEQ,
       fabric_xactors_to_slaves_1_f_wr_addr_EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_addr_ENQ,
       fabric_xactors_to_slaves_1_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_1_f_wr_data
  reg [40 : 0] fabric_xactors_to_slaves_1_f_wr_data_D_IN;
  wire [40 : 0] fabric_xactors_to_slaves_1_f_wr_data_D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_data_CLR,
       fabric_xactors_to_slaves_1_f_wr_data_DEQ,
       fabric_xactors_to_slaves_1_f_wr_data_EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_data_ENQ,
       fabric_xactors_to_slaves_1_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_1_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_1_f_wr_resp_D_IN,
	       fabric_xactors_to_slaves_1_f_wr_resp_D_OUT;
  wire fabric_xactors_to_slaves_1_f_wr_resp_CLR,
       fabric_xactors_to_slaves_1_f_wr_resp_DEQ,
       fabric_xactors_to_slaves_1_f_wr_resp_EMPTY_N,
       fabric_xactors_to_slaves_1_f_wr_resp_ENQ,
       fabric_xactors_to_slaves_1_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_2_f_rd_addr
  reg [51 : 0] fabric_xactors_to_slaves_2_f_rd_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_2_f_rd_addr_D_OUT;
  wire fabric_xactors_to_slaves_2_f_rd_addr_CLR,
       fabric_xactors_to_slaves_2_f_rd_addr_DEQ,
       fabric_xactors_to_slaves_2_f_rd_addr_EMPTY_N,
       fabric_xactors_to_slaves_2_f_rd_addr_ENQ,
       fabric_xactors_to_slaves_2_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_2_f_rd_data
  wire [38 : 0] fabric_xactors_to_slaves_2_f_rd_data_D_IN,
		fabric_xactors_to_slaves_2_f_rd_data_D_OUT;
  wire fabric_xactors_to_slaves_2_f_rd_data_CLR,
       fabric_xactors_to_slaves_2_f_rd_data_DEQ,
       fabric_xactors_to_slaves_2_f_rd_data_EMPTY_N,
       fabric_xactors_to_slaves_2_f_rd_data_ENQ,
       fabric_xactors_to_slaves_2_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_2_f_wr_addr
  reg [51 : 0] fabric_xactors_to_slaves_2_f_wr_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_2_f_wr_addr_D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_addr_CLR,
       fabric_xactors_to_slaves_2_f_wr_addr_DEQ,
       fabric_xactors_to_slaves_2_f_wr_addr_EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_addr_ENQ,
       fabric_xactors_to_slaves_2_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_2_f_wr_data
  reg [40 : 0] fabric_xactors_to_slaves_2_f_wr_data_D_IN;
  wire [40 : 0] fabric_xactors_to_slaves_2_f_wr_data_D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_data_CLR,
       fabric_xactors_to_slaves_2_f_wr_data_DEQ,
       fabric_xactors_to_slaves_2_f_wr_data_EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_data_ENQ,
       fabric_xactors_to_slaves_2_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_2_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_2_f_wr_resp_D_IN,
	       fabric_xactors_to_slaves_2_f_wr_resp_D_OUT;
  wire fabric_xactors_to_slaves_2_f_wr_resp_CLR,
       fabric_xactors_to_slaves_2_f_wr_resp_DEQ,
       fabric_xactors_to_slaves_2_f_wr_resp_EMPTY_N,
       fabric_xactors_to_slaves_2_f_wr_resp_ENQ,
       fabric_xactors_to_slaves_2_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_3_f_rd_addr
  reg [51 : 0] fabric_xactors_to_slaves_3_f_rd_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_3_f_rd_addr_D_OUT;
  wire fabric_xactors_to_slaves_3_f_rd_addr_CLR,
       fabric_xactors_to_slaves_3_f_rd_addr_DEQ,
       fabric_xactors_to_slaves_3_f_rd_addr_EMPTY_N,
       fabric_xactors_to_slaves_3_f_rd_addr_ENQ,
       fabric_xactors_to_slaves_3_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_3_f_rd_data
  wire [38 : 0] fabric_xactors_to_slaves_3_f_rd_data_D_IN,
		fabric_xactors_to_slaves_3_f_rd_data_D_OUT;
  wire fabric_xactors_to_slaves_3_f_rd_data_CLR,
       fabric_xactors_to_slaves_3_f_rd_data_DEQ,
       fabric_xactors_to_slaves_3_f_rd_data_EMPTY_N,
       fabric_xactors_to_slaves_3_f_rd_data_ENQ,
       fabric_xactors_to_slaves_3_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_3_f_wr_addr
  reg [51 : 0] fabric_xactors_to_slaves_3_f_wr_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_3_f_wr_addr_D_OUT;
  wire fabric_xactors_to_slaves_3_f_wr_addr_CLR,
       fabric_xactors_to_slaves_3_f_wr_addr_DEQ,
       fabric_xactors_to_slaves_3_f_wr_addr_EMPTY_N,
       fabric_xactors_to_slaves_3_f_wr_addr_ENQ,
       fabric_xactors_to_slaves_3_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_3_f_wr_data
  reg [40 : 0] fabric_xactors_to_slaves_3_f_wr_data_D_IN;
  wire [40 : 0] fabric_xactors_to_slaves_3_f_wr_data_D_OUT;
  wire fabric_xactors_to_slaves_3_f_wr_data_CLR,
       fabric_xactors_to_slaves_3_f_wr_data_DEQ,
       fabric_xactors_to_slaves_3_f_wr_data_EMPTY_N,
       fabric_xactors_to_slaves_3_f_wr_data_ENQ,
       fabric_xactors_to_slaves_3_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_3_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_3_f_wr_resp_D_IN,
	       fabric_xactors_to_slaves_3_f_wr_resp_D_OUT;
  wire fabric_xactors_to_slaves_3_f_wr_resp_CLR,
       fabric_xactors_to_slaves_3_f_wr_resp_DEQ,
       fabric_xactors_to_slaves_3_f_wr_resp_EMPTY_N,
       fabric_xactors_to_slaves_3_f_wr_resp_ENQ,
       fabric_xactors_to_slaves_3_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_4_f_rd_addr
  reg [51 : 0] fabric_xactors_to_slaves_4_f_rd_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_4_f_rd_addr_D_OUT;
  wire fabric_xactors_to_slaves_4_f_rd_addr_CLR,
       fabric_xactors_to_slaves_4_f_rd_addr_DEQ,
       fabric_xactors_to_slaves_4_f_rd_addr_EMPTY_N,
       fabric_xactors_to_slaves_4_f_rd_addr_ENQ,
       fabric_xactors_to_slaves_4_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_4_f_rd_data
  wire [38 : 0] fabric_xactors_to_slaves_4_f_rd_data_D_IN,
		fabric_xactors_to_slaves_4_f_rd_data_D_OUT;
  wire fabric_xactors_to_slaves_4_f_rd_data_CLR,
       fabric_xactors_to_slaves_4_f_rd_data_DEQ,
       fabric_xactors_to_slaves_4_f_rd_data_EMPTY_N,
       fabric_xactors_to_slaves_4_f_rd_data_ENQ,
       fabric_xactors_to_slaves_4_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_4_f_wr_addr
  reg [51 : 0] fabric_xactors_to_slaves_4_f_wr_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_4_f_wr_addr_D_OUT;
  wire fabric_xactors_to_slaves_4_f_wr_addr_CLR,
       fabric_xactors_to_slaves_4_f_wr_addr_DEQ,
       fabric_xactors_to_slaves_4_f_wr_addr_EMPTY_N,
       fabric_xactors_to_slaves_4_f_wr_addr_ENQ,
       fabric_xactors_to_slaves_4_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_4_f_wr_data
  reg [40 : 0] fabric_xactors_to_slaves_4_f_wr_data_D_IN;
  wire [40 : 0] fabric_xactors_to_slaves_4_f_wr_data_D_OUT;
  wire fabric_xactors_to_slaves_4_f_wr_data_CLR,
       fabric_xactors_to_slaves_4_f_wr_data_DEQ,
       fabric_xactors_to_slaves_4_f_wr_data_EMPTY_N,
       fabric_xactors_to_slaves_4_f_wr_data_ENQ,
       fabric_xactors_to_slaves_4_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_4_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_4_f_wr_resp_D_IN,
	       fabric_xactors_to_slaves_4_f_wr_resp_D_OUT;
  wire fabric_xactors_to_slaves_4_f_wr_resp_CLR,
       fabric_xactors_to_slaves_4_f_wr_resp_DEQ,
       fabric_xactors_to_slaves_4_f_wr_resp_EMPTY_N,
       fabric_xactors_to_slaves_4_f_wr_resp_ENQ,
       fabric_xactors_to_slaves_4_f_wr_resp_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_5_f_rd_addr
  reg [51 : 0] fabric_xactors_to_slaves_5_f_rd_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_5_f_rd_addr_D_OUT;
  wire fabric_xactors_to_slaves_5_f_rd_addr_CLR,
       fabric_xactors_to_slaves_5_f_rd_addr_DEQ,
       fabric_xactors_to_slaves_5_f_rd_addr_EMPTY_N,
       fabric_xactors_to_slaves_5_f_rd_addr_ENQ,
       fabric_xactors_to_slaves_5_f_rd_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_5_f_rd_data
  wire [38 : 0] fabric_xactors_to_slaves_5_f_rd_data_D_IN,
		fabric_xactors_to_slaves_5_f_rd_data_D_OUT;
  wire fabric_xactors_to_slaves_5_f_rd_data_CLR,
       fabric_xactors_to_slaves_5_f_rd_data_DEQ,
       fabric_xactors_to_slaves_5_f_rd_data_EMPTY_N,
       fabric_xactors_to_slaves_5_f_rd_data_ENQ,
       fabric_xactors_to_slaves_5_f_rd_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_5_f_wr_addr
  reg [51 : 0] fabric_xactors_to_slaves_5_f_wr_addr_D_IN;
  wire [51 : 0] fabric_xactors_to_slaves_5_f_wr_addr_D_OUT;
  wire fabric_xactors_to_slaves_5_f_wr_addr_CLR,
       fabric_xactors_to_slaves_5_f_wr_addr_DEQ,
       fabric_xactors_to_slaves_5_f_wr_addr_EMPTY_N,
       fabric_xactors_to_slaves_5_f_wr_addr_ENQ,
       fabric_xactors_to_slaves_5_f_wr_addr_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_5_f_wr_data
  reg [40 : 0] fabric_xactors_to_slaves_5_f_wr_data_D_IN;
  wire [40 : 0] fabric_xactors_to_slaves_5_f_wr_data_D_OUT;
  wire fabric_xactors_to_slaves_5_f_wr_data_CLR,
       fabric_xactors_to_slaves_5_f_wr_data_DEQ,
       fabric_xactors_to_slaves_5_f_wr_data_EMPTY_N,
       fabric_xactors_to_slaves_5_f_wr_data_ENQ,
       fabric_xactors_to_slaves_5_f_wr_data_FULL_N;

  // ports of submodule fabric_xactors_to_slaves_5_f_wr_resp
  wire [5 : 0] fabric_xactors_to_slaves_5_f_wr_resp_D_IN,
	       fabric_xactors_to_slaves_5_f_wr_resp_D_OUT;
  wire fabric_xactors_to_slaves_5_f_wr_resp_CLR,
       fabric_xactors_to_slaves_5_f_wr_resp_DEQ,
       fabric_xactors_to_slaves_5_f_wr_resp_EMPTY_N,
       fabric_xactors_to_slaves_5_f_wr_resp_ENQ,
       fabric_xactors_to_slaves_5_f_wr_resp_FULL_N;

  // ports of submodule signature
  wire [31 : 0] signature_master_ARADDR,
		signature_master_AWADDR,
		signature_master_RDATA,
		signature_master_WDATA,
		signature_slave_ARADDR,
		signature_slave_AWADDR,
		signature_slave_RDATA,
		signature_slave_WDATA;
  wire [7 : 0] signature_master_ARLEN,
	       signature_master_AWLEN,
	       signature_slave_ARLEN,
	       signature_slave_AWLEN;
  wire [3 : 0] signature_master_ARID,
	       signature_master_AWID,
	       signature_master_BID,
	       signature_master_RID,
	       signature_master_WID,
	       signature_master_WSTRB,
	       signature_slave_ARID,
	       signature_slave_AWID,
	       signature_slave_BID,
	       signature_slave_RID,
	       signature_slave_WID,
	       signature_slave_WSTRB;
  wire [2 : 0] signature_master_ARPROT,
	       signature_master_ARSIZE,
	       signature_master_AWPROT,
	       signature_master_AWSIZE,
	       signature_slave_ARPROT,
	       signature_slave_ARSIZE,
	       signature_slave_AWPROT,
	       signature_slave_AWSIZE;
  wire [1 : 0] signature_master_ARBURST,
	       signature_master_AWBURST,
	       signature_master_BRESP,
	       signature_master_RRESP,
	       signature_slave_ARBURST,
	       signature_slave_AWBURST,
	       signature_slave_BRESP,
	       signature_slave_RRESP;
  wire signature_master_ARREADY,
       signature_master_ARVALID,
       signature_master_AWREADY,
       signature_master_AWVALID,
       signature_master_BREADY,
       signature_master_BVALID,
       signature_master_RLAST,
       signature_master_RREADY,
       signature_master_RVALID,
       signature_master_WLAST,
       signature_master_WREADY,
       signature_master_WVALID,
       signature_mv_end_simulation,
       signature_slave_ARREADY,
       signature_slave_ARVALID,
       signature_slave_AWREADY,
       signature_slave_AWVALID,
       signature_slave_BREADY,
       signature_slave_BVALID,
       signature_slave_RLAST,
       signature_slave_RREADY,
       signature_slave_RVALID,
       signature_slave_WLAST,
       signature_slave_WREADY,
       signature_slave_WVALID;

  // ports of submodule uart_s_xactor_f_rd_addr
  wire [51 : 0] uart_s_xactor_f_rd_addr_D_IN, uart_s_xactor_f_rd_addr_D_OUT;
  wire uart_s_xactor_f_rd_addr_CLR,
       uart_s_xactor_f_rd_addr_DEQ,
       uart_s_xactor_f_rd_addr_EMPTY_N,
       uart_s_xactor_f_rd_addr_ENQ,
       uart_s_xactor_f_rd_addr_FULL_N;

  // ports of submodule uart_s_xactor_f_rd_data
  wire [38 : 0] uart_s_xactor_f_rd_data_D_IN, uart_s_xactor_f_rd_data_D_OUT;
  wire uart_s_xactor_f_rd_data_CLR,
       uart_s_xactor_f_rd_data_DEQ,
       uart_s_xactor_f_rd_data_EMPTY_N,
       uart_s_xactor_f_rd_data_ENQ,
       uart_s_xactor_f_rd_data_FULL_N;

  // ports of submodule uart_s_xactor_f_wr_addr
  wire [51 : 0] uart_s_xactor_f_wr_addr_D_IN, uart_s_xactor_f_wr_addr_D_OUT;
  wire uart_s_xactor_f_wr_addr_CLR,
       uart_s_xactor_f_wr_addr_DEQ,
       uart_s_xactor_f_wr_addr_EMPTY_N,
       uart_s_xactor_f_wr_addr_ENQ,
       uart_s_xactor_f_wr_addr_FULL_N;

  // ports of submodule uart_s_xactor_f_wr_data
  wire [40 : 0] uart_s_xactor_f_wr_data_D_IN, uart_s_xactor_f_wr_data_D_OUT;
  wire uart_s_xactor_f_wr_data_CLR,
       uart_s_xactor_f_wr_data_DEQ,
       uart_s_xactor_f_wr_data_EMPTY_N,
       uart_s_xactor_f_wr_data_ENQ,
       uart_s_xactor_f_wr_data_FULL_N;

  // ports of submodule uart_s_xactor_f_wr_resp
  wire [5 : 0] uart_s_xactor_f_wr_resp_D_IN, uart_s_xactor_f_wr_resp_D_OUT;
  wire uart_s_xactor_f_wr_resp_CLR,
       uart_s_xactor_f_wr_resp_DEQ,
       uart_s_xactor_f_wr_resp_EMPTY_N,
       uart_s_xactor_f_wr_resp_ENQ,
       uart_s_xactor_f_wr_resp_FULL_N;

  // ports of submodule uart_user_ifc_uart_baudGen_rBaudCounter
  wire [15 : 0] uart_user_ifc_uart_baudGen_rBaudCounter_DATA_A,
		uart_user_ifc_uart_baudGen_rBaudCounter_DATA_B,
		uart_user_ifc_uart_baudGen_rBaudCounter_DATA_C,
		uart_user_ifc_uart_baudGen_rBaudCounter_DATA_F,
		uart_user_ifc_uart_baudGen_rBaudCounter_Q_OUT;
  wire uart_user_ifc_uart_baudGen_rBaudCounter_ADDA,
       uart_user_ifc_uart_baudGen_rBaudCounter_ADDB,
       uart_user_ifc_uart_baudGen_rBaudCounter_SETC,
       uart_user_ifc_uart_baudGen_rBaudCounter_SETF;

  // ports of submodule uart_user_ifc_uart_baudGen_rBaudTickCounter
  wire [2 : 0] uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_A,
	       uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_B,
	       uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_C,
	       uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_F,
	       uart_user_ifc_uart_baudGen_rBaudTickCounter_Q_OUT;
  wire uart_user_ifc_uart_baudGen_rBaudTickCounter_ADDA,
       uart_user_ifc_uart_baudGen_rBaudTickCounter_ADDB,
       uart_user_ifc_uart_baudGen_rBaudTickCounter_SETC,
       uart_user_ifc_uart_baudGen_rBaudTickCounter_SETF;

  // ports of submodule uart_user_ifc_uart_fifoRecv
  wire [7 : 0] uart_user_ifc_uart_fifoRecv_D_IN,
	       uart_user_ifc_uart_fifoRecv_D_OUT;
  wire uart_user_ifc_uart_fifoRecv_CLR,
       uart_user_ifc_uart_fifoRecv_DEQ,
       uart_user_ifc_uart_fifoRecv_EMPTY_N,
       uart_user_ifc_uart_fifoRecv_ENQ,
       uart_user_ifc_uart_fifoRecv_FULL_N;

  // ports of submodule uart_user_ifc_uart_fifoXmit
  wire [7 : 0] uart_user_ifc_uart_fifoXmit_D_IN,
	       uart_user_ifc_uart_fifoXmit_D_OUT;
  wire uart_user_ifc_uart_fifoXmit_CLR,
       uart_user_ifc_uart_fifoXmit_DEQ,
       uart_user_ifc_uart_fifoXmit_EMPTY_N,
       uart_user_ifc_uart_fifoXmit_ENQ,
       uart_user_ifc_uart_fifoXmit_FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_clint_axi_read_transaction,
       CAN_FIRE_RL_clint_axi_write_transaction,
       CAN_FIRE_RL_clint_clint_clear_interrupt,
       CAN_FIRE_RL_clint_clint_generate_time_interrupt,
       CAN_FIRE_RL_clint_clint_increment_timer,
       CAN_FIRE_RL_clint_read_burst_traction,
       CAN_FIRE_RL_clint_write_burst_traction,
       CAN_FIRE_RL_err_slave_receive_read_request,
       CAN_FIRE_RL_err_slave_receive_write_request,
       CAN_FIRE_RL_err_slave_send_error_response,
       CAN_FIRE_RL_err_slave_write_request_data_channel,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8,
       CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8,
       CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8,
       CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8,
       CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9,
       CAN_FIRE_RL_mkConnectionGetPut,
       CAN_FIRE_RL_mkConnectionGetPut_1,
       CAN_FIRE_RL_mkConnectionGetPut_2,
       CAN_FIRE_RL_rl_rd_addr_channel,
       CAN_FIRE_RL_rl_rd_addr_channel_1,
       CAN_FIRE_RL_rl_rd_addr_channel_2,
       CAN_FIRE_RL_rl_rd_addr_channel_3,
       CAN_FIRE_RL_rl_rd_addr_channel_4,
       CAN_FIRE_RL_rl_rd_addr_channel_5,
       CAN_FIRE_RL_rl_rd_addr_channel_6,
       CAN_FIRE_RL_rl_rd_data_channel,
       CAN_FIRE_RL_rl_rd_data_channel_1,
       CAN_FIRE_RL_rl_rd_data_channel_2,
       CAN_FIRE_RL_rl_rd_data_channel_3,
       CAN_FIRE_RL_rl_rd_data_channel_4,
       CAN_FIRE_RL_rl_rd_data_channel_5,
       CAN_FIRE_RL_rl_rd_data_channel_6,
       CAN_FIRE_RL_rl_wr_addr_channel,
       CAN_FIRE_RL_rl_wr_addr_channel_1,
       CAN_FIRE_RL_rl_wr_addr_channel_2,
       CAN_FIRE_RL_rl_wr_addr_channel_3,
       CAN_FIRE_RL_rl_wr_addr_channel_4,
       CAN_FIRE_RL_rl_wr_addr_channel_5,
       CAN_FIRE_RL_rl_wr_addr_channel_6,
       CAN_FIRE_RL_rl_wr_data_channel,
       CAN_FIRE_RL_rl_wr_data_channel_1,
       CAN_FIRE_RL_rl_wr_data_channel_2,
       CAN_FIRE_RL_rl_wr_data_channel_3,
       CAN_FIRE_RL_rl_wr_data_channel_4,
       CAN_FIRE_RL_rl_wr_data_channel_5,
       CAN_FIRE_RL_rl_wr_data_channel_6,
       CAN_FIRE_RL_rl_wr_response_channel,
       CAN_FIRE_RL_rl_wr_response_channel_1,
       CAN_FIRE_RL_rl_wr_response_channel_2,
       CAN_FIRE_RL_rl_wr_response_channel_3,
       CAN_FIRE_RL_rl_wr_response_channel_4,
       CAN_FIRE_RL_rl_wr_response_channel_5,
       CAN_FIRE_RL_rl_wr_response_channel_6,
       CAN_FIRE_RL_uart_burst_reads,
       CAN_FIRE_RL_uart_burst_writes,
       CAN_FIRE_RL_uart_capture_read_request,
       CAN_FIRE_RL_uart_capture_write_request,
       CAN_FIRE_RL_uart_user_ifc_capture_status,
       CAN_FIRE_RL_uart_user_ifc_uart_baudGen_assert_2x_baud_tick,
       CAN_FIRE_RL_uart_user_ifc_uart_baudGen_baud_count_wire,
       CAN_FIRE_RL_uart_user_ifc_uart_baudGen_baud_tick_count_wire,
       CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x,
       CAN_FIRE_RL_uart_user_ifc_uart_baud_generator_clock_enable,
       CAN_FIRE_RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter,
       CAN_FIRE_RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_bit_cell_time_counter,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_bit_counter,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_parity_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_sample_pin,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample,
       CAN_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_bit_cell_time_counter,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_bit_counter,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time,
       CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command,
       CAN_FIRE_boot_mem_master_m_arready,
       CAN_FIRE_boot_mem_master_m_awready,
       CAN_FIRE_boot_mem_master_m_bvalid,
       CAN_FIRE_boot_mem_master_m_rvalid,
       CAN_FIRE_boot_mem_master_m_wready,
       CAN_FIRE_io_dump_get,
       CAN_FIRE_main_mem_master_m_arready,
       CAN_FIRE_main_mem_master_m_awready,
       CAN_FIRE_main_mem_master_m_bvalid,
       CAN_FIRE_main_mem_master_m_rvalid,
       CAN_FIRE_main_mem_master_m_wready,
       CAN_FIRE_uart_io_sin,
       WILL_FIRE_RL_clint_axi_read_transaction,
       WILL_FIRE_RL_clint_axi_write_transaction,
       WILL_FIRE_RL_clint_clint_clear_interrupt,
       WILL_FIRE_RL_clint_clint_generate_time_interrupt,
       WILL_FIRE_RL_clint_clint_increment_timer,
       WILL_FIRE_RL_clint_read_burst_traction,
       WILL_FIRE_RL_clint_write_burst_traction,
       WILL_FIRE_RL_err_slave_receive_read_request,
       WILL_FIRE_RL_err_slave_receive_write_request,
       WILL_FIRE_RL_err_slave_send_error_response,
       WILL_FIRE_RL_err_slave_write_request_data_channel,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8,
       WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8,
       WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8,
       WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8,
       WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9,
       WILL_FIRE_RL_mkConnectionGetPut,
       WILL_FIRE_RL_mkConnectionGetPut_1,
       WILL_FIRE_RL_mkConnectionGetPut_2,
       WILL_FIRE_RL_rl_rd_addr_channel,
       WILL_FIRE_RL_rl_rd_addr_channel_1,
       WILL_FIRE_RL_rl_rd_addr_channel_2,
       WILL_FIRE_RL_rl_rd_addr_channel_3,
       WILL_FIRE_RL_rl_rd_addr_channel_4,
       WILL_FIRE_RL_rl_rd_addr_channel_5,
       WILL_FIRE_RL_rl_rd_addr_channel_6,
       WILL_FIRE_RL_rl_rd_data_channel,
       WILL_FIRE_RL_rl_rd_data_channel_1,
       WILL_FIRE_RL_rl_rd_data_channel_2,
       WILL_FIRE_RL_rl_rd_data_channel_3,
       WILL_FIRE_RL_rl_rd_data_channel_4,
       WILL_FIRE_RL_rl_rd_data_channel_5,
       WILL_FIRE_RL_rl_rd_data_channel_6,
       WILL_FIRE_RL_rl_wr_addr_channel,
       WILL_FIRE_RL_rl_wr_addr_channel_1,
       WILL_FIRE_RL_rl_wr_addr_channel_2,
       WILL_FIRE_RL_rl_wr_addr_channel_3,
       WILL_FIRE_RL_rl_wr_addr_channel_4,
       WILL_FIRE_RL_rl_wr_addr_channel_5,
       WILL_FIRE_RL_rl_wr_addr_channel_6,
       WILL_FIRE_RL_rl_wr_data_channel,
       WILL_FIRE_RL_rl_wr_data_channel_1,
       WILL_FIRE_RL_rl_wr_data_channel_2,
       WILL_FIRE_RL_rl_wr_data_channel_3,
       WILL_FIRE_RL_rl_wr_data_channel_4,
       WILL_FIRE_RL_rl_wr_data_channel_5,
       WILL_FIRE_RL_rl_wr_data_channel_6,
       WILL_FIRE_RL_rl_wr_response_channel,
       WILL_FIRE_RL_rl_wr_response_channel_1,
       WILL_FIRE_RL_rl_wr_response_channel_2,
       WILL_FIRE_RL_rl_wr_response_channel_3,
       WILL_FIRE_RL_rl_wr_response_channel_4,
       WILL_FIRE_RL_rl_wr_response_channel_5,
       WILL_FIRE_RL_rl_wr_response_channel_6,
       WILL_FIRE_RL_uart_burst_reads,
       WILL_FIRE_RL_uart_burst_writes,
       WILL_FIRE_RL_uart_capture_read_request,
       WILL_FIRE_RL_uart_capture_write_request,
       WILL_FIRE_RL_uart_user_ifc_capture_status,
       WILL_FIRE_RL_uart_user_ifc_uart_baudGen_assert_2x_baud_tick,
       WILL_FIRE_RL_uart_user_ifc_uart_baudGen_baud_count_wire,
       WILL_FIRE_RL_uart_user_ifc_uart_baudGen_baud_tick_count_wire,
       WILL_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x,
       WILL_FIRE_RL_uart_user_ifc_uart_baud_generator_clock_enable,
       WILL_FIRE_RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter,
       WILL_FIRE_RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_bit_cell_time_counter,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_bit_counter,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_parity_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_sample_pin,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample,
       WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_bit_cell_time_counter,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_bit_counter,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time,
       WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command,
       WILL_FIRE_boot_mem_master_m_arready,
       WILL_FIRE_boot_mem_master_m_awready,
       WILL_FIRE_boot_mem_master_m_bvalid,
       WILL_FIRE_boot_mem_master_m_rvalid,
       WILL_FIRE_boot_mem_master_m_wready,
       WILL_FIRE_io_dump_get,
       WILL_FIRE_main_mem_master_m_arready,
       WILL_FIRE_main_mem_master_m_awready,
       WILL_FIRE_main_mem_master_m_bvalid,
       WILL_FIRE_main_mem_master_m_rvalid,
       WILL_FIRE_main_mem_master_m_wready,
       WILL_FIRE_uart_io_sin;

  // inputs to muxes for submodule ports
  reg [2 : 0] MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_3;
  wire [38 : 0] MUX_clint_s_xactor_f_rd_data_enq_1__VAL_1,
		MUX_clint_s_xactor_f_rd_data_enq_1__VAL_2,
		MUX_uart_s_xactor_f_rd_data_enq_1__VAL_1,
		MUX_uart_s_xactor_f_rd_data_enq_1__VAL_2;
  wire [7 : 0] MUX_clint_rg_rdburst_count_write_1__VAL_2,
	       MUX_err_slave_rg_readburst_counter_write_1__VAL_1,
	       MUX_uart_rg_rdburst_count_write_1__VAL_2,
	       MUX_uart_rg_wrburst_count_write_1__VAL_2;
  wire [5 : 0] MUX_clint_s_xactor_f_wr_resp_enq_1__VAL_1,
	       MUX_clint_s_xactor_f_wr_resp_enq_1__VAL_2,
	       MUX_err_slave_s_xactor_f_wr_resp_enq_1__VAL_1,
	       MUX_uart_s_xactor_f_wr_resp_enq_1__VAL_1,
	       MUX_uart_s_xactor_f_wr_resp_enq_1__VAL_2;
  wire [2 : 0] MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_1,
	       MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_2,
	       MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_4,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_1,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_2,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_3,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_4,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_5,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_6,
	       MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_7;
  wire MUX_clint_clint_mtip_write_1__VAL_1,
       MUX_clint_rg_rdburst_count_write_1__SEL_1,
       MUX_clint_rg_wrburst_count_write_1__SEL_1,
       MUX_clint_s_xactor_f_wr_resp_enq_1__SEL_1,
       MUX_err_slave_read_state_write_1__SEL_1,
       MUX_err_slave_rg_readburst_counter_write_1__SEL_1,
       MUX_err_slave_s_xactor_f_wr_resp_enq_1__SEL_1,
       MUX_err_slave_s_xactor_f_wr_resp_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_1,
       MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_3,
       MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_1,
       MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_3,
       MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_1,
       MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_3,
       MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_1,
       MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_3,
       MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_1,
       MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_3,
       MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_1,
       MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_2,
       MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_3,
       MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_2,
       MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_3,
       MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_2,
       MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_3,
       MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_2,
       MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_3,
       MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_2,
       MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_3,
       MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_2,
       MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_3,
       MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_1,
       MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_2,
       MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_3,
       MUX_uart_rg_rdburst_count_write_1__SEL_1,
       MUX_uart_rg_wrburst_count_write_1__SEL_1,
       MUX_uart_s_xactor_f_wr_resp_enq_1__SEL_1,
       MUX_uart_user_ifc_uart_rRecvState_write_1__SEL_6,
       MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_1,
       MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_2,
       MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_3;


  // remaining internal signals
  reg [63 : 0] CASE_clint_s_xactor_f_wr_addrD_OUT_BITS_7_TO__ETC__q1,
	       mask__h97323,
	       x__h77526,
	       x__h87336;
  reg [31 : 0] data__h97324, rdata__h71703, rdata__h73432;
  reg [1 : 0] CASE_uart_s_xactor_f_rd_addrD_OUT_BITS_23_TO__ETC__q2,
	      CASE_uart_s_xactor_f_wr_addrD_OUT_BITS_23_TO__ETC__q3;
  wire [63 : 0] _theResult_____2__h77214,
		_theResult_____2__h87205,
		_theResult___snd__h77385,
		_theResult___snd__h77452,
		_theResult___snd__h77519,
		_theResult___snd__h88530,
		_theResult___snd__h96266,
		_theResult___snd__h96333,
		datamask__h97327,
		mask__h97326,
		notmask__h97328,
		temp___1__h77973,
		temp___1__h87773,
		temp___1__h88525,
		temp__h77213,
		temp__h77544,
		temp__h86853,
		temp__h87204,
		temp__h87345,
		temp__h96809,
		x__h98582;
  wire [31 : 0] a__h71679, a__h71685, a__h73418;
  wire [7 : 0] x__h73497, x__h75721, x__h87294;
  wire [5 : 0] shift_amt__h77210, shift_amt__h87201, shift_amt__h97325;
  wire [3 : 0] x__h63201, x__h64905, x__h66661, x__h66687, x_wget__h71046;
  wire _dor1fabric_v_f_rd_mis_0_EN_deq,
       _dor1fabric_v_f_rd_mis_1_EN_deq,
       _dor1fabric_v_f_rd_mis_2_EN_deq,
       _dor1fabric_v_f_rd_mis_3_EN_deq,
       _dor1fabric_v_f_rd_mis_4_EN_deq,
       _dor1fabric_v_f_rd_mis_5_EN_deq,
       _dor1fabric_v_f_wrd_sjs_0_EN_deq,
       _dor1fabric_v_f_wrd_sjs_1_EN_deq,
       _dor1fabric_v_f_wrd_sjs_2_EN_deq,
       _dor2uart_user_ifc_uart_pwXmitCellCountReset_EN_wset,
       err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1033,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1035,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1038,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1059,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1061,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1064,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1086,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1088,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1091,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1093,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1115,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1117,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979,
       fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d108,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d110,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d113,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d149,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d151,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d154,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d191,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d193,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d196,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d198,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d235,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d237,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68,
       fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70,
       fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d104,
       fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d14,
       fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d145,
       fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d187,
       fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d230,
       fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d64,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1186,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1188,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1191,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1209,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1211,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1214,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1233,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1235,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1238,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1240,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1259,
       fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1261,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d353,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d355,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d358,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d389,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d391,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d394,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d426,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d428,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d431,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d433,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d465,
       fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d467,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1330,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1332,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1335,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1353,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1355,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1358,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1377,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1379,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1382,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1384,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1403,
       fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1405,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d582,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d584,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d587,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d618,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d620,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d623,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d655,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d657,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d660,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d662,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d694,
       fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d696,
       fabric_xactors_to_slaves_0_f_wr_data_i_notFull_ETC___d269,
       fabric_xactors_to_slaves_0_f_wr_data_i_notFull_ETC___d498,
       fabric_xactors_to_slaves_1_f_wr_data_i_notFull_ETC___d314,
       fabric_xactors_to_slaves_1_f_wr_data_i_notFull_ETC___d543,
       fabric_xactors_to_slaves_2_f_wr_data_i_notFull_ETC___d349,
       fabric_xactors_to_slaves_2_f_wr_data_i_notFull_ETC___d578,
       fabric_xactors_to_slaves_3_f_wr_data_i_notFull_ETC___d385,
       fabric_xactors_to_slaves_3_f_wr_data_i_notFull_ETC___d614,
       fabric_xactors_to_slaves_4_f_wr_data_i_notFull_ETC___d422,
       fabric_xactors_to_slaves_4_f_wr_data_i_notFull_ETC___d651,
       fabric_xactors_to_slaves_5_f_wr_data_i_notFull_ETC___d460,
       fabric_xactors_to_slaves_5_f_wr_data_i_notFull_ETC___d689,
       uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496,
       z__h68144,
       z__h68151,
       z__h68158,
       z__h68165,
       z__h68172,
       z__h68179;

  // actionvalue method io_dump_get
  assign io_dump_get = eclass_io_dump_get ;
  assign RDY_io_dump_get = eclass_RDY_io_dump_get ;
  assign CAN_FIRE_io_dump_get = eclass_RDY_io_dump_get ;
  assign WILL_FIRE_io_dump_get = EN_io_dump_get ;

  // value method main_mem_master_m_awvalid
  assign main_mem_master_AWVALID =
	     fabric_xactors_to_slaves_0_f_wr_addr_EMPTY_N ;

  // value method main_mem_master_m_awaddr
  assign main_mem_master_AWADDR =
	     fabric_xactors_to_slaves_0_f_wr_addr_D_OUT[51:20] ;

  // value method main_mem_master_m_awprot
  assign main_mem_master_AWPROT =
	     fabric_xactors_to_slaves_0_f_wr_addr_D_OUT[19:17] ;

  // value method main_mem_master_m_awlen
  assign main_mem_master_AWLEN =
	     fabric_xactors_to_slaves_0_f_wr_addr_D_OUT[16:9] ;

  // value method main_mem_master_m_awsize
  assign main_mem_master_AWSIZE =
	     fabric_xactors_to_slaves_0_f_wr_addr_D_OUT[8:6] ;

  // value method main_mem_master_m_awburst
  assign main_mem_master_AWBURST =
	     fabric_xactors_to_slaves_0_f_wr_addr_D_OUT[5:4] ;

  // value method main_mem_master_m_awid
  assign main_mem_master_AWID =
	     fabric_xactors_to_slaves_0_f_wr_addr_D_OUT[3:0] ;

  // action method main_mem_master_m_awready
  assign CAN_FIRE_main_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_main_mem_master_m_awready = 1'd1 ;

  // value method main_mem_master_m_wvalid
  assign main_mem_master_WVALID =
	     fabric_xactors_to_slaves_0_f_wr_data_EMPTY_N ;

  // value method main_mem_master_m_wdata
  assign main_mem_master_WDATA =
	     fabric_xactors_to_slaves_0_f_wr_data_D_OUT[40:9] ;

  // value method main_mem_master_m_wstrb
  assign main_mem_master_WSTRB =
	     fabric_xactors_to_slaves_0_f_wr_data_D_OUT[8:5] ;

  // value method main_mem_master_m_wlast
  assign main_mem_master_WLAST =
	     fabric_xactors_to_slaves_0_f_wr_data_D_OUT[0] ;

  // value method main_mem_master_m_wid
  assign main_mem_master_WID =
	     fabric_xactors_to_slaves_0_f_wr_data_D_OUT[4:1] ;

  // action method main_mem_master_m_wready
  assign CAN_FIRE_main_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_main_mem_master_m_wready = 1'd1 ;

  // action method main_mem_master_m_bvalid
  assign CAN_FIRE_main_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_main_mem_master_m_bvalid = 1'd1 ;

  // value method main_mem_master_m_bready
  assign main_mem_master_BREADY =
	     fabric_xactors_to_slaves_0_f_wr_resp_FULL_N ;

  // value method main_mem_master_m_arvalid
  assign main_mem_master_ARVALID =
	     fabric_xactors_to_slaves_0_f_rd_addr_EMPTY_N ;

  // value method main_mem_master_m_araddr
  assign main_mem_master_ARADDR =
	     fabric_xactors_to_slaves_0_f_rd_addr_D_OUT[51:20] ;

  // value method main_mem_master_m_arprot
  assign main_mem_master_ARPROT =
	     fabric_xactors_to_slaves_0_f_rd_addr_D_OUT[19:17] ;

  // value method main_mem_master_m_arlen
  assign main_mem_master_ARLEN =
	     fabric_xactors_to_slaves_0_f_rd_addr_D_OUT[13:6] ;

  // value method main_mem_master_m_arsize
  assign main_mem_master_ARSIZE =
	     fabric_xactors_to_slaves_0_f_rd_addr_D_OUT[16:14] ;

  // value method main_mem_master_m_arburst
  assign main_mem_master_ARBURST =
	     fabric_xactors_to_slaves_0_f_rd_addr_D_OUT[5:4] ;

  // value method main_mem_master_m_arid
  assign main_mem_master_ARID =
	     fabric_xactors_to_slaves_0_f_rd_addr_D_OUT[3:0] ;

  // action method main_mem_master_m_arready
  assign CAN_FIRE_main_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_main_mem_master_m_arready = 1'd1 ;

  // action method main_mem_master_m_rvalid
  assign CAN_FIRE_main_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_main_mem_master_m_rvalid = 1'd1 ;

  // value method main_mem_master_m_rready
  assign main_mem_master_RREADY =
	     fabric_xactors_to_slaves_0_f_rd_data_FULL_N ;

  // value method boot_mem_master_m_awvalid
  assign boot_mem_master_AWVALID =
	     fabric_xactors_to_slaves_1_f_wr_addr_EMPTY_N ;

  // value method boot_mem_master_m_awaddr
  assign boot_mem_master_AWADDR =
	     fabric_xactors_to_slaves_1_f_wr_addr_D_OUT[51:20] ;

  // value method boot_mem_master_m_awprot
  assign boot_mem_master_AWPROT =
	     fabric_xactors_to_slaves_1_f_wr_addr_D_OUT[19:17] ;

  // value method boot_mem_master_m_awlen
  assign boot_mem_master_AWLEN =
	     fabric_xactors_to_slaves_1_f_wr_addr_D_OUT[16:9] ;

  // value method boot_mem_master_m_awsize
  assign boot_mem_master_AWSIZE =
	     fabric_xactors_to_slaves_1_f_wr_addr_D_OUT[8:6] ;

  // value method boot_mem_master_m_awburst
  assign boot_mem_master_AWBURST =
	     fabric_xactors_to_slaves_1_f_wr_addr_D_OUT[5:4] ;

  // value method boot_mem_master_m_awid
  assign boot_mem_master_AWID =
	     fabric_xactors_to_slaves_1_f_wr_addr_D_OUT[3:0] ;

  // action method boot_mem_master_m_awready
  assign CAN_FIRE_boot_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_boot_mem_master_m_awready = 1'd1 ;

  // value method boot_mem_master_m_wvalid
  assign boot_mem_master_WVALID =
	     fabric_xactors_to_slaves_1_f_wr_data_EMPTY_N ;

  // value method boot_mem_master_m_wdata
  assign boot_mem_master_WDATA =
	     fabric_xactors_to_slaves_1_f_wr_data_D_OUT[40:9] ;

  // value method boot_mem_master_m_wstrb
  assign boot_mem_master_WSTRB =
	     fabric_xactors_to_slaves_1_f_wr_data_D_OUT[8:5] ;

  // value method boot_mem_master_m_wlast
  assign boot_mem_master_WLAST =
	     fabric_xactors_to_slaves_1_f_wr_data_D_OUT[0] ;

  // value method boot_mem_master_m_wid
  assign boot_mem_master_WID =
	     fabric_xactors_to_slaves_1_f_wr_data_D_OUT[4:1] ;

  // action method boot_mem_master_m_wready
  assign CAN_FIRE_boot_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_boot_mem_master_m_wready = 1'd1 ;

  // action method boot_mem_master_m_bvalid
  assign CAN_FIRE_boot_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_boot_mem_master_m_bvalid = 1'd1 ;

  // value method boot_mem_master_m_bready
  assign boot_mem_master_BREADY =
	     fabric_xactors_to_slaves_1_f_wr_resp_FULL_N ;

  // value method boot_mem_master_m_arvalid
  assign boot_mem_master_ARVALID =
	     fabric_xactors_to_slaves_1_f_rd_addr_EMPTY_N ;

  // value method boot_mem_master_m_araddr
  assign boot_mem_master_ARADDR =
	     fabric_xactors_to_slaves_1_f_rd_addr_D_OUT[51:20] ;

  // value method boot_mem_master_m_arprot
  assign boot_mem_master_ARPROT =
	     fabric_xactors_to_slaves_1_f_rd_addr_D_OUT[19:17] ;

  // value method boot_mem_master_m_arlen
  assign boot_mem_master_ARLEN =
	     fabric_xactors_to_slaves_1_f_rd_addr_D_OUT[13:6] ;

  // value method boot_mem_master_m_arsize
  assign boot_mem_master_ARSIZE =
	     fabric_xactors_to_slaves_1_f_rd_addr_D_OUT[16:14] ;

  // value method boot_mem_master_m_arburst
  assign boot_mem_master_ARBURST =
	     fabric_xactors_to_slaves_1_f_rd_addr_D_OUT[5:4] ;

  // value method boot_mem_master_m_arid
  assign boot_mem_master_ARID =
	     fabric_xactors_to_slaves_1_f_rd_addr_D_OUT[3:0] ;

  // action method boot_mem_master_m_arready
  assign CAN_FIRE_boot_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_boot_mem_master_m_arready = 1'd1 ;

  // action method boot_mem_master_m_rvalid
  assign CAN_FIRE_boot_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_boot_mem_master_m_rvalid = 1'd1 ;

  // value method boot_mem_master_m_rready
  assign boot_mem_master_RREADY =
	     fabric_xactors_to_slaves_1_f_rd_data_FULL_N ;

  // action method uart_io_sin
  assign CAN_FIRE_uart_io_sin = 1'd1 ;
  assign WILL_FIRE_uart_io_sin = 1'd1 ;

  // value method uart_io_sout
  assign uart_io_SOUT = uart_user_ifc_uart_rXmitDataOut ;

  // value method mv_end_simulation
  assign mv_end_simulation = signature_mv_end_simulation ;
  assign RDY_mv_end_simulation = 1'd1 ;


mkeclass eclass (
    .CLK(CLK),
    .RST_N(RST_N),

    // Data memory
    .master_d_AWVALID(eclass_master_d_AWVALID),
    .master_d_AWADDR(eclass_master_d_AWADDR),
    .master_d_WVALID(eclass_master_d_WVALID),
    .master_d_WDATA(eclass_master_d_WDATA),
    .master_d_WSTRB(eclass_master_d_WSTRB),
    .master_d_ARVALID(eclass_master_d_ARVALID),
    .master_d_ARADDR(eclass_master_d_ARADDR),
    .master_d_RREADY(eclass_master_d_RREADY),
    .master_d_RVALID(eclass_master_d_RVALID),
    .master_d_RDATA(eclass_master_d_RDATA),
    .master_d_RRESP(eclass_master_d_RRESP),

    // Instruction memory (read-only)
    .master_i_ARVALID(eclass_master_i_ARVALID),
    .master_i_ARADDR(eclass_master_i_ARADDR),
    .master_i_RREADY(eclass_master_i_RREADY),
    .master_i_RVALID(eclass_master_i_RVALID),
    .master_i_RDATA(eclass_master_i_RDATA),
    .master_i_RRESP(eclass_master_i_RRESP)
);



  // submodule fabric_v_f_rd_err_user_0
  FIFO10 #(.guarded(1'd1)) fabric_v_f_rd_err_user_0(.RST(RST_N),
						    .CLK(CLK),
						    .ENQ(fabric_v_f_rd_err_user_0_ENQ),
						    .DEQ(fabric_v_f_rd_err_user_0_DEQ),
						    .CLR(fabric_v_f_rd_err_user_0_CLR),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule fabric_v_f_rd_err_user_1
  FIFO10 #(.guarded(1'd1)) fabric_v_f_rd_err_user_1(.RST(RST_N),
						    .CLK(CLK),
						    .ENQ(fabric_v_f_rd_err_user_1_ENQ),
						    .DEQ(fabric_v_f_rd_err_user_1_DEQ),
						    .CLR(fabric_v_f_rd_err_user_1_CLR),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule fabric_v_f_rd_err_user_2
  FIFO10 #(.guarded(1'd1)) fabric_v_f_rd_err_user_2(.RST(RST_N),
						    .CLK(CLK),
						    .ENQ(fabric_v_f_rd_err_user_2_ENQ),
						    .DEQ(fabric_v_f_rd_err_user_2_DEQ),
						    .CLR(fabric_v_f_rd_err_user_2_CLR),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule fabric_v_f_rd_mis_0
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_rd_mis_0(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_mis_0_D_IN),
							     .ENQ(fabric_v_f_rd_mis_0_ENQ),
							     .DEQ(fabric_v_f_rd_mis_0_DEQ),
							     .CLR(fabric_v_f_rd_mis_0_CLR),
							     .D_OUT(fabric_v_f_rd_mis_0_D_OUT),
							     .FULL_N(fabric_v_f_rd_mis_0_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_mis_0_EMPTY_N));

  // submodule fabric_v_f_rd_mis_1
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_rd_mis_1(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_mis_1_D_IN),
							     .ENQ(fabric_v_f_rd_mis_1_ENQ),
							     .DEQ(fabric_v_f_rd_mis_1_DEQ),
							     .CLR(fabric_v_f_rd_mis_1_CLR),
							     .D_OUT(fabric_v_f_rd_mis_1_D_OUT),
							     .FULL_N(fabric_v_f_rd_mis_1_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_mis_1_EMPTY_N));

  // submodule fabric_v_f_rd_mis_2
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_rd_mis_2(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_mis_2_D_IN),
							     .ENQ(fabric_v_f_rd_mis_2_ENQ),
							     .DEQ(fabric_v_f_rd_mis_2_DEQ),
							     .CLR(fabric_v_f_rd_mis_2_CLR),
							     .D_OUT(fabric_v_f_rd_mis_2_D_OUT),
							     .FULL_N(fabric_v_f_rd_mis_2_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_mis_2_EMPTY_N));

  // submodule fabric_v_f_rd_mis_3
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_rd_mis_3(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_mis_3_D_IN),
							     .ENQ(fabric_v_f_rd_mis_3_ENQ),
							     .DEQ(fabric_v_f_rd_mis_3_DEQ),
							     .CLR(fabric_v_f_rd_mis_3_CLR),
							     .D_OUT(fabric_v_f_rd_mis_3_D_OUT),
							     .FULL_N(fabric_v_f_rd_mis_3_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_mis_3_EMPTY_N));

  // submodule fabric_v_f_rd_mis_4
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_rd_mis_4(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_mis_4_D_IN),
							     .ENQ(fabric_v_f_rd_mis_4_ENQ),
							     .DEQ(fabric_v_f_rd_mis_4_DEQ),
							     .CLR(fabric_v_f_rd_mis_4_CLR),
							     .D_OUT(fabric_v_f_rd_mis_4_D_OUT),
							     .FULL_N(fabric_v_f_rd_mis_4_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_mis_4_EMPTY_N));

  // submodule fabric_v_f_rd_mis_5
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_rd_mis_5(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_mis_5_D_IN),
							     .ENQ(fabric_v_f_rd_mis_5_ENQ),
							     .DEQ(fabric_v_f_rd_mis_5_DEQ),
							     .CLR(fabric_v_f_rd_mis_5_CLR),
							     .D_OUT(fabric_v_f_rd_mis_5_D_OUT),
							     .FULL_N(fabric_v_f_rd_mis_5_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_mis_5_EMPTY_N));

  // submodule fabric_v_f_rd_sjs_0
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_rd_sjs_0(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_sjs_0_D_IN),
							     .ENQ(fabric_v_f_rd_sjs_0_ENQ),
							     .DEQ(fabric_v_f_rd_sjs_0_DEQ),
							     .CLR(fabric_v_f_rd_sjs_0_CLR),
							     .D_OUT(fabric_v_f_rd_sjs_0_D_OUT),
							     .FULL_N(fabric_v_f_rd_sjs_0_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_sjs_0_EMPTY_N));

  // submodule fabric_v_f_rd_sjs_1
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_rd_sjs_1(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_sjs_1_D_IN),
							     .ENQ(fabric_v_f_rd_sjs_1_ENQ),
							     .DEQ(fabric_v_f_rd_sjs_1_DEQ),
							     .CLR(fabric_v_f_rd_sjs_1_CLR),
							     .D_OUT(fabric_v_f_rd_sjs_1_D_OUT),
							     .FULL_N(fabric_v_f_rd_sjs_1_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_sjs_1_EMPTY_N));

  // submodule fabric_v_f_rd_sjs_2
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_rd_sjs_2(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_rd_sjs_2_D_IN),
							     .ENQ(fabric_v_f_rd_sjs_2_ENQ),
							     .DEQ(fabric_v_f_rd_sjs_2_DEQ),
							     .CLR(fabric_v_f_rd_sjs_2_CLR),
							     .D_OUT(fabric_v_f_rd_sjs_2_D_OUT),
							     .FULL_N(fabric_v_f_rd_sjs_2_FULL_N),
							     .EMPTY_N(fabric_v_f_rd_sjs_2_EMPTY_N));



  // submodule fabric_v_f_wr_err_user_2
  FIFO10 #(.guarded(1'd1)) fabric_v_f_wr_err_user_2(.RST(RST_N),
						    .CLK(CLK),
						    .ENQ(fabric_v_f_wr_err_user_2_ENQ),
						    .DEQ(fabric_v_f_wr_err_user_2_DEQ),
						    .CLR(fabric_v_f_wr_err_user_2_CLR),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule fabric_v_f_wr_mis_0
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wr_mis_0(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_mis_0_D_IN),
							     .ENQ(fabric_v_f_wr_mis_0_ENQ),
							     .DEQ(fabric_v_f_wr_mis_0_DEQ),
							     .CLR(fabric_v_f_wr_mis_0_CLR),
							     .D_OUT(fabric_v_f_wr_mis_0_D_OUT),
							     .FULL_N(fabric_v_f_wr_mis_0_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_mis_0_EMPTY_N));

  // submodule fabric_v_f_wr_mis_1
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wr_mis_1(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_mis_1_D_IN),
							     .ENQ(fabric_v_f_wr_mis_1_ENQ),
							     .DEQ(fabric_v_f_wr_mis_1_DEQ),
							     .CLR(fabric_v_f_wr_mis_1_CLR),
							     .D_OUT(fabric_v_f_wr_mis_1_D_OUT),
							     .FULL_N(fabric_v_f_wr_mis_1_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_mis_1_EMPTY_N));

  // submodule fabric_v_f_wr_mis_2
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wr_mis_2(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_mis_2_D_IN),
							     .ENQ(fabric_v_f_wr_mis_2_ENQ),
							     .DEQ(fabric_v_f_wr_mis_2_DEQ),
							     .CLR(fabric_v_f_wr_mis_2_CLR),
							     .D_OUT(fabric_v_f_wr_mis_2_D_OUT),
							     .FULL_N(fabric_v_f_wr_mis_2_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_mis_2_EMPTY_N));

  // submodule fabric_v_f_wr_mis_3
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wr_mis_3(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_mis_3_D_IN),
							     .ENQ(fabric_v_f_wr_mis_3_ENQ),
							     .DEQ(fabric_v_f_wr_mis_3_DEQ),
							     .CLR(fabric_v_f_wr_mis_3_CLR),
							     .D_OUT(fabric_v_f_wr_mis_3_D_OUT),
							     .FULL_N(fabric_v_f_wr_mis_3_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_mis_3_EMPTY_N));

  // submodule fabric_v_f_wr_mis_4
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wr_mis_4(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_mis_4_D_IN),
							     .ENQ(fabric_v_f_wr_mis_4_ENQ),
							     .DEQ(fabric_v_f_wr_mis_4_DEQ),
							     .CLR(fabric_v_f_wr_mis_4_CLR),
							     .D_OUT(fabric_v_f_wr_mis_4_D_OUT),
							     .FULL_N(fabric_v_f_wr_mis_4_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_mis_4_EMPTY_N));

  // submodule fabric_v_f_wr_mis_5
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wr_mis_5(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_mis_5_D_IN),
							     .ENQ(fabric_v_f_wr_mis_5_ENQ),
							     .DEQ(fabric_v_f_wr_mis_5_DEQ),
							     .CLR(fabric_v_f_wr_mis_5_CLR),
							     .D_OUT(fabric_v_f_wr_mis_5_D_OUT),
							     .FULL_N(fabric_v_f_wr_mis_5_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_mis_5_EMPTY_N));

  // submodule fabric_v_f_wr_sjs_0
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_wr_sjs_0(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_sjs_0_D_IN),
							     .ENQ(fabric_v_f_wr_sjs_0_ENQ),
							     .DEQ(fabric_v_f_wr_sjs_0_DEQ),
							     .CLR(fabric_v_f_wr_sjs_0_CLR),
							     .D_OUT(fabric_v_f_wr_sjs_0_D_OUT),
							     .FULL_N(fabric_v_f_wr_sjs_0_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_sjs_0_EMPTY_N));

  // submodule fabric_v_f_wr_sjs_1
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_wr_sjs_1(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_sjs_1_D_IN),
							     .ENQ(fabric_v_f_wr_sjs_1_ENQ),
							     .DEQ(fabric_v_f_wr_sjs_1_DEQ),
							     .CLR(fabric_v_f_wr_sjs_1_CLR),
							     .D_OUT(fabric_v_f_wr_sjs_1_D_OUT),
							     .FULL_N(fabric_v_f_wr_sjs_1_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_sjs_1_EMPTY_N));

  // submodule fabric_v_f_wr_sjs_2
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_wr_sjs_2(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(fabric_v_f_wr_sjs_2_D_IN),
							     .ENQ(fabric_v_f_wr_sjs_2_ENQ),
							     .DEQ(fabric_v_f_wr_sjs_2_DEQ),
							     .CLR(fabric_v_f_wr_sjs_2_CLR),
							     .D_OUT(fabric_v_f_wr_sjs_2_D_OUT),
							     .FULL_N(fabric_v_f_wr_sjs_2_FULL_N),
							     .EMPTY_N(fabric_v_f_wr_sjs_2_EMPTY_N));

  // submodule fabric_v_f_wrd_err_user_0
  FIFO10 #(.guarded(1'd1)) fabric_v_f_wrd_err_user_0(.RST(RST_N),
						     .CLK(CLK),
						     .ENQ(fabric_v_f_wrd_err_user_0_ENQ),
						     .DEQ(fabric_v_f_wrd_err_user_0_DEQ),
						     .CLR(fabric_v_f_wrd_err_user_0_CLR),
						     .FULL_N(),
						     .EMPTY_N());

  // submodule fabric_v_f_wrd_err_user_1
  FIFO10 #(.guarded(1'd1)) fabric_v_f_wrd_err_user_1(.RST(RST_N),
						     .CLK(CLK),
						     .ENQ(fabric_v_f_wrd_err_user_1_ENQ),
						     .DEQ(fabric_v_f_wrd_err_user_1_DEQ),
						     .CLR(fabric_v_f_wrd_err_user_1_CLR),
						     .FULL_N(),
						     .EMPTY_N());

  // submodule fabric_v_f_wrd_err_user_2
  FIFO10 #(.guarded(1'd1)) fabric_v_f_wrd_err_user_2(.RST(RST_N),
						     .CLK(CLK),
						     .ENQ(fabric_v_f_wrd_err_user_2_ENQ),
						     .DEQ(fabric_v_f_wrd_err_user_2_DEQ),
						     .CLR(fabric_v_f_wrd_err_user_2_CLR),
						     .FULL_N(),
						     .EMPTY_N());

  // submodule fabric_v_f_wrd_mis_0
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wrd_mis_0(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_mis_0_D_IN),
							      .ENQ(fabric_v_f_wrd_mis_0_ENQ),
							      .DEQ(fabric_v_f_wrd_mis_0_DEQ),
							      .CLR(fabric_v_f_wrd_mis_0_CLR),
							      .D_OUT(fabric_v_f_wrd_mis_0_D_OUT),
							      .FULL_N(fabric_v_f_wrd_mis_0_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_mis_0_EMPTY_N));

  // submodule fabric_v_f_wrd_mis_1
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wrd_mis_1(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_mis_1_D_IN),
							      .ENQ(fabric_v_f_wrd_mis_1_ENQ),
							      .DEQ(fabric_v_f_wrd_mis_1_DEQ),
							      .CLR(fabric_v_f_wrd_mis_1_CLR),
							      .D_OUT(fabric_v_f_wrd_mis_1_D_OUT),
							      .FULL_N(fabric_v_f_wrd_mis_1_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_mis_1_EMPTY_N));

  // submodule fabric_v_f_wrd_mis_2
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wrd_mis_2(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_mis_2_D_IN),
							      .ENQ(fabric_v_f_wrd_mis_2_ENQ),
							      .DEQ(fabric_v_f_wrd_mis_2_DEQ),
							      .CLR(fabric_v_f_wrd_mis_2_CLR),
							      .D_OUT(fabric_v_f_wrd_mis_2_D_OUT),
							      .FULL_N(fabric_v_f_wrd_mis_2_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_mis_2_EMPTY_N));

  // submodule fabric_v_f_wrd_mis_3
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wrd_mis_3(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_mis_3_D_IN),
							      .ENQ(fabric_v_f_wrd_mis_3_ENQ),
							      .DEQ(fabric_v_f_wrd_mis_3_DEQ),
							      .CLR(fabric_v_f_wrd_mis_3_CLR),
							      .D_OUT(fabric_v_f_wrd_mis_3_D_OUT),
							      .FULL_N(fabric_v_f_wrd_mis_3_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_mis_3_EMPTY_N));

  // submodule fabric_v_f_wrd_mis_4
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wrd_mis_4(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_mis_4_D_IN),
							      .ENQ(fabric_v_f_wrd_mis_4_ENQ),
							      .DEQ(fabric_v_f_wrd_mis_4_DEQ),
							      .CLR(fabric_v_f_wrd_mis_4_CLR),
							      .D_OUT(fabric_v_f_wrd_mis_4_D_OUT),
							      .FULL_N(fabric_v_f_wrd_mis_4_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_mis_4_EMPTY_N));

  // submodule fabric_v_f_wrd_mis_5
  FIFO1 #(.width(32'd2), .guarded(1'd1)) fabric_v_f_wrd_mis_5(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_mis_5_D_IN),
							      .ENQ(fabric_v_f_wrd_mis_5_ENQ),
							      .DEQ(fabric_v_f_wrd_mis_5_DEQ),
							      .CLR(fabric_v_f_wrd_mis_5_CLR),
							      .D_OUT(fabric_v_f_wrd_mis_5_D_OUT),
							      .FULL_N(fabric_v_f_wrd_mis_5_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_mis_5_EMPTY_N));

  // submodule fabric_v_f_wrd_sjs_0
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_wrd_sjs_0(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_sjs_0_D_IN),
							      .ENQ(fabric_v_f_wrd_sjs_0_ENQ),
							      .DEQ(fabric_v_f_wrd_sjs_0_DEQ),
							      .CLR(fabric_v_f_wrd_sjs_0_CLR),
							      .D_OUT(fabric_v_f_wrd_sjs_0_D_OUT),
							      .FULL_N(fabric_v_f_wrd_sjs_0_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_sjs_0_EMPTY_N));

  // submodule fabric_v_f_wrd_sjs_1
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_wrd_sjs_1(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_sjs_1_D_IN),
							      .ENQ(fabric_v_f_wrd_sjs_1_ENQ),
							      .DEQ(fabric_v_f_wrd_sjs_1_DEQ),
							      .CLR(fabric_v_f_wrd_sjs_1_CLR),
							      .D_OUT(fabric_v_f_wrd_sjs_1_D_OUT),
							      .FULL_N(fabric_v_f_wrd_sjs_1_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_sjs_1_EMPTY_N));

  // submodule fabric_v_f_wrd_sjs_2
  FIFO1 #(.width(32'd3), .guarded(1'd1)) fabric_v_f_wrd_sjs_2(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(fabric_v_f_wrd_sjs_2_D_IN),
							      .ENQ(fabric_v_f_wrd_sjs_2_ENQ),
							      .DEQ(fabric_v_f_wrd_sjs_2_DEQ),
							      .CLR(fabric_v_f_wrd_sjs_2_CLR),
							      .D_OUT(fabric_v_f_wrd_sjs_2_D_OUT),
							      .FULL_N(fabric_v_f_wrd_sjs_2_FULL_N),
							      .EMPTY_N(fabric_v_f_wrd_sjs_2_EMPTY_N));

  // submodule fabric_xactors_from_masters_0_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_rd_addr_D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_rd_addr_ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_rd_addr_DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_rd_addr_CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_rd_addr_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_rd_addr_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_from_masters_0_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_rd_data_D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_rd_data_ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_rd_data_DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_rd_data_CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_rd_data_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_rd_data_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_from_masters_0_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_wr_addr_D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_wr_addr_ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_wr_addr_DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_wr_addr_CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_wr_addr_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_wr_addr_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_from_masters_0_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_wr_data_D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_wr_data_ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_wr_data_DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_wr_data_CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_wr_data_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_wr_data_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_from_masters_0_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_from_masters_0_f_wr_resp(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_0_f_wr_resp_D_IN),
								  .ENQ(fabric_xactors_from_masters_0_f_wr_resp_ENQ),
								  .DEQ(fabric_xactors_from_masters_0_f_wr_resp_DEQ),
								  .CLR(fabric_xactors_from_masters_0_f_wr_resp_CLR),
								  .D_OUT(fabric_xactors_from_masters_0_f_wr_resp_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_0_f_wr_resp_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_0_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_from_masters_1_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_from_masters_1_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_1_f_rd_addr_D_IN),
								  .ENQ(fabric_xactors_from_masters_1_f_rd_addr_ENQ),
								  .DEQ(fabric_xactors_from_masters_1_f_rd_addr_DEQ),
								  .CLR(fabric_xactors_from_masters_1_f_rd_addr_CLR),
								  .D_OUT(fabric_xactors_from_masters_1_f_rd_addr_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_1_f_rd_addr_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_from_masters_1_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_from_masters_1_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_1_f_rd_data_D_IN),
								  .ENQ(fabric_xactors_from_masters_1_f_rd_data_ENQ),
								  .DEQ(fabric_xactors_from_masters_1_f_rd_data_DEQ),
								  .CLR(fabric_xactors_from_masters_1_f_rd_data_CLR),
								  .D_OUT(fabric_xactors_from_masters_1_f_rd_data_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_1_f_rd_data_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_1_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_from_masters_1_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_from_masters_1_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_1_f_wr_addr_D_IN),
								  .ENQ(fabric_xactors_from_masters_1_f_wr_addr_ENQ),
								  .DEQ(fabric_xactors_from_masters_1_f_wr_addr_DEQ),
								  .CLR(fabric_xactors_from_masters_1_f_wr_addr_CLR),
								  .D_OUT(fabric_xactors_from_masters_1_f_wr_addr_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_1_f_wr_addr_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_from_masters_1_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_from_masters_1_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_1_f_wr_data_D_IN),
								  .ENQ(fabric_xactors_from_masters_1_f_wr_data_ENQ),
								  .DEQ(fabric_xactors_from_masters_1_f_wr_data_DEQ),
								  .CLR(fabric_xactors_from_masters_1_f_wr_data_CLR),
								  .D_OUT(fabric_xactors_from_masters_1_f_wr_data_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_1_f_wr_data_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_1_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_from_masters_1_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_from_masters_1_f_wr_resp(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_1_f_wr_resp_D_IN),
								  .ENQ(fabric_xactors_from_masters_1_f_wr_resp_ENQ),
								  .DEQ(fabric_xactors_from_masters_1_f_wr_resp_DEQ),
								  .CLR(fabric_xactors_from_masters_1_f_wr_resp_CLR),
								  .D_OUT(fabric_xactors_from_masters_1_f_wr_resp_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_1_f_wr_resp_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_1_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_from_masters_2_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_from_masters_2_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_2_f_rd_addr_D_IN),
								  .ENQ(fabric_xactors_from_masters_2_f_rd_addr_ENQ),
								  .DEQ(fabric_xactors_from_masters_2_f_rd_addr_DEQ),
								  .CLR(fabric_xactors_from_masters_2_f_rd_addr_CLR),
								  .D_OUT(fabric_xactors_from_masters_2_f_rd_addr_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_2_f_rd_addr_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_from_masters_2_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_from_masters_2_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_2_f_rd_data_D_IN),
								  .ENQ(fabric_xactors_from_masters_2_f_rd_data_ENQ),
								  .DEQ(fabric_xactors_from_masters_2_f_rd_data_DEQ),
								  .CLR(fabric_xactors_from_masters_2_f_rd_data_CLR),
								  .D_OUT(fabric_xactors_from_masters_2_f_rd_data_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_2_f_rd_data_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_2_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_from_masters_2_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_from_masters_2_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_2_f_wr_addr_D_IN),
								  .ENQ(fabric_xactors_from_masters_2_f_wr_addr_ENQ),
								  .DEQ(fabric_xactors_from_masters_2_f_wr_addr_DEQ),
								  .CLR(fabric_xactors_from_masters_2_f_wr_addr_CLR),
								  .D_OUT(fabric_xactors_from_masters_2_f_wr_addr_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_2_f_wr_addr_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_from_masters_2_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_from_masters_2_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_2_f_wr_data_D_IN),
								  .ENQ(fabric_xactors_from_masters_2_f_wr_data_ENQ),
								  .DEQ(fabric_xactors_from_masters_2_f_wr_data_DEQ),
								  .CLR(fabric_xactors_from_masters_2_f_wr_data_CLR),
								  .D_OUT(fabric_xactors_from_masters_2_f_wr_data_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_2_f_wr_data_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_2_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_from_masters_2_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_from_masters_2_f_wr_resp(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(fabric_xactors_from_masters_2_f_wr_resp_D_IN),
								  .ENQ(fabric_xactors_from_masters_2_f_wr_resp_ENQ),
								  .DEQ(fabric_xactors_from_masters_2_f_wr_resp_DEQ),
								  .CLR(fabric_xactors_from_masters_2_f_wr_resp_CLR),
								  .D_OUT(fabric_xactors_from_masters_2_f_wr_resp_D_OUT),
								  .FULL_N(fabric_xactors_from_masters_2_f_wr_resp_FULL_N),
								  .EMPTY_N(fabric_xactors_from_masters_2_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_to_slaves_0_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_rd_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_rd_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_rd_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_rd_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_rd_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_rd_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_0_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_rd_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_rd_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_rd_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_rd_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_rd_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_rd_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_0_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_wr_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_wr_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_wr_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_wr_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_wr_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_wr_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_wr_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_0_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_wr_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_wr_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_wr_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_wr_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_wr_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_wr_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_0_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_to_slaves_0_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_0_f_wr_resp_D_IN),
							       .ENQ(fabric_xactors_to_slaves_0_f_wr_resp_ENQ),
							       .DEQ(fabric_xactors_to_slaves_0_f_wr_resp_DEQ),
							       .CLR(fabric_xactors_to_slaves_0_f_wr_resp_CLR),
							       .D_OUT(fabric_xactors_to_slaves_0_f_wr_resp_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_0_f_wr_resp_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_0_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_to_slaves_1_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_rd_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_rd_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_rd_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_rd_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_rd_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_rd_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_1_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_rd_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_rd_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_rd_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_rd_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_rd_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_rd_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_1_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_wr_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_wr_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_wr_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_wr_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_wr_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_wr_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_wr_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_1_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_wr_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_wr_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_wr_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_wr_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_wr_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_wr_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_1_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_to_slaves_1_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_1_f_wr_resp_D_IN),
							       .ENQ(fabric_xactors_to_slaves_1_f_wr_resp_ENQ),
							       .DEQ(fabric_xactors_to_slaves_1_f_wr_resp_DEQ),
							       .CLR(fabric_xactors_to_slaves_1_f_wr_resp_CLR),
							       .D_OUT(fabric_xactors_to_slaves_1_f_wr_resp_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_1_f_wr_resp_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_1_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_to_slaves_2_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_rd_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_rd_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_rd_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_rd_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_rd_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_rd_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_2_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_rd_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_rd_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_rd_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_rd_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_rd_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_rd_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_2_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_wr_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_wr_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_wr_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_wr_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_wr_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_wr_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_wr_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_2_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_wr_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_wr_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_wr_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_wr_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_wr_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_wr_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_2_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_to_slaves_2_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_2_f_wr_resp_D_IN),
							       .ENQ(fabric_xactors_to_slaves_2_f_wr_resp_ENQ),
							       .DEQ(fabric_xactors_to_slaves_2_f_wr_resp_DEQ),
							       .CLR(fabric_xactors_to_slaves_2_f_wr_resp_CLR),
							       .D_OUT(fabric_xactors_to_slaves_2_f_wr_resp_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_2_f_wr_resp_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_2_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_to_slaves_3_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_3_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_3_f_rd_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_3_f_rd_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_3_f_rd_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_3_f_rd_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_3_f_rd_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_3_f_rd_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_3_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_3_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_to_slaves_3_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_3_f_rd_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_3_f_rd_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_3_f_rd_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_3_f_rd_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_3_f_rd_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_3_f_rd_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_3_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_3_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_3_f_wr_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_3_f_wr_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_3_f_wr_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_3_f_wr_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_3_f_wr_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_3_f_wr_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_3_f_wr_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_3_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_3_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_to_slaves_3_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_3_f_wr_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_3_f_wr_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_3_f_wr_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_3_f_wr_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_3_f_wr_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_3_f_wr_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_3_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_3_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_to_slaves_3_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_3_f_wr_resp_D_IN),
							       .ENQ(fabric_xactors_to_slaves_3_f_wr_resp_ENQ),
							       .DEQ(fabric_xactors_to_slaves_3_f_wr_resp_DEQ),
							       .CLR(fabric_xactors_to_slaves_3_f_wr_resp_CLR),
							       .D_OUT(fabric_xactors_to_slaves_3_f_wr_resp_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_3_f_wr_resp_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_3_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_to_slaves_4_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_4_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_4_f_rd_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_4_f_rd_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_4_f_rd_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_4_f_rd_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_4_f_rd_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_4_f_rd_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_4_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_4_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_to_slaves_4_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_4_f_rd_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_4_f_rd_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_4_f_rd_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_4_f_rd_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_4_f_rd_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_4_f_rd_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_4_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_4_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_4_f_wr_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_4_f_wr_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_4_f_wr_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_4_f_wr_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_4_f_wr_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_4_f_wr_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_4_f_wr_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_4_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_4_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_to_slaves_4_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_4_f_wr_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_4_f_wr_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_4_f_wr_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_4_f_wr_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_4_f_wr_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_4_f_wr_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_4_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_4_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_to_slaves_4_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_4_f_wr_resp_D_IN),
							       .ENQ(fabric_xactors_to_slaves_4_f_wr_resp_ENQ),
							       .DEQ(fabric_xactors_to_slaves_4_f_wr_resp_DEQ),
							       .CLR(fabric_xactors_to_slaves_4_f_wr_resp_CLR),
							       .D_OUT(fabric_xactors_to_slaves_4_f_wr_resp_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_4_f_wr_resp_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_4_f_wr_resp_EMPTY_N));

  // submodule fabric_xactors_to_slaves_5_f_rd_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_5_f_rd_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_5_f_rd_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_5_f_rd_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_5_f_rd_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_5_f_rd_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_5_f_rd_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_5_f_rd_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_5_f_rd_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_5_f_rd_data
  FIFO2 #(.width(32'd39),
	  .guarded(1'd1)) fabric_xactors_to_slaves_5_f_rd_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_5_f_rd_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_5_f_rd_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_5_f_rd_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_5_f_rd_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_5_f_rd_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_5_f_rd_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_5_f_rd_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_5_f_wr_addr
  FIFO2 #(.width(32'd52),
	  .guarded(1'd1)) fabric_xactors_to_slaves_5_f_wr_addr(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_5_f_wr_addr_D_IN),
							       .ENQ(fabric_xactors_to_slaves_5_f_wr_addr_ENQ),
							       .DEQ(fabric_xactors_to_slaves_5_f_wr_addr_DEQ),
							       .CLR(fabric_xactors_to_slaves_5_f_wr_addr_CLR),
							       .D_OUT(fabric_xactors_to_slaves_5_f_wr_addr_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_5_f_wr_addr_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_5_f_wr_addr_EMPTY_N));

  // submodule fabric_xactors_to_slaves_5_f_wr_data
  FIFO2 #(.width(32'd41),
	  .guarded(1'd1)) fabric_xactors_to_slaves_5_f_wr_data(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_5_f_wr_data_D_IN),
							       .ENQ(fabric_xactors_to_slaves_5_f_wr_data_ENQ),
							       .DEQ(fabric_xactors_to_slaves_5_f_wr_data_DEQ),
							       .CLR(fabric_xactors_to_slaves_5_f_wr_data_CLR),
							       .D_OUT(fabric_xactors_to_slaves_5_f_wr_data_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_5_f_wr_data_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_5_f_wr_data_EMPTY_N));

  // submodule fabric_xactors_to_slaves_5_f_wr_resp
  FIFO2 #(.width(32'd6),
	  .guarded(1'd1)) fabric_xactors_to_slaves_5_f_wr_resp(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(fabric_xactors_to_slaves_5_f_wr_resp_D_IN),
							       .ENQ(fabric_xactors_to_slaves_5_f_wr_resp_ENQ),
							       .DEQ(fabric_xactors_to_slaves_5_f_wr_resp_DEQ),
							       .CLR(fabric_xactors_to_slaves_5_f_wr_resp_CLR),
							       .D_OUT(fabric_xactors_to_slaves_5_f_wr_resp_D_OUT),
							       .FULL_N(fabric_xactors_to_slaves_5_f_wr_resp_FULL_N),
							       .EMPTY_N(fabric_xactors_to_slaves_5_f_wr_resp_EMPTY_N));

// submodule signature (reduced)
mksign_dump_axi4 signature (
    .CLK(CLK),
    .RST_N(RST_N),

    // AXI4 master interface
    .master_ARREADY(signature_master_ARREADY),
    .master_AWREADY(signature_master_AWREADY),
    .master_BID(signature_master_BID),
    .master_BRESP(signature_master_BRESP),
    .master_BVALID(signature_master_BVALID),
    .master_RDATA(signature_master_RDATA),
    .master_RID(signature_master_RID),
    .master_RLAST(signature_master_RLAST),
    .master_RRESP(signature_master_RRESP),
    .master_RVALID(signature_master_RVALID),
    .master_WREADY(signature_master_WREADY),

    .master_AWVALID(signature_master_AWVALID),
    .master_AWADDR(signature_master_AWADDR),
    .master_AWPROT(signature_master_AWPROT),
    .master_AWLEN(signature_master_AWLEN),
    .master_AWSIZE(signature_master_AWSIZE),
    .master_AWBURST(signature_master_AWBURST),
    .master_AWID(signature_master_AWID),
    .master_WVALID(signature_master_WVALID),
    .master_WDATA(signature_master_WDATA),
    .master_WSTRB(signature_master_WSTRB),
    .master_WLAST(signature_master_WLAST),
    .master_WID(signature_master_WID),
    .master_BREADY(signature_master_BREADY),
    .master_ARVALID(signature_master_ARVALID),
    .master_ARADDR(signature_master_ARADDR),
    .master_ARPROT(signature_master_ARPROT),
    .master_ARLEN(signature_master_ARLEN),
    .master_ARSIZE(signature_master_ARSIZE),
    .master_ARBURST(signature_master_ARBURST),
    .master_ARID(signature_master_ARID),
    .master_RREADY(signature_master_RREADY)
);


  // submodule uart_s_xactor_f_rd_addr
  FIFO2 #(.width(32'd52), .guarded(1'd1)) uart_s_xactor_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(uart_s_xactor_f_rd_addr_D_IN),
								  .ENQ(uart_s_xactor_f_rd_addr_ENQ),
								  .DEQ(uart_s_xactor_f_rd_addr_DEQ),
								  .CLR(uart_s_xactor_f_rd_addr_CLR),
								  .D_OUT(uart_s_xactor_f_rd_addr_D_OUT),
								  .FULL_N(uart_s_xactor_f_rd_addr_FULL_N),
								  .EMPTY_N(uart_s_xactor_f_rd_addr_EMPTY_N));

  // submodule uart_s_xactor_f_rd_data
  FIFO2 #(.width(32'd39), .guarded(1'd1)) uart_s_xactor_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(uart_s_xactor_f_rd_data_D_IN),
								  .ENQ(uart_s_xactor_f_rd_data_ENQ),
								  .DEQ(uart_s_xactor_f_rd_data_DEQ),
								  .CLR(uart_s_xactor_f_rd_data_CLR),
								  .D_OUT(uart_s_xactor_f_rd_data_D_OUT),
								  .FULL_N(uart_s_xactor_f_rd_data_FULL_N),
								  .EMPTY_N(uart_s_xactor_f_rd_data_EMPTY_N));

  // submodule uart_s_xactor_f_wr_addr
  FIFO2 #(.width(32'd52), .guarded(1'd1)) uart_s_xactor_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(uart_s_xactor_f_wr_addr_D_IN),
								  .ENQ(uart_s_xactor_f_wr_addr_ENQ),
								  .DEQ(uart_s_xactor_f_wr_addr_DEQ),
								  .CLR(uart_s_xactor_f_wr_addr_CLR),
								  .D_OUT(uart_s_xactor_f_wr_addr_D_OUT),
								  .FULL_N(uart_s_xactor_f_wr_addr_FULL_N),
								  .EMPTY_N(uart_s_xactor_f_wr_addr_EMPTY_N));

  // submodule uart_s_xactor_f_wr_data
  FIFO2 #(.width(32'd41), .guarded(1'd1)) uart_s_xactor_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(uart_s_xactor_f_wr_data_D_IN),
								  .ENQ(uart_s_xactor_f_wr_data_ENQ),
								  .DEQ(uart_s_xactor_f_wr_data_DEQ),
								  .CLR(uart_s_xactor_f_wr_data_CLR),
								  .D_OUT(uart_s_xactor_f_wr_data_D_OUT),
								  .FULL_N(uart_s_xactor_f_wr_data_FULL_N),
								  .EMPTY_N(uart_s_xactor_f_wr_data_EMPTY_N));

  // submodule uart_s_xactor_f_wr_resp
  FIFO2 #(.width(32'd6), .guarded(1'd1)) uart_s_xactor_f_wr_resp(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(uart_s_xactor_f_wr_resp_D_IN),
								 .ENQ(uart_s_xactor_f_wr_resp_ENQ),
								 .DEQ(uart_s_xactor_f_wr_resp_DEQ),
								 .CLR(uart_s_xactor_f_wr_resp_CLR),
								 .D_OUT(uart_s_xactor_f_wr_resp_D_OUT),
								 .FULL_N(uart_s_xactor_f_wr_resp_FULL_N),
								 .EMPTY_N(uart_s_xactor_f_wr_resp_EMPTY_N));

  Counter #(.width(32'd16),
	    .init(16'd0)) uart_user_ifc_uart_baudGen_rBaudCounter(.CLK(CLK),
								  .RST(RST_N),
								  .DATA_A(uart_user_ifc_uart_baudGen_rBaudCounter_DATA_A),
								  .DATA_B(uart_user_ifc_uart_baudGen_rBaudCounter_DATA_B),
								  .DATA_C(uart_user_ifc_uart_baudGen_rBaudCounter_DATA_C),
								  .DATA_F(uart_user_ifc_uart_baudGen_rBaudCounter_DATA_F),
								  .ADDA(uart_user_ifc_uart_baudGen_rBaudCounter_ADDA),
								  .ADDB(uart_user_ifc_uart_baudGen_rBaudCounter_ADDB),
								  .SETC(uart_user_ifc_uart_baudGen_rBaudCounter_SETC),
								  .SETF(uart_user_ifc_uart_baudGen_rBaudCounter_SETF),
								  .Q_OUT(uart_user_ifc_uart_baudGen_rBaudCounter_Q_OUT));

  // submodule uart_user_ifc_uart_baudGen_rBaudTickCounter
  Counter #(.width(32'd3),
	    .init(3'd0)) uart_user_ifc_uart_baudGen_rBaudTickCounter(.CLK(CLK),
								     .RST(RST_N),
								     .DATA_A(uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_A),
								     .DATA_B(uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_B),
								     .DATA_C(uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_C),
								     .DATA_F(uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_F),
								     .ADDA(uart_user_ifc_uart_baudGen_rBaudTickCounter_ADDA),
								     .ADDB(uart_user_ifc_uart_baudGen_rBaudTickCounter_ADDB),
								     .SETC(uart_user_ifc_uart_baudGen_rBaudTickCounter_SETC),
								     .SETF(uart_user_ifc_uart_baudGen_rBaudTickCounter_SETF),
								     .Q_OUT(uart_user_ifc_uart_baudGen_rBaudTickCounter_Q_OUT));

SizedFIFO #(
    .p1width(8),
    .p2depth(16),
    .p3cntr_width(4),
    .guarded(1)
) uart_user_ifc_uart_fifoRecv (
    .CLK(CLK),
    .RST(RST_N),
    .CLR(uart_user_ifc_uart_fifoRecv_CLR),
    .D_IN(uart_user_ifc_uart_fifoRecv_D_IN),
    .ENQ(uart_user_ifc_uart_fifoRecv_ENQ),
    .DEQ(uart_user_ifc_uart_fifoRecv_DEQ),
    .D_OUT(uart_user_ifc_uart_fifoRecv_D_OUT),
    .FULL_N(uart_user_ifc_uart_fifoRecv_FULL_N),
    .EMPTY_N(uart_user_ifc_uart_fifoRecv_EMPTY_N)
);

SizedFIFO #(
    .p1width(8),
    .p2depth(16),
    .p3cntr_width(4),
    .guarded(1)
) uart_user_ifc_uart_fifoXmit (
    .CLK(CLK),
    .RST(RST_N),
    .CLR(uart_user_ifc_uart_fifoXmit_CLR),
    .D_IN(uart_user_ifc_uart_fifoXmit_D_IN),
    .ENQ(uart_user_ifc_uart_fifoXmit_ENQ),
    .DEQ(uart_user_ifc_uart_fifoXmit_DEQ),
    .D_OUT(uart_user_ifc_uart_fifoXmit_D_OUT),
    .FULL_N(uart_user_ifc_uart_fifoXmit_FULL_N),
    .EMPTY_N(uart_user_ifc_uart_fifoXmit_EMPTY_N)
);




  // rule RL_rl_wr_addr_channel
  assign CAN_FIRE_RL_rl_wr_addr_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel = 1'd1 ;

  // rule RL_rl_wr_data_channel
  assign CAN_FIRE_RL_rl_wr_data_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel = 1'd1 ;

  // rule RL_rl_wr_response_channel
  assign CAN_FIRE_RL_rl_wr_response_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel = 1'd1 ;

  // rule RL_rl_rd_addr_channel
  assign CAN_FIRE_RL_rl_rd_addr_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel = 1'd1 ;

  // rule RL_rl_rd_data_channel
  assign CAN_FIRE_RL_rl_rd_data_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel = 1'd1 ;

  // rule RL_rl_wr_addr_channel_1
  assign CAN_FIRE_RL_rl_wr_addr_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_1 = 1'd1 ;

  // rule RL_rl_wr_data_channel_1
  assign CAN_FIRE_RL_rl_wr_data_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_1 = 1'd1 ;

  // rule RL_rl_wr_response_channel_1
  assign CAN_FIRE_RL_rl_wr_response_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_1 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_1
  assign CAN_FIRE_RL_rl_rd_addr_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_1 = 1'd1 ;

  // rule RL_rl_rd_data_channel_1
  assign CAN_FIRE_RL_rl_rd_data_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_1 = 1'd1 ;

  // rule RL_rl_wr_addr_channel_2
  assign CAN_FIRE_RL_rl_wr_addr_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_2 = 1'd1 ;

  // rule RL_rl_wr_data_channel_2
  assign CAN_FIRE_RL_rl_wr_data_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_2 = 1'd1 ;

  // rule RL_rl_wr_response_channel_2
  assign CAN_FIRE_RL_rl_wr_response_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_2 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_2
  assign CAN_FIRE_RL_rl_rd_addr_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_2 = 1'd1 ;

  // rule RL_rl_rd_data_channel_2
  assign CAN_FIRE_RL_rl_rd_data_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_2 = 1'd1 ;

  // rule RL_rl_wr_addr_channel_3
  assign CAN_FIRE_RL_rl_wr_addr_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_3 = 1'd1 ;

  // rule RL_rl_wr_data_channel_3
  assign CAN_FIRE_RL_rl_wr_data_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_3 = 1'd1 ;

  // rule RL_rl_wr_response_channel_3
  assign CAN_FIRE_RL_rl_wr_response_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_3 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_3
  assign CAN_FIRE_RL_rl_rd_addr_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_3 = 1'd1 ;

  // rule RL_rl_rd_data_channel_3
  assign CAN_FIRE_RL_rl_rd_data_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_3 = 1'd1 ;

  // rule RL_rl_wr_addr_channel_4
  assign CAN_FIRE_RL_rl_wr_addr_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_4 = 1'd1 ;

  // rule RL_rl_wr_data_channel_4
  assign CAN_FIRE_RL_rl_wr_data_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_4 = 1'd1 ;

  // rule RL_rl_wr_response_channel_4
  assign CAN_FIRE_RL_rl_wr_response_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_4 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_4
  assign CAN_FIRE_RL_rl_rd_addr_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_4 = 1'd1 ;

  // rule RL_rl_rd_data_channel_4
  assign CAN_FIRE_RL_rl_rd_data_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_4 = 1'd1 ;

  // rule RL_rl_wr_addr_channel_5
  assign CAN_FIRE_RL_rl_wr_addr_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_5 = 1'd1 ;

  // rule RL_rl_wr_data_channel_5
  assign CAN_FIRE_RL_rl_wr_data_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_5 = 1'd1 ;

  // rule RL_rl_wr_response_channel_5
  assign CAN_FIRE_RL_rl_wr_response_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_5 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_5
  assign CAN_FIRE_RL_rl_rd_addr_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_5 = 1'd1 ;

  // rule RL_rl_rd_data_channel_5
  assign CAN_FIRE_RL_rl_rd_data_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_5 = 1'd1 ;

  // rule RL_rl_wr_addr_channel_6
  assign CAN_FIRE_RL_rl_wr_addr_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_6 = 1'd1 ;

  // rule RL_rl_wr_data_channel_6
  assign CAN_FIRE_RL_rl_wr_data_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_6 = 1'd1 ;

  // rule RL_rl_wr_response_channel_6
  assign CAN_FIRE_RL_rl_wr_response_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_6 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_6
  assign CAN_FIRE_RL_rl_rd_addr_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_6 = 1'd1 ;

  // rule RL_rl_rd_data_channel_6
  assign CAN_FIRE_RL_rl_rd_data_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_6 = 1'd1 ;

  // rule RL_mkConnectionGetPut
  assign CAN_FIRE_RL_mkConnectionGetPut = 1'd1 ;
  assign WILL_FIRE_RL_mkConnectionGetPut = 1'd1 ;

  // rule RL_mkConnectionGetPut_1
  assign CAN_FIRE_RL_mkConnectionGetPut_1 = 1'd1 ;
  assign WILL_FIRE_RL_mkConnectionGetPut_1 = 1'd1 ;

  // rule RL_mkConnectionGetPut_2
  assign CAN_FIRE_RL_mkConnectionGetPut_2 = 1'd1 ;
  assign WILL_FIRE_RL_mkConnectionGetPut_2 = 1'd1 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave =
	     fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d14 &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_1
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 =
	     fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d64 &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20) &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_2
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 =
	     fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d104 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d113 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_3
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 =
	     fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d145 &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20) &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d154 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_4
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 =
	     fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d187 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d198 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_5
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 =
	     fabric_xactors_from_masters_0_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d230 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d237 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_6
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 =
	     fabric_xactors_to_slaves_0_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_0_f_wr_data_i_notFull_ETC___d269 &&
	     !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_7
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 =
	     fabric_xactors_to_slaves_1_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_1_f_wr_data_i_notFull_ETC___d314 &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275) &&
	     !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_8
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 =
	     fabric_xactors_to_slaves_2_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_2_f_wr_data_i_notFull_ETC___d349 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d358 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_9
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 =
	     fabric_xactors_to_slaves_3_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_3_f_wr_data_i_notFull_ETC___d385 &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275) &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d394 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_10
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 =
	     fabric_xactors_to_slaves_4_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_4_f_wr_data_i_notFull_ETC___d422 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d433 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_11
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 =
	     fabric_xactors_to_slaves_5_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_5_f_wr_data_i_notFull_ETC___d460 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d467 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_12
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 =
	     fabric_xactors_to_slaves_0_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_0_f_wr_data_i_notFull_ETC___d498 &&
	     !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_13
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 =
	     fabric_xactors_to_slaves_1_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_1_f_wr_data_i_notFull_ETC___d543 &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504) &&
	     !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_14
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 =
	     fabric_xactors_to_slaves_2_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_2_f_wr_data_i_notFull_ETC___d578 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d587 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_15
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 =
	     fabric_xactors_to_slaves_3_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_3_f_wr_data_i_notFull_ETC___d614 &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504) &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d623 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_16
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 =
	     fabric_xactors_to_slaves_4_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_4_f_wr_data_i_notFull_ETC___d651 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d662 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_17
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 =
	     fabric_xactors_to_slaves_5_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_5_f_wr_data_i_notFull_ETC___d689 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d696 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_data_FULL_N &&
	     fabric_v_f_wrd_mis_0_EMPTY_N &&
	     fabric_v_f_wrd_sjs_0_EMPTY_N &&
	     fabric_v_f_wrd_mis_0_D_OUT == 2'd0 &&
	     fabric_v_f_wrd_sjs_0_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_1
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_data_FULL_N &&
	     fabric_v_f_wrd_mis_1_EMPTY_N &&
	     fabric_v_f_wrd_sjs_0_EMPTY_N &&
	     fabric_v_f_wrd_mis_1_D_OUT == 2'd0 &&
	     fabric_v_f_wrd_sjs_0_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_2
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_data_FULL_N &&
	     fabric_v_f_wrd_mis_2_EMPTY_N &&
	     fabric_v_f_wrd_sjs_0_EMPTY_N &&
	     fabric_v_f_wrd_mis_2_D_OUT == 2'd0 &&
	     fabric_v_f_wrd_sjs_0_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_3
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_wr_data_FULL_N &&
	     fabric_v_f_wrd_mis_3_EMPTY_N &&
	     fabric_v_f_wrd_sjs_0_EMPTY_N &&
	     fabric_v_f_wrd_mis_3_D_OUT == 2'd0 &&
	     fabric_v_f_wrd_sjs_0_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_4
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_wr_data_FULL_N &&
	     fabric_v_f_wrd_mis_4_EMPTY_N &&
	     fabric_v_f_wrd_sjs_0_EMPTY_N &&
	     fabric_v_f_wrd_mis_4_D_OUT == 2'd0 &&
	     fabric_v_f_wrd_sjs_0_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_5
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_wr_data_FULL_N &&
	     fabric_v_f_wrd_mis_5_EMPTY_N &&
	     fabric_v_f_wrd_sjs_0_EMPTY_N &&
	     fabric_v_f_wrd_mis_5_D_OUT == 2'd0 &&
	     fabric_v_f_wrd_sjs_0_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_6
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 =
	     fabric_xactors_to_slaves_0_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_0_EMPTY_N &&
	     fabric_v_f_wrd_sjs_1_EMPTY_N &&
	     fabric_v_f_wrd_mis_0_D_OUT == 2'd1 &&
	     fabric_v_f_wrd_sjs_1_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_7
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 =
	     fabric_xactors_to_slaves_1_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_1_EMPTY_N &&
	     fabric_v_f_wrd_sjs_1_EMPTY_N &&
	     fabric_v_f_wrd_mis_1_D_OUT == 2'd1 &&
	     fabric_v_f_wrd_sjs_1_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_8
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 =
	     fabric_xactors_to_slaves_2_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_2_EMPTY_N &&
	     fabric_v_f_wrd_sjs_1_EMPTY_N &&
	     fabric_v_f_wrd_mis_2_D_OUT == 2'd1 &&
	     fabric_v_f_wrd_sjs_1_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_9
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 =
	     fabric_xactors_to_slaves_3_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_3_EMPTY_N &&
	     fabric_v_f_wrd_sjs_1_EMPTY_N &&
	     fabric_v_f_wrd_mis_3_D_OUT == 2'd1 &&
	     fabric_v_f_wrd_sjs_1_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_10
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 =
	     fabric_xactors_to_slaves_4_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_4_EMPTY_N &&
	     fabric_v_f_wrd_sjs_1_EMPTY_N &&
	     fabric_v_f_wrd_mis_4_D_OUT == 2'd1 &&
	     fabric_v_f_wrd_sjs_1_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_11
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 =
	     fabric_xactors_to_slaves_5_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_5_EMPTY_N &&
	     fabric_v_f_wrd_sjs_1_EMPTY_N &&
	     fabric_v_f_wrd_mis_5_D_OUT == 2'd1 &&
	     fabric_v_f_wrd_sjs_1_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_12
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 =
	     fabric_xactors_to_slaves_0_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_0_EMPTY_N &&
	     fabric_v_f_wrd_sjs_2_EMPTY_N &&
	     fabric_v_f_wrd_mis_0_D_OUT == 2'd2 &&
	     fabric_v_f_wrd_sjs_2_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_13
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 =
	     fabric_xactors_to_slaves_1_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_1_EMPTY_N &&
	     fabric_v_f_wrd_sjs_2_EMPTY_N &&
	     fabric_v_f_wrd_mis_1_D_OUT == 2'd2 &&
	     fabric_v_f_wrd_sjs_2_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_14
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 =
	     fabric_xactors_to_slaves_2_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_2_EMPTY_N &&
	     fabric_v_f_wrd_sjs_2_EMPTY_N &&
	     fabric_v_f_wrd_mis_2_D_OUT == 2'd2 &&
	     fabric_v_f_wrd_sjs_2_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_15
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 =
	     fabric_xactors_to_slaves_3_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_3_EMPTY_N &&
	     fabric_v_f_wrd_sjs_2_EMPTY_N &&
	     fabric_v_f_wrd_mis_3_D_OUT == 2'd2 &&
	     fabric_v_f_wrd_sjs_2_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_16
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 =
	     fabric_xactors_to_slaves_4_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_4_EMPTY_N &&
	     fabric_v_f_wrd_sjs_2_EMPTY_N &&
	     fabric_v_f_wrd_mis_4_D_OUT == 2'd2 &&
	     fabric_v_f_wrd_sjs_2_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_wr_xaction_master_to_slave_data_17
  assign CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 =
	     fabric_xactors_to_slaves_5_f_wr_data_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wrd_mis_5_EMPTY_N &&
	     fabric_v_f_wrd_sjs_2_EMPTY_N &&
	     fabric_v_f_wrd_mis_5_D_OUT == 2'd2 &&
	     fabric_v_f_wrd_sjs_2_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 =
	     CAN_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave =
	     fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_0_FULL_N &&
	     fabric_v_f_rd_sjs_0_FULL_N &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_1
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 =
	     fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_1_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_1_FULL_N &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981) &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_2
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 =
	     fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_2_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_2_FULL_N &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1038 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_3
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 =
	     fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_3_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_3_FULL_N &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981) &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1064 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_4
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 =
	     fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_4_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_4_FULL_N &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1093 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_5
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 =
	     fabric_xactors_from_masters_0_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_5_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_5_FULL_N &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1117 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_6
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 =
	     fabric_xactors_to_slaves_0_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_0_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_1_FULL_N &&
	     !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_7
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 =
	     fabric_xactors_to_slaves_1_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_1_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_1_FULL_N &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140) &&
	     !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_8
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 =
	     fabric_xactors_to_slaves_2_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_2_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_1_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1191 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_9
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 =
	     fabric_xactors_to_slaves_3_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_3_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_1_FULL_N &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140) &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1214 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_10
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 =
	     fabric_xactors_to_slaves_4_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_4_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_1_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1240 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_11
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 =
	     fabric_xactors_to_slaves_5_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_5_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_1_FULL_N &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1261 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_12
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 =
	     fabric_xactors_to_slaves_0_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_0_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_2_FULL_N &&
	     !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_13
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 =
	     fabric_xactors_to_slaves_1_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_1_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_2_FULL_N &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284) &&
	     !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308 &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_14
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 =
	     fabric_xactors_to_slaves_2_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_2_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_2_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1335 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_15
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 =
	     fabric_xactors_to_slaves_3_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_3_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_2_FULL_N &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284) &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1358 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_16
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 =
	     fabric_xactors_to_slaves_4_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_4_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_2_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1384 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ;

  // rule RL_fabric_rl_rd_xaction_master_to_slave_17
  assign CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 =
	     fabric_xactors_to_slaves_5_f_rd_addr_FULL_N &&
	     fabric_v_f_rd_mis_5_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_EMPTY_N &&
	     fabric_v_f_rd_sjs_2_FULL_N &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1405 ;
  assign WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 =
	     CAN_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	     !WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master =
	     fabric_v_f_wr_mis_0_EMPTY_N && fabric_v_f_wr_sjs_0_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_resp_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_0_D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_1
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 =
	     fabric_v_f_wr_sjs_0_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_1_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_mis_1_D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_2
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 =
	     fabric_v_f_wr_sjs_0_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_2_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_mis_2_D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_3
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 =
	     fabric_v_f_wr_sjs_0_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_3_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_mis_3_D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_4
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 =
	     fabric_v_f_wr_sjs_0_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_4_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_mis_4_D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_5
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 =
	     fabric_v_f_wr_sjs_0_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_5_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_mis_5_D_OUT == 2'd0 &&
	     fabric_v_f_wr_sjs_0_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_6
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 =
	     fabric_v_f_wr_mis_0_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_0_D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_7
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 =
	     fabric_v_f_wr_mis_1_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_1_D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_8
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 =
	     fabric_v_f_wr_mis_2_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_2_D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_9
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 =
	     fabric_v_f_wr_mis_3_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_3_D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_10
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 =
	     fabric_v_f_wr_mis_4_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_4_D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_11
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 =
	     fabric_v_f_wr_mis_5_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_5_D_OUT == 2'd1 &&
	     fabric_v_f_wr_sjs_1_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_12
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 =
	     fabric_v_f_wr_mis_0_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_0_D_OUT == 2'd2 &&
	     fabric_v_f_wr_sjs_2_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_13
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 =
	     fabric_v_f_wr_mis_1_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_1_D_OUT == 2'd2 &&
	     fabric_v_f_wr_sjs_2_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_14
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 =
	     fabric_v_f_wr_mis_2_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_2_D_OUT == 2'd2 &&
	     fabric_v_f_wr_sjs_2_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_15
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 =
	     fabric_v_f_wr_mis_3_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_3_D_OUT == 2'd2 &&
	     fabric_v_f_wr_sjs_2_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_16
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 =
	     fabric_v_f_wr_mis_4_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_4_D_OUT == 2'd2 &&
	     fabric_v_f_wr_sjs_2_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 ;

  // rule RL_fabric_rl_wr_resp_slave_to_master_17
  assign CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 =
	     fabric_v_f_wr_mis_5_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_wr_resp_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_resp_FULL_N &&
	     fabric_v_f_wr_mis_5_D_OUT == 2'd2 &&
	     fabric_v_f_wr_sjs_2_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 =
	     CAN_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master =
	     fabric_v_f_rd_mis_0_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_0_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_0_EMPTY_N &&
	     fabric_v_f_rd_mis_0_D_OUT == 2'd0 &&
	     fabric_v_f_rd_sjs_0_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_1
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 =
	     fabric_xactors_from_masters_0_f_rd_data_FULL_N &&
	     fabric_v_f_rd_mis_1_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_rd_data_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_EMPTY_N &&
	     fabric_v_f_rd_mis_1_D_OUT == 2'd0 &&
	     fabric_v_f_rd_sjs_0_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_2
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 =
	     fabric_xactors_from_masters_0_f_rd_data_FULL_N &&
	     fabric_v_f_rd_mis_2_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_EMPTY_N &&
	     fabric_v_f_rd_mis_2_D_OUT == 2'd0 &&
	     fabric_v_f_rd_sjs_0_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_3
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 =
	     fabric_xactors_from_masters_0_f_rd_data_FULL_N &&
	     fabric_v_f_rd_mis_3_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_rd_data_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_EMPTY_N &&
	     fabric_v_f_rd_mis_3_D_OUT == 2'd0 &&
	     fabric_v_f_rd_sjs_0_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_4
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 =
	     fabric_xactors_from_masters_0_f_rd_data_FULL_N &&
	     fabric_v_f_rd_mis_4_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_rd_data_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_EMPTY_N &&
	     fabric_v_f_rd_mis_4_D_OUT == 2'd0 &&
	     fabric_v_f_rd_sjs_0_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_5
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 =
	     fabric_xactors_from_masters_0_f_rd_data_FULL_N &&
	     fabric_v_f_rd_mis_5_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_rd_data_EMPTY_N &&
	     fabric_v_f_rd_sjs_0_EMPTY_N &&
	     fabric_v_f_rd_mis_5_D_OUT == 2'd0 &&
	     fabric_v_f_rd_sjs_0_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_6
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 =
	     fabric_v_f_rd_mis_0_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_1_EMPTY_N &&
	     fabric_v_f_rd_mis_0_D_OUT == 2'd1 &&
	     fabric_v_f_rd_sjs_1_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_7
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 =
	     fabric_v_f_rd_mis_1_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_1_EMPTY_N &&
	     fabric_v_f_rd_mis_1_D_OUT == 2'd1 &&
	     fabric_v_f_rd_sjs_1_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_8
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 =
	     fabric_v_f_rd_mis_2_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_1_EMPTY_N &&
	     fabric_v_f_rd_mis_2_D_OUT == 2'd1 &&
	     fabric_v_f_rd_sjs_1_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_9
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 =
	     fabric_v_f_rd_mis_3_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_1_EMPTY_N &&
	     fabric_v_f_rd_mis_3_D_OUT == 2'd1 &&
	     fabric_v_f_rd_sjs_1_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_10
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 =
	     fabric_v_f_rd_mis_4_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_1_EMPTY_N &&
	     fabric_v_f_rd_mis_4_D_OUT == 2'd1 &&
	     fabric_v_f_rd_sjs_1_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_11
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 =
	     fabric_v_f_rd_mis_5_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_1_EMPTY_N &&
	     fabric_v_f_rd_mis_5_D_OUT == 2'd1 &&
	     fabric_v_f_rd_sjs_1_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_12
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 =
	     fabric_v_f_rd_mis_0_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_2_EMPTY_N &&
	     fabric_v_f_rd_mis_0_D_OUT == 2'd2 &&
	     fabric_v_f_rd_sjs_2_D_OUT == 3'd0 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_13
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 =
	     fabric_v_f_rd_mis_1_EMPTY_N &&
	     fabric_xactors_to_slaves_1_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_2_EMPTY_N &&
	     fabric_v_f_rd_mis_1_D_OUT == 2'd2 &&
	     fabric_v_f_rd_sjs_2_D_OUT == 3'd1 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_14
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 =
	     fabric_v_f_rd_mis_2_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_2_EMPTY_N &&
	     fabric_v_f_rd_mis_2_D_OUT == 2'd2 &&
	     fabric_v_f_rd_sjs_2_D_OUT == 3'd2 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_15
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 =
	     fabric_v_f_rd_mis_3_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_2_EMPTY_N &&
	     fabric_v_f_rd_mis_3_D_OUT == 2'd2 &&
	     fabric_v_f_rd_sjs_2_D_OUT == 3'd3 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_16
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 =
	     fabric_v_f_rd_mis_4_EMPTY_N &&
	     fabric_xactors_to_slaves_4_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_2_EMPTY_N &&
	     fabric_v_f_rd_mis_4_D_OUT == 2'd2 &&
	     fabric_v_f_rd_sjs_2_D_OUT == 3'd4 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 ;

  // rule RL_fabric_rl_rd_resp_slave_to_master_17
  assign CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 =
	     fabric_v_f_rd_mis_5_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_rd_data_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_rd_data_FULL_N &&
	     fabric_v_f_rd_sjs_2_EMPTY_N &&
	     fabric_v_f_rd_mis_5_D_OUT == 2'd2 &&
	     fabric_v_f_rd_sjs_2_D_OUT == 3'd5 ;
  assign WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 =
	     CAN_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 ;

  // rule RL_uart_user_ifc_capture_status
  assign CAN_FIRE_RL_uart_user_ifc_capture_status = 1'd1 ;
  assign WILL_FIRE_RL_uart_user_ifc_capture_status = 1'd1 ;

  // rule RL_uart_capture_read_request
  assign CAN_FIRE_RL_uart_capture_read_request =
	     uart_s_xactor_f_rd_addr_EMPTY_N &&
	     uart_s_xactor_f_rd_data_FULL_N &&
	     uart_rg_rdburst_count == 8'd0 ;
  assign WILL_FIRE_RL_uart_capture_read_request =
	     CAN_FIRE_RL_uart_capture_read_request ;

  // rule RL_uart_burst_reads
  assign CAN_FIRE_RL_uart_burst_reads =
	     uart_s_xactor_f_rd_data_FULL_N && uart_rg_rdburst_count != 8'd0 ;
  assign WILL_FIRE_RL_uart_burst_reads = CAN_FIRE_RL_uart_burst_reads ;

  // rule RL_uart_user_ifc_uart_baudGen_baud_count_wire
  assign CAN_FIRE_RL_uart_user_ifc_uart_baudGen_baud_count_wire = 1'd1 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_baudGen_baud_count_wire = 1'd1 ;

  // rule RL_uart_user_ifc_uart_baud_generator_clock_enable
  assign CAN_FIRE_RL_uart_user_ifc_uart_baud_generator_clock_enable = 1'd1 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_baud_generator_clock_enable = 1'd1 ;

  // rule RL_uart_user_ifc_uart_receive_wait_for_start_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit =
	     uart_user_ifc_uart_rRecvState == 3'd0 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit ;

  // rule RL_uart_user_ifc_uart_receive_find_center_of_bit_cell
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell =
	     uart_user_ifc_uart_rRecvState == 3'd1 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell ;

  // rule RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample =
	     uart_user_ifc_uart_rRecvState == 3'd2 &&
	     uart_user_ifc_uart_rRecvCellCount == 4'hF &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample ;

  // rule RL_uart_user_ifc_uart_receive_sample_pin
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_sample_pin =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_sample_pin =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // rule RL_uart_user_ifc_uart_receive_parity_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_parity_bit =
	     uart_user_ifc_uart_rRecvState == 3'd4 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_parity_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_parity_bit ;

  // rule RL_uart_user_ifc_uart_receive_stop_first_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit =
	     uart_user_ifc_uart_rRecvState == 3'd5 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit ;

  // rule RL_uart_user_ifc_uart_receive_bit_counter
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_bit_counter = 1'd1 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_bit_counter = 1'd1 ;

  // rule RL_uart_user_ifc_uart_receive_stop_last_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit =
	     uart_user_ifc_uart_rRecvState == 3'd6 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit ;

  // rule RL_uart_user_ifc_uart_receive_bit_cell_time_counter
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_bit_cell_time_counter =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_bit_cell_time_counter =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;

  // rule RL_uart_user_ifc_uart_receive_buffer_shift
  assign CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift =
	     uart_user_ifc_uart_rRecvState == 3'd3 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // rule RL_uart_user_ifc_uart_transmit_wait_for_start_command
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command =
	     uart_user_ifc_uart_rXmitState == 3'd0 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command ;

  // rule RL_uart_capture_write_request
  assign CAN_FIRE_RL_uart_capture_write_request =
	     uart_s_xactor_f_wr_addr_EMPTY_N &&
	     uart_s_xactor_f_wr_data_EMPTY_N &&
	     uart_s_xactor_f_wr_resp_FULL_N &&
	     uart_rg_wrburst_count == 8'd0 ;
  assign WILL_FIRE_RL_uart_capture_write_request =
	     CAN_FIRE_RL_uart_capture_write_request ;

  // rule RL_uart_burst_writes
  assign CAN_FIRE_RL_uart_burst_writes =
	     uart_s_xactor_f_wr_data_EMPTY_N &&
	     uart_s_xactor_f_wr_resp_FULL_N &&
	     uart_rg_wrburst_count != 8'd0 ;
  assign WILL_FIRE_RL_uart_burst_writes = CAN_FIRE_RL_uart_burst_writes ;

  // rule RL_uart_user_ifc_uart_transmit_send_start_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit =
	     uart_user_ifc_uart_rXmitState == 3'd1 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit ;

  // rule RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time =
	     uart_user_ifc_uart_rXmitState == 3'd2 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time ;

  // rule RL_uart_user_ifc_uart_transmit_bit_counter
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_bit_counter = 1'd1 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_bit_counter = 1'd1 ;

  // rule RL_uart_user_ifc_uart_transmit_shift_next_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit =
	     uart_user_ifc_uart_rXmitState == 3'd3 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit ;

  // rule RL_uart_user_ifc_uart_transmit_buffer_load
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load =
	     uart_user_ifc_uart_fifoXmit_EMPTY_N &&
	     uart_user_ifc_uart_pwXmitLoadBuffer_whas ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ;

  // rule RL_uart_user_ifc_uart_transmit_buffer_shift
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift =
	     !uart_user_ifc_uart_pwXmitLoadBuffer_whas &&
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // rule RL_uart_user_ifc_uart_transmit_send_parity_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit =
	     uart_user_ifc_uart_rXmitState == 3'd7 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit ;

  // rule RL_uart_user_ifc_uart_transmit_send_stop_bit
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit =
	     uart_user_ifc_uart_rXmitState == 3'd4 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit ;

  // rule RL_uart_user_ifc_uart_transmit_send_stop_bit1_5
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 =
	     uart_user_ifc_uart_rXmitState == 3'd5 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 ;

  // rule RL_uart_user_ifc_uart_transmit_send_stop_bit2
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 =
	     uart_user_ifc_uart_rXmitState == 3'd6 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 ;

  // rule RL_uart_user_ifc_uart_transmit_bit_cell_time_counter
  assign CAN_FIRE_RL_uart_user_ifc_uart_transmit_bit_cell_time_counter =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_transmit_bit_cell_time_counter =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;

  // rule RL_uart_user_ifc_uart_baudGen_baud_tick_count_wire
  assign CAN_FIRE_RL_uart_user_ifc_uart_baudGen_baud_tick_count_wire = 1'd1 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_baudGen_baud_tick_count_wire = 1'd1 ;

  // rule RL_uart_user_ifc_uart_baudGen_assert_2x_baud_tick
  assign CAN_FIRE_RL_uart_user_ifc_uart_baudGen_assert_2x_baud_tick =
	     uart_user_ifc_uart_baudGen_rBaudTickCounter_Q_OUT == 3'd0 &&
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_baudGen_assert_2x_baud_tick =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_assert_2x_baud_tick ;

  // rule RL_uart_user_ifc_uart_baudGen_count_baudtick_16x
  assign CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x =
	     !uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;

  // rule RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter
  assign CAN_FIRE_RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit !=
	     uart_user_ifc_uart_fifoRecv_r_deq_whas ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter =
	     CAN_FIRE_RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter ;

  // rule RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter
  assign CAN_FIRE_RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter =
	     uart_user_ifc_uart_fifoXmit_r_enq_whas !=
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ;
  assign WILL_FIRE_RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter =
	     CAN_FIRE_RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter ;

  // rule RL_clint_axi_read_transaction
  assign CAN_FIRE_RL_clint_axi_read_transaction =
	     clint_s_xactor_f_rd_addr_EMPTY_N &&
	     clint_s_xactor_f_rd_data_FULL_N &&
	     clint_rg_rdburst_count == 8'd0 ;
  assign WILL_FIRE_RL_clint_axi_read_transaction =
	     CAN_FIRE_RL_clint_axi_read_transaction ;

  // rule RL_clint_read_burst_traction
  assign CAN_FIRE_RL_clint_read_burst_traction =
	     clint_s_xactor_f_rd_data_FULL_N &&
	     clint_rg_rdburst_count != 8'd0 ;
  assign WILL_FIRE_RL_clint_read_burst_traction =
	     CAN_FIRE_RL_clint_read_burst_traction ;

  // rule RL_clint_axi_write_transaction
  assign CAN_FIRE_RL_clint_axi_write_transaction =
	     clint_s_xactor_f_wr_addr_EMPTY_N &&
	     clint_s_xactor_f_wr_data_EMPTY_N &&
	     clint_s_xactor_f_wr_resp_FULL_N &&
	     clint_rg_wrburst_count == 8'd0 ;
  assign WILL_FIRE_RL_clint_axi_write_transaction =
	     CAN_FIRE_RL_clint_axi_write_transaction ;

  // rule RL_clint_write_burst_traction
  assign CAN_FIRE_RL_clint_write_burst_traction =
	     clint_s_xactor_f_wr_data_EMPTY_N &&
	     clint_s_xactor_f_wr_resp_FULL_N &&
	     clint_rg_wrburst_count != 8'd0 ;
  assign WILL_FIRE_RL_clint_write_burst_traction =
	     CAN_FIRE_RL_clint_write_burst_traction ;

  // rule RL_clint_clint_generate_time_interrupt
  assign CAN_FIRE_RL_clint_clint_generate_time_interrupt =
	     !clint_clint_wr_mtimecmp_written_whas ;
  assign WILL_FIRE_RL_clint_clint_generate_time_interrupt =
	     CAN_FIRE_RL_clint_clint_generate_time_interrupt &&
	     !WILL_FIRE_RL_clint_axi_write_transaction ;

  // rule RL_clint_clint_clear_interrupt
  assign CAN_FIRE_RL_clint_clint_clear_interrupt =
	     clint_clint_wr_mtimecmp_written_whas ;
  assign WILL_FIRE_RL_clint_clint_clear_interrupt =
	     clint_clint_wr_mtimecmp_written_whas ;

  // rule RL_clint_clint_increment_timer
  assign CAN_FIRE_RL_clint_clint_increment_timer = 1'd1 ;
  assign WILL_FIRE_RL_clint_clint_increment_timer = 1'd1 ;

  // rule RL_err_slave_receive_read_request
  assign CAN_FIRE_RL_err_slave_receive_read_request =
	     err_slave_s_xactor_f_rd_addr_EMPTY_N && !err_slave_read_state ;
  assign WILL_FIRE_RL_err_slave_receive_read_request =
	     CAN_FIRE_RL_err_slave_receive_read_request ;

  // rule RL_err_slave_send_error_response
  assign CAN_FIRE_RL_err_slave_send_error_response =
	     err_slave_s_xactor_f_rd_data_FULL_N && err_slave_read_state ;
  assign WILL_FIRE_RL_err_slave_send_error_response =
	     CAN_FIRE_RL_err_slave_send_error_response ;

  // rule RL_err_slave_receive_write_request
  assign CAN_FIRE_RL_err_slave_receive_write_request =
	     err_slave_s_xactor_f_wr_addr_EMPTY_N &&
	     err_slave_s_xactor_f_wr_data_EMPTY_N &&
	     err_slave_s_xactor_f_wr_resp_FULL_N &&
	     !err_slave_write_state ;
  assign WILL_FIRE_RL_err_slave_receive_write_request =
	     CAN_FIRE_RL_err_slave_receive_write_request ;

  // rule RL_err_slave_write_request_data_channel
  assign CAN_FIRE_RL_err_slave_write_request_data_channel =
	     err_slave_s_xactor_f_wr_data_EMPTY_N &&
	     err_slave_s_xactor_f_wr_resp_FULL_N &&
	     err_slave_write_state ;
  assign WILL_FIRE_RL_err_slave_write_request_data_channel =
	     CAN_FIRE_RL_err_slave_write_request_data_channel ;

  // inputs to muxes for submodule ports
  assign MUX_clint_rg_rdburst_count_write_1__SEL_1 =
	     WILL_FIRE_RL_clint_axi_read_transaction &&
	     clint_s_xactor_f_rd_addr_D_OUT[13:6] != 8'd0 ;
  assign MUX_clint_rg_wrburst_count_write_1__SEL_1 =
	     WILL_FIRE_RL_clint_write_burst_traction &&
	     clint_s_xactor_f_wr_data_D_OUT[0] ;
  assign MUX_clint_s_xactor_f_wr_resp_enq_1__SEL_1 =
	     WILL_FIRE_RL_clint_axi_write_transaction &&
	     clint_s_xactor_f_wr_data_D_OUT[0] ;
  assign MUX_err_slave_read_state_write_1__SEL_1 =
	     WILL_FIRE_RL_err_slave_send_error_response &&
	     err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942 ;
  assign MUX_err_slave_rg_readburst_counter_write_1__SEL_1 =
	     WILL_FIRE_RL_err_slave_send_error_response &&
	     !err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942 ;
  assign MUX_err_slave_s_xactor_f_wr_resp_enq_1__SEL_1 =
	     WILL_FIRE_RL_err_slave_receive_write_request &&
	     err_slave_s_xactor_f_wr_data_D_OUT[0] ;
  assign MUX_err_slave_s_xactor_f_wr_resp_enq_1__SEL_2 =
	     WILL_FIRE_RL_err_slave_write_request_data_channel &&
	     err_slave_s_xactor_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  assign MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ;
  assign MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ;
  assign MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ;
  assign MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ;
  assign MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ;
  assign MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ;
  assign MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ;
  assign MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ;
  assign MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ;
  assign MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ;
  assign MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ;
  assign MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ;
  assign MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ;
  assign MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ;
  assign MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_1 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;
  assign MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_2 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ;
  assign MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_3 =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ;
  assign MUX_uart_rg_rdburst_count_write_1__SEL_1 =
	     WILL_FIRE_RL_uart_capture_read_request &&
	     uart_s_xactor_f_rd_addr_D_OUT[13:6] != 8'd0 ;
  assign MUX_uart_rg_wrburst_count_write_1__SEL_1 =
	     WILL_FIRE_RL_uart_capture_write_request &&
	     uart_s_xactor_f_wr_addr_D_OUT[16:9] != 8'd0 ;
  assign MUX_uart_s_xactor_f_wr_resp_enq_1__SEL_1 =
	     WILL_FIRE_RL_uart_capture_write_request &&
	     uart_s_xactor_f_wr_data_D_OUT[0] ;
  assign MUX_uart_user_ifc_uart_rRecvState_write_1__SEL_6 =
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_sample_pin ;
  assign MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_1 =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time ;
  assign MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_2 =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit ;
  assign MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_3 =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command ;
  assign MUX_clint_clint_mtip_write_1__VAL_1 =
	     clint_clint_rgmtime >= clint_clint_rgmtimecmp ;
  assign MUX_clint_rg_rdburst_count_write_1__VAL_2 =
	     (clint_rg_rdburst_count == clint_rg_rdpacket[13:6]) ?
	       8'd0 :
	       x__h87294 ;
  assign MUX_clint_s_xactor_f_rd_data_enq_1__VAL_1 =
	     { (clint_s_xactor_f_rd_addr_D_OUT[35:20] == 16'h0 ||
		clint_s_xactor_f_rd_addr_D_OUT[35:20] >= 16'h4000 &&
		clint_s_xactor_f_rd_addr_D_OUT[35:20] <= 16'd16391 ||
		clint_s_xactor_f_rd_addr_D_OUT[35:20] >= 16'hBFF8 &&
		clint_s_xactor_f_rd_addr_D_OUT[35:20] <= 16'd49151) ?
		 2'd0 :
		 2'd2,
	       x__h77526[31:0],
	       clint_s_xactor_f_rd_addr_D_OUT[13:6] == 8'd0,
	       clint_s_xactor_f_rd_addr_D_OUT[3:0] } ;
  assign MUX_clint_s_xactor_f_rd_data_enq_1__VAL_2 =
	     { 2'd2,
	       x__h87336[31:0],
	       clint_rg_rdpacket[13:6] == 8'd0,
	       clint_rg_rdpacket[3:0] } ;
  assign MUX_clint_s_xactor_f_wr_resp_enq_1__VAL_1 =
	     { (clint_s_xactor_f_wr_addr_D_OUT[35:20] == 16'h0 ||
		clint_s_xactor_f_wr_addr_D_OUT[35:20] >= 16'h4000 &&
		clint_s_xactor_f_wr_addr_D_OUT[35:20] <= 16'd16391) ?
		 2'd0 :
		 2'd2,
	       clint_s_xactor_f_wr_addr_D_OUT[3:0] } ;
  assign MUX_clint_s_xactor_f_wr_resp_enq_1__VAL_2 =
	     { 2'd0, clint_rg_wrpacket[3:0] } ;
  assign MUX_err_slave_rg_readburst_counter_write_1__VAL_1 =
	     err_slave_rg_readburst_counter + 8'd1 ;
  assign MUX_err_slave_s_xactor_f_wr_resp_enq_1__VAL_1 =
	     { 2'd3, err_slave_s_xactor_f_wr_data_D_OUT[4:1] } ;
  assign MUX_uart_rg_rdburst_count_write_1__VAL_2 =
	     (uart_rg_rdburst_count == uart_rg_rdpacket[13:6]) ?
	       8'd0 :
	       x__h73497 ;
  assign MUX_uart_rg_wrburst_count_write_1__VAL_2 =
	     (uart_rg_wrburst_count == uart_rg_wrpacket[16:9]) ?
	       8'd0 :
	       x__h75721 ;
  assign MUX_uart_s_xactor_f_rd_data_enq_1__VAL_1 =
	     { CASE_uart_s_xactor_f_rd_addrD_OUT_BITS_23_TO__ETC__q2,
	       rdata__h71703,
	       uart_s_xactor_f_rd_addr_D_OUT[13:6] == 8'd0,
	       uart_s_xactor_f_rd_addr_D_OUT[3:0] } ;
  assign MUX_uart_s_xactor_f_rd_data_enq_1__VAL_2 =
	     { (uart_rg_rdpacket[23:20] == 4'h8 &&
		uart_rg_rdpacket[15:14] == 2'd0 &&
		uart_rg_rdpacket[5:4] == 2'd0) ?
		 2'd0 :
		 2'd2,
	       rdata__h73432,
	       uart_rg_rdpacket[13:6] == uart_rg_rdburst_count,
	       uart_rg_rdpacket[3:0] } ;
  assign MUX_uart_s_xactor_f_wr_resp_enq_1__VAL_1 =
	     { CASE_uart_s_xactor_f_wr_addrD_OUT_BITS_23_TO__ETC__q3,
	       uart_s_xactor_f_wr_data_D_OUT[4:1] } ;
  assign MUX_uart_s_xactor_f_wr_resp_enq_1__VAL_2 =
	     { (uart_rg_wrpacket[23:20] == 4'h4 &&
		uart_rg_wrpacket[7:6] == 2'd0 &&
		uart_rg_wrpacket[5:4] == 2'd0) ?
		 2'd0 :
		 2'd2,
	       uart_s_xactor_f_wr_data_D_OUT[4:1] } ;
  assign MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_1 =
	     uart_user_ifc_uart_rRecvData ? 3'd0 : 3'd1 ;
  assign MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_2 =
	     (uart_user_ifc_uart_rRecvCellCount == 4'h4) ?
	       (uart_user_ifc_uart_rRecvData ? 3'd0 : 3'd2) :
	       3'd1 ;
  always@(uart_user_ifc_uart_rRecvBitCount)
  begin
    case (uart_user_ifc_uart_rRecvBitCount)
      4'd8, 4'd9, 4'd10:
	  MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_3 = 3'd6;
      default: MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_3 = 3'd3;
    endcase
  end
  assign MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_4 =
	     uart_user_ifc_uart_rRecvData ? 3'd2 : 3'd0 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_1 =
	     uart_user_ifc_uart_fifoXmit_EMPTY_N ? 3'd1 : 3'd0 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_2 =
	     (uart_user_ifc_uart_rXmitCellCount == 4'hF) ? 3'd2 : 3'd1 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_3 =
	     (uart_user_ifc_uart_rXmitCellCount == 4'hF) ?
	       ((uart_user_ifc_uart_rXmitBitCount == 4'd7) ? 3'd4 : 3'd3) :
	       3'd2 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_4 =
	     (uart_user_ifc_uart_rXmitCellCount == 4'hF) ? 3'd4 : 3'd7 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_5 =
	     (uart_user_ifc_uart_rXmitCellCount == 4'hF) ? 3'd0 : 3'd4 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_6 =
	     (uart_user_ifc_uart_rXmitCellCount == 4'h7) ? 3'd0 : 3'd5 ;
  assign MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_7 =
	     (uart_user_ifc_uart_rXmitCellCount == 4'hF) ? 3'd0 : 3'd6 ;

  // inlined wires
  assign clint_clint_wr_mtimecmp_written_whas =
	     WILL_FIRE_RL_clint_axi_write_transaction &&
	     clint_s_xactor_f_wr_addr_D_OUT[35:20] >= 16'h4000 &&
	     clint_s_xactor_f_wr_addr_D_OUT[35:20] <= 16'd16391 ;
  assign uart_user_ifc_uart_fifoRecv_r_deq_whas =
	     WILL_FIRE_RL_uart_capture_read_request &&
	     uart_s_xactor_f_rd_addr_D_OUT[23:20] == 4'h8 &&
	     uart_user_ifc_uart_fifoRecv_EMPTY_N ||
	     WILL_FIRE_RL_uart_burst_reads &&
	     uart_rg_rdpacket[23:20] == 4'h8 &&
	     uart_user_ifc_uart_fifoRecv_EMPTY_N ;
  assign uart_user_ifc_uart_pwRecvCellCountReset_whas =
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell &&
	     uart_user_ifc_uart_rRecvCellCount == 4'h4 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_sample_pin ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit ;
  assign uart_user_ifc_uart_pwRecvResetBitCount_whas =
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit &&
	     uart_user_ifc_uart_rRecvData ;
  assign uart_user_ifc_uart_pwRecvEnableBitCount_whas =
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_sample_pin ;
  assign uart_user_ifc_uart_fifoXmit_r_enq_whas =
	     WILL_FIRE_RL_uart_capture_write_request &&
	     uart_s_xactor_f_wr_addr_D_OUT[23:20] == 4'h4 ||
	     WILL_FIRE_RL_uart_burst_writes &&
	     uart_rg_wrpacket[23:20] == 4'h4 ;
  assign uart_user_ifc_uart_pwXmitCellCountReset_whas =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command &&
	     uart_user_ifc_uart_fifoXmit_EMPTY_N ||
	     _dor2uart_user_ifc_uart_pwXmitCellCountReset_EN_wset &&
	     uart_user_ifc_uart_rXmitCellCount == 4'hF ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 &&
	     uart_user_ifc_uart_rXmitCellCount == 4'h7 ;
  assign uart_user_ifc_uart_pwXmitEnableBitCount_whas =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time &&
	     uart_user_ifc_uart_rXmitCellCount == 4'hF &&
	     uart_user_ifc_uart_rXmitBitCount != 4'd7 ;
  assign uart_user_ifc_uart_pwXmitLoadBuffer_whas =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command &&
	     uart_user_ifc_uart_fifoXmit_EMPTY_N ;

  // register clint_clint_msip
  assign clint_clint_msip_D_IN = data__h97324[0] ;
  assign clint_clint_msip_EN =
	     WILL_FIRE_RL_clint_axi_write_transaction &&
	     clint_s_xactor_f_wr_addr_D_OUT[35:20] == 16'h0 ;

  // register clint_clint_mtip
  assign clint_clint_mtip_D_IN =
	     WILL_FIRE_RL_clint_clint_generate_time_interrupt &&
	     MUX_clint_clint_mtip_write_1__VAL_1 ;
  assign clint_clint_mtip_EN =
	     WILL_FIRE_RL_clint_clint_generate_time_interrupt ||
	     clint_clint_wr_mtimecmp_written_whas ;

  // register clint_clint_rg_tick
  assign clint_clint_rg_tick_D_IN = clint_clint_rg_tick + 4'd1 ;
  assign clint_clint_rg_tick_EN = 1'd1 ;

  // register clint_clint_rgmtime
  assign clint_clint_rgmtime_D_IN = clint_clint_rgmtime + 64'd1 ;
  assign clint_clint_rgmtime_EN = clint_clint_rg_tick == 4'd0 ;

  // register clint_clint_rgmtimecmp
  assign clint_clint_rgmtimecmp_D_IN = x__h98582 | datamask__h97327 ;
  assign clint_clint_rgmtimecmp_EN = clint_clint_wr_mtimecmp_written_whas ;

  // register clint_rg_rdburst_count
  assign clint_rg_rdburst_count_D_IN =
	     MUX_clint_rg_rdburst_count_write_1__SEL_1 ?
	       8'd1 :
	       MUX_clint_rg_rdburst_count_write_1__VAL_2 ;
  assign clint_rg_rdburst_count_EN =
	     WILL_FIRE_RL_clint_axi_read_transaction &&
	     clint_s_xactor_f_rd_addr_D_OUT[13:6] != 8'd0 ||
	     WILL_FIRE_RL_clint_read_burst_traction ;

  // register clint_rg_rdpacket
  assign clint_rg_rdpacket_D_IN = clint_s_xactor_f_rd_addr_D_OUT ;
  assign clint_rg_rdpacket_EN = CAN_FIRE_RL_clint_axi_read_transaction ;

  // register clint_rg_wrburst_count
  assign clint_rg_wrburst_count_D_IN =
	     MUX_clint_rg_wrburst_count_write_1__SEL_1 ? 8'd0 : 8'd1 ;
  assign clint_rg_wrburst_count_EN =
	     WILL_FIRE_RL_clint_write_burst_traction &&
	     clint_s_xactor_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_clint_axi_write_transaction &&
	     clint_s_xactor_f_wr_addr_D_OUT[16:9] != 8'd0 ;

  // register clint_rg_wrpacket
  assign clint_rg_wrpacket_D_IN = clint_s_xactor_f_wr_addr_D_OUT ;
  assign clint_rg_wrpacket_EN = CAN_FIRE_RL_clint_axi_write_transaction ;

  // register err_slave_read_state
  assign err_slave_read_state_D_IN =
	     !MUX_err_slave_read_state_write_1__SEL_1 ;
  assign err_slave_read_state_EN =
	     WILL_FIRE_RL_err_slave_send_error_response &&
	     err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942 ||
	     WILL_FIRE_RL_err_slave_receive_read_request ;

  // register err_slave_rg_rd_id
  assign err_slave_rg_rd_id_D_IN = err_slave_s_xactor_f_rd_addr_D_OUT[3:0] ;
  assign err_slave_rg_rd_id_EN = CAN_FIRE_RL_err_slave_receive_read_request ;

  // register err_slave_rg_read_length
  assign err_slave_rg_read_length_D_IN =
	     err_slave_s_xactor_f_rd_addr_D_OUT[13:6] ;
  assign err_slave_rg_read_length_EN =
	     CAN_FIRE_RL_err_slave_receive_read_request ;

  // register err_slave_rg_readburst_counter
  assign err_slave_rg_readburst_counter_D_IN =
	     MUX_err_slave_rg_readburst_counter_write_1__SEL_1 ?
	       MUX_err_slave_rg_readburst_counter_write_1__VAL_1 :
	       8'd0 ;
  assign err_slave_rg_readburst_counter_EN =
	     WILL_FIRE_RL_err_slave_send_error_response &&
	     !err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942 ||
	     WILL_FIRE_RL_err_slave_receive_read_request ;

  // register err_slave_rg_write_response
  assign err_slave_rg_write_response_D_IN =
	     MUX_err_slave_s_xactor_f_wr_resp_enq_1__VAL_1 ;
  assign err_slave_rg_write_response_EN =
	     CAN_FIRE_RL_err_slave_receive_write_request ;

  // register err_slave_write_state
  assign err_slave_write_state_D_IN =
	     !MUX_err_slave_s_xactor_f_wr_resp_enq_1__SEL_2 ;
  assign err_slave_write_state_EN =
	     WILL_FIRE_RL_err_slave_write_request_data_channel &&
	     err_slave_s_xactor_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_err_slave_receive_write_request &&
	     !err_slave_s_xactor_f_wr_data_D_OUT[0] ;

  // register uart_rg_rdburst_count
  assign uart_rg_rdburst_count_D_IN =
	     MUX_uart_rg_rdburst_count_write_1__SEL_1 ?
	       8'd1 :
	       MUX_uart_rg_rdburst_count_write_1__VAL_2 ;
  assign uart_rg_rdburst_count_EN =
	     WILL_FIRE_RL_uart_capture_read_request &&
	     uart_s_xactor_f_rd_addr_D_OUT[13:6] != 8'd0 ||
	     WILL_FIRE_RL_uart_burst_reads ;

  // register uart_rg_rdpacket
  assign uart_rg_rdpacket_D_IN = uart_s_xactor_f_rd_addr_D_OUT ;
  assign uart_rg_rdpacket_EN = CAN_FIRE_RL_uart_capture_read_request ;

  // register uart_rg_wrburst_count
  assign uart_rg_wrburst_count_D_IN =
	     MUX_uart_rg_wrburst_count_write_1__SEL_1 ?
	       8'd1 :
	       MUX_uart_rg_wrburst_count_write_1__VAL_2 ;
  assign uart_rg_wrburst_count_EN =
	     WILL_FIRE_RL_uart_capture_write_request &&
	     uart_s_xactor_f_wr_addr_D_OUT[16:9] != 8'd0 ||
	     WILL_FIRE_RL_uart_burst_writes ;

  // register uart_rg_wrpacket
  assign uart_rg_wrpacket_D_IN = uart_s_xactor_f_wr_addr_D_OUT ;
  assign uart_rg_wrpacket_EN = CAN_FIRE_RL_uart_capture_write_request ;

  // register uart_user_ifc_baud_value
  assign uart_user_ifc_baud_value_D_IN = uart_s_xactor_f_wr_data_D_OUT[24:9] ;
  assign uart_user_ifc_baud_value_EN =
	     WILL_FIRE_RL_uart_capture_write_request &&
	     uart_s_xactor_f_wr_addr_D_OUT[23:20] == 4'h0 ||
	     WILL_FIRE_RL_uart_burst_writes &&
	     uart_rg_wrpacket[23:20] == 4'h0 ;

  // register uart_user_ifc_uart_fifoRecv_countReg
  assign uart_user_ifc_uart_fifoRecv_countReg_D_IN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit ?
	       uart_user_ifc_uart_fifoRecv_countReg + 5'd1 :
	       uart_user_ifc_uart_fifoRecv_countReg - 5'd1 ;
  assign uart_user_ifc_uart_fifoRecv_countReg_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_fifoRecv__updateLevelCounter ;

  // register uart_user_ifc_uart_fifoXmit_countReg
  assign uart_user_ifc_uart_fifoXmit_countReg_D_IN =
	     uart_user_ifc_uart_fifoXmit_r_enq_whas ?
	       uart_user_ifc_uart_fifoXmit_countReg + 5'd1 :
	       uart_user_ifc_uart_fifoXmit_countReg - 5'd1 ;
  assign uart_user_ifc_uart_fifoXmit_countReg_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_fifoXmit__updateLevelCounter ;

  // register uart_user_ifc_uart_rRecvBitCount
  assign uart_user_ifc_uart_rRecvBitCount_D_IN =
	     uart_user_ifc_uart_pwRecvResetBitCount_whas ? 4'd0 : x__h64905 ;
  assign uart_user_ifc_uart_rRecvBitCount_EN =
	     uart_user_ifc_uart_pwRecvResetBitCount_whas ||
	     uart_user_ifc_uart_pwRecvEnableBitCount_whas ;

  // register uart_user_ifc_uart_rRecvCellCount
  assign uart_user_ifc_uart_rRecvCellCount_D_IN =
	     uart_user_ifc_uart_pwRecvCellCountReset_whas ? 4'd0 : x__h63201 ;
  assign uart_user_ifc_uart_rRecvCellCount_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;

  // register uart_user_ifc_uart_rRecvData
  assign uart_user_ifc_uart_rRecvData_D_IN = uart_io_SIN ;
  assign uart_user_ifc_uart_rRecvData_EN = 1'd1 ;

  // register uart_user_ifc_uart_rRecvParity
  assign uart_user_ifc_uart_rRecvParity_D_IN = uart_user_ifc_uart_rRecvData ;
  assign uart_user_ifc_uart_rRecvParity_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_parity_bit ;

  // register uart_user_ifc_uart_rRecvState
  always@(WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit or
	  MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_1 or
	  WILL_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell or
	  MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_2 or
	  WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample or
	  MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_3 or
	  WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit or
	  MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_4 or
	  WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit or
	  MUX_uart_user_ifc_uart_rRecvState_write_1__SEL_6)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit:
	  uart_user_ifc_uart_rRecvState_D_IN =
	      MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_1;
      WILL_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell:
	  uart_user_ifc_uart_rRecvState_D_IN =
	      MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_2;
      WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample:
	  uart_user_ifc_uart_rRecvState_D_IN =
	      MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_3;
      WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit:
	  uart_user_ifc_uart_rRecvState_D_IN =
	      MUX_uart_user_ifc_uart_rRecvState_write_1__VAL_4;
      WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit:
	  uart_user_ifc_uart_rRecvState_D_IN = 3'd0;
      MUX_uart_user_ifc_uart_rRecvState_write_1__SEL_6:
	  uart_user_ifc_uart_rRecvState_D_IN = 3'd2;
      default: uart_user_ifc_uart_rRecvState_D_IN =
		   3'b010 /* unspecified value */ ;
    endcase
  end
  assign uart_user_ifc_uart_rRecvState_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_for_start_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_find_center_of_bit_cell ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_wait_bit_cell_time_for_sample ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_first_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_receive_sample_pin ;

  // register uart_user_ifc_uart_rXmitBitCount
  assign uart_user_ifc_uart_rXmitBitCount_D_IN =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command ?
	       4'd0 :
	       x__h66687 ;
  assign uart_user_ifc_uart_rXmitBitCount_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command ||
	     uart_user_ifc_uart_pwXmitEnableBitCount_whas ;

  // register uart_user_ifc_uart_rXmitCellCount
  assign uart_user_ifc_uart_rXmitCellCount_D_IN =
	     uart_user_ifc_uart_pwXmitCellCountReset_whas ? 4'd0 : x__h66661 ;
  assign uart_user_ifc_uart_rXmitCellCount_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;

  // register uart_user_ifc_uart_rXmitDataOut
  always@(MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_1 or
	  uart_user_ifc_uart_vrXmitBuffer_0 or
	  MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_2 or
	  MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_1:
	  uart_user_ifc_uart_rXmitDataOut_D_IN =
	      uart_user_ifc_uart_vrXmitBuffer_0;
      MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_2:
	  uart_user_ifc_uart_rXmitDataOut_D_IN = 1'b0;
      MUX_uart_user_ifc_uart_rXmitDataOut_write_1__SEL_3:
	  uart_user_ifc_uart_rXmitDataOut_D_IN = 1'b1;
      default: uart_user_ifc_uart_rXmitDataOut_D_IN =
		   1'b0 /* unspecified value */ ;
    endcase
  end
  assign uart_user_ifc_uart_rXmitDataOut_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command ;

  // register uart_user_ifc_uart_rXmitParity
  assign uart_user_ifc_uart_rXmitParity_D_IN =
	     z__h68179 ^ uart_user_ifc_uart_fifoXmit_D_OUT[7] ;
  assign uart_user_ifc_uart_rXmitParity_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ;

  // register uart_user_ifc_uart_rXmitState
  always@(WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_1 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_2 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_3 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_4 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_5 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_6 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 or
	  MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_7 or
	  WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_1;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_2;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_3;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_4;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_5;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_6;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2:
	  uart_user_ifc_uart_rXmitState_D_IN =
	      MUX_uart_user_ifc_uart_rXmitState_write_1__VAL_7;
      WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit:
	  uart_user_ifc_uart_rXmitState_D_IN = 3'd2;
      default: uart_user_ifc_uart_rXmitState_D_IN =
		   3'b010 /* unspecified value */ ;
    endcase
  end
  assign uart_user_ifc_uart_rXmitState_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_for_start_command ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit1_5 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_shift_next_bit ;

  // register uart_user_ifc_uart_vrRecvBuffer_0
  assign uart_user_ifc_uart_vrRecvBuffer_0_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_1 ;
  assign uart_user_ifc_uart_vrRecvBuffer_0_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_1
  assign uart_user_ifc_uart_vrRecvBuffer_1_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_2 ;
  assign uart_user_ifc_uart_vrRecvBuffer_1_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_2
  assign uart_user_ifc_uart_vrRecvBuffer_2_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_3 ;
  assign uart_user_ifc_uart_vrRecvBuffer_2_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_3
  assign uart_user_ifc_uart_vrRecvBuffer_3_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_4 ;
  assign uart_user_ifc_uart_vrRecvBuffer_3_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_4
  assign uart_user_ifc_uart_vrRecvBuffer_4_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_5 ;
  assign uart_user_ifc_uart_vrRecvBuffer_4_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_5
  assign uart_user_ifc_uart_vrRecvBuffer_5_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_6 ;
  assign uart_user_ifc_uart_vrRecvBuffer_5_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_6
  assign uart_user_ifc_uart_vrRecvBuffer_6_D_IN =
	     uart_user_ifc_uart_vrRecvBuffer_7 ;
  assign uart_user_ifc_uart_vrRecvBuffer_6_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrRecvBuffer_7
  assign uart_user_ifc_uart_vrRecvBuffer_7_D_IN =
	     uart_user_ifc_uart_rRecvData ;
  assign uart_user_ifc_uart_vrRecvBuffer_7_EN =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_0
  assign uart_user_ifc_uart_vrXmitBuffer_0_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[0] :
	       uart_user_ifc_uart_vrXmitBuffer_1 ;
  assign uart_user_ifc_uart_vrXmitBuffer_0_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_1
  assign uart_user_ifc_uart_vrXmitBuffer_1_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[1] :
	       uart_user_ifc_uart_vrXmitBuffer_2 ;
  assign uart_user_ifc_uart_vrXmitBuffer_1_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_2
  assign uart_user_ifc_uart_vrXmitBuffer_2_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[2] :
	       uart_user_ifc_uart_vrXmitBuffer_3 ;
  assign uart_user_ifc_uart_vrXmitBuffer_2_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_3
  assign uart_user_ifc_uart_vrXmitBuffer_3_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[3] :
	       uart_user_ifc_uart_vrXmitBuffer_4 ;
  assign uart_user_ifc_uart_vrXmitBuffer_3_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_4
  assign uart_user_ifc_uart_vrXmitBuffer_4_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[4] :
	       uart_user_ifc_uart_vrXmitBuffer_5 ;
  assign uart_user_ifc_uart_vrXmitBuffer_4_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_5
  assign uart_user_ifc_uart_vrXmitBuffer_5_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[5] :
	       uart_user_ifc_uart_vrXmitBuffer_6 ;
  assign uart_user_ifc_uart_vrXmitBuffer_5_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_6
  assign uart_user_ifc_uart_vrXmitBuffer_6_D_IN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ?
	       uart_user_ifc_uart_fifoXmit_D_OUT[6] :
	       uart_user_ifc_uart_vrXmitBuffer_7 ;
  assign uart_user_ifc_uart_vrXmitBuffer_6_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // register uart_user_ifc_uart_vrXmitBuffer_7
  assign uart_user_ifc_uart_vrXmitBuffer_7_D_IN =
	     !WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     uart_user_ifc_uart_fifoXmit_D_OUT[7] ;
  assign uart_user_ifc_uart_vrXmitBuffer_7_EN =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_buffer_shift ;

  // submodule clint_s_xactor_f_rd_addr
  assign clint_s_xactor_f_rd_addr_D_IN =
	     fabric_xactors_to_slaves_3_f_rd_addr_D_OUT ;
  assign clint_s_xactor_f_rd_addr_ENQ =
	     fabric_xactors_to_slaves_3_f_rd_addr_EMPTY_N &&
	     clint_s_xactor_f_rd_addr_FULL_N ;
  assign clint_s_xactor_f_rd_addr_DEQ =
	     CAN_FIRE_RL_clint_axi_read_transaction ;
  assign clint_s_xactor_f_rd_addr_CLR = 1'b0 ;

  // submodule clint_s_xactor_f_rd_data
  assign clint_s_xactor_f_rd_data_D_IN =
	     WILL_FIRE_RL_clint_axi_read_transaction ?
	       MUX_clint_s_xactor_f_rd_data_enq_1__VAL_1 :
	       MUX_clint_s_xactor_f_rd_data_enq_1__VAL_2 ;
  assign clint_s_xactor_f_rd_data_ENQ =
	     WILL_FIRE_RL_clint_axi_read_transaction ||
	     WILL_FIRE_RL_clint_read_burst_traction ;
  assign clint_s_xactor_f_rd_data_DEQ =
	     fabric_xactors_to_slaves_3_f_rd_data_FULL_N &&
	     clint_s_xactor_f_rd_data_EMPTY_N ;
  assign clint_s_xactor_f_rd_data_CLR = 1'b0 ;

  // submodule clint_s_xactor_f_wr_addr
  assign clint_s_xactor_f_wr_addr_D_IN =
	     fabric_xactors_to_slaves_3_f_wr_addr_D_OUT ;
  assign clint_s_xactor_f_wr_addr_ENQ =
	     fabric_xactors_to_slaves_3_f_wr_addr_EMPTY_N &&
	     clint_s_xactor_f_wr_addr_FULL_N ;
  assign clint_s_xactor_f_wr_addr_DEQ =
	     CAN_FIRE_RL_clint_axi_write_transaction ;
  assign clint_s_xactor_f_wr_addr_CLR = 1'b0 ;

  // submodule clint_s_xactor_f_wr_data
  assign clint_s_xactor_f_wr_data_D_IN =
	     fabric_xactors_to_slaves_3_f_wr_data_D_OUT ;
  assign clint_s_xactor_f_wr_data_ENQ =
	     fabric_xactors_to_slaves_3_f_wr_data_EMPTY_N &&
	     clint_s_xactor_f_wr_data_FULL_N ;
  assign clint_s_xactor_f_wr_data_DEQ =
	     WILL_FIRE_RL_clint_write_burst_traction ||
	     WILL_FIRE_RL_clint_axi_write_transaction ;
  assign clint_s_xactor_f_wr_data_CLR = 1'b0 ;

  // submodule clint_s_xactor_f_wr_resp
  assign clint_s_xactor_f_wr_resp_D_IN =
	     MUX_clint_s_xactor_f_wr_resp_enq_1__SEL_1 ?
	       MUX_clint_s_xactor_f_wr_resp_enq_1__VAL_1 :
	       MUX_clint_s_xactor_f_wr_resp_enq_1__VAL_2 ;
  assign clint_s_xactor_f_wr_resp_ENQ =
	     WILL_FIRE_RL_clint_axi_write_transaction &&
	     clint_s_xactor_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_clint_write_burst_traction &&
	     clint_s_xactor_f_wr_data_D_OUT[0] ;
  assign clint_s_xactor_f_wr_resp_DEQ =
	     fabric_xactors_to_slaves_3_f_wr_resp_FULL_N &&
	     clint_s_xactor_f_wr_resp_EMPTY_N ;
  assign clint_s_xactor_f_wr_resp_CLR = 1'b0 ;

  // submodule eclass
  assign eclass_master_d_ARREADY =
	     fabric_xactors_from_masters_1_f_rd_addr_FULL_N ;
  assign eclass_master_d_AWREADY =
	     fabric_xactors_from_masters_1_f_wr_addr_FULL_N ;
  assign eclass_master_d_BID =
	     fabric_xactors_from_masters_1_f_wr_resp_D_OUT[3:0] ;
  assign eclass_master_d_BRESP =
	     fabric_xactors_from_masters_1_f_wr_resp_D_OUT[5:4] ;
  assign eclass_master_d_BVALID =
	     fabric_xactors_from_masters_1_f_wr_resp_EMPTY_N ;
  assign eclass_master_d_RDATA =
	     fabric_xactors_from_masters_1_f_rd_data_D_OUT[36:5] ;
  assign eclass_master_d_RID =
	     fabric_xactors_from_masters_1_f_rd_data_D_OUT[3:0] ;
  assign eclass_master_d_RLAST =
	     fabric_xactors_from_masters_1_f_rd_data_D_OUT[4] ;
  assign eclass_master_d_RRESP =
	     fabric_xactors_from_masters_1_f_rd_data_D_OUT[38:37] ;
  assign eclass_master_d_RVALID =
	     fabric_xactors_from_masters_1_f_rd_data_EMPTY_N ;
  assign eclass_master_d_WREADY =
	     fabric_xactors_from_masters_1_f_wr_data_FULL_N ;
  assign eclass_master_i_ARREADY =
	     fabric_xactors_from_masters_2_f_rd_addr_FULL_N ;
  assign eclass_master_i_AWREADY =
	     fabric_xactors_from_masters_2_f_wr_addr_FULL_N ;
  assign eclass_master_i_BID =
	     fabric_xactors_from_masters_2_f_wr_resp_D_OUT[3:0] ;
  assign eclass_master_i_BRESP =
	     fabric_xactors_from_masters_2_f_wr_resp_D_OUT[5:4] ;
  assign eclass_master_i_BVALID =
	     fabric_xactors_from_masters_2_f_wr_resp_EMPTY_N ;
  assign eclass_master_i_RDATA =
	     fabric_xactors_from_masters_2_f_rd_data_D_OUT[36:5] ;
  assign eclass_master_i_RID =
	     fabric_xactors_from_masters_2_f_rd_data_D_OUT[3:0] ;
  assign eclass_master_i_RLAST =
	     fabric_xactors_from_masters_2_f_rd_data_D_OUT[4] ;
  assign eclass_master_i_RRESP =
	     fabric_xactors_from_masters_2_f_rd_data_D_OUT[38:37] ;
  assign eclass_master_i_RVALID =
	     fabric_xactors_from_masters_2_f_rd_data_EMPTY_N ;
  assign eclass_master_i_WREADY =
	     fabric_xactors_from_masters_2_f_wr_data_FULL_N ;
  assign eclass_sb_clint_msip_put = clint_clint_msip ;
  assign eclass_sb_clint_mtime_put = clint_clint_rgmtime ;
  assign eclass_sb_clint_mtip_put = clint_clint_mtip ;
  assign eclass_sb_ext_interrupt_put = 1'b0 ;
  assign eclass_EN_sb_clint_msip_put = 1'd1 ;
  assign eclass_EN_sb_clint_mtip_put = 1'd1 ;
  assign eclass_EN_sb_clint_mtime_put = 1'd1 ;
  assign eclass_EN_sb_ext_interrupt_put = 1'b0 ;
  assign eclass_EN_io_dump_get = EN_io_dump_get ;

  // submodule err_slave_s_xactor_f_rd_addr
  assign err_slave_s_xactor_f_rd_addr_D_IN =
	     fabric_xactors_to_slaves_5_f_rd_addr_D_OUT ;
  assign err_slave_s_xactor_f_rd_addr_ENQ =
	     fabric_xactors_to_slaves_5_f_rd_addr_EMPTY_N &&
	     err_slave_s_xactor_f_rd_addr_FULL_N ;
  assign err_slave_s_xactor_f_rd_addr_DEQ =
	     CAN_FIRE_RL_err_slave_receive_read_request ;
  assign err_slave_s_xactor_f_rd_addr_CLR = 1'b0 ;

  // submodule err_slave_s_xactor_f_rd_data
  assign err_slave_s_xactor_f_rd_data_D_IN =
	     { 34'h300000000,
	       err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942,
	       err_slave_rg_rd_id } ;
  assign err_slave_s_xactor_f_rd_data_ENQ =
	     CAN_FIRE_RL_err_slave_send_error_response ;
  assign err_slave_s_xactor_f_rd_data_DEQ =
	     fabric_xactors_to_slaves_5_f_rd_data_FULL_N &&
	     err_slave_s_xactor_f_rd_data_EMPTY_N ;
  assign err_slave_s_xactor_f_rd_data_CLR = 1'b0 ;

  // submodule err_slave_s_xactor_f_wr_addr
  assign err_slave_s_xactor_f_wr_addr_D_IN =
	     fabric_xactors_to_slaves_5_f_wr_addr_D_OUT ;
  assign err_slave_s_xactor_f_wr_addr_ENQ =
	     fabric_xactors_to_slaves_5_f_wr_addr_EMPTY_N &&
	     err_slave_s_xactor_f_wr_addr_FULL_N ;
  assign err_slave_s_xactor_f_wr_addr_DEQ =
	     CAN_FIRE_RL_err_slave_receive_write_request ;
  assign err_slave_s_xactor_f_wr_addr_CLR = 1'b0 ;

  // submodule err_slave_s_xactor_f_wr_data
  assign err_slave_s_xactor_f_wr_data_D_IN =
	     fabric_xactors_to_slaves_5_f_wr_data_D_OUT ;
  assign err_slave_s_xactor_f_wr_data_ENQ =
	     fabric_xactors_to_slaves_5_f_wr_data_EMPTY_N &&
	     err_slave_s_xactor_f_wr_data_FULL_N ;
  assign err_slave_s_xactor_f_wr_data_DEQ =
	     WILL_FIRE_RL_err_slave_write_request_data_channel ||
	     WILL_FIRE_RL_err_slave_receive_write_request ;
  assign err_slave_s_xactor_f_wr_data_CLR = 1'b0 ;

  // submodule err_slave_s_xactor_f_wr_resp
  assign err_slave_s_xactor_f_wr_resp_D_IN =
	     MUX_err_slave_s_xactor_f_wr_resp_enq_1__SEL_1 ?
	       MUX_err_slave_s_xactor_f_wr_resp_enq_1__VAL_1 :
	       err_slave_rg_write_response ;
  assign err_slave_s_xactor_f_wr_resp_ENQ =
	     WILL_FIRE_RL_err_slave_receive_write_request &&
	     err_slave_s_xactor_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_err_slave_write_request_data_channel &&
	     err_slave_s_xactor_f_wr_data_D_OUT[0] ;
  assign err_slave_s_xactor_f_wr_resp_DEQ =
	     fabric_xactors_to_slaves_5_f_wr_resp_FULL_N &&
	     err_slave_s_xactor_f_wr_resp_EMPTY_N ;
  assign err_slave_s_xactor_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_err_user_0
  assign fabric_v_f_rd_err_user_0_ENQ = 1'b0 ;
  assign fabric_v_f_rd_err_user_0_DEQ = 1'b0 ;
  assign fabric_v_f_rd_err_user_0_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_err_user_1
  assign fabric_v_f_rd_err_user_1_ENQ = 1'b0 ;
  assign fabric_v_f_rd_err_user_1_DEQ = 1'b0 ;
  assign fabric_v_f_rd_err_user_1_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_err_user_2
  assign fabric_v_f_rd_err_user_2_ENQ = 1'b0 ;
  assign fabric_v_f_rd_err_user_2_DEQ = 1'b0 ;
  assign fabric_v_f_rd_err_user_2_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_mis_0
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave:
	  fabric_v_f_rd_mis_0_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6:
	  fabric_v_f_rd_mis_0_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12:
	  fabric_v_f_rd_mis_0_D_IN = 2'd2;
      default: fabric_v_f_rd_mis_0_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_mis_0_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 ;
  assign fabric_v_f_rd_mis_0_DEQ =
	     _dor1fabric_v_f_rd_mis_0_EN_deq &&
	     fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_mis_0_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_mis_1
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1:
	  fabric_v_f_rd_mis_1_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7:
	  fabric_v_f_rd_mis_1_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13:
	  fabric_v_f_rd_mis_1_D_IN = 2'd2;
      default: fabric_v_f_rd_mis_1_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_mis_1_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 ;
  assign fabric_v_f_rd_mis_1_DEQ =
	     _dor1fabric_v_f_rd_mis_1_EN_deq &&
	     fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_mis_1_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_mis_2
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2:
	  fabric_v_f_rd_mis_2_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8:
	  fabric_v_f_rd_mis_2_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14:
	  fabric_v_f_rd_mis_2_D_IN = 2'd2;
      default: fabric_v_f_rd_mis_2_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_mis_2_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 ;
  assign fabric_v_f_rd_mis_2_DEQ =
	     _dor1fabric_v_f_rd_mis_2_EN_deq &&
	     fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_mis_2_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_mis_3
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3:
	  fabric_v_f_rd_mis_3_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9:
	  fabric_v_f_rd_mis_3_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15:
	  fabric_v_f_rd_mis_3_D_IN = 2'd2;
      default: fabric_v_f_rd_mis_3_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_mis_3_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 ;
  assign fabric_v_f_rd_mis_3_DEQ =
	     _dor1fabric_v_f_rd_mis_3_EN_deq &&
	     fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_mis_3_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_mis_4
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4:
	  fabric_v_f_rd_mis_4_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10:
	  fabric_v_f_rd_mis_4_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16:
	  fabric_v_f_rd_mis_4_D_IN = 2'd2;
      default: fabric_v_f_rd_mis_4_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_mis_4_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 ;
  assign fabric_v_f_rd_mis_4_DEQ =
	     _dor1fabric_v_f_rd_mis_4_EN_deq &&
	     fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_mis_4_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_mis_5
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5:
	  fabric_v_f_rd_mis_5_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11:
	  fabric_v_f_rd_mis_5_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17:
	  fabric_v_f_rd_mis_5_D_IN = 2'd2;
      default: fabric_v_f_rd_mis_5_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_mis_5_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 ;
  assign fabric_v_f_rd_mis_5_DEQ =
	     _dor1fabric_v_f_rd_mis_5_EN_deq &&
	     fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_mis_5_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_sjs_0
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave:
	  fabric_v_f_rd_sjs_0_D_IN = 3'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1:
	  fabric_v_f_rd_sjs_0_D_IN = 3'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2:
	  fabric_v_f_rd_sjs_0_D_IN = 3'd2;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3:
	  fabric_v_f_rd_sjs_0_D_IN = 3'd3;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4:
	  fabric_v_f_rd_sjs_0_D_IN = 3'd4;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5:
	  fabric_v_f_rd_sjs_0_D_IN = 3'd5;
      default: fabric_v_f_rd_sjs_0_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_sjs_0_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ;
  assign fabric_v_f_rd_sjs_0_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	     fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	     fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	     fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	     fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	     fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	     fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_sjs_0_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_sjs_1
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6:
	  fabric_v_f_rd_sjs_1_D_IN = 3'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7:
	  fabric_v_f_rd_sjs_1_D_IN = 3'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8:
	  fabric_v_f_rd_sjs_1_D_IN = 3'd2;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9:
	  fabric_v_f_rd_sjs_1_D_IN = 3'd3;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10:
	  fabric_v_f_rd_sjs_1_D_IN = 3'd4;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11:
	  fabric_v_f_rd_sjs_1_D_IN = 3'd5;
      default: fabric_v_f_rd_sjs_1_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_sjs_1_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 ;
  assign fabric_v_f_rd_sjs_1_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	     fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	     fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	     fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	     fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	     fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	     fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_sjs_1_CLR = 1'b0 ;

  // submodule fabric_v_f_rd_sjs_2
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12:
	  fabric_v_f_rd_sjs_2_D_IN = 3'd0;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13:
	  fabric_v_f_rd_sjs_2_D_IN = 3'd1;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14:
	  fabric_v_f_rd_sjs_2_D_IN = 3'd2;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15:
	  fabric_v_f_rd_sjs_2_D_IN = 3'd3;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16:
	  fabric_v_f_rd_sjs_2_D_IN = 3'd4;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17:
	  fabric_v_f_rd_sjs_2_D_IN = 3'd5;
      default: fabric_v_f_rd_sjs_2_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_rd_sjs_2_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 ;
  assign fabric_v_f_rd_sjs_2_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	     fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	     fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	     fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	     fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	     fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4] ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	     fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4] ;
  assign fabric_v_f_rd_sjs_2_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_err_user_0
  assign fabric_v_f_wr_err_user_0_ENQ = 1'b0 ;
  assign fabric_v_f_wr_err_user_0_DEQ = 1'b0 ;
  assign fabric_v_f_wr_err_user_0_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_err_user_1
  assign fabric_v_f_wr_err_user_1_ENQ = 1'b0 ;
  assign fabric_v_f_wr_err_user_1_DEQ = 1'b0 ;
  assign fabric_v_f_wr_err_user_1_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_err_user_2
  assign fabric_v_f_wr_err_user_2_ENQ = 1'b0 ;
  assign fabric_v_f_wr_err_user_2_DEQ = 1'b0 ;
  assign fabric_v_f_wr_err_user_2_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_mis_0
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave:
	  fabric_v_f_wr_mis_0_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6:
	  fabric_v_f_wr_mis_0_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12:
	  fabric_v_f_wr_mis_0_D_IN = 2'd2;
      default: fabric_v_f_wr_mis_0_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_mis_0_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ;
  assign fabric_v_f_wr_mis_0_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_v_f_wr_mis_0_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_mis_1
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1:
	  fabric_v_f_wr_mis_1_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7:
	  fabric_v_f_wr_mis_1_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13:
	  fabric_v_f_wr_mis_1_D_IN = 2'd2;
      default: fabric_v_f_wr_mis_1_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_mis_1_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ;
  assign fabric_v_f_wr_mis_1_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  assign fabric_v_f_wr_mis_1_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_mis_2
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2:
	  fabric_v_f_wr_mis_2_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8:
	  fabric_v_f_wr_mis_2_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14:
	  fabric_v_f_wr_mis_2_D_IN = 2'd2;
      default: fabric_v_f_wr_mis_2_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_mis_2_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ;
  assign fabric_v_f_wr_mis_2_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  assign fabric_v_f_wr_mis_2_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_mis_3
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3:
	  fabric_v_f_wr_mis_3_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9:
	  fabric_v_f_wr_mis_3_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15:
	  fabric_v_f_wr_mis_3_D_IN = 2'd2;
      default: fabric_v_f_wr_mis_3_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_mis_3_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ;
  assign fabric_v_f_wr_mis_3_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ;
  assign fabric_v_f_wr_mis_3_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_mis_4
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4:
	  fabric_v_f_wr_mis_4_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10:
	  fabric_v_f_wr_mis_4_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16:
	  fabric_v_f_wr_mis_4_D_IN = 2'd2;
      default: fabric_v_f_wr_mis_4_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_mis_4_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ;
  assign fabric_v_f_wr_mis_4_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ;
  assign fabric_v_f_wr_mis_4_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_mis_5
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5:
	  fabric_v_f_wr_mis_5_D_IN = 2'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11:
	  fabric_v_f_wr_mis_5_D_IN = 2'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17:
	  fabric_v_f_wr_mis_5_D_IN = 2'd2;
      default: fabric_v_f_wr_mis_5_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_mis_5_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ;
  assign fabric_v_f_wr_mis_5_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ;
  assign fabric_v_f_wr_mis_5_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_sjs_0
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave:
	  fabric_v_f_wr_sjs_0_D_IN = 3'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1:
	  fabric_v_f_wr_sjs_0_D_IN = 3'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2:
	  fabric_v_f_wr_sjs_0_D_IN = 3'd2;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3:
	  fabric_v_f_wr_sjs_0_D_IN = 3'd3;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4:
	  fabric_v_f_wr_sjs_0_D_IN = 3'd4;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5:
	  fabric_v_f_wr_sjs_0_D_IN = 3'd5;
      default: fabric_v_f_wr_sjs_0_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_sjs_0_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ;
  assign fabric_v_f_wr_sjs_0_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_v_f_wr_sjs_0_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_sjs_1
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6:
	  fabric_v_f_wr_sjs_1_D_IN = 3'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7:
	  fabric_v_f_wr_sjs_1_D_IN = 3'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8:
	  fabric_v_f_wr_sjs_1_D_IN = 3'd2;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9:
	  fabric_v_f_wr_sjs_1_D_IN = 3'd3;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10:
	  fabric_v_f_wr_sjs_1_D_IN = 3'd4;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11:
	  fabric_v_f_wr_sjs_1_D_IN = 3'd5;
      default: fabric_v_f_wr_sjs_1_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_sjs_1_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ;
  assign fabric_v_f_wr_sjs_1_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 ;
  assign fabric_v_f_wr_sjs_1_CLR = 1'b0 ;

  // submodule fabric_v_f_wr_sjs_2
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12:
	  fabric_v_f_wr_sjs_2_D_IN = 3'd0;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13:
	  fabric_v_f_wr_sjs_2_D_IN = 3'd1;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14:
	  fabric_v_f_wr_sjs_2_D_IN = 3'd2;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15:
	  fabric_v_f_wr_sjs_2_D_IN = 3'd3;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16:
	  fabric_v_f_wr_sjs_2_D_IN = 3'd4;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17:
	  fabric_v_f_wr_sjs_2_D_IN = 3'd5;
      default: fabric_v_f_wr_sjs_2_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wr_sjs_2_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ;
  assign fabric_v_f_wr_sjs_2_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 ;
  assign fabric_v_f_wr_sjs_2_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_err_user_0
  assign fabric_v_f_wrd_err_user_0_ENQ = 1'b0 ;
  assign fabric_v_f_wrd_err_user_0_DEQ = 1'b0 ;
  assign fabric_v_f_wrd_err_user_0_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_err_user_1
  assign fabric_v_f_wrd_err_user_1_ENQ = 1'b0 ;
  assign fabric_v_f_wrd_err_user_1_DEQ = 1'b0 ;
  assign fabric_v_f_wrd_err_user_1_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_err_user_2
  assign fabric_v_f_wrd_err_user_2_ENQ = 1'b0 ;
  assign fabric_v_f_wrd_err_user_2_DEQ = 1'b0 ;
  assign fabric_v_f_wrd_err_user_2_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_mis_0
  always@(MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_1: fabric_v_f_wrd_mis_0_D_IN = 2'd0;
      MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_2: fabric_v_f_wrd_mis_0_D_IN = 2'd1;
      MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_3: fabric_v_f_wrd_mis_0_D_IN = 2'd2;
      default: fabric_v_f_wrd_mis_0_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_mis_0_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_0_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_0_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_mis_1
  always@(MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_1: fabric_v_f_wrd_mis_1_D_IN = 2'd0;
      MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_2: fabric_v_f_wrd_mis_1_D_IN = 2'd1;
      MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_3: fabric_v_f_wrd_mis_1_D_IN = 2'd2;
      default: fabric_v_f_wrd_mis_1_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_mis_1_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_1_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_1_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_mis_2
  always@(MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_1: fabric_v_f_wrd_mis_2_D_IN = 2'd0;
      MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_2: fabric_v_f_wrd_mis_2_D_IN = 2'd1;
      MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_3: fabric_v_f_wrd_mis_2_D_IN = 2'd2;
      default: fabric_v_f_wrd_mis_2_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_mis_2_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_2_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_2_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_mis_3
  always@(MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_1: fabric_v_f_wrd_mis_3_D_IN = 2'd0;
      MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_2: fabric_v_f_wrd_mis_3_D_IN = 2'd1;
      MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_3: fabric_v_f_wrd_mis_3_D_IN = 2'd2;
      default: fabric_v_f_wrd_mis_3_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_mis_3_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_3_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_3_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_mis_4
  always@(MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_1: fabric_v_f_wrd_mis_4_D_IN = 2'd0;
      MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_2: fabric_v_f_wrd_mis_4_D_IN = 2'd1;
      MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_3: fabric_v_f_wrd_mis_4_D_IN = 2'd2;
      default: fabric_v_f_wrd_mis_4_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_mis_4_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_4_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_4_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_mis_5
  always@(MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_1: fabric_v_f_wrd_mis_5_D_IN = 2'd0;
      MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_2: fabric_v_f_wrd_mis_5_D_IN = 2'd1;
      MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_3: fabric_v_f_wrd_mis_5_D_IN = 2'd2;
      default: fabric_v_f_wrd_mis_5_D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_mis_5_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_5_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_mis_5_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_sjs_0
  always@(MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_1 or
	  MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_1: fabric_v_f_wrd_sjs_0_D_IN = 3'd0;
      MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_1: fabric_v_f_wrd_sjs_0_D_IN = 3'd1;
      MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_1: fabric_v_f_wrd_sjs_0_D_IN = 3'd2;
      MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_1: fabric_v_f_wrd_sjs_0_D_IN = 3'd3;
      MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_1: fabric_v_f_wrd_sjs_0_D_IN = 3'd4;
      MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_1: fabric_v_f_wrd_sjs_0_D_IN = 3'd5;
      default: fabric_v_f_wrd_sjs_0_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_sjs_0_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	     !fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_sjs_0_DEQ =
	     _dor1fabric_v_f_wrd_sjs_0_EN_deq &&
	     fabric_xactors_from_masters_0_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_sjs_0_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_sjs_1
  always@(MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_2 or
	  MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_2: fabric_v_f_wrd_sjs_1_D_IN = 3'd0;
      MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_2: fabric_v_f_wrd_sjs_1_D_IN = 3'd1;
      MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_2: fabric_v_f_wrd_sjs_1_D_IN = 3'd2;
      MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_2: fabric_v_f_wrd_sjs_1_D_IN = 3'd3;
      MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_2: fabric_v_f_wrd_sjs_1_D_IN = 3'd4;
      MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_2: fabric_v_f_wrd_sjs_1_D_IN = 3'd5;
      default: fabric_v_f_wrd_sjs_1_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_sjs_1_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	     !fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_sjs_1_DEQ =
	     _dor1fabric_v_f_wrd_sjs_1_EN_deq &&
	     fabric_xactors_from_masters_1_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_sjs_1_CLR = 1'b0 ;

  // submodule fabric_v_f_wrd_sjs_2
  always@(MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_3 or
	  MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_3 or
	  MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_3 or
	  MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_3 or
	  MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_3 or
	  MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_v_f_wrd_mis_0_enq_1__SEL_3: fabric_v_f_wrd_sjs_2_D_IN = 3'd0;
      MUX_fabric_v_f_wrd_mis_1_enq_1__SEL_3: fabric_v_f_wrd_sjs_2_D_IN = 3'd1;
      MUX_fabric_v_f_wrd_mis_2_enq_1__SEL_3: fabric_v_f_wrd_sjs_2_D_IN = 3'd2;
      MUX_fabric_v_f_wrd_mis_3_enq_1__SEL_3: fabric_v_f_wrd_sjs_2_D_IN = 3'd3;
      MUX_fabric_v_f_wrd_mis_4_enq_1__SEL_3: fabric_v_f_wrd_sjs_2_D_IN = 3'd4;
      MUX_fabric_v_f_wrd_mis_5_enq_1__SEL_3: fabric_v_f_wrd_sjs_2_D_IN = 3'd5;
      default: fabric_v_f_wrd_sjs_2_D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign fabric_v_f_wrd_sjs_2_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	     !fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_sjs_2_DEQ =
	     _dor1fabric_v_f_wrd_sjs_2_EN_deq &&
	     fabric_xactors_from_masters_2_f_wr_data_D_OUT[0] ;
  assign fabric_v_f_wrd_sjs_2_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_0_f_rd_addr
  assign fabric_xactors_from_masters_0_f_rd_addr_D_IN =
	     { signature_master_ARADDR,
	       signature_master_ARPROT,
	       signature_master_ARSIZE,
	       signature_master_ARLEN,
	       signature_master_ARBURST,
	       signature_master_ARID } ;
  assign fabric_xactors_from_masters_0_f_rd_addr_ENQ =
	     signature_master_ARVALID &&
	     fabric_xactors_from_masters_0_f_rd_addr_FULL_N ;
  assign fabric_xactors_from_masters_0_f_rd_addr_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ;
  assign fabric_xactors_from_masters_0_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_0_f_rd_data
  always@(WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master or
	  fabric_xactors_to_slaves_0_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 or
	  fabric_xactors_to_slaves_1_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 or
	  fabric_xactors_to_slaves_2_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 or
	  fabric_xactors_to_slaves_3_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 or
	  fabric_xactors_to_slaves_4_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 or
	  fabric_xactors_to_slaves_5_f_rd_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master:
	  fabric_xactors_from_masters_0_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_0_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1:
	  fabric_xactors_from_masters_0_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_1_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2:
	  fabric_xactors_from_masters_0_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_2_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3:
	  fabric_xactors_from_masters_0_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_3_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4:
	  fabric_xactors_from_masters_0_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_4_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5:
	  fabric_xactors_from_masters_0_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_5_f_rd_data_D_OUT;
      default: fabric_xactors_from_masters_0_f_rd_data_D_IN =
		   39'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_0_f_rd_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ;
  assign fabric_xactors_from_masters_0_f_rd_data_DEQ =
	     signature_master_RREADY &&
	     fabric_xactors_from_masters_0_f_rd_data_EMPTY_N ;
  assign fabric_xactors_from_masters_0_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_0_f_wr_addr
  assign fabric_xactors_from_masters_0_f_wr_addr_D_IN =
	     { signature_master_AWADDR,
	       signature_master_AWPROT,
	       signature_master_AWLEN,
	       signature_master_AWSIZE,
	       signature_master_AWBURST,
	       signature_master_AWID } ;
  assign fabric_xactors_from_masters_0_f_wr_addr_ENQ =
	     signature_master_AWVALID &&
	     fabric_xactors_from_masters_0_f_wr_addr_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_addr_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  assign fabric_xactors_from_masters_0_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_0_f_wr_data
  assign fabric_xactors_from_masters_0_f_wr_data_D_IN =
	     { signature_master_WDATA,
	       signature_master_WSTRB,
	       signature_master_WID,
	       signature_master_WLAST } ;
  assign fabric_xactors_from_masters_0_f_wr_data_ENQ =
	     signature_master_WVALID &&
	     fabric_xactors_from_masters_0_f_wr_data_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ;
  assign fabric_xactors_from_masters_0_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_0_f_wr_resp
  always@(WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master or
	  fabric_xactors_to_slaves_0_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 or
	  fabric_xactors_to_slaves_1_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 or
	  fabric_xactors_to_slaves_2_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 or
	  fabric_xactors_to_slaves_3_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 or
	  fabric_xactors_to_slaves_4_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 or
	  fabric_xactors_to_slaves_5_f_wr_resp_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master:
	  fabric_xactors_from_masters_0_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_0_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1:
	  fabric_xactors_from_masters_0_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_1_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2:
	  fabric_xactors_from_masters_0_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_2_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3:
	  fabric_xactors_from_masters_0_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_3_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4:
	  fabric_xactors_from_masters_0_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_4_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5:
	  fabric_xactors_from_masters_0_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_5_f_wr_resp_D_OUT;
      default: fabric_xactors_from_masters_0_f_wr_resp_D_IN =
		   6'b101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_0_f_wr_resp_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ;
  assign fabric_xactors_from_masters_0_f_wr_resp_DEQ =
	     signature_master_BREADY &&
	     fabric_xactors_from_masters_0_f_wr_resp_EMPTY_N ;
  assign fabric_xactors_from_masters_0_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_1_f_rd_addr
  assign fabric_xactors_from_masters_1_f_rd_addr_D_IN =
	     { eclass_master_d_ARADDR,
	       eclass_master_d_ARPROT,
	       eclass_master_d_ARSIZE,
	       eclass_master_d_ARLEN,
	       eclass_master_d_ARBURST,
	       eclass_master_d_ARID } ;
  assign fabric_xactors_from_masters_1_f_rd_addr_ENQ =
	     eclass_master_d_ARVALID &&
	     fabric_xactors_from_masters_1_f_rd_addr_FULL_N ;
  assign fabric_xactors_from_masters_1_f_rd_addr_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_1_f_rd_data
  always@(WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 or
	  fabric_xactors_to_slaves_0_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 or
	  fabric_xactors_to_slaves_1_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 or
	  fabric_xactors_to_slaves_2_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 or
	  fabric_xactors_to_slaves_3_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 or
	  fabric_xactors_to_slaves_4_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 or
	  fabric_xactors_to_slaves_5_f_rd_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6:
	  fabric_xactors_from_masters_1_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_0_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7:
	  fabric_xactors_from_masters_1_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_1_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8:
	  fabric_xactors_from_masters_1_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_2_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9:
	  fabric_xactors_from_masters_1_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_3_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10:
	  fabric_xactors_from_masters_1_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_4_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11:
	  fabric_xactors_from_masters_1_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_5_f_rd_data_D_OUT;
      default: fabric_xactors_from_masters_1_f_rd_data_D_IN =
		   39'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_1_f_rd_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 ;
  assign fabric_xactors_from_masters_1_f_rd_data_DEQ =
	     eclass_master_d_RREADY &&
	     fabric_xactors_from_masters_1_f_rd_data_EMPTY_N ;
  assign fabric_xactors_from_masters_1_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_1_f_wr_addr
  assign fabric_xactors_from_masters_1_f_wr_addr_D_IN =
	     { eclass_master_d_AWADDR,
	       eclass_master_d_AWPROT,
	       eclass_master_d_AWLEN,
	       eclass_master_d_AWSIZE,
	       eclass_master_d_AWBURST,
	       eclass_master_d_AWID } ;
  assign fabric_xactors_from_masters_1_f_wr_addr_ENQ =
	     eclass_master_d_AWVALID &&
	     fabric_xactors_from_masters_1_f_wr_addr_FULL_N ;
  assign fabric_xactors_from_masters_1_f_wr_addr_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_1_f_wr_data
  assign fabric_xactors_from_masters_1_f_wr_data_D_IN =
	     { eclass_master_d_WDATA,
	       eclass_master_d_WSTRB,
	       eclass_master_d_WID,
	       eclass_master_d_WLAST } ;
  assign fabric_xactors_from_masters_1_f_wr_data_ENQ =
	     eclass_master_d_WVALID &&
	     fabric_xactors_from_masters_1_f_wr_data_FULL_N ;
  assign fabric_xactors_from_masters_1_f_wr_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ;
  assign fabric_xactors_from_masters_1_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_1_f_wr_resp
  always@(WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 or
	  fabric_xactors_to_slaves_0_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 or
	  fabric_xactors_to_slaves_1_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 or
	  fabric_xactors_to_slaves_2_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 or
	  fabric_xactors_to_slaves_3_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 or
	  fabric_xactors_to_slaves_4_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 or
	  fabric_xactors_to_slaves_5_f_wr_resp_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6:
	  fabric_xactors_from_masters_1_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_0_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7:
	  fabric_xactors_from_masters_1_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_1_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8:
	  fabric_xactors_from_masters_1_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_2_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9:
	  fabric_xactors_from_masters_1_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_3_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10:
	  fabric_xactors_from_masters_1_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_4_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11:
	  fabric_xactors_from_masters_1_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_5_f_wr_resp_D_OUT;
      default: fabric_xactors_from_masters_1_f_wr_resp_D_IN =
		   6'b101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_1_f_wr_resp_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 ;
  assign fabric_xactors_from_masters_1_f_wr_resp_DEQ =
	     eclass_master_d_BREADY &&
	     fabric_xactors_from_masters_1_f_wr_resp_EMPTY_N ;
  assign fabric_xactors_from_masters_1_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_2_f_rd_addr
  assign fabric_xactors_from_masters_2_f_rd_addr_D_IN =
	     { eclass_master_i_ARADDR,
	       eclass_master_i_ARPROT,
	       eclass_master_i_ARSIZE,
	       eclass_master_i_ARLEN,
	       eclass_master_i_ARBURST,
	       eclass_master_i_ARID } ;
  assign fabric_xactors_from_masters_2_f_rd_addr_ENQ =
	     eclass_master_i_ARVALID &&
	     fabric_xactors_from_masters_2_f_rd_addr_FULL_N ;
  assign fabric_xactors_from_masters_2_f_rd_addr_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_2_f_rd_data
  always@(WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 or
	  fabric_xactors_to_slaves_0_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 or
	  fabric_xactors_to_slaves_1_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 or
	  fabric_xactors_to_slaves_2_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 or
	  fabric_xactors_to_slaves_3_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 or
	  fabric_xactors_to_slaves_4_f_rd_data_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 or
	  fabric_xactors_to_slaves_5_f_rd_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12:
	  fabric_xactors_from_masters_2_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_0_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13:
	  fabric_xactors_from_masters_2_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_1_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14:
	  fabric_xactors_from_masters_2_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_2_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15:
	  fabric_xactors_from_masters_2_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_3_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16:
	  fabric_xactors_from_masters_2_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_4_f_rd_data_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17:
	  fabric_xactors_from_masters_2_f_rd_data_D_IN =
	      fabric_xactors_to_slaves_5_f_rd_data_D_OUT;
      default: fabric_xactors_from_masters_2_f_rd_data_D_IN =
		   39'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_2_f_rd_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 ;
  assign fabric_xactors_from_masters_2_f_rd_data_DEQ =
	     eclass_master_i_RREADY &&
	     fabric_xactors_from_masters_2_f_rd_data_EMPTY_N ;
  assign fabric_xactors_from_masters_2_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_2_f_wr_addr
  assign fabric_xactors_from_masters_2_f_wr_addr_D_IN =
	     { eclass_master_i_AWADDR,
	       eclass_master_i_AWPROT,
	       eclass_master_i_AWLEN,
	       eclass_master_i_AWSIZE,
	       eclass_master_i_AWBURST,
	       eclass_master_i_AWID } ;
  assign fabric_xactors_from_masters_2_f_wr_addr_ENQ =
	     eclass_master_i_AWVALID &&
	     fabric_xactors_from_masters_2_f_wr_addr_FULL_N ;
  assign fabric_xactors_from_masters_2_f_wr_addr_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_2_f_wr_data
  assign fabric_xactors_from_masters_2_f_wr_data_D_IN =
	     { eclass_master_i_WDATA,
	       eclass_master_i_WSTRB,
	       eclass_master_i_WID,
	       eclass_master_i_WLAST } ;
  assign fabric_xactors_from_masters_2_f_wr_data_ENQ =
	     eclass_master_i_WVALID &&
	     fabric_xactors_from_masters_2_f_wr_data_FULL_N ;
  assign fabric_xactors_from_masters_2_f_wr_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ;
  assign fabric_xactors_from_masters_2_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_from_masters_2_f_wr_resp
  always@(WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 or
	  fabric_xactors_to_slaves_0_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 or
	  fabric_xactors_to_slaves_1_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 or
	  fabric_xactors_to_slaves_2_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 or
	  fabric_xactors_to_slaves_3_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 or
	  fabric_xactors_to_slaves_4_f_wr_resp_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 or
	  fabric_xactors_to_slaves_5_f_wr_resp_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12:
	  fabric_xactors_from_masters_2_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_0_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13:
	  fabric_xactors_from_masters_2_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_1_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14:
	  fabric_xactors_from_masters_2_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_2_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15:
	  fabric_xactors_from_masters_2_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_3_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16:
	  fabric_xactors_from_masters_2_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_4_f_wr_resp_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17:
	  fabric_xactors_from_masters_2_f_wr_resp_D_IN =
	      fabric_xactors_to_slaves_5_f_wr_resp_D_OUT;
      default: fabric_xactors_from_masters_2_f_wr_resp_D_IN =
		   6'b101010 /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_from_masters_2_f_wr_resp_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 ;
  assign fabric_xactors_from_masters_2_f_wr_resp_DEQ =
	     eclass_master_i_BREADY &&
	     fabric_xactors_from_masters_2_f_wr_resp_EMPTY_N ;
  assign fabric_xactors_from_masters_2_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_0_f_rd_addr
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave or
	  fabric_xactors_from_masters_0_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 or
	  fabric_xactors_from_masters_1_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 or
	  fabric_xactors_from_masters_2_f_rd_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave:
	  fabric_xactors_to_slaves_0_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6:
	  fabric_xactors_to_slaves_0_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12:
	  fabric_xactors_to_slaves_0_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
      default: fabric_xactors_to_slaves_0_f_rd_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_0_f_rd_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 ;
  assign fabric_xactors_to_slaves_0_f_rd_addr_DEQ =
	     fabric_xactors_to_slaves_0_f_rd_addr_EMPTY_N &&
	     main_mem_master_ARREADY ;
  assign fabric_xactors_to_slaves_0_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_0_f_rd_data
  assign fabric_xactors_to_slaves_0_f_rd_data_D_IN =
	     { main_mem_master_RRESP,
	       main_mem_master_RDATA,
	       main_mem_master_RLAST,
	       main_mem_master_RID } ;
  assign fabric_xactors_to_slaves_0_f_rd_data_ENQ =
	     main_mem_master_RVALID &&
	     fabric_xactors_to_slaves_0_f_rd_data_FULL_N ;
  assign fabric_xactors_to_slaves_0_f_rd_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  assign fabric_xactors_to_slaves_0_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_0_f_wr_addr
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave or
	  fabric_xactors_from_masters_0_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 or
	  fabric_xactors_from_masters_1_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 or
	  fabric_xactors_from_masters_2_f_wr_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave:
	  fabric_xactors_to_slaves_0_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6:
	  fabric_xactors_to_slaves_0_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12:
	  fabric_xactors_to_slaves_0_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
      default: fabric_xactors_to_slaves_0_f_wr_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_0_f_wr_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ;
  assign fabric_xactors_to_slaves_0_f_wr_addr_DEQ =
	     fabric_xactors_to_slaves_0_f_wr_addr_EMPTY_N &&
	     main_mem_master_AWREADY ;
  assign fabric_xactors_to_slaves_0_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_0_f_wr_data
  always@(MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_1 or
	  fabric_xactors_from_masters_0_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_2 or
	  fabric_xactors_from_masters_1_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_3 or
	  fabric_xactors_from_masters_2_f_wr_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_1:
	  fabric_xactors_to_slaves_0_f_wr_data_D_IN =
	      fabric_xactors_from_masters_0_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_2:
	  fabric_xactors_to_slaves_0_f_wr_data_D_IN =
	      fabric_xactors_from_masters_1_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_0_f_wr_data_enq_1__SEL_3:
	  fabric_xactors_to_slaves_0_f_wr_data_D_IN =
	      fabric_xactors_from_masters_2_f_wr_data_D_OUT;
      default: fabric_xactors_to_slaves_0_f_wr_data_D_IN =
		   41'h0AAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_0_f_wr_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 ;
  assign fabric_xactors_to_slaves_0_f_wr_data_DEQ =
	     fabric_xactors_to_slaves_0_f_wr_data_EMPTY_N &&
	     main_mem_master_WREADY ;
  assign fabric_xactors_to_slaves_0_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_0_f_wr_resp
  assign fabric_xactors_to_slaves_0_f_wr_resp_D_IN =
	     { main_mem_master_BRESP, main_mem_master_BID } ;
  assign fabric_xactors_to_slaves_0_f_wr_resp_ENQ =
	     main_mem_master_BVALID &&
	     fabric_xactors_to_slaves_0_f_wr_resp_FULL_N ;
  assign fabric_xactors_to_slaves_0_f_wr_resp_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master ;
  assign fabric_xactors_to_slaves_0_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_1_f_rd_addr
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 or
	  fabric_xactors_from_masters_0_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 or
	  fabric_xactors_from_masters_1_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 or
	  fabric_xactors_from_masters_2_f_rd_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1:
	  fabric_xactors_to_slaves_1_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7:
	  fabric_xactors_to_slaves_1_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13:
	  fabric_xactors_to_slaves_1_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
      default: fabric_xactors_to_slaves_1_f_rd_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_1_f_rd_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 ;
  assign fabric_xactors_to_slaves_1_f_rd_addr_DEQ =
	     fabric_xactors_to_slaves_1_f_rd_addr_EMPTY_N &&
	     boot_mem_master_ARREADY ;
  assign fabric_xactors_to_slaves_1_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_1_f_rd_data
  assign fabric_xactors_to_slaves_1_f_rd_data_D_IN =
	     { boot_mem_master_RRESP,
	       boot_mem_master_RDATA,
	       boot_mem_master_RLAST,
	       boot_mem_master_RID } ;
  assign fabric_xactors_to_slaves_1_f_rd_data_ENQ =
	     boot_mem_master_RVALID &&
	     fabric_xactors_to_slaves_1_f_rd_data_FULL_N ;
  assign fabric_xactors_to_slaves_1_f_rd_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  assign fabric_xactors_to_slaves_1_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_1_f_wr_addr
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 or
	  fabric_xactors_from_masters_0_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 or
	  fabric_xactors_from_masters_1_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 or
	  fabric_xactors_from_masters_2_f_wr_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1:
	  fabric_xactors_to_slaves_1_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7:
	  fabric_xactors_to_slaves_1_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13:
	  fabric_xactors_to_slaves_1_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
      default: fabric_xactors_to_slaves_1_f_wr_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_1_f_wr_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ;
  assign fabric_xactors_to_slaves_1_f_wr_addr_DEQ =
	     fabric_xactors_to_slaves_1_f_wr_addr_EMPTY_N &&
	     boot_mem_master_AWREADY ;
  assign fabric_xactors_to_slaves_1_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_1_f_wr_data
  always@(MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_1 or
	  fabric_xactors_from_masters_0_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_2 or
	  fabric_xactors_from_masters_1_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_3 or
	  fabric_xactors_from_masters_2_f_wr_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_1:
	  fabric_xactors_to_slaves_1_f_wr_data_D_IN =
	      fabric_xactors_from_masters_0_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_2:
	  fabric_xactors_to_slaves_1_f_wr_data_D_IN =
	      fabric_xactors_from_masters_1_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_1_f_wr_data_enq_1__SEL_3:
	  fabric_xactors_to_slaves_1_f_wr_data_D_IN =
	      fabric_xactors_from_masters_2_f_wr_data_D_OUT;
      default: fabric_xactors_to_slaves_1_f_wr_data_D_IN =
		   41'h0AAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_1_f_wr_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 ;
  assign fabric_xactors_to_slaves_1_f_wr_data_DEQ =
	     fabric_xactors_to_slaves_1_f_wr_data_EMPTY_N &&
	     boot_mem_master_WREADY ;
  assign fabric_xactors_to_slaves_1_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_1_f_wr_resp
  assign fabric_xactors_to_slaves_1_f_wr_resp_D_IN =
	     { boot_mem_master_BRESP, boot_mem_master_BID } ;
  assign fabric_xactors_to_slaves_1_f_wr_resp_ENQ =
	     boot_mem_master_BVALID &&
	     fabric_xactors_to_slaves_1_f_wr_resp_FULL_N ;
  assign fabric_xactors_to_slaves_1_f_wr_resp_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 ;
  assign fabric_xactors_to_slaves_1_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_2_f_rd_addr
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 or
	  fabric_xactors_from_masters_0_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 or
	  fabric_xactors_from_masters_1_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 or
	  fabric_xactors_from_masters_2_f_rd_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2:
	  fabric_xactors_to_slaves_2_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8:
	  fabric_xactors_to_slaves_2_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14:
	  fabric_xactors_to_slaves_2_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
      default: fabric_xactors_to_slaves_2_f_rd_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_2_f_rd_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 ;
  assign fabric_xactors_to_slaves_2_f_rd_addr_DEQ =
	     fabric_xactors_to_slaves_2_f_rd_addr_EMPTY_N &&
	     uart_s_xactor_f_rd_addr_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_2_f_rd_data
  assign fabric_xactors_to_slaves_2_f_rd_data_D_IN =
	     uart_s_xactor_f_rd_data_D_OUT ;
  assign fabric_xactors_to_slaves_2_f_rd_data_ENQ =
	     uart_s_xactor_f_rd_data_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_rd_data_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_rd_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  assign fabric_xactors_to_slaves_2_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_2_f_wr_addr
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 or
	  fabric_xactors_from_masters_0_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 or
	  fabric_xactors_from_masters_1_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 or
	  fabric_xactors_from_masters_2_f_wr_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2:
	  fabric_xactors_to_slaves_2_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8:
	  fabric_xactors_to_slaves_2_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14:
	  fabric_xactors_to_slaves_2_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
      default: fabric_xactors_to_slaves_2_f_wr_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_2_f_wr_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ;
  assign fabric_xactors_to_slaves_2_f_wr_addr_DEQ =
	     fabric_xactors_to_slaves_2_f_wr_addr_EMPTY_N &&
	     uart_s_xactor_f_wr_addr_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_2_f_wr_data
  always@(MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_1 or
	  fabric_xactors_from_masters_0_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_2 or
	  fabric_xactors_from_masters_1_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_3 or
	  fabric_xactors_from_masters_2_f_wr_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_1:
	  fabric_xactors_to_slaves_2_f_wr_data_D_IN =
	      fabric_xactors_from_masters_0_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_2:
	  fabric_xactors_to_slaves_2_f_wr_data_D_IN =
	      fabric_xactors_from_masters_1_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_2_f_wr_data_enq_1__SEL_3:
	  fabric_xactors_to_slaves_2_f_wr_data_D_IN =
	      fabric_xactors_from_masters_2_f_wr_data_D_OUT;
      default: fabric_xactors_to_slaves_2_f_wr_data_D_IN =
		   41'h0AAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_2_f_wr_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 ;
  assign fabric_xactors_to_slaves_2_f_wr_data_DEQ =
	     fabric_xactors_to_slaves_2_f_wr_data_EMPTY_N &&
	     uart_s_xactor_f_wr_data_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_2_f_wr_resp
  assign fabric_xactors_to_slaves_2_f_wr_resp_D_IN =
	     uart_s_xactor_f_wr_resp_D_OUT ;
  assign fabric_xactors_to_slaves_2_f_wr_resp_ENQ =
	     uart_s_xactor_f_wr_resp_EMPTY_N &&
	     fabric_xactors_to_slaves_2_f_wr_resp_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_wr_resp_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 ;
  assign fabric_xactors_to_slaves_2_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_3_f_rd_addr
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 or
	  fabric_xactors_from_masters_0_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 or
	  fabric_xactors_from_masters_1_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 or
	  fabric_xactors_from_masters_2_f_rd_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3:
	  fabric_xactors_to_slaves_3_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9:
	  fabric_xactors_to_slaves_3_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15:
	  fabric_xactors_to_slaves_3_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
      default: fabric_xactors_to_slaves_3_f_rd_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_3_f_rd_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 ;
  assign fabric_xactors_to_slaves_3_f_rd_addr_DEQ =
	     fabric_xactors_to_slaves_3_f_rd_addr_EMPTY_N &&
	     clint_s_xactor_f_rd_addr_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_3_f_rd_data
  assign fabric_xactors_to_slaves_3_f_rd_data_D_IN =
	     clint_s_xactor_f_rd_data_D_OUT ;
  assign fabric_xactors_to_slaves_3_f_rd_data_ENQ =
	     clint_s_xactor_f_rd_data_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_rd_data_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_rd_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ;
  assign fabric_xactors_to_slaves_3_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_3_f_wr_addr
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 or
	  fabric_xactors_from_masters_0_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 or
	  fabric_xactors_from_masters_1_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 or
	  fabric_xactors_from_masters_2_f_wr_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3:
	  fabric_xactors_to_slaves_3_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9:
	  fabric_xactors_to_slaves_3_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15:
	  fabric_xactors_to_slaves_3_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
      default: fabric_xactors_to_slaves_3_f_wr_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_3_f_wr_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ;
  assign fabric_xactors_to_slaves_3_f_wr_addr_DEQ =
	     fabric_xactors_to_slaves_3_f_wr_addr_EMPTY_N &&
	     clint_s_xactor_f_wr_addr_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_3_f_wr_data
  always@(MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_1 or
	  fabric_xactors_from_masters_0_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_2 or
	  fabric_xactors_from_masters_1_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_3 or
	  fabric_xactors_from_masters_2_f_wr_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_1:
	  fabric_xactors_to_slaves_3_f_wr_data_D_IN =
	      fabric_xactors_from_masters_0_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_2:
	  fabric_xactors_to_slaves_3_f_wr_data_D_IN =
	      fabric_xactors_from_masters_1_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_3_f_wr_data_enq_1__SEL_3:
	  fabric_xactors_to_slaves_3_f_wr_data_D_IN =
	      fabric_xactors_from_masters_2_f_wr_data_D_OUT;
      default: fabric_xactors_to_slaves_3_f_wr_data_D_IN =
		   41'h0AAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_3_f_wr_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 ;
  assign fabric_xactors_to_slaves_3_f_wr_data_DEQ =
	     fabric_xactors_to_slaves_3_f_wr_data_EMPTY_N &&
	     clint_s_xactor_f_wr_data_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_3_f_wr_resp
  assign fabric_xactors_to_slaves_3_f_wr_resp_D_IN =
	     clint_s_xactor_f_wr_resp_D_OUT ;
  assign fabric_xactors_to_slaves_3_f_wr_resp_ENQ =
	     clint_s_xactor_f_wr_resp_EMPTY_N &&
	     fabric_xactors_to_slaves_3_f_wr_resp_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_wr_resp_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 ;
  assign fabric_xactors_to_slaves_3_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_4_f_rd_addr
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 or
	  fabric_xactors_from_masters_0_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 or
	  fabric_xactors_from_masters_1_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 or
	  fabric_xactors_from_masters_2_f_rd_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4:
	  fabric_xactors_to_slaves_4_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10:
	  fabric_xactors_to_slaves_4_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16:
	  fabric_xactors_to_slaves_4_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
      default: fabric_xactors_to_slaves_4_f_rd_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_4_f_rd_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 ;
  assign fabric_xactors_to_slaves_4_f_rd_addr_DEQ =
	     fabric_xactors_to_slaves_4_f_rd_addr_EMPTY_N &&
	     signature_slave_ARREADY ;
  assign fabric_xactors_to_slaves_4_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_4_f_rd_data
  assign fabric_xactors_to_slaves_4_f_rd_data_D_IN =
	     { signature_slave_RRESP,
	       signature_slave_RDATA,
	       signature_slave_RLAST,
	       signature_slave_RID } ;
  assign fabric_xactors_to_slaves_4_f_rd_data_ENQ =
	     signature_slave_RVALID &&
	     fabric_xactors_to_slaves_4_f_rd_data_FULL_N ;
  assign fabric_xactors_to_slaves_4_f_rd_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ;
  assign fabric_xactors_to_slaves_4_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_4_f_wr_addr
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 or
	  fabric_xactors_from_masters_0_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 or
	  fabric_xactors_from_masters_1_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 or
	  fabric_xactors_from_masters_2_f_wr_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4:
	  fabric_xactors_to_slaves_4_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10:
	  fabric_xactors_to_slaves_4_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16:
	  fabric_xactors_to_slaves_4_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
      default: fabric_xactors_to_slaves_4_f_wr_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_4_f_wr_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ;
  assign fabric_xactors_to_slaves_4_f_wr_addr_DEQ =
	     fabric_xactors_to_slaves_4_f_wr_addr_EMPTY_N &&
	     signature_slave_AWREADY ;
  assign fabric_xactors_to_slaves_4_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_4_f_wr_data
  always@(MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_1 or
	  fabric_xactors_from_masters_0_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_2 or
	  fabric_xactors_from_masters_1_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_3 or
	  fabric_xactors_from_masters_2_f_wr_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_1:
	  fabric_xactors_to_slaves_4_f_wr_data_D_IN =
	      fabric_xactors_from_masters_0_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_2:
	  fabric_xactors_to_slaves_4_f_wr_data_D_IN =
	      fabric_xactors_from_masters_1_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_4_f_wr_data_enq_1__SEL_3:
	  fabric_xactors_to_slaves_4_f_wr_data_D_IN =
	      fabric_xactors_from_masters_2_f_wr_data_D_OUT;
      default: fabric_xactors_to_slaves_4_f_wr_data_D_IN =
		   41'h0AAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_4_f_wr_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 ;
  assign fabric_xactors_to_slaves_4_f_wr_data_DEQ =
	     fabric_xactors_to_slaves_4_f_wr_data_EMPTY_N &&
	     signature_slave_WREADY ;
  assign fabric_xactors_to_slaves_4_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_4_f_wr_resp
  assign fabric_xactors_to_slaves_4_f_wr_resp_D_IN =
	     { signature_slave_BRESP, signature_slave_BID } ;
  assign fabric_xactors_to_slaves_4_f_wr_resp_ENQ =
	     signature_slave_BVALID &&
	     fabric_xactors_to_slaves_4_f_wr_resp_FULL_N ;
  assign fabric_xactors_to_slaves_4_f_wr_resp_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 ;
  assign fabric_xactors_to_slaves_4_f_wr_resp_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_5_f_rd_addr
  always@(WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 or
	  fabric_xactors_from_masters_0_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 or
	  fabric_xactors_from_masters_1_f_rd_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 or
	  fabric_xactors_from_masters_2_f_rd_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5:
	  fabric_xactors_to_slaves_5_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_0_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11:
	  fabric_xactors_to_slaves_5_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_1_f_rd_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17:
	  fabric_xactors_to_slaves_5_f_rd_addr_D_IN =
	      fabric_xactors_from_masters_2_f_rd_addr_D_OUT;
      default: fabric_xactors_to_slaves_5_f_rd_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_5_f_rd_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 ;
  assign fabric_xactors_to_slaves_5_f_rd_addr_DEQ =
	     fabric_xactors_to_slaves_5_f_rd_addr_EMPTY_N &&
	     err_slave_s_xactor_f_rd_addr_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_rd_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_5_f_rd_data
  assign fabric_xactors_to_slaves_5_f_rd_data_D_IN =
	     err_slave_s_xactor_f_rd_data_D_OUT ;
  assign fabric_xactors_to_slaves_5_f_rd_data_ENQ =
	     err_slave_s_xactor_f_rd_data_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_rd_data_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_rd_data_DEQ =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ;
  assign fabric_xactors_to_slaves_5_f_rd_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_5_f_wr_addr
  always@(WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 or
	  fabric_xactors_from_masters_0_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 or
	  fabric_xactors_from_masters_1_f_wr_addr_D_OUT or
	  WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 or
	  fabric_xactors_from_masters_2_f_wr_addr_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5:
	  fabric_xactors_to_slaves_5_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_0_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11:
	  fabric_xactors_to_slaves_5_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_1_f_wr_addr_D_OUT;
      WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17:
	  fabric_xactors_to_slaves_5_f_wr_addr_D_IN =
	      fabric_xactors_from_masters_2_f_wr_addr_D_OUT;
      default: fabric_xactors_to_slaves_5_f_wr_addr_D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_5_f_wr_addr_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ;
  assign fabric_xactors_to_slaves_5_f_wr_addr_DEQ =
	     fabric_xactors_to_slaves_5_f_wr_addr_EMPTY_N &&
	     err_slave_s_xactor_f_wr_addr_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_wr_addr_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_5_f_wr_data
  always@(MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_1 or
	  fabric_xactors_from_masters_0_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_2 or
	  fabric_xactors_from_masters_1_f_wr_data_D_OUT or
	  MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_3 or
	  fabric_xactors_from_masters_2_f_wr_data_D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_1:
	  fabric_xactors_to_slaves_5_f_wr_data_D_IN =
	      fabric_xactors_from_masters_0_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_2:
	  fabric_xactors_to_slaves_5_f_wr_data_D_IN =
	      fabric_xactors_from_masters_1_f_wr_data_D_OUT;
      MUX_fabric_xactors_to_slaves_5_f_wr_data_enq_1__SEL_3:
	  fabric_xactors_to_slaves_5_f_wr_data_D_IN =
	      fabric_xactors_from_masters_2_f_wr_data_D_OUT;
      default: fabric_xactors_to_slaves_5_f_wr_data_D_IN =
		   41'h0AAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign fabric_xactors_to_slaves_5_f_wr_data_ENQ =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 ;
  assign fabric_xactors_to_slaves_5_f_wr_data_DEQ =
	     fabric_xactors_to_slaves_5_f_wr_data_EMPTY_N &&
	     err_slave_s_xactor_f_wr_data_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_wr_data_CLR = 1'b0 ;

  // submodule fabric_xactors_to_slaves_5_f_wr_resp
  assign fabric_xactors_to_slaves_5_f_wr_resp_D_IN =
	     err_slave_s_xactor_f_wr_resp_D_OUT ;
  assign fabric_xactors_to_slaves_5_f_wr_resp_ENQ =
	     err_slave_s_xactor_f_wr_resp_EMPTY_N &&
	     fabric_xactors_to_slaves_5_f_wr_resp_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_wr_resp_DEQ =
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 ;
  assign fabric_xactors_to_slaves_5_f_wr_resp_CLR = 1'b0 ;

  // submodule signature
  assign signature_master_ARREADY =
	     fabric_xactors_from_masters_0_f_rd_addr_FULL_N ;
  assign signature_master_AWREADY =
	     fabric_xactors_from_masters_0_f_wr_addr_FULL_N ;
  assign signature_master_BID =
	     fabric_xactors_from_masters_0_f_wr_resp_D_OUT[3:0] ;
  assign signature_master_BRESP =
	     fabric_xactors_from_masters_0_f_wr_resp_D_OUT[5:4] ;
  assign signature_master_BVALID =
	     fabric_xactors_from_masters_0_f_wr_resp_EMPTY_N ;
  assign signature_master_RDATA =
	     fabric_xactors_from_masters_0_f_rd_data_D_OUT[36:5] ;
  assign signature_master_RID =
	     fabric_xactors_from_masters_0_f_rd_data_D_OUT[3:0] ;
  assign signature_master_RLAST =
	     fabric_xactors_from_masters_0_f_rd_data_D_OUT[4] ;
  assign signature_master_RRESP =
	     fabric_xactors_from_masters_0_f_rd_data_D_OUT[38:37] ;
  assign signature_master_RVALID =
	     fabric_xactors_from_masters_0_f_rd_data_EMPTY_N ;
  assign signature_master_WREADY =
	     fabric_xactors_from_masters_0_f_wr_data_FULL_N ;
  assign signature_slave_ARADDR =
	     fabric_xactors_to_slaves_4_f_rd_addr_D_OUT[51:20] ;
  assign signature_slave_ARBURST =
	     fabric_xactors_to_slaves_4_f_rd_addr_D_OUT[5:4] ;
  assign signature_slave_ARID =
	     fabric_xactors_to_slaves_4_f_rd_addr_D_OUT[3:0] ;
  assign signature_slave_ARLEN =
	     fabric_xactors_to_slaves_4_f_rd_addr_D_OUT[13:6] ;
  assign signature_slave_ARPROT =
	     fabric_xactors_to_slaves_4_f_rd_addr_D_OUT[19:17] ;
  assign signature_slave_ARSIZE =
	     fabric_xactors_to_slaves_4_f_rd_addr_D_OUT[16:14] ;
  assign signature_slave_ARVALID =
	     fabric_xactors_to_slaves_4_f_rd_addr_EMPTY_N ;
  assign signature_slave_AWADDR =
	     fabric_xactors_to_slaves_4_f_wr_addr_D_OUT[51:20] ;
  assign signature_slave_AWBURST =
	     fabric_xactors_to_slaves_4_f_wr_addr_D_OUT[5:4] ;
  assign signature_slave_AWID =
	     fabric_xactors_to_slaves_4_f_wr_addr_D_OUT[3:0] ;
  assign signature_slave_AWLEN =
	     fabric_xactors_to_slaves_4_f_wr_addr_D_OUT[16:9] ;
  assign signature_slave_AWPROT =
	     fabric_xactors_to_slaves_4_f_wr_addr_D_OUT[19:17] ;
  assign signature_slave_AWSIZE =
	     fabric_xactors_to_slaves_4_f_wr_addr_D_OUT[8:6] ;
  assign signature_slave_AWVALID =
	     fabric_xactors_to_slaves_4_f_wr_addr_EMPTY_N ;
  assign signature_slave_BREADY =
	     fabric_xactors_to_slaves_4_f_wr_resp_FULL_N ;
  assign signature_slave_RREADY =
	     fabric_xactors_to_slaves_4_f_rd_data_FULL_N ;
  assign signature_slave_WDATA =
	     fabric_xactors_to_slaves_4_f_wr_data_D_OUT[40:9] ;
  assign signature_slave_WID =
	     fabric_xactors_to_slaves_4_f_wr_data_D_OUT[4:1] ;
  assign signature_slave_WLAST =
	     fabric_xactors_to_slaves_4_f_wr_data_D_OUT[0] ;
  assign signature_slave_WSTRB =
	     fabric_xactors_to_slaves_4_f_wr_data_D_OUT[8:5] ;
  assign signature_slave_WVALID =
	     fabric_xactors_to_slaves_4_f_wr_data_EMPTY_N ;

  // submodule uart_s_xactor_f_rd_addr
  assign uart_s_xactor_f_rd_addr_D_IN =
	     fabric_xactors_to_slaves_2_f_rd_addr_D_OUT ;
  assign uart_s_xactor_f_rd_addr_ENQ =
	     fabric_xactors_to_slaves_2_f_rd_addr_EMPTY_N &&
	     uart_s_xactor_f_rd_addr_FULL_N ;
  assign uart_s_xactor_f_rd_addr_DEQ = CAN_FIRE_RL_uart_capture_read_request ;
  assign uart_s_xactor_f_rd_addr_CLR = 1'b0 ;

  // submodule uart_s_xactor_f_rd_data
  assign uart_s_xactor_f_rd_data_D_IN =
	     WILL_FIRE_RL_uart_capture_read_request ?
	       MUX_uart_s_xactor_f_rd_data_enq_1__VAL_1 :
	       MUX_uart_s_xactor_f_rd_data_enq_1__VAL_2 ;
  assign uart_s_xactor_f_rd_data_ENQ =
	     WILL_FIRE_RL_uart_capture_read_request ||
	     WILL_FIRE_RL_uart_burst_reads ;
  assign uart_s_xactor_f_rd_data_DEQ =
	     fabric_xactors_to_slaves_2_f_rd_data_FULL_N &&
	     uart_s_xactor_f_rd_data_EMPTY_N ;
  assign uart_s_xactor_f_rd_data_CLR = 1'b0 ;

  // submodule uart_s_xactor_f_wr_addr
  assign uart_s_xactor_f_wr_addr_D_IN =
	     fabric_xactors_to_slaves_2_f_wr_addr_D_OUT ;
  assign uart_s_xactor_f_wr_addr_ENQ =
	     fabric_xactors_to_slaves_2_f_wr_addr_EMPTY_N &&
	     uart_s_xactor_f_wr_addr_FULL_N ;
  assign uart_s_xactor_f_wr_addr_DEQ =
	     CAN_FIRE_RL_uart_capture_write_request ;
  assign uart_s_xactor_f_wr_addr_CLR = 1'b0 ;

  // submodule uart_s_xactor_f_wr_data
  assign uart_s_xactor_f_wr_data_D_IN =
	     fabric_xactors_to_slaves_2_f_wr_data_D_OUT ;
  assign uart_s_xactor_f_wr_data_ENQ =
	     fabric_xactors_to_slaves_2_f_wr_data_EMPTY_N &&
	     uart_s_xactor_f_wr_data_FULL_N ;
  assign uart_s_xactor_f_wr_data_DEQ =
	     WILL_FIRE_RL_uart_burst_writes ||
	     WILL_FIRE_RL_uart_capture_write_request ;
  assign uart_s_xactor_f_wr_data_CLR = 1'b0 ;

  // submodule uart_s_xactor_f_wr_resp
  assign uart_s_xactor_f_wr_resp_D_IN =
	     MUX_uart_s_xactor_f_wr_resp_enq_1__SEL_1 ?
	       MUX_uart_s_xactor_f_wr_resp_enq_1__VAL_1 :
	       MUX_uart_s_xactor_f_wr_resp_enq_1__VAL_2 ;
  assign uart_s_xactor_f_wr_resp_ENQ =
	     WILL_FIRE_RL_uart_capture_write_request &&
	     uart_s_xactor_f_wr_data_D_OUT[0] ||
	     WILL_FIRE_RL_uart_burst_writes &&
	     uart_s_xactor_f_wr_data_D_OUT[0] ;
  assign uart_s_xactor_f_wr_resp_DEQ =
	     fabric_xactors_to_slaves_2_f_wr_resp_FULL_N &&
	     uart_s_xactor_f_wr_resp_EMPTY_N ;
  assign uart_s_xactor_f_wr_resp_CLR = 1'b0 ;

  // submodule uart_user_ifc_uart_baudGen_rBaudCounter
  assign uart_user_ifc_uart_baudGen_rBaudCounter_DATA_A = 16'd1 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_DATA_B = 16'h0 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_DATA_C = 16'h0 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_DATA_F = 16'd0 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_ADDA =
	     uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_ADDB = 1'b0 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_SETC = 1'b0 ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_SETF =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;

  // submodule uart_user_ifc_uart_baudGen_rBaudTickCounter
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_A = 3'd1 ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_B = 3'h0 ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_C = 3'h0 ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_DATA_F = 3'h0 ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_ADDA =
	     CAN_FIRE_RL_uart_user_ifc_uart_baudGen_count_baudtick_16x ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_ADDB = 1'b0 ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_SETC = 1'b0 ;
  assign uart_user_ifc_uart_baudGen_rBaudTickCounter_SETF = 1'b0 ;

  // submodule uart_user_ifc_uart_fifoRecv
  assign uart_user_ifc_uart_fifoRecv_D_IN =
	     { uart_user_ifc_uart_vrRecvBuffer_7,
	       uart_user_ifc_uart_vrRecvBuffer_6,
	       uart_user_ifc_uart_vrRecvBuffer_5,
	       uart_user_ifc_uart_vrRecvBuffer_4,
	       uart_user_ifc_uart_vrRecvBuffer_3,
	       uart_user_ifc_uart_vrRecvBuffer_2,
	       uart_user_ifc_uart_vrRecvBuffer_1,
	       uart_user_ifc_uart_vrRecvBuffer_0 } ;
  assign uart_user_ifc_uart_fifoRecv_ENQ =
	     CAN_FIRE_RL_uart_user_ifc_uart_receive_stop_last_bit ;
  assign uart_user_ifc_uart_fifoRecv_DEQ =
	     uart_user_ifc_uart_fifoRecv_r_deq_whas ;
  assign uart_user_ifc_uart_fifoRecv_CLR = 1'b0 ;

  // submodule uart_user_ifc_uart_fifoXmit
  assign uart_user_ifc_uart_fifoXmit_D_IN =
	     uart_s_xactor_f_wr_data_D_OUT[16:9] ;
  assign uart_user_ifc_uart_fifoXmit_ENQ =
	     uart_user_ifc_uart_fifoXmit_r_enq_whas ;
  assign uart_user_ifc_uart_fifoXmit_DEQ =
	     CAN_FIRE_RL_uart_user_ifc_uart_transmit_buffer_load ;
  assign uart_user_ifc_uart_fifoXmit_CLR = 1'b0 ;

  // remaining internal signals
  assign _dor1fabric_v_f_rd_mis_0_EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master ;
  assign _dor1fabric_v_f_rd_mis_1_EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 ;
  assign _dor1fabric_v_f_rd_mis_2_EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 ;
  assign _dor1fabric_v_f_rd_mis_3_EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 ;
  assign _dor1fabric_v_f_rd_mis_4_EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 ;
  assign _dor1fabric_v_f_rd_mis_5_EN_deq =
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 ||
	     WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 ;
  assign _dor1fabric_v_f_wrd_sjs_0_EN_deq =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data ;
  assign _dor1fabric_v_f_wrd_sjs_1_EN_deq =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 ;
  assign _dor1fabric_v_f_wrd_sjs_2_EN_deq =
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 ||
	     WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 ;
  assign _dor2uart_user_ifc_uart_pwXmitCellCountReset_EN_wset =
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit2 ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_stop_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_parity_bit ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_wait_1_bit_cell_time ||
	     WILL_FIRE_RL_uart_user_ifc_uart_transmit_send_start_bit ;
  assign _theResult_____2__h77214 =
	     (clint_s_xactor_f_rd_addr_D_OUT[15:14] == 2'd0) ?
	       temp___1__h77973 :
	       temp__h77213 ;
  assign _theResult_____2__h87205 =
	     (clint_rg_rdpacket[15:14] == 2'd0) ?
	       temp___1__h87773 :
	       temp__h87204 ;
  assign _theResult___snd__h77385 =
	     (clint_s_xactor_f_rd_addr_D_OUT[35:20] == 16'h0) ?
	       temp___1__h88525 :
	       _theResult___snd__h77452 ;
  assign _theResult___snd__h77452 =
	     (clint_s_xactor_f_rd_addr_D_OUT[35:20] >= 16'h4000 &&
	      clint_s_xactor_f_rd_addr_D_OUT[35:20] <= 16'd16391) ?
	       clint_clint_rgmtimecmp :
	       _theResult___snd__h77519 ;
  assign _theResult___snd__h77519 =
	     (clint_s_xactor_f_rd_addr_D_OUT[35:20] >= 16'hBFF8 &&
	      clint_s_xactor_f_rd_addr_D_OUT[35:20] <= 16'd49151) ?
	       clint_clint_rgmtime :
	       64'd0 ;
  assign _theResult___snd__h88530 =
	     (clint_rg_rdpacket[35:20] == 16'h0) ?
	       temp___1__h88525 :
	       _theResult___snd__h96266 ;
  assign _theResult___snd__h96266 =
	     (clint_rg_rdpacket[35:20] >= 16'h4000 &&
	      clint_rg_rdpacket[35:20] <= 16'd16391) ?
	       clint_clint_rgmtimecmp :
	       _theResult___snd__h96333 ;
  assign _theResult___snd__h96333 =
	     (clint_rg_rdpacket[35:20] >= 16'hBFF8 &&
	      clint_rg_rdpacket[35:20] <= 16'd49151) ?
	       clint_clint_rgmtime :
	       64'd0 ;
  assign a__h71679 =
	     { 4'd0,
	       x_wget__h71046,
	       4'd0,
	       x_wget__h71046,
	       4'd0,
	       x_wget__h71046,
	       4'd0,
	       x_wget__h71046 } ;
  assign a__h71685 =
	     uart_user_ifc_uart_fifoRecv_EMPTY_N ?
	       {4{uart_user_ifc_uart_fifoRecv_D_OUT}} :
	       32'd0 ;
  assign a__h73418 = {2{uart_user_ifc_baud_value}} ;
  assign datamask__h97327 =
	     CASE_clint_s_xactor_f_wr_addrD_OUT_BITS_7_TO__ETC__q1 &
	     mask__h97326 ;
  assign err_slave_rg_readburst_counter_940_EQ_err_slav_ETC___d2942 =
	     err_slave_rg_readburst_counter == err_slave_rg_read_length ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <
	     32'h00001000 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <=
	     32'h00010FFF ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1033 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <
	     32'h00011300 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1035 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <=
	     32'h00011340 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1038 =
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010) &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1033 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1035 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1059 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <
	     32'h02000000 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1061 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <=
	     32'h020BFFFF ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1064 =
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1033 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1035) &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1059 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1061 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1086 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <
	     32'h00020000 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1088 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <=
	     32'h0002000C ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1091 =
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1033 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1035) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1059 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1061) &&
	     !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1086 &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1088 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1093 =
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010) &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1091 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1115 =
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1033 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1035) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1059 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1061) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1086 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1088) ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1117 =
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981) &&
	     (fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1008 ||
	      !fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1010) &&
	     fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d1115 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d979 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <
	     32'h80000000 ;
  assign fabric_xactors_from_masters_0_f_rd_addr_first__ETC___d981 =
	     fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20] <=
	     32'h8FFFFFFF ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d108 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <
	     32'h00011300 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d110 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <=
	     32'h00011340 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d113 =
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70) &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d108 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d110 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d149 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <
	     32'h02000000 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d151 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <=
	     32'h020BFFFF ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d154 =
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d108 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d110) &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d149 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d151 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <
	     32'h80000000 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d191 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <
	     32'h00020000 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d193 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <=
	     32'h0002000C ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d196 =
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d108 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d110) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d149 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d151) &&
	     !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d191 &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d193 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d198 =
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70) &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d196 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <=
	     32'h8FFFFFFF ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d235 =
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d108 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d110) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d149 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d151) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d191 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d193) ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d237 =
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d18 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d20) &&
	     (fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68 ||
	      !fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70) &&
	     fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d235 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d68 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <
	     32'h00001000 ;
  assign fabric_xactors_from_masters_0_f_wr_addr_first__ETC___d70 =
	     fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20] <=
	     32'h00010FFF ;
  assign fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d104 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_2_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_2_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_2_FULL_N &&
	     fabric_v_f_wrd_sjs_0_FULL_N &&
	     fabric_v_f_wrd_mis_2_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d14 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_xactors_to_slaves_0_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_0_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_0_FULL_N &&
	     fabric_v_f_wr_sjs_0_FULL_N &&
	     fabric_v_f_wrd_mis_0_FULL_N &&
	     fabric_v_f_wrd_sjs_0_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d145 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_3_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_3_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_3_FULL_N &&
	     fabric_v_f_wrd_sjs_0_FULL_N &&
	     fabric_v_f_wrd_mis_3_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d187 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_4_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_4_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_4_FULL_N &&
	     fabric_v_f_wrd_sjs_0_FULL_N &&
	     fabric_v_f_wrd_mis_4_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d230 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_5_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_5_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_5_FULL_N &&
	     fabric_v_f_wrd_sjs_0_FULL_N &&
	     fabric_v_f_wrd_mis_5_FULL_N ;
  assign fabric_xactors_from_masters_0_f_wr_data_i_notE_ETC___d64 =
	     fabric_xactors_from_masters_0_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_0_FULL_N &&
	     fabric_xactors_to_slaves_1_f_wr_addr_FULL_N &&
	     fabric_xactors_to_slaves_1_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_1_FULL_N &&
	     fabric_v_f_wrd_sjs_0_FULL_N &&
	     fabric_v_f_wrd_mis_1_FULL_N ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <
	     32'h80000000 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <=
	     32'h8FFFFFFF ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <
	     32'h00001000 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <=
	     32'h00010FFF ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1186 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <
	     32'h00011300 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1188 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <=
	     32'h00011340 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1191 =
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166) &&
	     !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1186 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1188 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1209 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <
	     32'h02000000 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1211 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <=
	     32'h020BFFFF ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1214 =
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1186 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1188) &&
	     !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1209 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1211 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1233 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <
	     32'h00020000 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1235 =
	     fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20] <=
	     32'h0002000C ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1238 =
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1186 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1188) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1209 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1211) &&
	     !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1233 &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1235 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1240 =
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166) &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1238 ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1259 =
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1186 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1188) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1209 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1211) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1233 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1235) ;
  assign fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1261 =
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1138 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1140) &&
	     (fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1164 ||
	      !fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1166) &&
	     fabric_xactors_from_masters_1_f_rd_addr_first__ETC___d1259 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <
	     32'h80000000 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <=
	     32'h8FFFFFFF ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <
	     32'h00001000 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <=
	     32'h00010FFF ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d353 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <
	     32'h00011300 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d355 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <=
	     32'h00011340 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d358 =
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320) &&
	     !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d353 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d355 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d389 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <
	     32'h02000000 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d391 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <=
	     32'h020BFFFF ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d394 =
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d353 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d355) &&
	     !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d389 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d391 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d426 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <
	     32'h00020000 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d428 =
	     fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20] <=
	     32'h0002000C ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d431 =
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d353 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d355) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d389 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d391) &&
	     !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d426 &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d428 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d433 =
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320) &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d431 ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d465 =
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d353 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d355) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d389 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d391) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d426 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d428) ;
  assign fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d467 =
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d273 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d275) &&
	     (fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d318 ||
	      !fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d320) &&
	     fabric_xactors_from_masters_1_f_wr_addr_first__ETC___d465 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <
	     32'h80000000 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <=
	     32'h8FFFFFFF ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <
	     32'h00001000 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <=
	     32'h00010FFF ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1330 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <
	     32'h00011300 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1332 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <=
	     32'h00011340 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1335 =
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310) &&
	     !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1330 &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1332 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1353 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <
	     32'h02000000 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1355 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <=
	     32'h020BFFFF ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1358 =
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1330 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1332) &&
	     !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1353 &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1355 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1377 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <
	     32'h00020000 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1379 =
	     fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20] <=
	     32'h0002000C ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1382 =
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1330 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1332) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1353 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1355) &&
	     !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1377 &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1379 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1384 =
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310) &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1382 ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1403 =
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1330 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1332) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1353 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1355) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1377 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1379) ;
  assign fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1405 =
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1282 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1284) &&
	     (fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1308 ||
	      !fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1310) &&
	     fabric_xactors_from_masters_2_f_rd_addr_first__ETC___d1403 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <
	     32'h80000000 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <=
	     32'h8FFFFFFF ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <
	     32'h00001000 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <=
	     32'h00010FFF ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d582 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <
	     32'h00011300 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d584 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <=
	     32'h00011340 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d587 =
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549) &&
	     !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d582 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d584 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d618 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <
	     32'h02000000 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d620 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <=
	     32'h020BFFFF ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d623 =
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d582 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d584) &&
	     !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d618 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d620 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d655 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <
	     32'h00020000 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d657 =
	     fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20] <=
	     32'h0002000C ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d660 =
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d582 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d584) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d618 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d620) &&
	     !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d655 &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d657 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d662 =
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549) &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d660 ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d694 =
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d582 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d584) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d618 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d620) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d655 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d657) ;
  assign fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d696 =
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d502 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d504) &&
	     (fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d547 ||
	      !fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d549) &&
	     fabric_xactors_from_masters_2_f_wr_addr_first__ETC___d694 ;
  assign fabric_xactors_to_slaves_0_f_wr_data_i_notFull_ETC___d269 =
	     fabric_xactors_to_slaves_0_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_0_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_FULL_N &&
	     fabric_v_f_wrd_mis_0_FULL_N &&
	     fabric_v_f_wrd_sjs_1_FULL_N ;
  assign fabric_xactors_to_slaves_0_f_wr_data_i_notFull_ETC___d498 =
	     fabric_xactors_to_slaves_0_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_0_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_FULL_N &&
	     fabric_v_f_wrd_mis_0_FULL_N &&
	     fabric_v_f_wrd_sjs_2_FULL_N ;
  assign fabric_xactors_to_slaves_1_f_wr_data_i_notFull_ETC___d314 =
	     fabric_xactors_to_slaves_1_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_1_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_FULL_N &&
	     fabric_v_f_wrd_mis_1_FULL_N &&
	     fabric_v_f_wrd_sjs_1_FULL_N ;
  assign fabric_xactors_to_slaves_1_f_wr_data_i_notFull_ETC___d543 =
	     fabric_xactors_to_slaves_1_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_1_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_FULL_N &&
	     fabric_v_f_wrd_mis_1_FULL_N &&
	     fabric_v_f_wrd_sjs_2_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_wr_data_i_notFull_ETC___d349 =
	     fabric_xactors_to_slaves_2_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_2_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_FULL_N &&
	     fabric_v_f_wrd_mis_2_FULL_N &&
	     fabric_v_f_wrd_sjs_1_FULL_N ;
  assign fabric_xactors_to_slaves_2_f_wr_data_i_notFull_ETC___d578 =
	     fabric_xactors_to_slaves_2_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_2_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_FULL_N &&
	     fabric_v_f_wrd_mis_2_FULL_N &&
	     fabric_v_f_wrd_sjs_2_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_wr_data_i_notFull_ETC___d385 =
	     fabric_xactors_to_slaves_3_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_3_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_FULL_N &&
	     fabric_v_f_wrd_mis_3_FULL_N &&
	     fabric_v_f_wrd_sjs_1_FULL_N ;
  assign fabric_xactors_to_slaves_3_f_wr_data_i_notFull_ETC___d614 =
	     fabric_xactors_to_slaves_3_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_3_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_FULL_N &&
	     fabric_v_f_wrd_mis_3_FULL_N &&
	     fabric_v_f_wrd_sjs_2_FULL_N ;
  assign fabric_xactors_to_slaves_4_f_wr_data_i_notFull_ETC___d422 =
	     fabric_xactors_to_slaves_4_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_4_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_FULL_N &&
	     fabric_v_f_wrd_mis_4_FULL_N &&
	     fabric_v_f_wrd_sjs_1_FULL_N ;
  assign fabric_xactors_to_slaves_4_f_wr_data_i_notFull_ETC___d651 =
	     fabric_xactors_to_slaves_4_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_4_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_FULL_N &&
	     fabric_v_f_wrd_mis_4_FULL_N &&
	     fabric_v_f_wrd_sjs_2_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_wr_data_i_notFull_ETC___d460 =
	     fabric_xactors_to_slaves_5_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_5_FULL_N &&
	     fabric_xactors_from_masters_1_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_1_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_1_FULL_N &&
	     fabric_v_f_wrd_mis_5_FULL_N &&
	     fabric_v_f_wrd_sjs_1_FULL_N ;
  assign fabric_xactors_to_slaves_5_f_wr_data_i_notFull_ETC___d689 =
	     fabric_xactors_to_slaves_5_f_wr_data_FULL_N &&
	     fabric_v_f_wr_mis_5_FULL_N &&
	     fabric_xactors_from_masters_2_f_wr_addr_EMPTY_N &&
	     fabric_xactors_from_masters_2_f_wr_data_EMPTY_N &&
	     fabric_v_f_wr_sjs_2_FULL_N &&
	     fabric_v_f_wrd_mis_5_FULL_N &&
	     fabric_v_f_wrd_sjs_2_FULL_N ;
  assign mask__h97326 = mask__h97323 << shift_amt__h97325 ;
  assign notmask__h97328 = ~mask__h97326 ;
  assign shift_amt__h77210 = { clint_s_xactor_f_rd_addr_D_OUT[22:20], 3'd0 } ;
  assign shift_amt__h87201 = { clint_rg_rdpacket[22:20], 3'd0 } ;
  assign shift_amt__h97325 = { clint_s_xactor_f_wr_addr_D_OUT[22:20], 3'd0 } ;
  assign temp___1__h77973 = {8{temp__h77213[7:0]}} ;
  assign temp___1__h87773 = {8{temp__h87204[7:0]}} ;
  assign temp___1__h88525 = {64{clint_clint_msip}} ;
  assign temp__h77213 = _theResult___snd__h77385 >> shift_amt__h77210 ;
  assign temp__h77544 = {4{_theResult_____2__h77214[15:0]}} ;
  assign temp__h86853 = {2{_theResult_____2__h77214[31:0]}} ;
  assign temp__h87204 = _theResult___snd__h88530 >> shift_amt__h87201 ;
  assign temp__h87345 = {4{_theResult_____2__h87205[15:0]}} ;
  assign temp__h96809 = {2{_theResult_____2__h87205[31:0]}} ;
  assign uart_user_ifc_uart_baudGen_rBaudCounter_value__ETC___d2496 =
	     uart_user_ifc_uart_baudGen_rBaudCounter_Q_OUT + 16'd1 <
	     uart_user_ifc_baud_value ;
  assign x__h63201 = uart_user_ifc_uart_rRecvCellCount + 4'd1 ;
  assign x__h64905 = uart_user_ifc_uart_rRecvBitCount + 4'd1 ;
  assign x__h66661 = uart_user_ifc_uart_rXmitCellCount + 4'd1 ;
  assign x__h66687 = uart_user_ifc_uart_rXmitBitCount + 4'd1 ;
  assign x__h73497 = uart_rg_rdburst_count + 8'd1 ;
  assign x__h75721 = uart_rg_wrburst_count + 8'd1 ;
  assign x__h87294 = clint_rg_rdburst_count + 8'd1 ;
  assign x__h98582 = clint_clint_rgmtimecmp & notmask__h97328 ;
  assign x_wget__h71046 =
	     { uart_user_ifc_uart_fifoRecv_EMPTY_N,
	       uart_user_ifc_uart_fifoRecv_FULL_N,
	       uart_user_ifc_uart_fifoXmit_FULL_N,
	       !uart_user_ifc_uart_fifoXmit_EMPTY_N &&
	       uart_user_ifc_uart_rXmitState == 3'd0 } ;
  assign z__h68144 =
	     uart_user_ifc_uart_fifoXmit_D_OUT[0] ^
	     uart_user_ifc_uart_fifoXmit_D_OUT[1] ;
  assign z__h68151 = z__h68144 ^ uart_user_ifc_uart_fifoXmit_D_OUT[2] ;
  assign z__h68158 = z__h68151 ^ uart_user_ifc_uart_fifoXmit_D_OUT[3] ;
  assign z__h68165 = z__h68158 ^ uart_user_ifc_uart_fifoXmit_D_OUT[4] ;
  assign z__h68172 = z__h68165 ^ uart_user_ifc_uart_fifoXmit_D_OUT[5] ;
  assign z__h68179 = z__h68172 ^ uart_user_ifc_uart_fifoXmit_D_OUT[6] ;
  always@(clint_s_xactor_f_wr_addr_D_OUT or clint_s_xactor_f_wr_data_D_OUT)
  begin
    case (clint_s_xactor_f_wr_addr_D_OUT[7:6])
      2'd0: data__h97324 = {4{clint_s_xactor_f_wr_data_D_OUT[16:9]}};
      2'd1: data__h97324 = {2{clint_s_xactor_f_wr_data_D_OUT[24:9]}};
      default: data__h97324 = clint_s_xactor_f_wr_data_D_OUT[40:9];
    endcase
  end
  always@(clint_s_xactor_f_wr_addr_D_OUT)
  begin
    case (clint_s_xactor_f_wr_addr_D_OUT[7:6])
      2'd0: mask__h97323 = 64'h00000000000000FF;
      2'd1: mask__h97323 = 64'h000000000000FFFF;
      2'd2: mask__h97323 = 64'h00000000FFFFFFFF;
      2'd3: mask__h97323 = 64'hFFFFFFFFFFFFFFFF;
    endcase
  end
  always@(uart_s_xactor_f_rd_addr_D_OUT or
	  a__h73418 or a__h71685 or a__h71679)
  begin
    case (uart_s_xactor_f_rd_addr_D_OUT[23:20])
      4'h8: rdata__h71703 = a__h71685;
      4'hC: rdata__h71703 = a__h71679;
      default: rdata__h71703 = a__h73418;
    endcase
  end
  always@(uart_rg_rdpacket or a__h73418 or a__h71685 or a__h71679)
  begin
    case (uart_rg_rdpacket[23:20])
      4'h8: rdata__h73432 = a__h71685;
      4'hC: rdata__h73432 = a__h71679;
      default: rdata__h73432 = a__h73418;
    endcase
  end
  always@(clint_s_xactor_f_wr_addr_D_OUT or clint_s_xactor_f_wr_data_D_OUT)
  begin
    case (clint_s_xactor_f_wr_addr_D_OUT[7:6])
      2'd0:
	  CASE_clint_s_xactor_f_wr_addrD_OUT_BITS_7_TO__ETC__q1 =
	      {8{clint_s_xactor_f_wr_data_D_OUT[16:9]}};
      2'd1:
	  CASE_clint_s_xactor_f_wr_addrD_OUT_BITS_7_TO__ETC__q1 =
	      {4{clint_s_xactor_f_wr_data_D_OUT[24:9]}};
      default: CASE_clint_s_xactor_f_wr_addrD_OUT_BITS_7_TO__ETC__q1 =
		   {2{clint_s_xactor_f_wr_data_D_OUT[40:9]}};
    endcase
  end
  always@(clint_s_xactor_f_rd_addr_D_OUT or
	  temp__h77213 or temp___1__h77973 or temp__h77544 or temp__h86853)
  begin
    case (clint_s_xactor_f_rd_addr_D_OUT[15:14])
      2'd0: x__h77526 = temp___1__h77973;
      2'd1: x__h77526 = temp__h77544;
      2'd2: x__h77526 = temp__h86853;
      2'd3: x__h77526 = temp__h77213;
    endcase
  end
  always@(clint_rg_rdpacket or
	  temp__h87204 or temp___1__h87773 or temp__h87345 or temp__h96809)
  begin
    case (clint_rg_rdpacket[15:14])
      2'd0: x__h87336 = temp___1__h87773;
      2'd1: x__h87336 = temp__h87345;
      2'd2: x__h87336 = temp__h96809;
      2'd3: x__h87336 = temp__h87204;
    endcase
  end
  always@(uart_s_xactor_f_rd_addr_D_OUT)
  begin
    case (uart_s_xactor_f_rd_addr_D_OUT[23:20])
      4'h0, 4'h8, 4'hC:
	  CASE_uart_s_xactor_f_rd_addrD_OUT_BITS_23_TO__ETC__q2 = 2'd0;
      default: CASE_uart_s_xactor_f_rd_addrD_OUT_BITS_23_TO__ETC__q2 = 2'd2;
    endcase
  end
  always@(uart_s_xactor_f_wr_addr_D_OUT)
  begin
    case (uart_s_xactor_f_wr_addr_D_OUT[23:20])
      4'h0, 4'h4:
	  CASE_uart_s_xactor_f_wr_addrD_OUT_BITS_23_TO__ETC__q3 = 2'd0;
      default: CASE_uart_s_xactor_f_wr_addrD_OUT_BITS_23_TO__ETC__q3 = 2'd2;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        clint_clint_msip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	clint_clint_mtip <= `BSV_ASSIGNMENT_DELAY 1'd0;
	clint_clint_rg_tick <= `BSV_ASSIGNMENT_DELAY 4'd0;
	clint_clint_rgmtime <= `BSV_ASSIGNMENT_DELAY 64'd0;
	clint_clint_rgmtimecmp <= `BSV_ASSIGNMENT_DELAY 64'd0;
	clint_rg_rdburst_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	clint_rg_rdpacket <= `BSV_ASSIGNMENT_DELAY
	    52'hAAAAAAAAAAAAA /* unspecified value */ ;
	clint_rg_wrburst_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	clint_rg_wrpacket <= `BSV_ASSIGNMENT_DELAY
	    52'hAAAAAAAAAAAAA /* unspecified value */ ;
	err_slave_read_state <= `BSV_ASSIGNMENT_DELAY 1'd0;
	err_slave_rg_rd_id <= `BSV_ASSIGNMENT_DELAY 4'd0;
	err_slave_rg_read_length <= `BSV_ASSIGNMENT_DELAY 8'd0;
	err_slave_rg_readburst_counter <= `BSV_ASSIGNMENT_DELAY 8'd0;
	err_slave_rg_write_response <= `BSV_ASSIGNMENT_DELAY
	    6'b101010 /* unspecified value */ ;
	err_slave_write_state <= `BSV_ASSIGNMENT_DELAY 1'd0;
	uart_rg_rdburst_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	uart_rg_rdpacket <= `BSV_ASSIGNMENT_DELAY
	    52'hAAAAAAAAAAAAA /* unspecified value */ ;
	uart_rg_wrburst_count <= `BSV_ASSIGNMENT_DELAY 8'd0;
	uart_rg_wrpacket <= `BSV_ASSIGNMENT_DELAY
	    52'hAAAAAAAAAAAAA /* unspecified value */ ;
	uart_user_ifc_baud_value <= `BSV_ASSIGNMENT_DELAY 16'd5;
	uart_user_ifc_uart_fifoRecv_countReg <= `BSV_ASSIGNMENT_DELAY 5'd0;
	uart_user_ifc_uart_fifoXmit_countReg <= `BSV_ASSIGNMENT_DELAY 5'd0;
	uart_user_ifc_uart_rRecvData <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (clint_clint_msip_EN)
	  clint_clint_msip <= `BSV_ASSIGNMENT_DELAY clint_clint_msip_D_IN;
	if (clint_clint_mtip_EN)
	  clint_clint_mtip <= `BSV_ASSIGNMENT_DELAY clint_clint_mtip_D_IN;
	if (clint_clint_rg_tick_EN)
	  clint_clint_rg_tick <= `BSV_ASSIGNMENT_DELAY
	      clint_clint_rg_tick_D_IN;
	if (clint_clint_rgmtime_EN)
	  clint_clint_rgmtime <= `BSV_ASSIGNMENT_DELAY
	      clint_clint_rgmtime_D_IN;
	if (clint_clint_rgmtimecmp_EN)
	  clint_clint_rgmtimecmp <= `BSV_ASSIGNMENT_DELAY
	      clint_clint_rgmtimecmp_D_IN;
	if (clint_rg_rdburst_count_EN)
	  clint_rg_rdburst_count <= `BSV_ASSIGNMENT_DELAY
	      clint_rg_rdburst_count_D_IN;
	if (clint_rg_rdpacket_EN)
	  clint_rg_rdpacket <= `BSV_ASSIGNMENT_DELAY clint_rg_rdpacket_D_IN;
	if (clint_rg_wrburst_count_EN)
	  clint_rg_wrburst_count <= `BSV_ASSIGNMENT_DELAY
	      clint_rg_wrburst_count_D_IN;
	if (clint_rg_wrpacket_EN)
	  clint_rg_wrpacket <= `BSV_ASSIGNMENT_DELAY clint_rg_wrpacket_D_IN;
	if (err_slave_read_state_EN)
	  err_slave_read_state <= `BSV_ASSIGNMENT_DELAY
	      err_slave_read_state_D_IN;
	if (err_slave_rg_rd_id_EN)
	  err_slave_rg_rd_id <= `BSV_ASSIGNMENT_DELAY err_slave_rg_rd_id_D_IN;
	if (err_slave_rg_read_length_EN)
	  err_slave_rg_read_length <= `BSV_ASSIGNMENT_DELAY
	      err_slave_rg_read_length_D_IN;
	if (err_slave_rg_readburst_counter_EN)
	  err_slave_rg_readburst_counter <= `BSV_ASSIGNMENT_DELAY
	      err_slave_rg_readburst_counter_D_IN;
	if (err_slave_rg_write_response_EN)
	  err_slave_rg_write_response <= `BSV_ASSIGNMENT_DELAY
	      err_slave_rg_write_response_D_IN;
	if (err_slave_write_state_EN)
	  err_slave_write_state <= `BSV_ASSIGNMENT_DELAY
	      err_slave_write_state_D_IN;
	if (uart_rg_rdburst_count_EN)
	  uart_rg_rdburst_count <= `BSV_ASSIGNMENT_DELAY
	      uart_rg_rdburst_count_D_IN;
	if (uart_rg_rdpacket_EN)
	  uart_rg_rdpacket <= `BSV_ASSIGNMENT_DELAY uart_rg_rdpacket_D_IN;
	if (uart_rg_wrburst_count_EN)
	  uart_rg_wrburst_count <= `BSV_ASSIGNMENT_DELAY
	      uart_rg_wrburst_count_D_IN;
	if (uart_rg_wrpacket_EN)
	  uart_rg_wrpacket <= `BSV_ASSIGNMENT_DELAY uart_rg_wrpacket_D_IN;
	if (uart_user_ifc_baud_value_EN)
	  uart_user_ifc_baud_value <= `BSV_ASSIGNMENT_DELAY
	      uart_user_ifc_baud_value_D_IN;
	if (uart_user_ifc_uart_fifoRecv_countReg_EN)
	  uart_user_ifc_uart_fifoRecv_countReg <= `BSV_ASSIGNMENT_DELAY
	      uart_user_ifc_uart_fifoRecv_countReg_D_IN;
	if (uart_user_ifc_uart_fifoXmit_countReg_EN)
	  uart_user_ifc_uart_fifoXmit_countReg <= `BSV_ASSIGNMENT_DELAY
	      uart_user_ifc_uart_fifoXmit_countReg_D_IN;
	if (uart_user_ifc_uart_rRecvData_EN)
	  uart_user_ifc_uart_rRecvData <= `BSV_ASSIGNMENT_DELAY
	      uart_user_ifc_uart_rRecvData_D_IN;
      end
    if (uart_user_ifc_uart_vrRecvBuffer_0_EN)
      uart_user_ifc_uart_vrRecvBuffer_0 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_0_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_1_EN)
      uart_user_ifc_uart_vrRecvBuffer_1 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_1_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_2_EN)
      uart_user_ifc_uart_vrRecvBuffer_2 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_2_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_3_EN)
      uart_user_ifc_uart_vrRecvBuffer_3 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_3_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_4_EN)
      uart_user_ifc_uart_vrRecvBuffer_4 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_4_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_5_EN)
      uart_user_ifc_uart_vrRecvBuffer_5 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_5_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_6_EN)
      uart_user_ifc_uart_vrRecvBuffer_6 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_6_D_IN;
    if (uart_user_ifc_uart_vrRecvBuffer_7_EN)
      uart_user_ifc_uart_vrRecvBuffer_7 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrRecvBuffer_7_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_0_EN)
      uart_user_ifc_uart_vrXmitBuffer_0 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_0_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_1_EN)
      uart_user_ifc_uart_vrXmitBuffer_1 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_1_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_2_EN)
      uart_user_ifc_uart_vrXmitBuffer_2 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_2_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_3_EN)
      uart_user_ifc_uart_vrXmitBuffer_3 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_3_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_4_EN)
      uart_user_ifc_uart_vrXmitBuffer_4 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_4_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_5_EN)
      uart_user_ifc_uart_vrXmitBuffer_5 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_5_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_6_EN)
      uart_user_ifc_uart_vrXmitBuffer_6 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_6_D_IN;
    if (uart_user_ifc_uart_vrXmitBuffer_7_EN)
      uart_user_ifc_uart_vrXmitBuffer_7 <= `BSV_ASSIGNMENT_DELAY
	  uart_user_ifc_uart_vrXmitBuffer_7_D_IN;
  end

  always@(posedge CLK or `BSV_RESET_EDGE RST_N)
  if (RST_N == `BSV_RESET_VALUE)
    begin
      uart_user_ifc_uart_rRecvBitCount <= `BSV_ASSIGNMENT_DELAY 4'd0;
      uart_user_ifc_uart_rRecvCellCount <= `BSV_ASSIGNMENT_DELAY 4'd0;
      uart_user_ifc_uart_rRecvParity <= `BSV_ASSIGNMENT_DELAY 1'd0;
      uart_user_ifc_uart_rRecvState <= `BSV_ASSIGNMENT_DELAY 3'd0;
      uart_user_ifc_uart_rXmitBitCount <= `BSV_ASSIGNMENT_DELAY 4'd0;
      uart_user_ifc_uart_rXmitCellCount <= `BSV_ASSIGNMENT_DELAY 4'd0;
      uart_user_ifc_uart_rXmitDataOut <= `BSV_ASSIGNMENT_DELAY 1'd1;
      uart_user_ifc_uart_rXmitParity <= `BSV_ASSIGNMENT_DELAY 1'd0;
      uart_user_ifc_uart_rXmitState <= `BSV_ASSIGNMENT_DELAY 3'd0;
    end
  else
    begin
      if (uart_user_ifc_uart_rRecvBitCount_EN)
	uart_user_ifc_uart_rRecvBitCount <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rRecvBitCount_D_IN;
      if (uart_user_ifc_uart_rRecvCellCount_EN)
	uart_user_ifc_uart_rRecvCellCount <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rRecvCellCount_D_IN;
      if (uart_user_ifc_uart_rRecvParity_EN)
	uart_user_ifc_uart_rRecvParity <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rRecvParity_D_IN;
      if (uart_user_ifc_uart_rRecvState_EN)
	uart_user_ifc_uart_rRecvState <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rRecvState_D_IN;
      if (uart_user_ifc_uart_rXmitBitCount_EN)
	uart_user_ifc_uart_rXmitBitCount <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rXmitBitCount_D_IN;
      if (uart_user_ifc_uart_rXmitCellCount_EN)
	uart_user_ifc_uart_rXmitCellCount <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rXmitCellCount_D_IN;
      if (uart_user_ifc_uart_rXmitDataOut_EN)
	uart_user_ifc_uart_rXmitDataOut <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rXmitDataOut_D_IN;
      if (uart_user_ifc_uart_rXmitParity_EN)
	uart_user_ifc_uart_rXmitParity <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rXmitParity_D_IN;
      if (uart_user_ifc_uart_rXmitState_EN)
	uart_user_ifc_uart_rXmitState <= `BSV_ASSIGNMENT_DELAY
	    uart_user_ifc_uart_rXmitState_D_IN;
    end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    clint_clint_msip = 1'h0;
    clint_clint_mtip = 1'h0;
    clint_clint_rg_tick = 4'hA;
    clint_clint_rgmtime = 64'hAAAAAAAAAAAAAAAA;
    clint_clint_rgmtimecmp = 64'hAAAAAAAAAAAAAAAA;
    clint_rg_rdburst_count = 8'hAA;
    clint_rg_rdpacket = 52'hAAAAAAAAAAAAA;
    clint_rg_wrburst_count = 8'hAA;
    clint_rg_wrpacket = 52'hAAAAAAAAAAAAA;
    err_slave_read_state = 1'h0;
    err_slave_rg_rd_id = 4'hA;
    err_slave_rg_read_length = 8'hAA;
    err_slave_rg_readburst_counter = 8'hAA;
    err_slave_rg_write_response = 6'h2A;
    err_slave_write_state = 1'h0;
    uart_rg_rdburst_count = 8'hAA;
    uart_rg_rdpacket = 52'hAAAAAAAAAAAAA;
    uart_rg_wrburst_count = 8'hAA;
    uart_rg_wrpacket = 52'hAAAAAAAAAAAAA;
    uart_user_ifc_baud_value = 16'hAAAA;
    uart_user_ifc_uart_fifoRecv_countReg = 5'h0A;
    uart_user_ifc_uart_fifoXmit_countReg = 5'h0A;
    uart_user_ifc_uart_rRecvBitCount = 4'hA;
    uart_user_ifc_uart_rRecvCellCount = 4'hA;
    uart_user_ifc_uart_rRecvData = 1'h0;
    uart_user_ifc_uart_rRecvParity = 1'h0;
    uart_user_ifc_uart_rRecvState = 3'h2;
    uart_user_ifc_uart_rXmitBitCount = 4'hA;
    uart_user_ifc_uart_rXmitCellCount = 4'hA;
    uart_user_ifc_uart_rXmitDataOut = 1'h0;
    uart_user_ifc_uart_rXmitParity = 1'h0;
    uart_user_ifc_uart_rXmitState = 3'h2;
    uart_user_ifc_uart_vrRecvBuffer_0 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_1 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_2 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_3 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_4 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_5 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_6 = 1'h0;
    uart_user_ifc_uart_vrRecvBuffer_7 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_0 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_1 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_2 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_3 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_4 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_5 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_6 = 1'h0;
    uart_user_ifc_uart_vrXmitBuffer_7 = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d26 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d27 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d28 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  v__h10548 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d26 ||
	   TASK_testplusargs___d27 && TASK_testplusargs___d28))
	$write("[%10d", v__h10548, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d26 ||
	   TASK_testplusargs___d27 && TASK_testplusargs___d28))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d26 ||
	   TASK_testplusargs___d27 && TASK_testplusargs___d28))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d33 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d34 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d35 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  v__h10696 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("[%10d", v__h10696, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d33 ||
	   TASK_testplusargs___d34 && TASK_testplusargs___d35))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d44 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d45 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d46 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_4_OR_TASK_testplusargs_5_AND_ETC___d53 =
	(TASK_testplusargs___d44 ||
	 TASK_testplusargs___d45 && TASK_testplusargs___d46) &&
	fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    TASK_testplusargs_4_OR_TASK_testplusargs_5_AND_ETC___d54 =
	(TASK_testplusargs___d44 ||
	 TASK_testplusargs___d45 && TASK_testplusargs___d46) &&
	!fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave)
	begin
	  v__h10848 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("[%10d", v__h10848, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  TASK_testplusargs_4_OR_TASK_testplusargs_5_AND_ETC___d53)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  TASK_testplusargs_4_OR_TASK_testplusargs_5_AND_ETC___d54)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave &&
	  (TASK_testplusargs___d44 ||
	   TASK_testplusargs___d45 && TASK_testplusargs___d46))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d74 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d75 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d76 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  v__h11449 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d74 ||
	   TASK_testplusargs___d75 && TASK_testplusargs___d76))
	$write("[%10d", v__h11449, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d74 ||
	   TASK_testplusargs___d75 && TASK_testplusargs___d76))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d74 ||
	   TASK_testplusargs___d75 && TASK_testplusargs___d76))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d81 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d82 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d83 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  v__h11597 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("[%10d", v__h11597, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d81 ||
	   TASK_testplusargs___d82 && TASK_testplusargs___d83))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d87 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d88 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d89 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_7_OR_TASK_testplusargs_8_AND_ETC___d93 =
	(TASK_testplusargs___d87 ||
	 TASK_testplusargs___d88 && TASK_testplusargs___d89) &&
	fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    TASK_testplusargs_7_OR_TASK_testplusargs_8_AND_ETC___d94 =
	(TASK_testplusargs___d87 ||
	 TASK_testplusargs___d88 && TASK_testplusargs___d89) &&
	!fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1)
	begin
	  v__h11749 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("[%10d", v__h11749, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  TASK_testplusargs_7_OR_TASK_testplusargs_8_AND_ETC___d93)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  TASK_testplusargs_7_OR_TASK_testplusargs_8_AND_ETC___d94)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d87 ||
	   TASK_testplusargs___d88 && TASK_testplusargs___d89))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d115 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d116 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d117 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  v__h12350 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d115 ||
	   TASK_testplusargs___d116 && TASK_testplusargs___d117))
	$write("[%10d", v__h12350, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d115 ||
	   TASK_testplusargs___d116 && TASK_testplusargs___d117))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d115 ||
	   TASK_testplusargs___d116 && TASK_testplusargs___d117))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d122 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d123 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d124 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  v__h12498 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("[%10d", v__h12498, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d122 ||
	   TASK_testplusargs___d123 && TASK_testplusargs___d124))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d128 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d129 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d130 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_28_OR_TASK_testplusargs_29_A_ETC___d134 =
	(TASK_testplusargs___d128 ||
	 TASK_testplusargs___d129 && TASK_testplusargs___d130) &&
	fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    TASK_testplusargs_28_OR_TASK_testplusargs_29_A_ETC___d135 =
	(TASK_testplusargs___d128 ||
	 TASK_testplusargs___d129 && TASK_testplusargs___d130) &&
	!fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2)
	begin
	  v__h12650 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("[%10d", v__h12650, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  TASK_testplusargs_28_OR_TASK_testplusargs_29_A_ETC___d134)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  TASK_testplusargs_28_OR_TASK_testplusargs_29_A_ETC___d135)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d128 ||
	   TASK_testplusargs___d129 && TASK_testplusargs___d130))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d157 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d158 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d159 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  v__h13251 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d157 ||
	   TASK_testplusargs___d158 && TASK_testplusargs___d159))
	$write("[%10d", v__h13251, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d157 ||
	   TASK_testplusargs___d158 && TASK_testplusargs___d159))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d157 ||
	   TASK_testplusargs___d158 && TASK_testplusargs___d159))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d164 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d165 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d166 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  v__h13399 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("[%10d", v__h13399, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d164 ||
	   TASK_testplusargs___d165 && TASK_testplusargs___d166))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d170 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d171 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d172 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_70_OR_TASK_testplusargs_71_A_ETC___d176 =
	(TASK_testplusargs___d170 ||
	 TASK_testplusargs___d171 && TASK_testplusargs___d172) &&
	fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    TASK_testplusargs_70_OR_TASK_testplusargs_71_A_ETC___d177 =
	(TASK_testplusargs___d170 ||
	 TASK_testplusargs___d171 && TASK_testplusargs___d172) &&
	!fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3)
	begin
	  v__h13551 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("[%10d", v__h13551, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  TASK_testplusargs_70_OR_TASK_testplusargs_71_A_ETC___d176)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  TASK_testplusargs_70_OR_TASK_testplusargs_71_A_ETC___d177)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d170 ||
	   TASK_testplusargs___d171 && TASK_testplusargs___d172))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d200 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d201 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d202 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  v__h14152 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d200 ||
	   TASK_testplusargs___d201 && TASK_testplusargs___d202))
	$write("[%10d", v__h14152, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d200 ||
	   TASK_testplusargs___d201 && TASK_testplusargs___d202))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d200 ||
	   TASK_testplusargs___d201 && TASK_testplusargs___d202))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d207 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d208 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d209 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  v__h14300 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("[%10d", v__h14300, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d207 ||
	   TASK_testplusargs___d208 && TASK_testplusargs___d209))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d213 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d214 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d215 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_13_OR_TASK_testplusargs_14_A_ETC___d219 =
	(TASK_testplusargs___d213 ||
	 TASK_testplusargs___d214 && TASK_testplusargs___d215) &&
	fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    TASK_testplusargs_13_OR_TASK_testplusargs_14_A_ETC___d220 =
	(TASK_testplusargs___d213 ||
	 TASK_testplusargs___d214 && TASK_testplusargs___d215) &&
	!fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4)
	begin
	  v__h14452 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("[%10d", v__h14452, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  TASK_testplusargs_13_OR_TASK_testplusargs_14_A_ETC___d219)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  TASK_testplusargs_13_OR_TASK_testplusargs_14_A_ETC___d220)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d213 ||
	   TASK_testplusargs___d214 && TASK_testplusargs___d215))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d239 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d240 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d241 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  v__h15053 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d239 ||
	   TASK_testplusargs___d240 && TASK_testplusargs___d241))
	$write("[%10d", v__h15053, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d239 ||
	   TASK_testplusargs___d240 && TASK_testplusargs___d241))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d239 ||
	   TASK_testplusargs___d240 && TASK_testplusargs___d241))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d246 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d247 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d248 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  v__h15201 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("[%10d", v__h15201, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d246 ||
	   TASK_testplusargs___d247 && TASK_testplusargs___d248))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d252 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d253 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d254 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_52_OR_TASK_testplusargs_53_A_ETC___d258 =
	(TASK_testplusargs___d252 ||
	 TASK_testplusargs___d253 && TASK_testplusargs___d254) &&
	fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    TASK_testplusargs_52_OR_TASK_testplusargs_53_A_ETC___d259 =
	(TASK_testplusargs___d252 ||
	 TASK_testplusargs___d253 && TASK_testplusargs___d254) &&
	!fabric_xactors_from_masters_0_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5)
	begin
	  v__h15353 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("[%10d", v__h15353, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("'h%h", fabric_xactors_from_masters_0_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  TASK_testplusargs_52_OR_TASK_testplusargs_53_A_ETC___d258)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  TASK_testplusargs_52_OR_TASK_testplusargs_53_A_ETC___d259)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d252 ||
	   TASK_testplusargs___d253 && TASK_testplusargs___d254))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d281 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d282 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d283 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  v__h16024 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d281 ||
	   TASK_testplusargs___d282 && TASK_testplusargs___d283))
	$write("[%10d", v__h16024, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d281 ||
	   TASK_testplusargs___d282 && TASK_testplusargs___d283))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d281 ||
	   TASK_testplusargs___d282 && TASK_testplusargs___d283))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d287 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d288 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d289 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  v__h16172 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("[%10d", v__h16172, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d287 ||
	   TASK_testplusargs___d288 && TASK_testplusargs___d289))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d298 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d299 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d300 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_98_OR_TASK_testplusargs_99_A_ETC___d307 =
	(TASK_testplusargs___d298 ||
	 TASK_testplusargs___d299 && TASK_testplusargs___d300) &&
	fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    TASK_testplusargs_98_OR_TASK_testplusargs_99_A_ETC___d308 =
	(TASK_testplusargs___d298 ||
	 TASK_testplusargs___d299 && TASK_testplusargs___d300) &&
	!fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6)
	begin
	  v__h16324 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("[%10d", v__h16324, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  TASK_testplusargs_98_OR_TASK_testplusargs_99_A_ETC___d307)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  TASK_testplusargs_98_OR_TASK_testplusargs_99_A_ETC___d308)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d298 ||
	   TASK_testplusargs___d299 && TASK_testplusargs___d300))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d324 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d325 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d326 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  v__h16903 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d324 ||
	   TASK_testplusargs___d325 && TASK_testplusargs___d326))
	$write("[%10d", v__h16903, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d324 ||
	   TASK_testplusargs___d325 && TASK_testplusargs___d326))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d324 ||
	   TASK_testplusargs___d325 && TASK_testplusargs___d326))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d330 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d331 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d332 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  v__h17051 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("[%10d", v__h17051, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d330 ||
	   TASK_testplusargs___d331 && TASK_testplusargs___d332))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d336 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d337 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d338 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_36_OR_TASK_testplusargs_37_A_ETC___d342 =
	(TASK_testplusargs___d336 ||
	 TASK_testplusargs___d337 && TASK_testplusargs___d338) &&
	fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    TASK_testplusargs_36_OR_TASK_testplusargs_37_A_ETC___d343 =
	(TASK_testplusargs___d336 ||
	 TASK_testplusargs___d337 && TASK_testplusargs___d338) &&
	!fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7)
	begin
	  v__h17203 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("[%10d", v__h17203, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  TASK_testplusargs_36_OR_TASK_testplusargs_37_A_ETC___d342)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  TASK_testplusargs_36_OR_TASK_testplusargs_37_A_ETC___d343)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d336 ||
	   TASK_testplusargs___d337 && TASK_testplusargs___d338))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d360 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d361 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d362 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  v__h17782 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d360 ||
	   TASK_testplusargs___d361 && TASK_testplusargs___d362))
	$write("[%10d", v__h17782, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d360 ||
	   TASK_testplusargs___d361 && TASK_testplusargs___d362))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d360 ||
	   TASK_testplusargs___d361 && TASK_testplusargs___d362))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d366 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d367 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d368 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  v__h17930 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("[%10d", v__h17930, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d366 ||
	   TASK_testplusargs___d367 && TASK_testplusargs___d368))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d372 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d373 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d374 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_72_OR_TASK_testplusargs_73_A_ETC___d378 =
	(TASK_testplusargs___d372 ||
	 TASK_testplusargs___d373 && TASK_testplusargs___d374) &&
	fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    TASK_testplusargs_72_OR_TASK_testplusargs_73_A_ETC___d379 =
	(TASK_testplusargs___d372 ||
	 TASK_testplusargs___d373 && TASK_testplusargs___d374) &&
	!fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8)
	begin
	  v__h18082 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("[%10d", v__h18082, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  TASK_testplusargs_72_OR_TASK_testplusargs_73_A_ETC___d378)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  TASK_testplusargs_72_OR_TASK_testplusargs_73_A_ETC___d379)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d372 ||
	   TASK_testplusargs___d373 && TASK_testplusargs___d374))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d397 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d398 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d399 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  v__h18661 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d397 ||
	   TASK_testplusargs___d398 && TASK_testplusargs___d399))
	$write("[%10d", v__h18661, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d397 ||
	   TASK_testplusargs___d398 && TASK_testplusargs___d399))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d397 ||
	   TASK_testplusargs___d398 && TASK_testplusargs___d399))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d403 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d404 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d405 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  v__h18809 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("[%10d", v__h18809, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d403 ||
	   TASK_testplusargs___d404 && TASK_testplusargs___d405))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d409 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d410 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d411 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_09_OR_TASK_testplusargs_10_A_ETC___d415 =
	(TASK_testplusargs___d409 ||
	 TASK_testplusargs___d410 && TASK_testplusargs___d411) &&
	fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    TASK_testplusargs_09_OR_TASK_testplusargs_10_A_ETC___d416 =
	(TASK_testplusargs___d409 ||
	 TASK_testplusargs___d410 && TASK_testplusargs___d411) &&
	!fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9)
	begin
	  v__h18961 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("[%10d", v__h18961, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  TASK_testplusargs_09_OR_TASK_testplusargs_10_A_ETC___d415)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  TASK_testplusargs_09_OR_TASK_testplusargs_10_A_ETC___d416)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d409 ||
	   TASK_testplusargs___d410 && TASK_testplusargs___d411))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d435 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d436 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d437 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  v__h19540 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d435 ||
	   TASK_testplusargs___d436 && TASK_testplusargs___d437))
	$write("[%10d", v__h19540, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d435 ||
	   TASK_testplusargs___d436 && TASK_testplusargs___d437))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d435 ||
	   TASK_testplusargs___d436 && TASK_testplusargs___d437))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d441 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d442 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d443 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  v__h19688 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("[%10d", v__h19688, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d441 ||
	   TASK_testplusargs___d442 && TASK_testplusargs___d443))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d447 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d448 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d449 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_47_OR_TASK_testplusargs_48_A_ETC___d453 =
	(TASK_testplusargs___d447 ||
	 TASK_testplusargs___d448 && TASK_testplusargs___d449) &&
	fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    TASK_testplusargs_47_OR_TASK_testplusargs_48_A_ETC___d454 =
	(TASK_testplusargs___d447 ||
	 TASK_testplusargs___d448 && TASK_testplusargs___d449) &&
	!fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10)
	begin
	  v__h19840 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("[%10d", v__h19840, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  TASK_testplusargs_47_OR_TASK_testplusargs_48_A_ETC___d453)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  TASK_testplusargs_47_OR_TASK_testplusargs_48_A_ETC___d454)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d447 ||
	   TASK_testplusargs___d448 && TASK_testplusargs___d449))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d469 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d470 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d471 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  v__h20419 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d469 ||
	   TASK_testplusargs___d470 && TASK_testplusargs___d471))
	$write("[%10d", v__h20419, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d469 ||
	   TASK_testplusargs___d470 && TASK_testplusargs___d471))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d469 ||
	   TASK_testplusargs___d470 && TASK_testplusargs___d471))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d475 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d476 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d477 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  v__h20567 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("[%10d", v__h20567, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d475 ||
	   TASK_testplusargs___d476 && TASK_testplusargs___d477))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d481 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d482 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d483 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_81_OR_TASK_testplusargs_82_A_ETC___d487 =
	(TASK_testplusargs___d481 ||
	 TASK_testplusargs___d482 && TASK_testplusargs___d483) &&
	fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    TASK_testplusargs_81_OR_TASK_testplusargs_82_A_ETC___d488 =
	(TASK_testplusargs___d481 ||
	 TASK_testplusargs___d482 && TASK_testplusargs___d483) &&
	!fabric_xactors_from_masters_1_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11)
	begin
	  v__h20719 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("[%10d", v__h20719, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("'h%h", fabric_xactors_from_masters_1_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  TASK_testplusargs_81_OR_TASK_testplusargs_82_A_ETC___d487)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  TASK_testplusargs_81_OR_TASK_testplusargs_82_A_ETC___d488)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d481 ||
	   TASK_testplusargs___d482 && TASK_testplusargs___d483))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d510 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d511 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d512 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  v__h21390 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d510 ||
	   TASK_testplusargs___d511 && TASK_testplusargs___d512))
	$write("[%10d", v__h21390, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d510 ||
	   TASK_testplusargs___d511 && TASK_testplusargs___d512))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d510 ||
	   TASK_testplusargs___d511 && TASK_testplusargs___d512))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d516 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d517 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d518 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  v__h21538 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("[%10d", v__h21538, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d516 ||
	   TASK_testplusargs___d517 && TASK_testplusargs___d518))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d527 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d528 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d529 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_27_OR_TASK_testplusargs_28_A_ETC___d536 =
	(TASK_testplusargs___d527 ||
	 TASK_testplusargs___d528 && TASK_testplusargs___d529) &&
	fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    TASK_testplusargs_27_OR_TASK_testplusargs_28_A_ETC___d537 =
	(TASK_testplusargs___d527 ||
	 TASK_testplusargs___d528 && TASK_testplusargs___d529) &&
	!fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12)
	begin
	  v__h21690 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("[%10d", v__h21690, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  TASK_testplusargs_27_OR_TASK_testplusargs_28_A_ETC___d536)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  TASK_testplusargs_27_OR_TASK_testplusargs_28_A_ETC___d537)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d527 ||
	   TASK_testplusargs___d528 && TASK_testplusargs___d529))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d553 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d554 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d555 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  v__h22269 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d553 ||
	   TASK_testplusargs___d554 && TASK_testplusargs___d555))
	$write("[%10d", v__h22269, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d553 ||
	   TASK_testplusargs___d554 && TASK_testplusargs___d555))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d553 ||
	   TASK_testplusargs___d554 && TASK_testplusargs___d555))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d559 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d560 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d561 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  v__h22417 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("[%10d", v__h22417, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d559 ||
	   TASK_testplusargs___d560 && TASK_testplusargs___d561))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d565 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d566 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d567 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_65_OR_TASK_testplusargs_66_A_ETC___d571 =
	(TASK_testplusargs___d565 ||
	 TASK_testplusargs___d566 && TASK_testplusargs___d567) &&
	fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    TASK_testplusargs_65_OR_TASK_testplusargs_66_A_ETC___d572 =
	(TASK_testplusargs___d565 ||
	 TASK_testplusargs___d566 && TASK_testplusargs___d567) &&
	!fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13)
	begin
	  v__h22569 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("[%10d", v__h22569, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  TASK_testplusargs_65_OR_TASK_testplusargs_66_A_ETC___d571)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  TASK_testplusargs_65_OR_TASK_testplusargs_66_A_ETC___d572)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d565 ||
	   TASK_testplusargs___d566 && TASK_testplusargs___d567))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d589 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d590 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d591 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  v__h23148 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d589 ||
	   TASK_testplusargs___d590 && TASK_testplusargs___d591))
	$write("[%10d", v__h23148, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d589 ||
	   TASK_testplusargs___d590 && TASK_testplusargs___d591))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d589 ||
	   TASK_testplusargs___d590 && TASK_testplusargs___d591))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d595 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d596 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d597 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  v__h23296 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("[%10d", v__h23296, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d595 ||
	   TASK_testplusargs___d596 && TASK_testplusargs___d597))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d601 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d602 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d603 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_01_OR_TASK_testplusargs_02_A_ETC___d607 =
	(TASK_testplusargs___d601 ||
	 TASK_testplusargs___d602 && TASK_testplusargs___d603) &&
	fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    TASK_testplusargs_01_OR_TASK_testplusargs_02_A_ETC___d608 =
	(TASK_testplusargs___d601 ||
	 TASK_testplusargs___d602 && TASK_testplusargs___d603) &&
	!fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14)
	begin
	  v__h23448 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("[%10d", v__h23448, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  TASK_testplusargs_01_OR_TASK_testplusargs_02_A_ETC___d607)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  TASK_testplusargs_01_OR_TASK_testplusargs_02_A_ETC___d608)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d601 ||
	   TASK_testplusargs___d602 && TASK_testplusargs___d603))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d626 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d627 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d628 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  v__h24027 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d626 ||
	   TASK_testplusargs___d627 && TASK_testplusargs___d628))
	$write("[%10d", v__h24027, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d626 ||
	   TASK_testplusargs___d627 && TASK_testplusargs___d628))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d626 ||
	   TASK_testplusargs___d627 && TASK_testplusargs___d628))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d632 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d633 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d634 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  v__h24175 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("[%10d", v__h24175, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d632 ||
	   TASK_testplusargs___d633 && TASK_testplusargs___d634))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d638 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d639 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d640 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_38_OR_TASK_testplusargs_39_A_ETC___d644 =
	(TASK_testplusargs___d638 ||
	 TASK_testplusargs___d639 && TASK_testplusargs___d640) &&
	fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    TASK_testplusargs_38_OR_TASK_testplusargs_39_A_ETC___d645 =
	(TASK_testplusargs___d638 ||
	 TASK_testplusargs___d639 && TASK_testplusargs___d640) &&
	!fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15)
	begin
	  v__h24327 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("[%10d", v__h24327, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  TASK_testplusargs_38_OR_TASK_testplusargs_39_A_ETC___d644)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  TASK_testplusargs_38_OR_TASK_testplusargs_39_A_ETC___d645)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d638 ||
	   TASK_testplusargs___d639 && TASK_testplusargs___d640))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d664 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d665 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d666 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  v__h24906 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d664 ||
	   TASK_testplusargs___d665 && TASK_testplusargs___d666))
	$write("[%10d", v__h24906, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d664 ||
	   TASK_testplusargs___d665 && TASK_testplusargs___d666))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d664 ||
	   TASK_testplusargs___d665 && TASK_testplusargs___d666))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d670 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d671 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d672 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  v__h25054 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("[%10d", v__h25054, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d670 ||
	   TASK_testplusargs___d671 && TASK_testplusargs___d672))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d676 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d677 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d678 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_76_OR_TASK_testplusargs_77_A_ETC___d682 =
	(TASK_testplusargs___d676 ||
	 TASK_testplusargs___d677 && TASK_testplusargs___d678) &&
	fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    TASK_testplusargs_76_OR_TASK_testplusargs_77_A_ETC___d683 =
	(TASK_testplusargs___d676 ||
	 TASK_testplusargs___d677 && TASK_testplusargs___d678) &&
	!fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16)
	begin
	  v__h25206 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("[%10d", v__h25206, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  TASK_testplusargs_76_OR_TASK_testplusargs_77_A_ETC___d682)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  TASK_testplusargs_76_OR_TASK_testplusargs_77_A_ETC___d683)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d676 ||
	   TASK_testplusargs___d677 && TASK_testplusargs___d678))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d698 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d699 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d700 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  v__h25785 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d698 ||
	   TASK_testplusargs___d699 && TASK_testplusargs___d700))
	$write("[%10d", v__h25785, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d698 ||
	   TASK_testplusargs___d699 && TASK_testplusargs___d700))
	$write("AXI4_Fabric: wr master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d698 ||
	   TASK_testplusargs___d699 && TASK_testplusargs___d700))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d704 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d705 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d706 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  v__h25933 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("[%10d", v__h25933, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("AXI4_Wr_Addr { ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[16:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[8:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write(", ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_wr_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d704 ||
	   TASK_testplusargs___d705 && TASK_testplusargs___d706))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d710 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d711 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d712 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_10_OR_TASK_testplusargs_11_A_ETC___d716 =
	(TASK_testplusargs___d710 ||
	 TASK_testplusargs___d711 && TASK_testplusargs___d712) &&
	fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    TASK_testplusargs_10_OR_TASK_testplusargs_11_A_ETC___d717 =
	(TASK_testplusargs___d710 ||
	 TASK_testplusargs___d711 && TASK_testplusargs___d712) &&
	!fabric_xactors_from_masters_2_f_wr_data_D_OUT[0];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17)
	begin
	  v__h26085 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("[%10d", v__h26085, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[40:9]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[8:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write(", ", "wid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("'h%h", fabric_xactors_from_masters_2_f_wr_data_D_OUT[4:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  TASK_testplusargs_10_OR_TASK_testplusargs_11_A_ETC___d716)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  TASK_testplusargs_10_OR_TASK_testplusargs_11_A_ETC___d717)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d710 ||
	   TASK_testplusargs___d711 && TASK_testplusargs___d712))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data)
	begin
	  TASK_testplusargs___d729 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data)
	begin
	  TASK_testplusargs___d730 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data)
	begin
	  TASK_testplusargs___d731 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data)
	begin
	  v__h26437 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  (TASK_testplusargs___d729 ||
	   TASK_testplusargs___d730 && TASK_testplusargs___d731))
	$write("[%10d", v__h26437, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  (TASK_testplusargs___d729 ||
	   TASK_testplusargs___d730 && TASK_testplusargs___d731))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data &&
	  (TASK_testplusargs___d729 ||
	   TASK_testplusargs___d730 && TASK_testplusargs___d731))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1)
	begin
	  TASK_testplusargs___d744 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1)
	begin
	  TASK_testplusargs___d745 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1)
	begin
	  TASK_testplusargs___d746 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1)
	begin
	  v__h26731 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  (TASK_testplusargs___d744 ||
	   TASK_testplusargs___d745 && TASK_testplusargs___d746))
	$write("[%10d", v__h26731, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  (TASK_testplusargs___d744 ||
	   TASK_testplusargs___d745 && TASK_testplusargs___d746))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_1 &&
	  (TASK_testplusargs___d744 ||
	   TASK_testplusargs___d745 && TASK_testplusargs___d746))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2)
	begin
	  TASK_testplusargs___d759 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2)
	begin
	  TASK_testplusargs___d760 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2)
	begin
	  TASK_testplusargs___d761 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2)
	begin
	  v__h27025 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 &&
	  (TASK_testplusargs___d759 ||
	   TASK_testplusargs___d760 && TASK_testplusargs___d761))
	$write("[%10d", v__h27025, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 &&
	  (TASK_testplusargs___d759 ||
	   TASK_testplusargs___d760 && TASK_testplusargs___d761))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_2 &&
	  (TASK_testplusargs___d759 ||
	   TASK_testplusargs___d760 && TASK_testplusargs___d761))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3)
	begin
	  TASK_testplusargs___d774 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3)
	begin
	  TASK_testplusargs___d775 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3)
	begin
	  TASK_testplusargs___d776 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3)
	begin
	  v__h27319 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 &&
	  (TASK_testplusargs___d774 ||
	   TASK_testplusargs___d775 && TASK_testplusargs___d776))
	$write("[%10d", v__h27319, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 &&
	  (TASK_testplusargs___d774 ||
	   TASK_testplusargs___d775 && TASK_testplusargs___d776))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_3 &&
	  (TASK_testplusargs___d774 ||
	   TASK_testplusargs___d775 && TASK_testplusargs___d776))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4)
	begin
	  TASK_testplusargs___d789 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4)
	begin
	  TASK_testplusargs___d790 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4)
	begin
	  TASK_testplusargs___d791 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4)
	begin
	  v__h27613 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 &&
	  (TASK_testplusargs___d789 ||
	   TASK_testplusargs___d790 && TASK_testplusargs___d791))
	$write("[%10d", v__h27613, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 &&
	  (TASK_testplusargs___d789 ||
	   TASK_testplusargs___d790 && TASK_testplusargs___d791))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_4 &&
	  (TASK_testplusargs___d789 ||
	   TASK_testplusargs___d790 && TASK_testplusargs___d791))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5)
	begin
	  TASK_testplusargs___d804 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5)
	begin
	  TASK_testplusargs___d805 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5)
	begin
	  TASK_testplusargs___d806 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5)
	begin
	  v__h27907 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 &&
	  (TASK_testplusargs___d804 ||
	   TASK_testplusargs___d805 && TASK_testplusargs___d806))
	$write("[%10d", v__h27907, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 &&
	  (TASK_testplusargs___d804 ||
	   TASK_testplusargs___d805 && TASK_testplusargs___d806))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_5 &&
	  (TASK_testplusargs___d804 ||
	   TASK_testplusargs___d805 && TASK_testplusargs___d806))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6)
	begin
	  TASK_testplusargs___d819 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6)
	begin
	  TASK_testplusargs___d820 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6)
	begin
	  TASK_testplusargs___d821 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6)
	begin
	  v__h28219 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 &&
	  (TASK_testplusargs___d819 ||
	   TASK_testplusargs___d820 && TASK_testplusargs___d821))
	$write("[%10d", v__h28219, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 &&
	  (TASK_testplusargs___d819 ||
	   TASK_testplusargs___d820 && TASK_testplusargs___d821))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_6 &&
	  (TASK_testplusargs___d819 ||
	   TASK_testplusargs___d820 && TASK_testplusargs___d821))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7)
	begin
	  TASK_testplusargs___d832 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7)
	begin
	  TASK_testplusargs___d833 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7)
	begin
	  TASK_testplusargs___d834 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7)
	begin
	  v__h28508 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 &&
	  (TASK_testplusargs___d832 ||
	   TASK_testplusargs___d833 && TASK_testplusargs___d834))
	$write("[%10d", v__h28508, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 &&
	  (TASK_testplusargs___d832 ||
	   TASK_testplusargs___d833 && TASK_testplusargs___d834))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_7 &&
	  (TASK_testplusargs___d832 ||
	   TASK_testplusargs___d833 && TASK_testplusargs___d834))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8)
	begin
	  TASK_testplusargs___d845 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8)
	begin
	  TASK_testplusargs___d846 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8)
	begin
	  TASK_testplusargs___d847 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8)
	begin
	  v__h28797 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 &&
	  (TASK_testplusargs___d845 ||
	   TASK_testplusargs___d846 && TASK_testplusargs___d847))
	$write("[%10d", v__h28797, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 &&
	  (TASK_testplusargs___d845 ||
	   TASK_testplusargs___d846 && TASK_testplusargs___d847))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_8 &&
	  (TASK_testplusargs___d845 ||
	   TASK_testplusargs___d846 && TASK_testplusargs___d847))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9)
	begin
	  TASK_testplusargs___d858 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9)
	begin
	  TASK_testplusargs___d859 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9)
	begin
	  TASK_testplusargs___d860 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9)
	begin
	  v__h29086 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 &&
	  (TASK_testplusargs___d858 ||
	   TASK_testplusargs___d859 && TASK_testplusargs___d860))
	$write("[%10d", v__h29086, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 &&
	  (TASK_testplusargs___d858 ||
	   TASK_testplusargs___d859 && TASK_testplusargs___d860))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_9 &&
	  (TASK_testplusargs___d858 ||
	   TASK_testplusargs___d859 && TASK_testplusargs___d860))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10)
	begin
	  TASK_testplusargs___d871 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10)
	begin
	  TASK_testplusargs___d872 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10)
	begin
	  TASK_testplusargs___d873 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10)
	begin
	  v__h29375 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 &&
	  (TASK_testplusargs___d871 ||
	   TASK_testplusargs___d872 && TASK_testplusargs___d873))
	$write("[%10d", v__h29375, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 &&
	  (TASK_testplusargs___d871 ||
	   TASK_testplusargs___d872 && TASK_testplusargs___d873))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_10 &&
	  (TASK_testplusargs___d871 ||
	   TASK_testplusargs___d872 && TASK_testplusargs___d873))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11)
	begin
	  TASK_testplusargs___d884 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11)
	begin
	  TASK_testplusargs___d885 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11)
	begin
	  TASK_testplusargs___d886 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11)
	begin
	  v__h29664 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 &&
	  (TASK_testplusargs___d884 ||
	   TASK_testplusargs___d885 && TASK_testplusargs___d886))
	$write("[%10d", v__h29664, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 &&
	  (TASK_testplusargs___d884 ||
	   TASK_testplusargs___d885 && TASK_testplusargs___d886))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_11 &&
	  (TASK_testplusargs___d884 ||
	   TASK_testplusargs___d885 && TASK_testplusargs___d886))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12)
	begin
	  TASK_testplusargs___d899 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12)
	begin
	  TASK_testplusargs___d900 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12)
	begin
	  TASK_testplusargs___d901 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12)
	begin
	  v__h29976 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 &&
	  (TASK_testplusargs___d899 ||
	   TASK_testplusargs___d900 && TASK_testplusargs___d901))
	$write("[%10d", v__h29976, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 &&
	  (TASK_testplusargs___d899 ||
	   TASK_testplusargs___d900 && TASK_testplusargs___d901))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_12 &&
	  (TASK_testplusargs___d899 ||
	   TASK_testplusargs___d900 && TASK_testplusargs___d901))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13)
	begin
	  TASK_testplusargs___d912 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13)
	begin
	  TASK_testplusargs___d913 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13)
	begin
	  TASK_testplusargs___d914 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13)
	begin
	  v__h30265 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 &&
	  (TASK_testplusargs___d912 ||
	   TASK_testplusargs___d913 && TASK_testplusargs___d914))
	$write("[%10d", v__h30265, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 &&
	  (TASK_testplusargs___d912 ||
	   TASK_testplusargs___d913 && TASK_testplusargs___d914))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_13 &&
	  (TASK_testplusargs___d912 ||
	   TASK_testplusargs___d913 && TASK_testplusargs___d914))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14)
	begin
	  TASK_testplusargs___d925 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14)
	begin
	  TASK_testplusargs___d926 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14)
	begin
	  TASK_testplusargs___d927 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14)
	begin
	  v__h30554 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 &&
	  (TASK_testplusargs___d925 ||
	   TASK_testplusargs___d926 && TASK_testplusargs___d927))
	$write("[%10d", v__h30554, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 &&
	  (TASK_testplusargs___d925 ||
	   TASK_testplusargs___d926 && TASK_testplusargs___d927))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_14 &&
	  (TASK_testplusargs___d925 ||
	   TASK_testplusargs___d926 && TASK_testplusargs___d927))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15)
	begin
	  TASK_testplusargs___d938 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15)
	begin
	  TASK_testplusargs___d939 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15)
	begin
	  TASK_testplusargs___d940 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15)
	begin
	  v__h30843 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 &&
	  (TASK_testplusargs___d938 ||
	   TASK_testplusargs___d939 && TASK_testplusargs___d940))
	$write("[%10d", v__h30843, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 &&
	  (TASK_testplusargs___d938 ||
	   TASK_testplusargs___d939 && TASK_testplusargs___d940))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_15 &&
	  (TASK_testplusargs___d938 ||
	   TASK_testplusargs___d939 && TASK_testplusargs___d940))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16)
	begin
	  TASK_testplusargs___d951 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16)
	begin
	  TASK_testplusargs___d952 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16)
	begin
	  TASK_testplusargs___d953 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16)
	begin
	  v__h31132 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 &&
	  (TASK_testplusargs___d951 ||
	   TASK_testplusargs___d952 && TASK_testplusargs___d953))
	$write("[%10d", v__h31132, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 &&
	  (TASK_testplusargs___d951 ||
	   TASK_testplusargs___d952 && TASK_testplusargs___d953))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_16 &&
	  (TASK_testplusargs___d951 ||
	   TASK_testplusargs___d952 && TASK_testplusargs___d953))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17)
	begin
	  TASK_testplusargs___d964 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17)
	begin
	  TASK_testplusargs___d965 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17)
	begin
	  TASK_testplusargs___d966 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17)
	begin
	  v__h31421 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 &&
	  (TASK_testplusargs___d964 ||
	   TASK_testplusargs___d965 && TASK_testplusargs___d966))
	$write("[%10d", v__h31421, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 &&
	  (TASK_testplusargs___d964 ||
	   TASK_testplusargs___d965 && TASK_testplusargs___d966))
	$write("AXI4_Fabric: Write Data -> slave[%0d] \n", $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_xaction_master_to_slave_data_17 &&
	  (TASK_testplusargs___d964 ||
	   TASK_testplusargs___d965 && TASK_testplusargs___d966))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d984 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d985 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d986 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  v__h32161 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d984 ||
	   TASK_testplusargs___d985 && TASK_testplusargs___d986))
	$write("[%10d", v__h32161, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d984 ||
	   TASK_testplusargs___d985 && TASK_testplusargs___d986))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d984 ||
	   TASK_testplusargs___d985 && TASK_testplusargs___d986))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d990 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d991 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  TASK_testplusargs___d992 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave)
	begin
	  v__h32300 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("[%10d", v__h32300, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave &&
	  (TASK_testplusargs___d990 ||
	   TASK_testplusargs___d991 && TASK_testplusargs___d992))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d1014 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d1015 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d1016 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  v__h32711 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1014 ||
	   TASK_testplusargs___d1015 && TASK_testplusargs___d1016))
	$write("[%10d", v__h32711, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1014 ||
	   TASK_testplusargs___d1015 && TASK_testplusargs___d1016))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1014 ||
	   TASK_testplusargs___d1015 && TASK_testplusargs___d1016))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d1020 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d1021 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  TASK_testplusargs___d1022 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1)
	begin
	  v__h32850 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("[%10d", v__h32850, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_1 &&
	  (TASK_testplusargs___d1020 ||
	   TASK_testplusargs___d1021 && TASK_testplusargs___d1022))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d1040 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d1041 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d1042 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  v__h33261 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1040 ||
	   TASK_testplusargs___d1041 && TASK_testplusargs___d1042))
	$write("[%10d", v__h33261, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1040 ||
	   TASK_testplusargs___d1041 && TASK_testplusargs___d1042))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1040 ||
	   TASK_testplusargs___d1041 && TASK_testplusargs___d1042))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d1046 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d1047 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  TASK_testplusargs___d1048 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2)
	begin
	  v__h33400 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("[%10d", v__h33400, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_2 &&
	  (TASK_testplusargs___d1046 ||
	   TASK_testplusargs___d1047 && TASK_testplusargs___d1048))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d1067 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d1068 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d1069 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  v__h33811 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1067 ||
	   TASK_testplusargs___d1068 && TASK_testplusargs___d1069))
	$write("[%10d", v__h33811, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1067 ||
	   TASK_testplusargs___d1068 && TASK_testplusargs___d1069))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1067 ||
	   TASK_testplusargs___d1068 && TASK_testplusargs___d1069))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d1073 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d1074 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  TASK_testplusargs___d1075 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3)
	begin
	  v__h33950 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("[%10d", v__h33950, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_3 &&
	  (TASK_testplusargs___d1073 ||
	   TASK_testplusargs___d1074 && TASK_testplusargs___d1075))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d1095 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d1096 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d1097 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  v__h34361 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1095 ||
	   TASK_testplusargs___d1096 && TASK_testplusargs___d1097))
	$write("[%10d", v__h34361, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1095 ||
	   TASK_testplusargs___d1096 && TASK_testplusargs___d1097))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1095 ||
	   TASK_testplusargs___d1096 && TASK_testplusargs___d1097))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d1101 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d1102 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  TASK_testplusargs___d1103 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4)
	begin
	  v__h34500 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("[%10d", v__h34500, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_4 &&
	  (TASK_testplusargs___d1101 ||
	   TASK_testplusargs___d1102 && TASK_testplusargs___d1103))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d1119 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d1120 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d1121 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  v__h34911 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1119 ||
	   TASK_testplusargs___d1120 && TASK_testplusargs___d1121))
	$write("[%10d", v__h34911, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1119 ||
	   TASK_testplusargs___d1120 && TASK_testplusargs___d1121))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1119 ||
	   TASK_testplusargs___d1120 && TASK_testplusargs___d1121))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d1125 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d1126 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  TASK_testplusargs___d1127 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5)
	begin
	  v__h35050 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("[%10d", v__h35050, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h", fabric_xactors_from_masters_0_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("'h%h",
	       fabric_xactors_from_masters_0_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_5 &&
	  (TASK_testplusargs___d1125 ||
	   TASK_testplusargs___d1126 && TASK_testplusargs___d1127))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d1143 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d1144 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d1145 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  v__h35504 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1143 ||
	   TASK_testplusargs___d1144 && TASK_testplusargs___d1145))
	$write("[%10d", v__h35504, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1143 ||
	   TASK_testplusargs___d1144 && TASK_testplusargs___d1145))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1143 ||
	   TASK_testplusargs___d1144 && TASK_testplusargs___d1145))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d1149 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d1150 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  TASK_testplusargs___d1151 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6)
	begin
	  v__h35643 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("[%10d", v__h35643, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_6 &&
	  (TASK_testplusargs___d1149 ||
	   TASK_testplusargs___d1150 && TASK_testplusargs___d1151))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d1170 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d1171 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d1172 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  v__h36039 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1170 ||
	   TASK_testplusargs___d1171 && TASK_testplusargs___d1172))
	$write("[%10d", v__h36039, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1170 ||
	   TASK_testplusargs___d1171 && TASK_testplusargs___d1172))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1170 ||
	   TASK_testplusargs___d1171 && TASK_testplusargs___d1172))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d1176 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d1177 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  TASK_testplusargs___d1178 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7)
	begin
	  v__h36178 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("[%10d", v__h36178, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_7 &&
	  (TASK_testplusargs___d1176 ||
	   TASK_testplusargs___d1177 && TASK_testplusargs___d1178))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d1193 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d1194 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d1195 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  v__h36574 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1193 ||
	   TASK_testplusargs___d1194 && TASK_testplusargs___d1195))
	$write("[%10d", v__h36574, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1193 ||
	   TASK_testplusargs___d1194 && TASK_testplusargs___d1195))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1193 ||
	   TASK_testplusargs___d1194 && TASK_testplusargs___d1195))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d1199 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d1200 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  TASK_testplusargs___d1201 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8)
	begin
	  v__h36713 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("[%10d", v__h36713, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_8 &&
	  (TASK_testplusargs___d1199 ||
	   TASK_testplusargs___d1200 && TASK_testplusargs___d1201))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d1217 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d1218 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d1219 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  v__h37109 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1217 ||
	   TASK_testplusargs___d1218 && TASK_testplusargs___d1219))
	$write("[%10d", v__h37109, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1217 ||
	   TASK_testplusargs___d1218 && TASK_testplusargs___d1219))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1217 ||
	   TASK_testplusargs___d1218 && TASK_testplusargs___d1219))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d1223 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d1224 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  TASK_testplusargs___d1225 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9)
	begin
	  v__h37248 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("[%10d", v__h37248, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_9 &&
	  (TASK_testplusargs___d1223 ||
	   TASK_testplusargs___d1224 && TASK_testplusargs___d1225))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d1242 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d1243 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d1244 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  v__h37644 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1242 ||
	   TASK_testplusargs___d1243 && TASK_testplusargs___d1244))
	$write("[%10d", v__h37644, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1242 ||
	   TASK_testplusargs___d1243 && TASK_testplusargs___d1244))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1242 ||
	   TASK_testplusargs___d1243 && TASK_testplusargs___d1244))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d1248 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d1249 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  TASK_testplusargs___d1250 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10)
	begin
	  v__h37783 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("[%10d", v__h37783, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_10 &&
	  (TASK_testplusargs___d1248 ||
	   TASK_testplusargs___d1249 && TASK_testplusargs___d1250))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d1263 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d1264 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d1265 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  v__h38179 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1263 ||
	   TASK_testplusargs___d1264 && TASK_testplusargs___d1265))
	$write("[%10d", v__h38179, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1263 ||
	   TASK_testplusargs___d1264 && TASK_testplusargs___d1265))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1263 ||
	   TASK_testplusargs___d1264 && TASK_testplusargs___d1265))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d1269 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d1270 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  TASK_testplusargs___d1271 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11)
	begin
	  v__h38318 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("[%10d", v__h38318, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h", fabric_xactors_from_masters_1_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("'h%h",
	       fabric_xactors_from_masters_1_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_11 &&
	  (TASK_testplusargs___d1269 ||
	   TASK_testplusargs___d1270 && TASK_testplusargs___d1271))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d1287 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d1288 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d1289 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  v__h38772 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1287 ||
	   TASK_testplusargs___d1288 && TASK_testplusargs___d1289))
	$write("[%10d", v__h38772, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1287 ||
	   TASK_testplusargs___d1288 && TASK_testplusargs___d1289))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1287 ||
	   TASK_testplusargs___d1288 && TASK_testplusargs___d1289))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d1293 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d1294 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  TASK_testplusargs___d1295 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12)
	begin
	  v__h38911 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("[%10d", v__h38911, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_12 &&
	  (TASK_testplusargs___d1293 ||
	   TASK_testplusargs___d1294 && TASK_testplusargs___d1295))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d1314 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d1315 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d1316 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  v__h39307 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1314 ||
	   TASK_testplusargs___d1315 && TASK_testplusargs___d1316))
	$write("[%10d", v__h39307, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1314 ||
	   TASK_testplusargs___d1315 && TASK_testplusargs___d1316))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1314 ||
	   TASK_testplusargs___d1315 && TASK_testplusargs___d1316))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d1320 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d1321 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  TASK_testplusargs___d1322 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13)
	begin
	  v__h39446 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("[%10d", v__h39446, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_13 &&
	  (TASK_testplusargs___d1320 ||
	   TASK_testplusargs___d1321 && TASK_testplusargs___d1322))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d1337 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d1338 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d1339 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  v__h39842 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1337 ||
	   TASK_testplusargs___d1338 && TASK_testplusargs___d1339))
	$write("[%10d", v__h39842, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1337 ||
	   TASK_testplusargs___d1338 && TASK_testplusargs___d1339))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1337 ||
	   TASK_testplusargs___d1338 && TASK_testplusargs___d1339))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d1343 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d1344 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  TASK_testplusargs___d1345 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14)
	begin
	  v__h39981 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("[%10d", v__h39981, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_14 &&
	  (TASK_testplusargs___d1343 ||
	   TASK_testplusargs___d1344 && TASK_testplusargs___d1345))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d1361 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d1362 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d1363 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  v__h40377 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1361 ||
	   TASK_testplusargs___d1362 && TASK_testplusargs___d1363))
	$write("[%10d", v__h40377, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1361 ||
	   TASK_testplusargs___d1362 && TASK_testplusargs___d1363))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1361 ||
	   TASK_testplusargs___d1362 && TASK_testplusargs___d1363))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d1367 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d1368 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  TASK_testplusargs___d1369 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15)
	begin
	  v__h40516 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("[%10d", v__h40516, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_15 &&
	  (TASK_testplusargs___d1367 ||
	   TASK_testplusargs___d1368 && TASK_testplusargs___d1369))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d1386 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d1387 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d1388 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  v__h40912 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1386 ||
	   TASK_testplusargs___d1387 && TASK_testplusargs___d1388))
	$write("[%10d", v__h40912, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1386 ||
	   TASK_testplusargs___d1387 && TASK_testplusargs___d1388))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1386 ||
	   TASK_testplusargs___d1387 && TASK_testplusargs___d1388))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d1392 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d1393 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  TASK_testplusargs___d1394 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16)
	begin
	  v__h41051 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("[%10d", v__h41051, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_16 &&
	  (TASK_testplusargs___d1392 ||
	   TASK_testplusargs___d1393 && TASK_testplusargs___d1394))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d1407 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d1408 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d1409 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  v__h41447 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1407 ||
	   TASK_testplusargs___d1408 && TASK_testplusargs___d1409))
	$write("[%10d", v__h41447, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1407 ||
	   TASK_testplusargs___d1408 && TASK_testplusargs___d1409))
	$write("AXI4_Fabric: rd master [%0d] -> slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1407 ||
	   TASK_testplusargs___d1408 && TASK_testplusargs___d1409))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d1413 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d1414 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  TASK_testplusargs___d1415 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17)
	begin
	  v__h41586 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("[%10d", v__h41586, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("AXI4_Rd_Addr { ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[51:20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[19:17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[16:14]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[13:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h", fabric_xactors_from_masters_2_f_rd_addr_D_OUT[5:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write(", ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("'h%h",
	       fabric_xactors_from_masters_2_f_rd_addr_D_OUT[3:0],
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_xaction_master_to_slave_17 &&
	  (TASK_testplusargs___d1413 ||
	   TASK_testplusargs___d1414 && TASK_testplusargs___d1415))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1433 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1434 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1435 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  v__h41931 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1433 ||
	   TASK_testplusargs___d1434 && TASK_testplusargs___d1435))
	$write("[%10d", v__h41931, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1433 ||
	   TASK_testplusargs___d1434 && TASK_testplusargs___d1435))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1433 ||
	   TASK_testplusargs___d1434 && TASK_testplusargs___d1435))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1439 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1440 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1441 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1447 =
	(TASK_testplusargs___d1439 ||
	 TASK_testplusargs___d1440 && TASK_testplusargs___d1441) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1449 =
	(TASK_testplusargs___d1439 ||
	 TASK_testplusargs___d1440 && TASK_testplusargs___d1441) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1451 =
	(TASK_testplusargs___d1439 ||
	 TASK_testplusargs___d1440 && TASK_testplusargs___d1441) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1457 =
	(TASK_testplusargs___d1439 ||
	 TASK_testplusargs___d1440 && TASK_testplusargs___d1441) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master)
	begin
	  v__h42070 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write("[%10d", v__h42070, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1447)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1449)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1451)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  TASK_testplusargs_439_OR_TASK_testplusargs_440_ETC___d1457)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master &&
	  (TASK_testplusargs___d1439 ||
	   TASK_testplusargs___d1440 && TASK_testplusargs___d1441))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1470 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1471 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1472 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  v__h42380 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1470 ||
	   TASK_testplusargs___d1471 && TASK_testplusargs___d1472))
	$write("[%10d", v__h42380, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1470 ||
	   TASK_testplusargs___d1471 && TASK_testplusargs___d1472))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1470 ||
	   TASK_testplusargs___d1471 && TASK_testplusargs___d1472))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1476 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1477 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1478 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1484 =
	(TASK_testplusargs___d1476 ||
	 TASK_testplusargs___d1477 && TASK_testplusargs___d1478) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1486 =
	(TASK_testplusargs___d1476 ||
	 TASK_testplusargs___d1477 && TASK_testplusargs___d1478) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1488 =
	(TASK_testplusargs___d1476 ||
	 TASK_testplusargs___d1477 && TASK_testplusargs___d1478) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1494 =
	(TASK_testplusargs___d1476 ||
	 TASK_testplusargs___d1477 && TASK_testplusargs___d1478) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1)
	begin
	  v__h42519 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write("[%10d", v__h42519, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1484)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1486)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1488)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  TASK_testplusargs_476_OR_TASK_testplusargs_477_ETC___d1494)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1476 ||
	   TASK_testplusargs___d1477 && TASK_testplusargs___d1478))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d1507 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d1508 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d1509 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  v__h42829 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1507 ||
	   TASK_testplusargs___d1508 && TASK_testplusargs___d1509))
	$write("[%10d", v__h42829, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1507 ||
	   TASK_testplusargs___d1508 && TASK_testplusargs___d1509))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1507 ||
	   TASK_testplusargs___d1508 && TASK_testplusargs___d1509))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d1513 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d1514 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d1515 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1521 =
	(TASK_testplusargs___d1513 ||
	 TASK_testplusargs___d1514 && TASK_testplusargs___d1515) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1523 =
	(TASK_testplusargs___d1513 ||
	 TASK_testplusargs___d1514 && TASK_testplusargs___d1515) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1525 =
	(TASK_testplusargs___d1513 ||
	 TASK_testplusargs___d1514 && TASK_testplusargs___d1515) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1531 =
	(TASK_testplusargs___d1513 ||
	 TASK_testplusargs___d1514 && TASK_testplusargs___d1515) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2)
	begin
	  v__h42968 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write("[%10d", v__h42968, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1521)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1523)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1525)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  TASK_testplusargs_513_OR_TASK_testplusargs_514_ETC___d1531)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d1513 ||
	   TASK_testplusargs___d1514 && TASK_testplusargs___d1515))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d1544 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d1545 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d1546 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  v__h43278 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1544 ||
	   TASK_testplusargs___d1545 && TASK_testplusargs___d1546))
	$write("[%10d", v__h43278, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1544 ||
	   TASK_testplusargs___d1545 && TASK_testplusargs___d1546))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1544 ||
	   TASK_testplusargs___d1545 && TASK_testplusargs___d1546))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d1550 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d1551 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d1552 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1558 =
	(TASK_testplusargs___d1550 ||
	 TASK_testplusargs___d1551 && TASK_testplusargs___d1552) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1560 =
	(TASK_testplusargs___d1550 ||
	 TASK_testplusargs___d1551 && TASK_testplusargs___d1552) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1562 =
	(TASK_testplusargs___d1550 ||
	 TASK_testplusargs___d1551 && TASK_testplusargs___d1552) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1568 =
	(TASK_testplusargs___d1550 ||
	 TASK_testplusargs___d1551 && TASK_testplusargs___d1552) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3)
	begin
	  v__h43417 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write("[%10d", v__h43417, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1558)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1560)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1562)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  TASK_testplusargs_550_OR_TASK_testplusargs_551_ETC___d1568)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write("'h%h", fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d1550 ||
	   TASK_testplusargs___d1551 && TASK_testplusargs___d1552))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d1581 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d1582 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d1583 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  v__h43727 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1581 ||
	   TASK_testplusargs___d1582 && TASK_testplusargs___d1583))
	$write("[%10d", v__h43727, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1581 ||
	   TASK_testplusargs___d1582 && TASK_testplusargs___d1583))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1581 ||
	   TASK_testplusargs___d1582 && TASK_testplusargs___d1583))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d1587 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d1588 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d1589 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1595 =
	(TASK_testplusargs___d1587 ||
	 TASK_testplusargs___d1588 && TASK_testplusargs___d1589) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1597 =
	(TASK_testplusargs___d1587 ||
	 TASK_testplusargs___d1588 && TASK_testplusargs___d1589) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1599 =
	(TASK_testplusargs___d1587 ||
	 TASK_testplusargs___d1588 && TASK_testplusargs___d1589) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1605 =
	(TASK_testplusargs___d1587 ||
	 TASK_testplusargs___d1588 && TASK_testplusargs___d1589) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4)
	begin
	  v__h43866 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write("[%10d", v__h43866, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1595)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1597)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1599)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  TASK_testplusargs_587_OR_TASK_testplusargs_588_ETC___d1605)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write("'h%h", fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d1587 ||
	   TASK_testplusargs___d1588 && TASK_testplusargs___d1589))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d1618 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d1619 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d1620 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  v__h44176 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1618 ||
	   TASK_testplusargs___d1619 && TASK_testplusargs___d1620))
	$write("[%10d", v__h44176, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1618 ||
	   TASK_testplusargs___d1619 && TASK_testplusargs___d1620))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1618 ||
	   TASK_testplusargs___d1619 && TASK_testplusargs___d1620))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d1624 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d1625 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d1626 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1632 =
	(TASK_testplusargs___d1624 ||
	 TASK_testplusargs___d1625 && TASK_testplusargs___d1626) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1634 =
	(TASK_testplusargs___d1624 ||
	 TASK_testplusargs___d1625 && TASK_testplusargs___d1626) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1636 =
	(TASK_testplusargs___d1624 ||
	 TASK_testplusargs___d1625 && TASK_testplusargs___d1626) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1642 =
	(TASK_testplusargs___d1624 ||
	 TASK_testplusargs___d1625 && TASK_testplusargs___d1626) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5)
	begin
	  v__h44315 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write("[%10d", v__h44315, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1632)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1634)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1636)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  TASK_testplusargs_624_OR_TASK_testplusargs_625_ETC___d1642)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write("'h%h", fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d1624 ||
	   TASK_testplusargs___d1625 && TASK_testplusargs___d1626))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d1654 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d1655 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d1656 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  v__h44630 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1654 ||
	   TASK_testplusargs___d1655 && TASK_testplusargs___d1656))
	$write("[%10d", v__h44630, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1654 ||
	   TASK_testplusargs___d1655 && TASK_testplusargs___d1656))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1654 ||
	   TASK_testplusargs___d1655 && TASK_testplusargs___d1656))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d1660 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d1661 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d1662 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1666 =
	(TASK_testplusargs___d1660 ||
	 TASK_testplusargs___d1661 && TASK_testplusargs___d1662) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1667 =
	(TASK_testplusargs___d1660 ||
	 TASK_testplusargs___d1661 && TASK_testplusargs___d1662) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1668 =
	(TASK_testplusargs___d1660 ||
	 TASK_testplusargs___d1661 && TASK_testplusargs___d1662) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1669 =
	(TASK_testplusargs___d1660 ||
	 TASK_testplusargs___d1661 && TASK_testplusargs___d1662) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6)
	begin
	  v__h44769 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write("[%10d", v__h44769, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1666)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1667)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1668)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  TASK_testplusargs_660_OR_TASK_testplusargs_661_ETC___d1669)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d1660 ||
	   TASK_testplusargs___d1661 && TASK_testplusargs___d1662))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d1676 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d1677 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d1678 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  v__h45052 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1676 ||
	   TASK_testplusargs___d1677 && TASK_testplusargs___d1678))
	$write("[%10d", v__h45052, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1676 ||
	   TASK_testplusargs___d1677 && TASK_testplusargs___d1678))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1676 ||
	   TASK_testplusargs___d1677 && TASK_testplusargs___d1678))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d1682 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d1683 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d1684 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1688 =
	(TASK_testplusargs___d1682 ||
	 TASK_testplusargs___d1683 && TASK_testplusargs___d1684) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1689 =
	(TASK_testplusargs___d1682 ||
	 TASK_testplusargs___d1683 && TASK_testplusargs___d1684) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1690 =
	(TASK_testplusargs___d1682 ||
	 TASK_testplusargs___d1683 && TASK_testplusargs___d1684) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1691 =
	(TASK_testplusargs___d1682 ||
	 TASK_testplusargs___d1683 && TASK_testplusargs___d1684) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7)
	begin
	  v__h45191 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write("[%10d", v__h45191, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1688)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1689)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1690)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  TASK_testplusargs_682_OR_TASK_testplusargs_683_ETC___d1691)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d1682 ||
	   TASK_testplusargs___d1683 && TASK_testplusargs___d1684))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d1698 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d1699 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d1700 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  v__h45474 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1698 ||
	   TASK_testplusargs___d1699 && TASK_testplusargs___d1700))
	$write("[%10d", v__h45474, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1698 ||
	   TASK_testplusargs___d1699 && TASK_testplusargs___d1700))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1698 ||
	   TASK_testplusargs___d1699 && TASK_testplusargs___d1700))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d1704 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d1705 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d1706 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1710 =
	(TASK_testplusargs___d1704 ||
	 TASK_testplusargs___d1705 && TASK_testplusargs___d1706) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1711 =
	(TASK_testplusargs___d1704 ||
	 TASK_testplusargs___d1705 && TASK_testplusargs___d1706) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1712 =
	(TASK_testplusargs___d1704 ||
	 TASK_testplusargs___d1705 && TASK_testplusargs___d1706) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1713 =
	(TASK_testplusargs___d1704 ||
	 TASK_testplusargs___d1705 && TASK_testplusargs___d1706) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8)
	begin
	  v__h45613 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write("[%10d", v__h45613, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1710)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1711)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1712)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  TASK_testplusargs_704_OR_TASK_testplusargs_705_ETC___d1713)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d1704 ||
	   TASK_testplusargs___d1705 && TASK_testplusargs___d1706))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d1720 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d1721 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d1722 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  v__h45896 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1720 ||
	   TASK_testplusargs___d1721 && TASK_testplusargs___d1722))
	$write("[%10d", v__h45896, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1720 ||
	   TASK_testplusargs___d1721 && TASK_testplusargs___d1722))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1720 ||
	   TASK_testplusargs___d1721 && TASK_testplusargs___d1722))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d1726 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d1727 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d1728 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1732 =
	(TASK_testplusargs___d1726 ||
	 TASK_testplusargs___d1727 && TASK_testplusargs___d1728) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1733 =
	(TASK_testplusargs___d1726 ||
	 TASK_testplusargs___d1727 && TASK_testplusargs___d1728) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1734 =
	(TASK_testplusargs___d1726 ||
	 TASK_testplusargs___d1727 && TASK_testplusargs___d1728) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1735 =
	(TASK_testplusargs___d1726 ||
	 TASK_testplusargs___d1727 && TASK_testplusargs___d1728) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9)
	begin
	  v__h46035 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write("[%10d", v__h46035, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1732)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1733)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1734)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  TASK_testplusargs_726_OR_TASK_testplusargs_727_ETC___d1735)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write("'h%h", fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d1726 ||
	   TASK_testplusargs___d1727 && TASK_testplusargs___d1728))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d1742 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d1743 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d1744 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  v__h46318 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1742 ||
	   TASK_testplusargs___d1743 && TASK_testplusargs___d1744))
	$write("[%10d", v__h46318, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1742 ||
	   TASK_testplusargs___d1743 && TASK_testplusargs___d1744))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1742 ||
	   TASK_testplusargs___d1743 && TASK_testplusargs___d1744))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d1748 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d1749 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d1750 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1754 =
	(TASK_testplusargs___d1748 ||
	 TASK_testplusargs___d1749 && TASK_testplusargs___d1750) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1755 =
	(TASK_testplusargs___d1748 ||
	 TASK_testplusargs___d1749 && TASK_testplusargs___d1750) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1756 =
	(TASK_testplusargs___d1748 ||
	 TASK_testplusargs___d1749 && TASK_testplusargs___d1750) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1757 =
	(TASK_testplusargs___d1748 ||
	 TASK_testplusargs___d1749 && TASK_testplusargs___d1750) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10)
	begin
	  v__h46457 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write("[%10d", v__h46457, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1754)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1755)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1756)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  TASK_testplusargs_748_OR_TASK_testplusargs_749_ETC___d1757)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write("'h%h", fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d1748 ||
	   TASK_testplusargs___d1749 && TASK_testplusargs___d1750))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d1764 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d1765 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d1766 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  v__h46740 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1764 ||
	   TASK_testplusargs___d1765 && TASK_testplusargs___d1766))
	$write("[%10d", v__h46740, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1764 ||
	   TASK_testplusargs___d1765 && TASK_testplusargs___d1766))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1764 ||
	   TASK_testplusargs___d1765 && TASK_testplusargs___d1766))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d1770 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d1771 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d1772 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1776 =
	(TASK_testplusargs___d1770 ||
	 TASK_testplusargs___d1771 && TASK_testplusargs___d1772) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1777 =
	(TASK_testplusargs___d1770 ||
	 TASK_testplusargs___d1771 && TASK_testplusargs___d1772) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1778 =
	(TASK_testplusargs___d1770 ||
	 TASK_testplusargs___d1771 && TASK_testplusargs___d1772) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1779 =
	(TASK_testplusargs___d1770 ||
	 TASK_testplusargs___d1771 && TASK_testplusargs___d1772) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11)
	begin
	  v__h46879 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write("[%10d", v__h46879, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1776)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1777)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1778)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  TASK_testplusargs_770_OR_TASK_testplusargs_771_ETC___d1779)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write("'h%h", fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d1770 ||
	   TASK_testplusargs___d1771 && TASK_testplusargs___d1772))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d1790 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d1791 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d1792 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  v__h47194 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1790 ||
	   TASK_testplusargs___d1791 && TASK_testplusargs___d1792))
	$write("[%10d", v__h47194, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1790 ||
	   TASK_testplusargs___d1791 && TASK_testplusargs___d1792))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1790 ||
	   TASK_testplusargs___d1791 && TASK_testplusargs___d1792))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d1796 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d1797 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d1798 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1802 =
	(TASK_testplusargs___d1796 ||
	 TASK_testplusargs___d1797 && TASK_testplusargs___d1798) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1803 =
	(TASK_testplusargs___d1796 ||
	 TASK_testplusargs___d1797 && TASK_testplusargs___d1798) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1804 =
	(TASK_testplusargs___d1796 ||
	 TASK_testplusargs___d1797 && TASK_testplusargs___d1798) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1805 =
	(TASK_testplusargs___d1796 ||
	 TASK_testplusargs___d1797 && TASK_testplusargs___d1798) &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12)
	begin
	  v__h47333 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write("[%10d", v__h47333, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1802)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1803)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1804)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  TASK_testplusargs_796_OR_TASK_testplusargs_797_ETC___d1805)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write("'h%h", fabric_xactors_to_slaves_0_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d1796 ||
	   TASK_testplusargs___d1797 && TASK_testplusargs___d1798))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d1812 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d1813 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d1814 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  v__h47616 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1812 ||
	   TASK_testplusargs___d1813 && TASK_testplusargs___d1814))
	$write("[%10d", v__h47616, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1812 ||
	   TASK_testplusargs___d1813 && TASK_testplusargs___d1814))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1812 ||
	   TASK_testplusargs___d1813 && TASK_testplusargs___d1814))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d1818 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d1819 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d1820 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1824 =
	(TASK_testplusargs___d1818 ||
	 TASK_testplusargs___d1819 && TASK_testplusargs___d1820) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1825 =
	(TASK_testplusargs___d1818 ||
	 TASK_testplusargs___d1819 && TASK_testplusargs___d1820) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1826 =
	(TASK_testplusargs___d1818 ||
	 TASK_testplusargs___d1819 && TASK_testplusargs___d1820) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1827 =
	(TASK_testplusargs___d1818 ||
	 TASK_testplusargs___d1819 && TASK_testplusargs___d1820) &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13)
	begin
	  v__h47755 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write("[%10d", v__h47755, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1824)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1825)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1826)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  TASK_testplusargs_818_OR_TASK_testplusargs_819_ETC___d1827)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write("'h%h", fabric_xactors_to_slaves_1_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d1818 ||
	   TASK_testplusargs___d1819 && TASK_testplusargs___d1820))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d1834 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d1835 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d1836 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  v__h48038 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1834 ||
	   TASK_testplusargs___d1835 && TASK_testplusargs___d1836))
	$write("[%10d", v__h48038, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1834 ||
	   TASK_testplusargs___d1835 && TASK_testplusargs___d1836))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1834 ||
	   TASK_testplusargs___d1835 && TASK_testplusargs___d1836))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d1840 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d1841 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d1842 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1846 =
	(TASK_testplusargs___d1840 ||
	 TASK_testplusargs___d1841 && TASK_testplusargs___d1842) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1847 =
	(TASK_testplusargs___d1840 ||
	 TASK_testplusargs___d1841 && TASK_testplusargs___d1842) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1848 =
	(TASK_testplusargs___d1840 ||
	 TASK_testplusargs___d1841 && TASK_testplusargs___d1842) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1849 =
	(TASK_testplusargs___d1840 ||
	 TASK_testplusargs___d1841 && TASK_testplusargs___d1842) &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14)
	begin
	  v__h48177 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write("[%10d", v__h48177, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1846)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1847)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1848)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  TASK_testplusargs_840_OR_TASK_testplusargs_841_ETC___d1849)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write("'h%h", fabric_xactors_to_slaves_2_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d1840 ||
	   TASK_testplusargs___d1841 && TASK_testplusargs___d1842))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d1856 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d1857 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d1858 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  v__h48460 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1856 ||
	   TASK_testplusargs___d1857 && TASK_testplusargs___d1858))
	$write("[%10d", v__h48460, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1856 ||
	   TASK_testplusargs___d1857 && TASK_testplusargs___d1858))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1856 ||
	   TASK_testplusargs___d1857 && TASK_testplusargs___d1858))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d1862 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d1863 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d1864 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1868 =
	(TASK_testplusargs___d1862 ||
	 TASK_testplusargs___d1863 && TASK_testplusargs___d1864) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1869 =
	(TASK_testplusargs___d1862 ||
	 TASK_testplusargs___d1863 && TASK_testplusargs___d1864) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1870 =
	(TASK_testplusargs___d1862 ||
	 TASK_testplusargs___d1863 && TASK_testplusargs___d1864) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1871 =
	(TASK_testplusargs___d1862 ||
	 TASK_testplusargs___d1863 && TASK_testplusargs___d1864) &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15)
	begin
	  v__h48599 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write("[%10d", v__h48599, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1868)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1869)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1870)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  TASK_testplusargs_862_OR_TASK_testplusargs_863_ETC___d1871)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write("'h%h", fabric_xactors_to_slaves_3_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d1862 ||
	   TASK_testplusargs___d1863 && TASK_testplusargs___d1864))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d1878 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d1879 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d1880 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  v__h48882 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1878 ||
	   TASK_testplusargs___d1879 && TASK_testplusargs___d1880))
	$write("[%10d", v__h48882, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1878 ||
	   TASK_testplusargs___d1879 && TASK_testplusargs___d1880))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1878 ||
	   TASK_testplusargs___d1879 && TASK_testplusargs___d1880))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d1884 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d1885 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d1886 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1890 =
	(TASK_testplusargs___d1884 ||
	 TASK_testplusargs___d1885 && TASK_testplusargs___d1886) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1891 =
	(TASK_testplusargs___d1884 ||
	 TASK_testplusargs___d1885 && TASK_testplusargs___d1886) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1892 =
	(TASK_testplusargs___d1884 ||
	 TASK_testplusargs___d1885 && TASK_testplusargs___d1886) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1893 =
	(TASK_testplusargs___d1884 ||
	 TASK_testplusargs___d1885 && TASK_testplusargs___d1886) &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16)
	begin
	  v__h49021 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write("[%10d", v__h49021, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1890)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1891)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1892)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  TASK_testplusargs_884_OR_TASK_testplusargs_885_ETC___d1893)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write("'h%h", fabric_xactors_to_slaves_4_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d1884 ||
	   TASK_testplusargs___d1885 && TASK_testplusargs___d1886))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d1900 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d1901 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d1902 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  v__h49304 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1900 ||
	   TASK_testplusargs___d1901 && TASK_testplusargs___d1902))
	$write("[%10d", v__h49304, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1900 ||
	   TASK_testplusargs___d1901 && TASK_testplusargs___d1902))
	$write("AXI4_Fabric: wr master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1900 ||
	   TASK_testplusargs___d1901 && TASK_testplusargs___d1902))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d1906 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d1907 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d1908 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1912 =
	(TASK_testplusargs___d1906 ||
	 TASK_testplusargs___d1907 && TASK_testplusargs___d1908) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd0;
    TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1913 =
	(TASK_testplusargs___d1906 ||
	 TASK_testplusargs___d1907 && TASK_testplusargs___d1908) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd1;
    TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1914 =
	(TASK_testplusargs___d1906 ||
	 TASK_testplusargs___d1907 && TASK_testplusargs___d1908) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] == 2'd2;
    TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1915 =
	(TASK_testplusargs___d1906 ||
	 TASK_testplusargs___d1907 && TASK_testplusargs___d1908) &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd0 &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd1 &&
	fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[5:4] != 2'd2;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17)
	begin
	  v__h49443 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write("[%10d", v__h49443, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write("AXI4_Wr_Resp { ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1912)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1913)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1914)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  TASK_testplusargs_906_OR_TASK_testplusargs_907_ETC___d1915)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write(", ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write("'h%h", fabric_xactors_to_slaves_5_f_wr_resp_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_wr_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d1906 ||
	   TASK_testplusargs___d1907 && TASK_testplusargs___d1908))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1931 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1932 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1933 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  v__h49850 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1931 ||
	   TASK_testplusargs___d1932 && TASK_testplusargs___d1933))
	$write("[%10d", v__h49850, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1931 ||
	   TASK_testplusargs___d1932 && TASK_testplusargs___d1933))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1931 ||
	   TASK_testplusargs___d1932 && TASK_testplusargs___d1933))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1937 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1938 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  TASK_testplusargs___d1939 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1945 =
	(TASK_testplusargs___d1937 ||
	 TASK_testplusargs___d1938 && TASK_testplusargs___d1939) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1947 =
	(TASK_testplusargs___d1937 ||
	 TASK_testplusargs___d1938 && TASK_testplusargs___d1939) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1949 =
	(TASK_testplusargs___d1937 ||
	 TASK_testplusargs___d1938 && TASK_testplusargs___d1939) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1955 =
	(TASK_testplusargs___d1937 ||
	 TASK_testplusargs___d1938 && TASK_testplusargs___d1939) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1959 =
	(TASK_testplusargs___d1937 ||
	 TASK_testplusargs___d1938 && TASK_testplusargs___d1939) &&
	!fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4];
    TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1957 =
	(TASK_testplusargs___d1937 ||
	 TASK_testplusargs___d1938 && TASK_testplusargs___d1939) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master)
	begin
	  v__h49989 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("[%10d", v__h49989, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1945)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1947)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1949)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1955)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1957)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  TASK_testplusargs_937_OR_TASK_testplusargs_938_ETC___d1959)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master &&
	  (TASK_testplusargs___d1937 ||
	   TASK_testplusargs___d1938 && TASK_testplusargs___d1939))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1973 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1974 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1975 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  v__h50365 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1973 ||
	   TASK_testplusargs___d1974 && TASK_testplusargs___d1975))
	$write("[%10d", v__h50365, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1973 ||
	   TASK_testplusargs___d1974 && TASK_testplusargs___d1975))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1973 ||
	   TASK_testplusargs___d1974 && TASK_testplusargs___d1975))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1979 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1980 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  TASK_testplusargs___d1981 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1987 =
	(TASK_testplusargs___d1979 ||
	 TASK_testplusargs___d1980 && TASK_testplusargs___d1981) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1989 =
	(TASK_testplusargs___d1979 ||
	 TASK_testplusargs___d1980 && TASK_testplusargs___d1981) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1991 =
	(TASK_testplusargs___d1979 ||
	 TASK_testplusargs___d1980 && TASK_testplusargs___d1981) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1997 =
	(TASK_testplusargs___d1979 ||
	 TASK_testplusargs___d1980 && TASK_testplusargs___d1981) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1999 =
	(TASK_testplusargs___d1979 ||
	 TASK_testplusargs___d1980 && TASK_testplusargs___d1981) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4];
    TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d2001 =
	(TASK_testplusargs___d1979 ||
	 TASK_testplusargs___d1980 && TASK_testplusargs___d1981) &&
	!fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1)
	begin
	  v__h50504 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("[%10d", v__h50504, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1987)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1989)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1991)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1997)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d1999)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  TASK_testplusargs_979_OR_TASK_testplusargs_980_ETC___d2001)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_1 &&
	  (TASK_testplusargs___d1979 ||
	   TASK_testplusargs___d1980 && TASK_testplusargs___d1981))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d2015 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d2016 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d2017 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  v__h50880 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2015 ||
	   TASK_testplusargs___d2016 && TASK_testplusargs___d2017))
	$write("[%10d", v__h50880, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2015 ||
	   TASK_testplusargs___d2016 && TASK_testplusargs___d2017))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2015 ||
	   TASK_testplusargs___d2016 && TASK_testplusargs___d2017))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d2021 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d2022 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  TASK_testplusargs___d2023 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2029 =
	(TASK_testplusargs___d2021 ||
	 TASK_testplusargs___d2022 && TASK_testplusargs___d2023) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2031 =
	(TASK_testplusargs___d2021 ||
	 TASK_testplusargs___d2022 && TASK_testplusargs___d2023) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2033 =
	(TASK_testplusargs___d2021 ||
	 TASK_testplusargs___d2022 && TASK_testplusargs___d2023) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2039 =
	(TASK_testplusargs___d2021 ||
	 TASK_testplusargs___d2022 && TASK_testplusargs___d2023) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2041 =
	(TASK_testplusargs___d2021 ||
	 TASK_testplusargs___d2022 && TASK_testplusargs___d2023) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4];
    TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2043 =
	(TASK_testplusargs___d2021 ||
	 TASK_testplusargs___d2022 && TASK_testplusargs___d2023) &&
	!fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2)
	begin
	  v__h51019 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("[%10d", v__h51019, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2029)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2031)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2033)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2039)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2041)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  TASK_testplusargs_021_OR_TASK_testplusargs_022_ETC___d2043)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_2 &&
	  (TASK_testplusargs___d2021 ||
	   TASK_testplusargs___d2022 && TASK_testplusargs___d2023))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d2057 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d2058 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d2059 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  v__h51395 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2057 ||
	   TASK_testplusargs___d2058 && TASK_testplusargs___d2059))
	$write("[%10d", v__h51395, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2057 ||
	   TASK_testplusargs___d2058 && TASK_testplusargs___d2059))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2057 ||
	   TASK_testplusargs___d2058 && TASK_testplusargs___d2059))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d2063 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d2064 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  TASK_testplusargs___d2065 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2071 =
	(TASK_testplusargs___d2063 ||
	 TASK_testplusargs___d2064 && TASK_testplusargs___d2065) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2073 =
	(TASK_testplusargs___d2063 ||
	 TASK_testplusargs___d2064 && TASK_testplusargs___d2065) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2075 =
	(TASK_testplusargs___d2063 ||
	 TASK_testplusargs___d2064 && TASK_testplusargs___d2065) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2081 =
	(TASK_testplusargs___d2063 ||
	 TASK_testplusargs___d2064 && TASK_testplusargs___d2065) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2083 =
	(TASK_testplusargs___d2063 ||
	 TASK_testplusargs___d2064 && TASK_testplusargs___d2065) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4];
    TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2085 =
	(TASK_testplusargs___d2063 ||
	 TASK_testplusargs___d2064 && TASK_testplusargs___d2065) &&
	!fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3)
	begin
	  v__h51534 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("[%10d", v__h51534, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2071)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2073)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2075)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2081)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("'h%h", fabric_xactors_to_slaves_3_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2083)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  TASK_testplusargs_063_OR_TASK_testplusargs_064_ETC___d2085)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("'h%h", fabric_xactors_to_slaves_3_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_3 &&
	  (TASK_testplusargs___d2063 ||
	   TASK_testplusargs___d2064 && TASK_testplusargs___d2065))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d2099 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d2100 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d2101 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  v__h51910 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2099 ||
	   TASK_testplusargs___d2100 && TASK_testplusargs___d2101))
	$write("[%10d", v__h51910, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2099 ||
	   TASK_testplusargs___d2100 && TASK_testplusargs___d2101))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2099 ||
	   TASK_testplusargs___d2100 && TASK_testplusargs___d2101))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d2105 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d2106 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  TASK_testplusargs___d2107 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2113 =
	(TASK_testplusargs___d2105 ||
	 TASK_testplusargs___d2106 && TASK_testplusargs___d2107) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2115 =
	(TASK_testplusargs___d2105 ||
	 TASK_testplusargs___d2106 && TASK_testplusargs___d2107) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2117 =
	(TASK_testplusargs___d2105 ||
	 TASK_testplusargs___d2106 && TASK_testplusargs___d2107) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2123 =
	(TASK_testplusargs___d2105 ||
	 TASK_testplusargs___d2106 && TASK_testplusargs___d2107) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2125 =
	(TASK_testplusargs___d2105 ||
	 TASK_testplusargs___d2106 && TASK_testplusargs___d2107) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4];
    TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2127 =
	(TASK_testplusargs___d2105 ||
	 TASK_testplusargs___d2106 && TASK_testplusargs___d2107) &&
	!fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4)
	begin
	  v__h52049 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("[%10d", v__h52049, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2113)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2115)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2117)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2123)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("'h%h", fabric_xactors_to_slaves_4_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2125)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  TASK_testplusargs_105_OR_TASK_testplusargs_106_ETC___d2127)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("'h%h", fabric_xactors_to_slaves_4_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_4 &&
	  (TASK_testplusargs___d2105 ||
	   TASK_testplusargs___d2106 && TASK_testplusargs___d2107))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d2141 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d2142 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d2143 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  v__h52425 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2141 ||
	   TASK_testplusargs___d2142 && TASK_testplusargs___d2143))
	$write("[%10d", v__h52425, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2141 ||
	   TASK_testplusargs___d2142 && TASK_testplusargs___d2143))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd0),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2141 ||
	   TASK_testplusargs___d2142 && TASK_testplusargs___d2143))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d2147 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d2148 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  TASK_testplusargs___d2149 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2155 =
	(TASK_testplusargs___d2147 ||
	 TASK_testplusargs___d2148 && TASK_testplusargs___d2149) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2157 =
	(TASK_testplusargs___d2147 ||
	 TASK_testplusargs___d2148 && TASK_testplusargs___d2149) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2159 =
	(TASK_testplusargs___d2147 ||
	 TASK_testplusargs___d2148 && TASK_testplusargs___d2149) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2165 =
	(TASK_testplusargs___d2147 ||
	 TASK_testplusargs___d2148 && TASK_testplusargs___d2149) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2167 =
	(TASK_testplusargs___d2147 ||
	 TASK_testplusargs___d2148 && TASK_testplusargs___d2149) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4];
    TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2169 =
	(TASK_testplusargs___d2147 ||
	 TASK_testplusargs___d2148 && TASK_testplusargs___d2149) &&
	!fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5)
	begin
	  v__h52564 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("[%10d", v__h52564, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2155)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2157)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2159)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2165)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("'h%h", fabric_xactors_to_slaves_5_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2167)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  TASK_testplusargs_147_OR_TASK_testplusargs_148_ETC___d2169)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("'h%h", fabric_xactors_to_slaves_5_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_5 &&
	  (TASK_testplusargs___d2147 ||
	   TASK_testplusargs___d2148 && TASK_testplusargs___d2149))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d2181 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d2182 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d2183 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  v__h52936 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2181 ||
	   TASK_testplusargs___d2182 && TASK_testplusargs___d2183))
	$write("[%10d", v__h52936, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2181 ||
	   TASK_testplusargs___d2182 && TASK_testplusargs___d2183))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2181 ||
	   TASK_testplusargs___d2182 && TASK_testplusargs___d2183))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d2187 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d2188 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  TASK_testplusargs___d2189 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2193 =
	(TASK_testplusargs___d2187 ||
	 TASK_testplusargs___d2188 && TASK_testplusargs___d2189) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2194 =
	(TASK_testplusargs___d2187 ||
	 TASK_testplusargs___d2188 && TASK_testplusargs___d2189) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2195 =
	(TASK_testplusargs___d2187 ||
	 TASK_testplusargs___d2188 && TASK_testplusargs___d2189) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2196 =
	(TASK_testplusargs___d2187 ||
	 TASK_testplusargs___d2188 && TASK_testplusargs___d2189) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2197 =
	(TASK_testplusargs___d2187 ||
	 TASK_testplusargs___d2188 && TASK_testplusargs___d2189) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4];
    TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2198 =
	(TASK_testplusargs___d2187 ||
	 TASK_testplusargs___d2188 && TASK_testplusargs___d2189) &&
	!fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6)
	begin
	  v__h53075 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("[%10d", v__h53075, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2193)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2194)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2195)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2196)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2197)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  TASK_testplusargs_187_OR_TASK_testplusargs_188_ETC___d2198)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_6 &&
	  (TASK_testplusargs___d2187 ||
	   TASK_testplusargs___d2188 && TASK_testplusargs___d2189))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d2205 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d2206 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d2207 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  v__h53413 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2205 ||
	   TASK_testplusargs___d2206 && TASK_testplusargs___d2207))
	$write("[%10d", v__h53413, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2205 ||
	   TASK_testplusargs___d2206 && TASK_testplusargs___d2207))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2205 ||
	   TASK_testplusargs___d2206 && TASK_testplusargs___d2207))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d2211 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d2212 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  TASK_testplusargs___d2213 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2217 =
	(TASK_testplusargs___d2211 ||
	 TASK_testplusargs___d2212 && TASK_testplusargs___d2213) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2218 =
	(TASK_testplusargs___d2211 ||
	 TASK_testplusargs___d2212 && TASK_testplusargs___d2213) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2219 =
	(TASK_testplusargs___d2211 ||
	 TASK_testplusargs___d2212 && TASK_testplusargs___d2213) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2220 =
	(TASK_testplusargs___d2211 ||
	 TASK_testplusargs___d2212 && TASK_testplusargs___d2213) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2221 =
	(TASK_testplusargs___d2211 ||
	 TASK_testplusargs___d2212 && TASK_testplusargs___d2213) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4];
    TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2222 =
	(TASK_testplusargs___d2211 ||
	 TASK_testplusargs___d2212 && TASK_testplusargs___d2213) &&
	!fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7)
	begin
	  v__h53552 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("[%10d", v__h53552, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2217)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2218)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2219)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2220)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2221)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  TASK_testplusargs_211_OR_TASK_testplusargs_212_ETC___d2222)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_7 &&
	  (TASK_testplusargs___d2211 ||
	   TASK_testplusargs___d2212 && TASK_testplusargs___d2213))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d2229 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d2230 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d2231 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  v__h53890 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2229 ||
	   TASK_testplusargs___d2230 && TASK_testplusargs___d2231))
	$write("[%10d", v__h53890, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2229 ||
	   TASK_testplusargs___d2230 && TASK_testplusargs___d2231))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2229 ||
	   TASK_testplusargs___d2230 && TASK_testplusargs___d2231))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d2235 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d2236 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  TASK_testplusargs___d2237 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2241 =
	(TASK_testplusargs___d2235 ||
	 TASK_testplusargs___d2236 && TASK_testplusargs___d2237) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2242 =
	(TASK_testplusargs___d2235 ||
	 TASK_testplusargs___d2236 && TASK_testplusargs___d2237) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2243 =
	(TASK_testplusargs___d2235 ||
	 TASK_testplusargs___d2236 && TASK_testplusargs___d2237) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2244 =
	(TASK_testplusargs___d2235 ||
	 TASK_testplusargs___d2236 && TASK_testplusargs___d2237) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2245 =
	(TASK_testplusargs___d2235 ||
	 TASK_testplusargs___d2236 && TASK_testplusargs___d2237) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4];
    TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2246 =
	(TASK_testplusargs___d2235 ||
	 TASK_testplusargs___d2236 && TASK_testplusargs___d2237) &&
	!fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8)
	begin
	  v__h54029 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("[%10d", v__h54029, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2241)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2242)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2243)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2244)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2245)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  TASK_testplusargs_235_OR_TASK_testplusargs_236_ETC___d2246)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_8 &&
	  (TASK_testplusargs___d2235 ||
	   TASK_testplusargs___d2236 && TASK_testplusargs___d2237))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d2253 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d2254 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d2255 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  v__h54367 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2253 ||
	   TASK_testplusargs___d2254 && TASK_testplusargs___d2255))
	$write("[%10d", v__h54367, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2253 ||
	   TASK_testplusargs___d2254 && TASK_testplusargs___d2255))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2253 ||
	   TASK_testplusargs___d2254 && TASK_testplusargs___d2255))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d2259 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d2260 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  TASK_testplusargs___d2261 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2265 =
	(TASK_testplusargs___d2259 ||
	 TASK_testplusargs___d2260 && TASK_testplusargs___d2261) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2266 =
	(TASK_testplusargs___d2259 ||
	 TASK_testplusargs___d2260 && TASK_testplusargs___d2261) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2267 =
	(TASK_testplusargs___d2259 ||
	 TASK_testplusargs___d2260 && TASK_testplusargs___d2261) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2269 =
	(TASK_testplusargs___d2259 ||
	 TASK_testplusargs___d2260 && TASK_testplusargs___d2261) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4];
    TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2268 =
	(TASK_testplusargs___d2259 ||
	 TASK_testplusargs___d2260 && TASK_testplusargs___d2261) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2270 =
	(TASK_testplusargs___d2259 ||
	 TASK_testplusargs___d2260 && TASK_testplusargs___d2261) &&
	!fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9)
	begin
	  v__h54506 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("[%10d", v__h54506, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2265)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2266)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2267)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2268)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("'h%h", fabric_xactors_to_slaves_3_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2269)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  TASK_testplusargs_259_OR_TASK_testplusargs_260_ETC___d2270)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("'h%h", fabric_xactors_to_slaves_3_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_9 &&
	  (TASK_testplusargs___d2259 ||
	   TASK_testplusargs___d2260 && TASK_testplusargs___d2261))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d2277 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d2278 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d2279 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  v__h54844 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2277 ||
	   TASK_testplusargs___d2278 && TASK_testplusargs___d2279))
	$write("[%10d", v__h54844, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2277 ||
	   TASK_testplusargs___d2278 && TASK_testplusargs___d2279))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2277 ||
	   TASK_testplusargs___d2278 && TASK_testplusargs___d2279))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d2283 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d2284 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  TASK_testplusargs___d2285 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2289 =
	(TASK_testplusargs___d2283 ||
	 TASK_testplusargs___d2284 && TASK_testplusargs___d2285) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2290 =
	(TASK_testplusargs___d2283 ||
	 TASK_testplusargs___d2284 && TASK_testplusargs___d2285) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2291 =
	(TASK_testplusargs___d2283 ||
	 TASK_testplusargs___d2284 && TASK_testplusargs___d2285) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2292 =
	(TASK_testplusargs___d2283 ||
	 TASK_testplusargs___d2284 && TASK_testplusargs___d2285) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2293 =
	(TASK_testplusargs___d2283 ||
	 TASK_testplusargs___d2284 && TASK_testplusargs___d2285) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4];
    TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2294 =
	(TASK_testplusargs___d2283 ||
	 TASK_testplusargs___d2284 && TASK_testplusargs___d2285) &&
	!fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10)
	begin
	  v__h54983 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("[%10d", v__h54983, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2289)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2290)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2291)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2292)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("'h%h", fabric_xactors_to_slaves_4_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2293)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  TASK_testplusargs_283_OR_TASK_testplusargs_284_ETC___d2294)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("'h%h", fabric_xactors_to_slaves_4_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_10 &&
	  (TASK_testplusargs___d2283 ||
	   TASK_testplusargs___d2284 && TASK_testplusargs___d2285))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d2301 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d2302 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d2303 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  v__h55321 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2301 ||
	   TASK_testplusargs___d2302 && TASK_testplusargs___d2303))
	$write("[%10d", v__h55321, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2301 ||
	   TASK_testplusargs___d2302 && TASK_testplusargs___d2303))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd1),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2301 ||
	   TASK_testplusargs___d2302 && TASK_testplusargs___d2303))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d2307 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d2308 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  TASK_testplusargs___d2309 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2313 =
	(TASK_testplusargs___d2307 ||
	 TASK_testplusargs___d2308 && TASK_testplusargs___d2309) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2314 =
	(TASK_testplusargs___d2307 ||
	 TASK_testplusargs___d2308 && TASK_testplusargs___d2309) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2315 =
	(TASK_testplusargs___d2307 ||
	 TASK_testplusargs___d2308 && TASK_testplusargs___d2309) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2316 =
	(TASK_testplusargs___d2307 ||
	 TASK_testplusargs___d2308 && TASK_testplusargs___d2309) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2317 =
	(TASK_testplusargs___d2307 ||
	 TASK_testplusargs___d2308 && TASK_testplusargs___d2309) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4];
    TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2318 =
	(TASK_testplusargs___d2307 ||
	 TASK_testplusargs___d2308 && TASK_testplusargs___d2309) &&
	!fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11)
	begin
	  v__h55460 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("[%10d", v__h55460, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2313)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2314)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2315)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2316)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("'h%h", fabric_xactors_to_slaves_5_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2317)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  TASK_testplusargs_307_OR_TASK_testplusargs_308_ETC___d2318)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("'h%h", fabric_xactors_to_slaves_5_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_11 &&
	  (TASK_testplusargs___d2307 ||
	   TASK_testplusargs___d2308 && TASK_testplusargs___d2309))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d2329 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d2330 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d2331 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  v__h55832 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2329 ||
	   TASK_testplusargs___d2330 && TASK_testplusargs___d2331))
	$write("[%10d", v__h55832, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2329 ||
	   TASK_testplusargs___d2330 && TASK_testplusargs___d2331))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2329 ||
	   TASK_testplusargs___d2330 && TASK_testplusargs___d2331))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d2335 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d2336 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  TASK_testplusargs___d2337 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2341 =
	(TASK_testplusargs___d2335 ||
	 TASK_testplusargs___d2336 && TASK_testplusargs___d2337) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2342 =
	(TASK_testplusargs___d2335 ||
	 TASK_testplusargs___d2336 && TASK_testplusargs___d2337) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2343 =
	(TASK_testplusargs___d2335 ||
	 TASK_testplusargs___d2336 && TASK_testplusargs___d2337) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2345 =
	(TASK_testplusargs___d2335 ||
	 TASK_testplusargs___d2336 && TASK_testplusargs___d2337) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4];
    TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2344 =
	(TASK_testplusargs___d2335 ||
	 TASK_testplusargs___d2336 && TASK_testplusargs___d2337) &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_0_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2346 =
	(TASK_testplusargs___d2335 ||
	 TASK_testplusargs___d2336 && TASK_testplusargs___d2337) &&
	!fabric_xactors_to_slaves_0_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12)
	begin
	  v__h55971 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("[%10d", v__h55971, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2341)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2342)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2343)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2344)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2345)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  TASK_testplusargs_335_OR_TASK_testplusargs_336_ETC___d2346)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("'h%h", fabric_xactors_to_slaves_0_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_12 &&
	  (TASK_testplusargs___d2335 ||
	   TASK_testplusargs___d2336 && TASK_testplusargs___d2337))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d2353 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d2354 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d2355 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  v__h56309 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2353 ||
	   TASK_testplusargs___d2354 && TASK_testplusargs___d2355))
	$write("[%10d", v__h56309, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2353 ||
	   TASK_testplusargs___d2354 && TASK_testplusargs___d2355))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2353 ||
	   TASK_testplusargs___d2354 && TASK_testplusargs___d2355))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d2359 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d2360 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  TASK_testplusargs___d2361 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2365 =
	(TASK_testplusargs___d2359 ||
	 TASK_testplusargs___d2360 && TASK_testplusargs___d2361) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2366 =
	(TASK_testplusargs___d2359 ||
	 TASK_testplusargs___d2360 && TASK_testplusargs___d2361) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2367 =
	(TASK_testplusargs___d2359 ||
	 TASK_testplusargs___d2360 && TASK_testplusargs___d2361) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2368 =
	(TASK_testplusargs___d2359 ||
	 TASK_testplusargs___d2360 && TASK_testplusargs___d2361) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2369 =
	(TASK_testplusargs___d2359 ||
	 TASK_testplusargs___d2360 && TASK_testplusargs___d2361) &&
	fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4];
    TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2370 =
	(TASK_testplusargs___d2359 ||
	 TASK_testplusargs___d2360 && TASK_testplusargs___d2361) &&
	!fabric_xactors_to_slaves_1_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13)
	begin
	  v__h56448 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("[%10d", v__h56448, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2365)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2366)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2367)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2368)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2369)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  TASK_testplusargs_359_OR_TASK_testplusargs_360_ETC___d2370)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("'h%h", fabric_xactors_to_slaves_1_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_13 &&
	  (TASK_testplusargs___d2359 ||
	   TASK_testplusargs___d2360 && TASK_testplusargs___d2361))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d2377 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d2378 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d2379 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  v__h56786 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2377 ||
	   TASK_testplusargs___d2378 && TASK_testplusargs___d2379))
	$write("[%10d", v__h56786, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2377 ||
	   TASK_testplusargs___d2378 && TASK_testplusargs___d2379))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2377 ||
	   TASK_testplusargs___d2378 && TASK_testplusargs___d2379))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d2383 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d2384 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  TASK_testplusargs___d2385 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2389 =
	(TASK_testplusargs___d2383 ||
	 TASK_testplusargs___d2384 && TASK_testplusargs___d2385) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2390 =
	(TASK_testplusargs___d2383 ||
	 TASK_testplusargs___d2384 && TASK_testplusargs___d2385) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2391 =
	(TASK_testplusargs___d2383 ||
	 TASK_testplusargs___d2384 && TASK_testplusargs___d2385) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2392 =
	(TASK_testplusargs___d2383 ||
	 TASK_testplusargs___d2384 && TASK_testplusargs___d2385) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2393 =
	(TASK_testplusargs___d2383 ||
	 TASK_testplusargs___d2384 && TASK_testplusargs___d2385) &&
	fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4];
    TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2394 =
	(TASK_testplusargs___d2383 ||
	 TASK_testplusargs___d2384 && TASK_testplusargs___d2385) &&
	!fabric_xactors_to_slaves_2_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14)
	begin
	  v__h56925 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("[%10d", v__h56925, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2389)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2390)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2391)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2392)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2393)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  TASK_testplusargs_383_OR_TASK_testplusargs_384_ETC___d2394)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("'h%h", fabric_xactors_to_slaves_2_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_14 &&
	  (TASK_testplusargs___d2383 ||
	   TASK_testplusargs___d2384 && TASK_testplusargs___d2385))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d2401 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d2402 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d2403 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  v__h57263 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2401 ||
	   TASK_testplusargs___d2402 && TASK_testplusargs___d2403))
	$write("[%10d", v__h57263, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2401 ||
	   TASK_testplusargs___d2402 && TASK_testplusargs___d2403))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd3));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2401 ||
	   TASK_testplusargs___d2402 && TASK_testplusargs___d2403))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d2407 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d2408 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  TASK_testplusargs___d2409 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2413 =
	(TASK_testplusargs___d2407 ||
	 TASK_testplusargs___d2408 && TASK_testplusargs___d2409) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2414 =
	(TASK_testplusargs___d2407 ||
	 TASK_testplusargs___d2408 && TASK_testplusargs___d2409) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2415 =
	(TASK_testplusargs___d2407 ||
	 TASK_testplusargs___d2408 && TASK_testplusargs___d2409) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2416 =
	(TASK_testplusargs___d2407 ||
	 TASK_testplusargs___d2408 && TASK_testplusargs___d2409) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2417 =
	(TASK_testplusargs___d2407 ||
	 TASK_testplusargs___d2408 && TASK_testplusargs___d2409) &&
	fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4];
    TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2418 =
	(TASK_testplusargs___d2407 ||
	 TASK_testplusargs___d2408 && TASK_testplusargs___d2409) &&
	!fabric_xactors_to_slaves_3_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15)
	begin
	  v__h57402 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("[%10d", v__h57402, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2413)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2414)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2415)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2416)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("'h%h", fabric_xactors_to_slaves_3_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2417)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  TASK_testplusargs_407_OR_TASK_testplusargs_408_ETC___d2418)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("'h%h", fabric_xactors_to_slaves_3_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_15 &&
	  (TASK_testplusargs___d2407 ||
	   TASK_testplusargs___d2408 && TASK_testplusargs___d2409))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d2425 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d2426 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d2427 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  v__h57740 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2425 ||
	   TASK_testplusargs___d2426 && TASK_testplusargs___d2427))
	$write("[%10d", v__h57740, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2425 ||
	   TASK_testplusargs___d2426 && TASK_testplusargs___d2427))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd4));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2425 ||
	   TASK_testplusargs___d2426 && TASK_testplusargs___d2427))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d2431 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d2432 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  TASK_testplusargs___d2433 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2437 =
	(TASK_testplusargs___d2431 ||
	 TASK_testplusargs___d2432 && TASK_testplusargs___d2433) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2438 =
	(TASK_testplusargs___d2431 ||
	 TASK_testplusargs___d2432 && TASK_testplusargs___d2433) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2439 =
	(TASK_testplusargs___d2431 ||
	 TASK_testplusargs___d2432 && TASK_testplusargs___d2433) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2440 =
	(TASK_testplusargs___d2431 ||
	 TASK_testplusargs___d2432 && TASK_testplusargs___d2433) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2442 =
	(TASK_testplusargs___d2431 ||
	 TASK_testplusargs___d2432 && TASK_testplusargs___d2433) &&
	!fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4];
    TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2441 =
	(TASK_testplusargs___d2431 ||
	 TASK_testplusargs___d2432 && TASK_testplusargs___d2433) &&
	fabric_xactors_to_slaves_4_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16)
	begin
	  v__h57879 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("[%10d", v__h57879, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2437)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2438)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2439)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2440)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("'h%h", fabric_xactors_to_slaves_4_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2441)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  TASK_testplusargs_431_OR_TASK_testplusargs_432_ETC___d2442)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("'h%h", fabric_xactors_to_slaves_4_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_16 &&
	  (TASK_testplusargs___d2431 ||
	   TASK_testplusargs___d2432 && TASK_testplusargs___d2433))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d2449 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d2450 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d2451 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  v__h58217 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2449 ||
	   TASK_testplusargs___d2450 && TASK_testplusargs___d2451))
	$write("[%10d", v__h58217, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2449 ||
	   TASK_testplusargs___d2450 && TASK_testplusargs___d2451))
	$write("AXI4_Fabric: rd master [%0d] <- slave [%0d]",
	       $signed(32'd2),
	       $signed(32'd5));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2449 ||
	   TASK_testplusargs___d2450 && TASK_testplusargs___d2451))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d2455 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d2456 = $test$plusargs("mfabric");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  TASK_testplusargs___d2457 = $test$plusargs("l0");
	  #0;
	end
    TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2461 =
	(TASK_testplusargs___d2455 ||
	 TASK_testplusargs___d2456 && TASK_testplusargs___d2457) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd0;
    TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2462 =
	(TASK_testplusargs___d2455 ||
	 TASK_testplusargs___d2456 && TASK_testplusargs___d2457) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd1;
    TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2463 =
	(TASK_testplusargs___d2455 ||
	 TASK_testplusargs___d2456 && TASK_testplusargs___d2457) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] == 2'd2;
    TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2464 =
	(TASK_testplusargs___d2455 ||
	 TASK_testplusargs___d2456 && TASK_testplusargs___d2457) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd0 &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd1 &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[38:37] != 2'd2;
    TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2465 =
	(TASK_testplusargs___d2455 ||
	 TASK_testplusargs___d2456 && TASK_testplusargs___d2457) &&
	fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4];
    TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2466 =
	(TASK_testplusargs___d2455 ||
	 TASK_testplusargs___d2456 && TASK_testplusargs___d2457) &&
	!fabric_xactors_to_slaves_5_f_rd_data_D_OUT[4];
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17)
	begin
	  v__h58356 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("[%10d", v__h58356, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("AXI4_Rd_Data { ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2461)
	$write("AXI4_OKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2462)
	$write("AXI4_EXOKAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2463)
	$write("AXI4_SLVERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2464)
	$write("AXI4_DECERR");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("'h%h", fabric_xactors_to_slaves_5_f_rd_data_D_OUT[36:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2465)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  TASK_testplusargs_455_OR_TASK_testplusargs_456_ETC___d2466)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("'h%h", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write(", ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("'h%h", fabric_xactors_to_slaves_5_f_rd_data_D_OUT[3:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_fabric_rl_rd_resp_slave_to_master_17 &&
	  (TASK_testplusargs___d2455 ||
	   TASK_testplusargs___d2456 && TASK_testplusargs___d2457))
	$write("\n");
  end
  // synopsys translate_on
endmodule  // mkSoc