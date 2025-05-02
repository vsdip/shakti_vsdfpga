// axi4_to_vsd_bridge.v
// Converts AXI4 instruction/data AXI to VSD-style RAM/UART/LED

module axi4_to_vsd_bridge (
    input         clk,
    input         rst_n,

    // === Instruction AXI Read Only ===
    input         i_arvalid,
    input  [31:0] i_araddr,
    output        i_arready,
    output        i_rvalid,
    output [31:0] i_rdata,
    input         i_rready,

    // === Data AXI ===
    input         d_arvalid,
    input  [31:0] d_araddr,
    output        d_arready,
    output        d_rvalid,
    output [31:0] d_rdata,
    input         d_rready,

    input         d_awvalid,
    input  [31:0] d_awaddr,
    input         d_wvalid,
    input  [31:0] d_wdata,
    input  [3:0]  d_wstrb,
    output        d_awready,
    output        d_wready,
    output        d_bvalid,
    input         d_bready,

    // === VSD Peripherals ===
    output reg [7:0] uart_data,
    output reg       uart_valid,
    input            uart_ready,
    output reg [4:0] leds,

    // === Internal RAM ===
    output reg [31:0] mem_addr,
    output reg        mem_rstrb,
    input      [31:0] mem_rdata,
    output reg [31:0] mem_wdata,
    output reg [3:0]  mem_wmask
);

    wire is_io = (d_araddr[22] | d_awaddr[22]);
    wire is_ram = ~is_io;
    wire [29:0] word_addr = is_io ? d_awaddr[31:2] : d_araddr[31:2];

    // --- LED Write ---
    always @(posedge clk) begin
        if (!rst_n)
            leds <= 5'b0;
        else if (d_awvalid && d_wvalid && d_awaddr[22] && word_addr == 30'h1_0000_02)
            leds <= d_wdata[4:0];
    end

    // --- UART Write ---
    always @(posedge clk) begin
        uart_valid <= 0;
        if (d_awvalid && d_wvalid && d_awaddr[22] && word_addr == 30'h1_0000_00) begin
            uart_data <= d_wdata[7:0];
            uart_valid <= 1;
        end
    end

    // --- RAM ---
    always @(posedge clk) begin
        if (!rst_n) begin
            mem_rstrb <= 0;
            mem_wmask <= 0;
        end else begin
            mem_rstrb <= 0;
            mem_wmask <= 0;

            if (d_arvalid && is_ram) begin
                mem_addr <= d_araddr;
                mem_rstrb <= 1;
            end

            if (d_awvalid && d_wvalid && is_ram) begin
                mem_addr  <= d_awaddr;
                mem_wdata <= d_wdata;
                mem_wmask <= d_wstrb;
            end
        end
    end

    // --- AXI read path ---
    assign d_arready = 1'b1;
    assign d_rvalid  = d_arvalid;
    assign d_rdata   = is_ram ? mem_rdata : (word_addr == 30'h1_0000_01 ? {22'b0, ~uart_ready, 9'b0} : 32'b0);

    assign i_arready = 1'b1;
    assign i_rvalid  = i_arvalid;
    assign i_rdata   = mem_rdata; // assume instruction always from RAM

    // --- AXI write path ---
    assign d_awready = 1'b1;
    assign d_wready  = 1'b1;
    assign d_bvalid  = d_awvalid && d_wvalid;

endmodule
