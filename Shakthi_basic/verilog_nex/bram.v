module bram (
    input  wire clk,
    input  wire [31:0] addr,
    output reg  [31:0] rdata
);
    (* ram_style = "block" *) // Hint for Yosys to infer BRAM
    reg [31:0] mem [0:1023];  // 4KB = 1024 words

    initial begin
        $readmemh("firmware.hex", mem);
    end

    always @(posedge clk) begin
        rdata <= mem[addr[11:2]];  // word-aligned access
    end
endmodule
