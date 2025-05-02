module uart_axilite #(
    parameter CLK_FREQ = 12000000,
    parameter BAUD = 9600
)(
    input         clk,
    input         rst,
    // AXI-Lite Interface
    input  [3:0]  awaddr,
    input         awvalid,
    output        awready,
    input  [31:0] wdata,
    input         wvalid,
    output        wready,
    output        bvalid,
    input         bready,
    // UART Interface
    output        tx,
    input         rx
);

    // UART TX Core
    reg [7:0] tx_data;
    reg       tx_start;
    wire      tx_busy;

    uart_tx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD(BAUD)
    ) uart_tx_inst (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    // Control Logic
    reg [1:0] state;
    localparam IDLE = 2'b00;
    localparam WRITE = 2'b01;
    localparam RESPOND = 2'b10;

    assign awready = (state == IDLE);
    assign wready = (state == IDLE);
    assign bvalid = (state == RESPOND);

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            tx_start <= 0;
            tx_data <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (awvalid && wvalid) begin
                        tx_data <= wdata[7:0];
                        tx_start <= 1;
                        state <= WRITE;
                    end
                end

                WRITE: begin
                    tx_start <= 0;
                    if (!tx_busy) begin
                        state <= RESPOND;
                    end
                end

                RESPOND: begin
                    if (bready) begin
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule

// Basic UART Transmitter
module uart_tx #(
    parameter CLK_FREQ = 12000000,
    parameter BAUD = 9600
)(
    input       clk,
    input       rst,
    input       tx_start,
    input [7:0] tx_data,
    output reg  tx,
    output      tx_busy
);

    localparam BIT_PERIOD = CLK_FREQ / BAUD;
    reg [3:0]  bit_cnt;
    reg [15:0] clk_cnt;
    reg [9:0]  shift_reg;
    reg        busy;

    assign tx_busy = busy;

    always @(posedge clk) begin
        if (rst) begin
            tx <= 1;
            busy <= 0;
            clk_cnt <= 0;
            bit_cnt <= 0;
        end else begin
            if (tx_start && !busy) begin
                shift_reg <= {1'b1, tx_data, 1'b0};
                busy <= 1;
                clk_cnt <= 0;
                bit_cnt <= 0;
            end

            if (busy) begin
                if (clk_cnt == BIT_PERIOD-1) begin
                    clk_cnt <= 0;
                    tx <= shift_reg[bit_cnt];
                    if (bit_cnt == 9) begin
                        busy <= 0;
                        tx <= 1;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end else begin
                    clk_cnt <= clk_cnt + 1;
                end
            end
        end
    end
endmodule