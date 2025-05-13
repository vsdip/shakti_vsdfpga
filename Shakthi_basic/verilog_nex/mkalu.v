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

    // Actionvalue method inputs
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

  // Simplified ALU operation decoding
  wire [2:0] funct3 = inputs_funct3;
  wire funct7 = inputs_fn[3];  // Use MSB of fn for ADD/SUB distinction

  // ALU operations
  wire [31:0] add_sub = inputs_op1 + (funct7 ? ~inputs_op2 + 1 : inputs_op2);
  wire [31:0] sll = inputs_op1 << inputs_op2[4:0];
  wire [31:0] srl = inputs_op1 >> inputs_op2[4:0];
  wire [31:0] sra = $signed(inputs_op1) >>> inputs_op2[4:0];
  wire        slt = $signed(inputs_op1) < $signed(inputs_op2);
  wire        sltu = inputs_op1 < inputs_op2;

  // Main ALU result
  reg [31:0] alu_result;
  always @(*) begin
    case(funct3)
      3'b000: alu_result = add_sub;       // ADD/SUB
      3'b001: alu_result = sll;           // SLL
      3'b010: alu_result = {31'b0, slt};  // SLT
      3'b011: alu_result = {31'b0, sltu}; // SLTU
      3'b100: alu_result = inputs_op1 ^ inputs_op2; // XOR
      3'b101: alu_result = funct7 ? sra : srl;      // SRL/SRA
      3'b110: alu_result = inputs_op1 | inputs_op2; // OR
      3'b111: alu_result = inputs_op1 & inputs_op2; // AND
      default: alu_result = 32'b0;
    endcase
  end

  // Effective address calculation (for load/store)
  wire [31:0] effective_addr = inputs_op1 + inputs_imm_value;

  // Output construction (preserve original format)
  always @(*) begin
    inputs[73]    = 1'b1;                  // done flag
    inputs[72:71] = 2'b00;                 // cmtype (regular)
    inputs[70:39] = alu_result;            // aluresult
    inputs[38:7]  = effective_addr;        // effective address
    inputs[6:1]   = 6'b0;                  // cause (no exceptions)
    inputs[0]     = (funct3 == 3'b000) &&  // redirect (for branches)
                    (inputs_inst_type == 3'b010) && 
                    (|alu_result);
  end

  // Reset and control logic
  always @(posedge CLK or `BSV_RESET_EDGE RST_N) begin
    if (RST_N == `BSV_RESET_VALUE) begin
      RDY_inputs <= `BSV_ASSIGNMENT_DELAY 1'b0;
    end else begin
      RDY_inputs <= `BSV_ASSIGNMENT_DELAY EN_inputs;
    end
  end

endmodule