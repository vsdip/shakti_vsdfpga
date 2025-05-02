// Read-only BRAM using BRAM-style hint
module bram_32k_read #(
    parameter ADDR_WIDTH = 15,
    parameter INIT_FILE = "boot.hex"
)(
    input                         clk,
    input                         arvalid,
    input  [ADDR_WIDTH-1:0]       araddr,
    output reg                    arready,
    output reg [31:0]             rdata,
    output reg                    rvalid,
    input                         rready
);

    (* ram_style = "block" *) // Hint for Yosys to infer BRAM
    reg [31:0] mem [0:(2**ADDR_WIDTH)-1];

    initial begin
        if (INIT_FILE != "")
            $readmemh(INIT_FILE, mem);
    end

    reg read_pending;

    always @(posedge clk) begin
        arready <= 0;
        rvalid  <= 0;

        if (arvalid && !read_pending) begin
            rdata <= mem[araddr];
            arready <= 1;
            rvalid  <= 1;
        end
    end
endmodule

// Write-only BRAM using BRAM-style hint
module bram_32k_write #(
    parameter ADDR_WIDTH = 15
)(
    input                         clk,
    input                         awvalid,
    input  [ADDR_WIDTH-1:0]       awaddr,
    output reg                    awready,
    input  [31:0]                 wdata,
    input  [3:0]                  wstrb,
    input                         wvalid,
    output reg                    wready,
    output reg                    bvalid,
    input                         bready
);

    (* ram_style = "block" *) // Hint for Yosys to infer BRAM
    reg [31:0] mem [0:(2**ADDR_WIDTH)-1];

    always @(posedge clk) begin
        awready <= 0;
        wready  <= 0;
        bvalid  <= 0;

        if (awvalid && wvalid) begin
            if (wstrb[0]) mem[awaddr][7:0]   <= wdata[7:0];
            if (wstrb[1]) mem[awaddr][15:8]  <= wdata[15:8];
            if (wstrb[2]) mem[awaddr][23:16] <= wdata[23:16];
            if (wstrb[3]) mem[awaddr][31:24] <= wdata[31:24];

            awready <= 1;
            wready  <= 1;
            bvalid  <= 1;
        end

        if (bvalid && bready) begin
            bvalid <= 0;
        end
    end
endmodule
