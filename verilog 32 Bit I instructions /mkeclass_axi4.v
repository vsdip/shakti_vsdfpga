module mkeclass_axi4 (
    input clk,              // Clock from FPGA (e.g., 12MHz)
    input rst_n,            // Active-low reset
    input uart_rx,          // UART RX from PC
    output uart_tx          // UART TX to PC
);

    wire reset = ~rst_n;

    mkSoc soc_inst (
        .CLK(clk),
        .RST_N(reset),
        .uart_io_SIN(uart_rx),
        .uart_io_SOUT(uart_tx)
        // Leave other unused ports unconnected or add them if needed
    );

endmodule