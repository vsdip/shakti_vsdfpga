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

module mkalu(
    input CLK,
    input RST_N,

    // actionvalue method inputs
    input [3 : 0] inputs_fn,
    input [31 : 0] inputs_op1,
    input [31 : 0] inputs_op2,
    input [31 : 0] inputs_op3,
    input [31 : 0] inputs_imm_value,
    input [2 : 0] inputs_inst_type,
    input [2 : 0] inputs_funct3,
    input [1 : 0] inputs_memaccess,
    input inputs_misa_c,
    input [1 : 0] inputs_lpc,
    input EN_inputs,

    // Outputs
    output reg [73 : 0] inputs,
    output reg RDY_inputs
);

  // Internal signals for ALU output
  wire [73 : 0] fn_alu_output;

  // Rule scheduling signals (not strictly needed for a purely combinational ALU output)
  // wire CAN_FIRE_inputs, WILL_FIRE_inputs;

  // Instantiate the simplified ALU module
  reduced_fn_alu instance_fn_alu_0(
    .fn_alu_fn(inputs_fn),
    .fn_alu_op1(inputs_op1),
    .fn_alu_op2(inputs_op2),
    .fn_alu_op3(inputs_op3),
    .fn_alu_imm_value(inputs_imm_value),
    .fn_alu_inst_type(inputs_inst_type),
    .fn_alu_funct3(inputs_funct3),
    .fn_alu_memaccess(inputs_memaccess),
    .fn_alu_misa_c(inputs_misa_c),
    .fn_alu_lpc(inputs_lpc),
    .fn_alu(fn_alu_output)
  );

  // Reset logic and output assignment
  always @(posedge CLK or negedge RST_N) begin
    if (~RST_N) begin
      // Reset outputs to a safe state
      inputs <= 74'd0;
      RDY_inputs <= 1'b0;
    end else begin
      // Update outputs based on inputs and ALU calculation
      inputs <= fn_alu_output;
      RDY_inputs <= EN_inputs;  // Indicate ready when enabled
    end
  end

  // Fire conditions based on input enable (if you have Bluespec rules)
  // assign CAN_FIRE_inputs = EN_inputs;  // Can fire as long as enabled
  // assign WILL_FIRE_inputs = EN_inputs; // Will fire when inputs are enabled

endmodule // mkalu