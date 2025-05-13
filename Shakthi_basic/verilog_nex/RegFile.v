
`ifdef  BSV_WARN_REGFILE_ADDR_RANGE
`else
`define BSV_WARN_REGFILE_ADDR_RANGE 0 
`endif


`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif


// Multi-ported Register File
module RegFile #(
    parameter addr_width = 5,  // Default: 5-bit address (0-31)
    parameter data_width = 32, // Default: 32-bit data
    parameter lo = 0,          // Default: lowest address
    parameter hi = 31          // Default: highest address
)(
    input               CLK,
    input [4:0]         ADDR_IN,    // 5-bit address (0-31)
    input [31:0]        D_IN,       // 32-bit data
    input               WE,         // Write enable

    // Only 2 active read ports (others unused)
    input [4:0]         ADDR_1,
    output [31:0]       D_OUT_1,
    input [4:0]         ADDR_2,
    output [31:0]       D_OUT_2,

    // Unused ports (kept for compatibility but optimized away)
    input [4:0]         ADDR_3,
    output [31:0]       D_OUT_3,
    input [4:0]         ADDR_4,
    output [31:0]       D_OUT_4,
    input [4:0]         ADDR_5,
    output [31:0]       D_OUT_5
);
    // Force BRAM inference (if array is large enough)
    reg [31:0] reg_file [0:31];  // 32 entries x 32-bit

    // Write logic
    always @(posedge CLK) begin
        if (WE) reg_file[ADDR_IN] <= D_IN;
    end

    // Active read ports
    assign D_OUT_1 = reg_file[ADDR_1];
    assign D_OUT_2 = reg_file[ADDR_2];

    // Unused read ports (tied to 0 to avoid synthesis warnings)
    assign D_OUT_3 = 32'b0;
    assign D_OUT_4 = 32'b0;
    assign D_OUT_5 = 32'b0;
endmodule