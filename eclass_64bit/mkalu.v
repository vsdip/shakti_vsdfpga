//
// Generated by Bluespec Compiler, version 2021.07 (build 4cac6eba)
//
// On Fri Mar  7 14:49:28 IST 2025
//
//
// Ports:
// Name                         I/O  size props
// inputs                         O   138
// RDY_inputs                     O     1 const
// mv_delayed_output              O    65
// RDY_mv_delayed_output          O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// inputs_fn                      I     4
// inputs_op1                     I    64
// inputs_op2                     I    64
// inputs_op3                     I    64
// inputs_imm_value               I    64
// inputs_inst_type               I     4
// inputs_funct3                  I     3
// inputs_memaccess               I     2
// inputs_word32                  I     1
// inputs_misa_c                  I     1
// inputs_lpc                     I     2
// inputs_tdata1                  I    44
// inputs_tdata2                  I   128
// inputs_tenable                 I     2
// EN_inputs                      I     1
//
// Combinational paths from inputs to outputs:
//   (inputs_fn,
//    inputs_op1,
//    inputs_op2,
//    inputs_op3,
//    inputs_imm_value,
//    inputs_inst_type,
//    inputs_funct3,
//    inputs_memaccess,
//    inputs_word32,
//    inputs_misa_c,
//    inputs_lpc,
//    inputs_tdata1,
//    inputs_tdata2,
//    inputs_tenable,
//    EN_inputs) -> inputs
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

module mkalu(CLK,
	     RST_N,

	     inputs_fn,
	     inputs_op1,
	     inputs_op2,
	     inputs_op3,
	     inputs_imm_value,
	     inputs_inst_type,
	     inputs_funct3,
	     inputs_memaccess,
	     inputs_word32,
	     inputs_misa_c,
	     inputs_lpc,
	     inputs_tdata1,
	     inputs_tdata2,
	     inputs_tenable,
	     EN_inputs,
	     inputs,
	     RDY_inputs,

	     mv_delayed_output,
	     RDY_mv_delayed_output);
  input  CLK;
  input  RST_N;

  // actionvalue method inputs
  input  [3 : 0] inputs_fn;
  input  [63 : 0] inputs_op1;
  input  [63 : 0] inputs_op2;
  input  [63 : 0] inputs_op3;
  input  [63 : 0] inputs_imm_value;
  input  [3 : 0] inputs_inst_type;
  input  [2 : 0] inputs_funct3;
  input  [1 : 0] inputs_memaccess;
  input  inputs_word32;
  input  inputs_misa_c;
  input  [1 : 0] inputs_lpc;
  input  [43 : 0] inputs_tdata1;
  input  [127 : 0] inputs_tdata2;
  input  [1 : 0] inputs_tenable;
  input  EN_inputs;
  output [137 : 0] inputs;
  output RDY_inputs;

  // value method mv_delayed_output
  output [64 : 0] mv_delayed_output;
  output RDY_mv_delayed_output;

  // signals for module outputs
  wire [137 : 0] inputs;
  wire [64 : 0] mv_delayed_output;
  wire RDY_inputs, RDY_mv_delayed_output;

  // inlined wires
  wire [64 : 0] wr_delayed_output_wget;

  // register rg_wait
  reg rg_wait;
  wire rg_wait_D_IN, rg_wait_EN;

  // ports of submodule muldiv
  wire [137 : 0] muldiv_delayed_output, muldiv_get_inputs;
  wire [63 : 0] muldiv_get_inputs_operand1, muldiv_get_inputs_operand2;
  wire [2 : 0] muldiv_get_inputs_funct3;
  wire muldiv_EN_delayed_output,
       muldiv_EN_get_inputs,
       muldiv_RDY_delayed_output,
       muldiv_get_inputs_word32;

  // rule scheduling signals
  wire CAN_FIRE_RL_capture_delayed_muldivputput,
       CAN_FIRE_inputs,
       WILL_FIRE_RL_capture_delayed_muldivputput,
       WILL_FIRE_inputs;

  // inputs to muxes for submodule ports
  wire MUX_rg_wait_write_1__SEL_1;

  // declarations used by system tasks
  // synopsys translate_off
  reg TASK_testplusargs___d7;
  reg TASK_testplusargs___d8;
  reg TASK_testplusargs___d9;
  reg [63 : 0] v__h349;
  // synopsys translate_on

  // remaining internal signals
  wire [137 : 0] fn_alu___d18;

  // actionvalue method inputs
  assign inputs =
	     (inputs_inst_type == 4'd8) ? muldiv_get_inputs : fn_alu___d18 ;
  assign RDY_inputs = 1'd1 ;
  assign CAN_FIRE_inputs = 1'd1 ;
  assign WILL_FIRE_inputs = EN_inputs ;

  // value method mv_delayed_output
  assign mv_delayed_output =
	     { wr_delayed_output_wget[64:1],
	       CAN_FIRE_RL_capture_delayed_muldivputput &&
	       wr_delayed_output_wget[0] } ;
  assign RDY_mv_delayed_output = 1'd1 ;

  // submodule muldiv
  mkmuldiv muldiv(.CLK(CLK),
		  .RST_N(RST_N),
		  .get_inputs_funct3(muldiv_get_inputs_funct3),
		  .get_inputs_operand1(muldiv_get_inputs_operand1),
		  .get_inputs_operand2(muldiv_get_inputs_operand2),
		  .get_inputs_word32(muldiv_get_inputs_word32),
		  .EN_get_inputs(muldiv_EN_get_inputs),
		  .EN_delayed_output(muldiv_EN_delayed_output),
		  .get_inputs(muldiv_get_inputs),
		  .RDY_get_inputs(),
		  .delayed_output(muldiv_delayed_output),
		  .RDY_delayed_output(muldiv_RDY_delayed_output));

  // rule RL_capture_delayed_muldivputput
  assign CAN_FIRE_RL_capture_delayed_muldivputput =
	     muldiv_RDY_delayed_output && rg_wait ;
  assign WILL_FIRE_RL_capture_delayed_muldivputput =
	     CAN_FIRE_RL_capture_delayed_muldivputput ;

  // inputs to muxes for submodule ports
  assign MUX_rg_wait_write_1__SEL_1 =
	     EN_inputs && inputs_inst_type == 4'd8 &&
	     !muldiv_get_inputs[137] ;

  // inlined wires
  assign wr_delayed_output_wget = { muldiv_delayed_output[134:71], 1'd1 } ;

  // register rg_wait
  assign rg_wait_D_IN = MUX_rg_wait_write_1__SEL_1 ;
  assign rg_wait_EN =
	     EN_inputs && inputs_inst_type == 4'd8 &&
	     !muldiv_get_inputs[137] ||
	     WILL_FIRE_RL_capture_delayed_muldivputput ;

  // submodule muldiv
  assign muldiv_get_inputs_funct3 = inputs_funct3 ;
  assign muldiv_get_inputs_operand1 = inputs_op1 ;
  assign muldiv_get_inputs_operand2 = inputs_op2 ;
  assign muldiv_get_inputs_word32 = inputs_word32 ;
  assign muldiv_EN_get_inputs = EN_inputs && inputs_inst_type == 4'd8 ;
  assign muldiv_EN_delayed_output = CAN_FIRE_RL_capture_delayed_muldivputput ;

  // remaining internal signals
  module_fn_alu instance_fn_alu_0(.fn_alu_fn(inputs_fn),
				  .fn_alu_op1(inputs_op1),
				  .fn_alu_op2(inputs_op2),
				  .fn_alu_op3(inputs_op3),
				  .fn_alu_imm_value(inputs_imm_value),
				  .fn_alu_inst_type(inputs_inst_type),
				  .fn_alu_funct3(inputs_funct3),
				  .fn_alu_memaccess(inputs_memaccess),
				  .fn_alu_word32(inputs_word32),
				  .fn_alu_misa_c(inputs_misa_c),
				  .fn_alu_lpc(inputs_lpc),
				  .fn_alu_tdata1(inputs_tdata1),
				  .fn_alu_tdata2(inputs_tdata2),
				  .fn_alu_tenable(inputs_tenable),
				  .fn_alu(fn_alu___d18));

  // handling of inlined registers

  always@(posedge CLK or `BSV_RESET_EDGE RST_N)
  if (RST_N == `BSV_RESET_VALUE)
    begin
      rg_wait <= `BSV_ASSIGNMENT_DELAY 1'd0;
    end
  else
    begin
      if (rg_wait_EN) rg_wait <= `BSV_ASSIGNMENT_DELAY rg_wait_D_IN;
    end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_wait = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput)
	begin
	  TASK_testplusargs___d7 = $test$plusargs("fullverbose");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput)
	begin
	  TASK_testplusargs___d8 = $test$plusargs("malu");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput)
	begin
	  TASK_testplusargs___d9 = $test$plusargs("l0");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput)
	begin
	  v__h349 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput &&
	  (TASK_testplusargs___d7 ||
	   TASK_testplusargs___d8 && TASK_testplusargs___d9))
	$write("[%10d", v__h349, "] ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput &&
	  (TASK_testplusargs___d7 ||
	   TASK_testplusargs___d8 && TASK_testplusargs___d9))
	$write("ALU: Sending delayed Result:%h",
	       muldiv_delayed_output[134:71]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_capture_delayed_muldivputput &&
	  (TASK_testplusargs___d7 ||
	   TASK_testplusargs___d8 && TASK_testplusargs___d9))
	$write("\n");
  end
  // synopsys translate_on
endmodule  // mkalu

