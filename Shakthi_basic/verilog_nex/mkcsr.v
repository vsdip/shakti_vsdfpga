// Simplified RISC-V Machine-Mode CSR Module (mkcsr.v)
`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

module mkcsr(
    input         CLK,
    input         RST_N,

    // Core Interface
    input  [11:0] csr_addr,
    input  [31:0] csr_wdata,
    input         csr_wen,
    output [31:0] csr_rdata,
    output        csr_valid,

    // Trap Interface
    input  [5:0]  trap_cause,     // Match mkcsrfile's 6-bit width
    input  [31:0] trap_pc,
    output [31:0] trap_handler,
    input         EN_ext_interrupt,  // Added port
    // Interrupt Interface
    input         ext_irq,
    output        pending_irq
);

  // Wire declarations for mkcsrfile connections
  wire [31:0] mstatus;
  wire        RDY_write_csr;

  // CSR Read/Write Logic
  assign csr_valid = 1'b1;
  assign csr_rdata = (csr_addr == 12'h300) ? mstatus :  // MSTATUS
                     (csr_addr == 12'h341) ? trap_pc :  // MEPC
                     32'h0;

  // Fixed trap vector (matches mkcsrfile's hardcoded MTVEC)
  assign trap_handler = 32'h00000000;

  // Instantiate mkcsrfile (defined in mkcsrfile.v)
  mkcsrfile csrfile (
    // Clock and Reset
    .CLK(CLK),
    .RST_N(RST_N),

    // CSR Access
    .read_csr_addr(csr_addr),
    .EN_read_csr(1'b0),          // Disabled (not used)
    .read_csr(),                 // Unused (read via csr_rdata)
    .RDY_read_csr(),             // Unused
    .write_csr_addr(csr_addr),
    .write_csr_word(csr_wdata),
    .EN_write_csr(csr_wen),
    .RDY_write_csr(RDY_write_csr),

    // Trap Handling (upd_on_ret unused)
    .EN_upd_on_ret(1'b0),        // Disabled
    .upd_on_ret(),               // Unused
    .RDY_upd_on_ret(),           // Unused

    // Active Trap Handling
    .upd_on_trap_cause(trap_cause),
    .upd_on_trap_pc(trap_pc),
    .EN_upd_on_trap(),       // Always enable
    .upd_on_trap(),              // Unused
    .RDY_upd_on_trap(),          // Unused

    // Interrupts
    .ext_interrupt_ex_i(ext_irq),
    .EN_ext_interrupt(),     // Always enable
    .RDY_ext_interrupt(),        // Unused
    .mv_interrupt(pending_irq),
    .EN_ext_interrupt(csr_EN_ext_interrupt),

    // Status
    .csr_mstatus(mstatus)
  );

  // Tie off unused outputs
      // Always ready
endmodule
