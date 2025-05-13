module axi4_uart_bridge (
    input  wire clk,
    input  wire rst,

    input  wire [31:0] awaddr,
    input  wire        awvalid,
    output wire        awready,

    input  wire [31:0] wdata,
    input  wire [3:0]  wstrb,
    input  wire        wvalid,
    output wire        wready,

    output reg  [1:0]  bresp,
    output reg         bvalid,
    input  wire        bready,

    output wire        uart_tx
);

    wire do_write = (awaddr == 32'h90000000) && awvalid && wvalid;
    reg  uart_send = 0;
    reg  [7:0] uart_data;
    wire uart_busy;

    assign awready = 1'b1;
    assign wready  = 1'b1;

    always @(posedge clk) begin
        if (rst) begin
            bvalid <= 0;
            uart_send <= 0;
        end else begin
            if (do_write && !uart_busy) begin
                uart_data <= wdata[7:0];
                uart_send <= 1;
                bvalid <= 1;
                bresp  <= 2'b00; // OKAY
            end else begin
                uart_send <= 0;
                if (bvalid && bready) bvalid <= 0;
            end
        end
    end

    uart_tx_8n1 uart (
        .clk(clk),
        .txbyte(uart_data),
        .senddata(uart_send),
        .tx(uart_tx)
    );

endmodule
