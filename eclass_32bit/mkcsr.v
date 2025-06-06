//
// Generated by Bluespec Compiler, version 2024.01 (build ae2a2fc6)
//
// On Mon Mar 31 00:26:11 IST 2025
//
//
// Ports:
// Name                         I/O  size props
// system_instruction             O    65
// RDY_system_instruction         O     1 const
// mv_csr_decode                  O   120
// RDY_mv_csr_decode              O     1 const
// take_trap                      O    32
// RDY_take_trap                  O     1 const
// RDY_clint_msip                 O     1 const
// RDY_clint_mtip                 O     1 const
// RDY_clint_mtime                O     1 const
// RDY_incr_minstret              O     1 const
// RDY_ext_interrupt              O     1 const
// mv_csr_misa_c                  O     1 reg
// RDY_mv_csr_misa_c              O     1 const
// mv_interrupt                   O     1
// mv_curr_priv                   O     2 reg
// RDY_mv_curr_priv               O     1 const
// csr_mstatus                    O    32
// RDY_csr_mstatus                O     1 const
// mv_pmp_cfg                     O    32 reg
// RDY_mv_pmp_cfg                 O     1 const
// mv_pmp_addr                    O   120 reg
// RDY_mv_pmp_addr                O     1 const
// mv_trigger_data1               O    40 reg
// RDY_mv_trigger_data1           O     1 const
// mv_trigger_data2               O    64 reg
// RDY_mv_trigger_data2           O     1 const
// mv_trigger_enable              O     2
// RDY_mv_trigger_enable          O     1 const
// RDY_ma_events                  O     1 const
// counter_values_fst             O    32 reg
// RDY_counter_values_fst         O     1 const
// counter_values_snd             O    64 reg
// RDY_counter_values_snd         O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// system_instruction_csr_address  I    12
// system_instruction_op1         I    32
// system_instruction_funct3      I     3
// system_instruction_lpc         I     2
// take_trap_type_cause           I     6
// take_trap_pc                   I    32
// take_trap_badaddr              I    32
// clint_msip_intrpt              I     1 reg
// clint_mtip_intrpt              I     1 reg
// clint_mtime_c_mtime            I    64 reg
// ext_interrupt_ex_i             I     1 reg
// ma_events_e                    I    11
// EN_clint_msip                  I     1
// EN_clint_mtip                  I     1
// EN_clint_mtime                 I     1
// EN_incr_minstret               I     1
// EN_ext_interrupt               I     1
// EN_ma_events                   I     1
// EN_system_instruction          I     1
// EN_take_trap                   I     1
//
// Combinational paths from inputs to outputs:
//   (system_instruction_csr_address,
//    system_instruction_funct3,
//    EN_system_instruction) -> system_instruction
//   (take_trap_type_cause, EN_take_trap) -> take_trap
//
//

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

module mkcsr(CLK,
	     RST_N,

	     system_instruction_csr_address,
	     system_instruction_op1,
	     system_instruction_funct3,
	     system_instruction_lpc,
	     EN_system_instruction,
	     system_instruction,
	     RDY_system_instruction,

	     mv_csr_decode,
	     RDY_mv_csr_decode,

	     take_trap_type_cause,
	     take_trap_pc,
	     take_trap_badaddr,
	     EN_take_trap,
	     take_trap,
	     RDY_take_trap,

	     clint_msip_intrpt,
	     EN_clint_msip,
	     RDY_clint_msip,

	     clint_mtip_intrpt,
	     EN_clint_mtip,
	     RDY_clint_mtip,

	     clint_mtime_c_mtime,
	     EN_clint_mtime,
	     RDY_clint_mtime,

	     EN_incr_minstret,
	     RDY_incr_minstret,

	     ext_interrupt_ex_i,
	     EN_ext_interrupt,
	     RDY_ext_interrupt,

	     mv_csr_misa_c,
	     RDY_mv_csr_misa_c,

	     mv_interrupt,

	     mv_curr_priv,
	     RDY_mv_curr_priv,

	     csr_mstatus,
	     RDY_csr_mstatus,

	     mv_pmp_cfg,
	     RDY_mv_pmp_cfg,

	     mv_pmp_addr,
	     RDY_mv_pmp_addr,

	     mv_trigger_data1,
	     RDY_mv_trigger_data1,

	     mv_trigger_data2,
	     RDY_mv_trigger_data2,

	     mv_trigger_enable,
	     RDY_mv_trigger_enable,

	     ma_events_e,
	     EN_ma_events,
	     RDY_ma_events,

	     counter_values_fst,
	     RDY_counter_values_fst,

	     counter_values_snd,
	     RDY_counter_values_snd);
  input  CLK;
  input  RST_N;

  // actionvalue method system_instruction
  input  [11 : 0] system_instruction_csr_address;
  input  [31 : 0] system_instruction_op1;
  input  [2 : 0] system_instruction_funct3;
  input  [1 : 0] system_instruction_lpc;
  input  EN_system_instruction;
  output [64 : 0] system_instruction;
  output RDY_system_instruction;

  // value method mv_csr_decode
  output [119 : 0] mv_csr_decode;
  output RDY_mv_csr_decode;

  // actionvalue method take_trap
  input  [5 : 0] take_trap_type_cause;
  input  [31 : 0] take_trap_pc;
  input  [31 : 0] take_trap_badaddr;
  input  EN_take_trap;
  output [31 : 0] take_trap;
  output RDY_take_trap;

  // action method clint_msip
  input  clint_msip_intrpt;
  input  EN_clint_msip;
  output RDY_clint_msip;

  // action method clint_mtip
  input  clint_mtip_intrpt;
  input  EN_clint_mtip;
  output RDY_clint_mtip;

  // action method clint_mtime
  input  [63 : 0] clint_mtime_c_mtime;
  input  EN_clint_mtime;
  output RDY_clint_mtime;

  // action method incr_minstret
  input  EN_incr_minstret;
  output RDY_incr_minstret;

  // action method ext_interrupt
  input  ext_interrupt_ex_i;
  input  EN_ext_interrupt;
  output RDY_ext_interrupt;

  // value method mv_csr_misa_c
  output mv_csr_misa_c;
  output RDY_mv_csr_misa_c;

  // value method mv_interrupt
  output mv_interrupt;

  // value method mv_curr_priv
  output [1 : 0] mv_curr_priv;
  output RDY_mv_curr_priv;

  // value method csr_mstatus
  output [31 : 0] csr_mstatus;
  output RDY_csr_mstatus;

  // value method mv_pmp_cfg
  output [31 : 0] mv_pmp_cfg;
  output RDY_mv_pmp_cfg;

  // value method mv_pmp_addr
  output [119 : 0] mv_pmp_addr;
  output RDY_mv_pmp_addr;

  // value method mv_trigger_data1
  output [39 : 0] mv_trigger_data1;
  output RDY_mv_trigger_data1;

  // value method mv_trigger_data2
  output [63 : 0] mv_trigger_data2;
  output RDY_mv_trigger_data2;

  // value method mv_trigger_enable
  output [1 : 0] mv_trigger_enable;
  output RDY_mv_trigger_enable;

  // action method ma_events
  input  [10 : 0] ma_events_e;
  input  EN_ma_events;
  output RDY_ma_events;

  // value method counter_values_fst
  output [31 : 0] counter_values_fst;
  output RDY_counter_values_fst;

  // value method counter_values_snd
  output [63 : 0] counter_values_snd;
  output RDY_counter_values_snd;

  // signals for module outputs
  wire [119 : 0] mv_csr_decode, mv_pmp_addr;
  wire [64 : 0] system_instruction;
  wire [63 : 0] counter_values_snd, mv_trigger_data2;
  wire [39 : 0] mv_trigger_data1;
  wire [31 : 0] counter_values_fst, csr_mstatus, mv_pmp_cfg, take_trap;
  wire [1 : 0] mv_curr_priv, mv_trigger_enable;
  wire RDY_clint_msip,
       RDY_clint_mtime,
       RDY_clint_mtip,
       RDY_counter_values_fst,
       RDY_counter_values_snd,
       RDY_csr_mstatus,
       RDY_ext_interrupt,
       RDY_incr_minstret,
       RDY_ma_events,
       RDY_mv_csr_decode,
       RDY_mv_csr_misa_c,
       RDY_mv_curr_priv,
       RDY_mv_pmp_addr,
       RDY_mv_pmp_cfg,
       RDY_mv_trigger_data1,
       RDY_mv_trigger_data2,
       RDY_mv_trigger_enable,
       RDY_system_instruction,
       RDY_take_trap,
       mv_csr_misa_c,
       mv_interrupt;

  // ports of submodule csrfile
  reg [31 : 0] csrfile_write_csr_word;
  wire [119 : 0] csrfile_mv_csr_decode, csrfile_mv_pmp_addr;
  wire [63 : 0] csrfile_clint_mtime_c_mtime,
		csrfile_counter_values_snd,
		csrfile_mv_trigger_data2;
  wire [39 : 0] csrfile_mv_trigger_data1;
  wire [31 : 0] csrfile_counter_values_fst,
		csrfile_csr_mstatus,
		csrfile_mv_pmp_cfg,
		csrfile_read_csr,
		csrfile_upd_on_ret,
		csrfile_upd_on_trap,
		csrfile_upd_on_trap_pc,
		csrfile_upd_on_trap_tval;
  wire [11 : 0] csrfile_read_csr_addr, csrfile_write_csr_addr;
  wire [10 : 0] csrfile_ma_events_e;
  wire [5 : 0] csrfile_upd_on_trap_cause;
  wire [1 : 0] csrfile_mv_curr_priv,
	       csrfile_mv_trigger_enable,
	       csrfile_upd_on_ret_prv,
	       csrfile_write_csr_lpc;
  wire csrfile_EN_clint_msip,
       csrfile_EN_clint_mtime,
       csrfile_EN_clint_mtip,
       csrfile_EN_ext_interrupt,
       csrfile_EN_incr_minstret,
       csrfile_EN_ma_events,
       csrfile_EN_read_csr,
       csrfile_EN_upd_on_ret,
       csrfile_EN_upd_on_trap,
       csrfile_EN_write_csr,
       csrfile_clint_msip_intrpt,
       csrfile_clint_mtip_intrpt,
       csrfile_ext_interrupt_ex_i,
       csrfile_mv_csr_misa_c,
       csrfile_mv_interrupt;

  // rule scheduling signals
  wire CAN_FIRE_clint_msip,
       CAN_FIRE_clint_mtime,
       CAN_FIRE_clint_mtip,
       CAN_FIRE_ext_interrupt,
       CAN_FIRE_incr_minstret,
       CAN_FIRE_ma_events,
       CAN_FIRE_system_instruction,
       CAN_FIRE_take_trap,
       WILL_FIRE_clint_msip,
       WILL_FIRE_clint_mtime,
       WILL_FIRE_clint_mtip,
       WILL_FIRE_ext_interrupt,
       WILL_FIRE_incr_minstret,
       WILL_FIRE_ma_events,
       WILL_FIRE_system_instruction,
       WILL_FIRE_take_trap;

  // declarations used by system tasks
  // synopsys translate_off
  reg TASK_testplusargs___d1;
  reg TASK_testplusargs___d2;
  reg TASK_testplusargs___d3;
  reg [63 : 0] v__h462;
  reg TASK_testplusargs___d15;
  reg TASK_testplusargs___d16;
  reg TASK_testplusargs___d17;
  reg [63 : 0] v__h737;
  reg system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d20;
  // synopsys translate_on

  // remaining internal signals
  reg [31 : 0] y_avValue_snd_fst__h958;
  wire [31 : 0] writecsrdata__h898, writecsrdata__h899, x__h911;

  // actionvalue method system_instruction
  assign system_instruction =
	     { system_instruction_funct3 == 3'd0 &&
	       (system_instruction_csr_address[11:8] == 4'h0 ||
		system_instruction_csr_address[11:8] == 4'h3),
	       (system_instruction_funct3 == 3'd0) ?
		 { y_avValue_snd_fst__h958, 32'd0 } :
		 { 32'd0, csrfile_read_csr } } ;
  assign RDY_system_instruction = 1'd1 ;
  assign CAN_FIRE_system_instruction = 1'd1 ;
  assign WILL_FIRE_system_instruction = EN_system_instruction ;

  // value method mv_csr_decode
  assign mv_csr_decode = csrfile_mv_csr_decode ;
  assign RDY_mv_csr_decode = 1'd1 ;

  // actionvalue method take_trap
  assign take_trap = csrfile_upd_on_trap ;
  assign RDY_take_trap = 1'd1 ;
  assign CAN_FIRE_take_trap = 1'd1 ;
  assign WILL_FIRE_take_trap = EN_take_trap ;

  // action method clint_msip
  assign RDY_clint_msip = 1'd1 ;
  assign CAN_FIRE_clint_msip = 1'd1 ;
  assign WILL_FIRE_clint_msip = EN_clint_msip ;

  // action method clint_mtip
  assign RDY_clint_mtip = 1'd1 ;
  assign CAN_FIRE_clint_mtip = 1'd1 ;
  assign WILL_FIRE_clint_mtip = EN_clint_mtip ;

  // action method clint_mtime
  assign RDY_clint_mtime = 1'd1 ;
  assign CAN_FIRE_clint_mtime = 1'd1 ;
  assign WILL_FIRE_clint_mtime = EN_clint_mtime ;

  // action method incr_minstret
  assign RDY_incr_minstret = 1'd1 ;
  assign CAN_FIRE_incr_minstret = 1'd1 ;
  assign WILL_FIRE_incr_minstret = EN_incr_minstret ;

  // action method ext_interrupt
  assign RDY_ext_interrupt = 1'd1 ;
  assign CAN_FIRE_ext_interrupt = 1'd1 ;
  assign WILL_FIRE_ext_interrupt = EN_ext_interrupt ;

  // value method mv_csr_misa_c
  assign mv_csr_misa_c = csrfile_mv_csr_misa_c ;
  assign RDY_mv_csr_misa_c = 1'd1 ;

  // value method mv_interrupt
  assign mv_interrupt = csrfile_mv_interrupt ;

  // value method mv_curr_priv
  assign mv_curr_priv = csrfile_mv_curr_priv ;
  assign RDY_mv_curr_priv = 1'd1 ;

  // value method csr_mstatus
  assign csr_mstatus = csrfile_csr_mstatus ;
  assign RDY_csr_mstatus = 1'd1 ;

  // value method mv_pmp_cfg
  assign mv_pmp_cfg = csrfile_mv_pmp_cfg ;
  assign RDY_mv_pmp_cfg = 1'd1 ;

  // value method mv_pmp_addr
  assign mv_pmp_addr = csrfile_mv_pmp_addr ;
  assign RDY_mv_pmp_addr = 1'd1 ;

  // value method mv_trigger_data1
  assign mv_trigger_data1 = csrfile_mv_trigger_data1 ;
  assign RDY_mv_trigger_data1 = 1'd1 ;

  // value method mv_trigger_data2
  assign mv_trigger_data2 = csrfile_mv_trigger_data2 ;
  assign RDY_mv_trigger_data2 = 1'd1 ;

  // value method mv_trigger_enable
  assign mv_trigger_enable = csrfile_mv_trigger_enable ;
  assign RDY_mv_trigger_enable = 1'd1 ;

  // action method ma_events
  assign RDY_ma_events = 1'd1 ;
  assign CAN_FIRE_ma_events = 1'd1 ;
  assign WILL_FIRE_ma_events = EN_ma_events ;

  // value method counter_values_fst
  assign counter_values_fst = csrfile_counter_values_fst ;
  assign RDY_counter_values_fst = 1'd1 ;

  // value method counter_values_snd
  assign counter_values_snd = csrfile_counter_values_snd ;
  assign RDY_counter_values_snd = 1'd1 ;

  // submodule csrfile
  mkcsrfile csrfile(.CLK(CLK),
		    .RST_N(RST_N),
		    .clint_msip_intrpt(csrfile_clint_msip_intrpt),
		    .clint_mtime_c_mtime(csrfile_clint_mtime_c_mtime),
		    .clint_mtip_intrpt(csrfile_clint_mtip_intrpt),
		    .ext_interrupt_ex_i(csrfile_ext_interrupt_ex_i),
		    .ma_events_e(csrfile_ma_events_e),
		    .read_csr_addr(csrfile_read_csr_addr),
		    .upd_on_ret_prv(csrfile_upd_on_ret_prv),
		    .upd_on_trap_cause(csrfile_upd_on_trap_cause),
		    .upd_on_trap_pc(csrfile_upd_on_trap_pc),
		    .upd_on_trap_tval(csrfile_upd_on_trap_tval),
		    .write_csr_addr(csrfile_write_csr_addr),
		    .write_csr_lpc(csrfile_write_csr_lpc),
		    .write_csr_word(csrfile_write_csr_word),
		    .EN_read_csr(csrfile_EN_read_csr),
		    .EN_write_csr(csrfile_EN_write_csr),
		    .EN_upd_on_ret(csrfile_EN_upd_on_ret),
		    .EN_upd_on_trap(csrfile_EN_upd_on_trap),
		    .EN_incr_minstret(csrfile_EN_incr_minstret),
		    .EN_clint_msip(csrfile_EN_clint_msip),
		    .EN_clint_mtip(csrfile_EN_clint_mtip),
		    .EN_clint_mtime(csrfile_EN_clint_mtime),
		    .EN_ext_interrupt(csrfile_EN_ext_interrupt),
		    .EN_ma_events(csrfile_EN_ma_events),
		    .read_csr(csrfile_read_csr),
		    .RDY_read_csr(),
		    .RDY_write_csr(),
		    .upd_on_ret(csrfile_upd_on_ret),
		    .RDY_upd_on_ret(),
		    .upd_on_trap(csrfile_upd_on_trap),
		    .RDY_upd_on_trap(),
		    .RDY_incr_minstret(),
		    .mv_csr_decode(csrfile_mv_csr_decode),
		    .RDY_mv_csr_decode(),
		    .mv_csr_misa_c(csrfile_mv_csr_misa_c),
		    .RDY_mv_csr_misa_c(),
		    .mv_curr_priv(csrfile_mv_curr_priv),
		    .RDY_mv_curr_priv(),
		    .csr_mstatus(csrfile_csr_mstatus),
		    .RDY_csr_mstatus(),
		    .RDY_clint_msip(),
		    .RDY_clint_mtip(),
		    .RDY_clint_mtime(),
		    .RDY_ext_interrupt(),
		    .mv_interrupt(csrfile_mv_interrupt),
		    .mv_pmp_cfg(csrfile_mv_pmp_cfg),
		    .RDY_mv_pmp_cfg(),
		    .mv_pmp_addr(csrfile_mv_pmp_addr),
		    .RDY_mv_pmp_addr(),
		    .mv_trigger_data1(csrfile_mv_trigger_data1),
		    .RDY_mv_trigger_data1(),
		    .mv_trigger_data2(csrfile_mv_trigger_data2),
		    .RDY_mv_trigger_data2(),
		    .mv_trigger_enable(csrfile_mv_trigger_enable),
		    .RDY_mv_trigger_enable(),
		    .RDY_ma_events(),
		    .counter_values_fst(csrfile_counter_values_fst),
		    .RDY_counter_values_fst(),
		    .counter_values_snd(csrfile_counter_values_snd),
		    .RDY_counter_values_snd());

  // submodule csrfile
  assign csrfile_clint_msip_intrpt = clint_msip_intrpt ;
  assign csrfile_clint_mtime_c_mtime = clint_mtime_c_mtime ;
  assign csrfile_clint_mtip_intrpt = clint_mtip_intrpt ;
  assign csrfile_ext_interrupt_ex_i = ext_interrupt_ex_i ;
  assign csrfile_ma_events_e = ma_events_e ;
  assign csrfile_read_csr_addr = system_instruction_csr_address ;
  assign csrfile_upd_on_ret_prv = system_instruction_csr_address[9:8] ;
  assign csrfile_upd_on_trap_cause = take_trap_type_cause ;
  assign csrfile_upd_on_trap_pc = take_trap_pc ;
  assign csrfile_upd_on_trap_tval = take_trap_badaddr ;
  assign csrfile_write_csr_addr = system_instruction_csr_address ;
  assign csrfile_write_csr_lpc = system_instruction_lpc ;
  always@(system_instruction_funct3 or
	  writecsrdata__h899 or system_instruction_op1 or writecsrdata__h898)
  begin
    case (system_instruction_funct3[1:0])
      2'd1: csrfile_write_csr_word = system_instruction_op1;
      2'd2: csrfile_write_csr_word = writecsrdata__h898;
      default: csrfile_write_csr_word = writecsrdata__h899;
    endcase
  end
  assign csrfile_EN_read_csr = EN_system_instruction ;
  assign csrfile_EN_write_csr =
	     EN_system_instruction && system_instruction_funct3 != 3'd0 ;
  assign csrfile_EN_upd_on_ret =
	     EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	     (system_instruction_csr_address[11:8] == 4'h0 ||
	      system_instruction_csr_address[11:8] == 4'h3) ;
  assign csrfile_EN_upd_on_trap = EN_take_trap ;
  assign csrfile_EN_incr_minstret = EN_incr_minstret ;
  assign csrfile_EN_clint_msip = EN_clint_msip ;
  assign csrfile_EN_clint_mtip = EN_clint_mtip ;
  assign csrfile_EN_clint_mtime = EN_clint_mtime ;
  assign csrfile_EN_ext_interrupt = EN_ext_interrupt ;
  assign csrfile_EN_ma_events = EN_ma_events ;

  // remaining internal signals
  assign writecsrdata__h898 = system_instruction_op1 | csrfile_read_csr ;
  assign writecsrdata__h899 = x__h911 & csrfile_read_csr ;
  assign x__h911 = ~system_instruction_op1 ;
  always@(system_instruction_csr_address or csrfile_upd_on_ret)
  begin
    case (system_instruction_csr_address[11:8])
      4'h0, 4'h3: y_avValue_snd_fst__h958 = csrfile_upd_on_ret;
      default: y_avValue_snd_fst__h958 = 32'd0;
    endcase
  end

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction)
	begin
	  TASK_testplusargs___d1 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction)
	begin
	  TASK_testplusargs___d2 = $test$plusargs("mcsr");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction)
	begin
	  TASK_testplusargs___d3 = $test$plusargs("l2");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction)
	begin
	  v__h462 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction &&
	  (TASK_testplusargs___d1 ||
	   TASK_testplusargs___d2 && TASK_testplusargs___d3))
	$write("[%10d", v__h462, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction &&
	  (TASK_testplusargs___d1 ||
	   TASK_testplusargs___d2 && TASK_testplusargs___d3))
	$write("CSR : Operation csr: %h op1: %h, funct3: %b csr_read: %h",
	       system_instruction_csr_address,
	       system_instruction_op1,
	       system_instruction_funct3,
	       csrfile_read_csr);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction &&
	  (TASK_testplusargs___d1 ||
	   TASK_testplusargs___d2 && TASK_testplusargs___d3))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  TASK_testplusargs___d15 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  TASK_testplusargs___d16 = $test$plusargs("mcsr");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  TASK_testplusargs___d17 = $test$plusargs("l1");
	  #0;
	end
    system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d20 =
	(system_instruction_csr_address[11:8] == 4'h0 ||
	 system_instruction_csr_address[11:8] == 4'h3) &&
	(TASK_testplusargs___d15 ||
	 TASK_testplusargs___d16 && TASK_testplusargs___d17);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  (system_instruction_csr_address[11:8] == 4'h0 ||
	   system_instruction_csr_address[11:8] == 4'h3))
	begin
	  v__h737 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d20)
	$write("[%10d", v__h737, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d20)
	$write("CSR : RET Function: %h", system_instruction_csr_address);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_system_instruction && system_instruction_funct3 == 3'd0 &&
	  system_instruction_csr_address_BITS_11_TO_8_EQ_ETC___d20)
	$write("\n");
  end
  // synopsys translate_on
endmodule  // mkcsr

