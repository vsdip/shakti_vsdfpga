module mkeclass_axi4 (
    input  wire clk,         // FPGA 12 MHz clock input
    input  wire rst_n,       // Active-low reset
    output wire uart_tx,     // UART TX output
    output wire [3:0] dbg_led // Optional debug output to LEDs
);

    wire rst = ~rst_n;

    // 9600 baud clock generation from 12 MHz
    reg clk_9600 = 0;
    reg [31:0] cntr_9600 = 0;
    parameter period_9600 = 625;

    always @(posedge int_osc) begin
        cntr_9600 <= cntr_9600 + 1;
        if (cntr_9600 == period_9600) begin
            clk_9600 <= ~clk_9600;
            cntr_9600 <= 0;
        end
    end

    // Instruction & data memory wires
    wire [31:0] imem_addr;
    wire [31:0] rom_data;

    wire [31:0] dmem_addr;
    wire [31:0] dmem_wdata;
    wire        int_osc;
    wire imem_arvalid;
    wire dmem_arvalid;
    wire dmem_awvalid;
    wire dmem_wvalid;

    // UART output logic
    reg  [7:0] uart_data = 8'd0;
    reg        uart_send = 0;
    reg  [23:0] delay = 0;
    reg        test_sent = 0;
    SB_HFOSC #(.CLKHF_DIV ("0b10")) u_SB_HFOSC ( .CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
reg force_send = 1'b1;

reg force_send = 1'b1;

always @(posedge int_osc) begin
    uart_send <= 0;



    //  Then listen for CPU writes
    if ( dmem_addr == 32'h90000000) begin
        uart_data <= "D";
        uart_send <= 1'b1;
    end
end

    // UART module
    uart_tx_8n1 uart_inst (
        .clk       (clk_9600),
        .txbyte    (uart_data),
        .senddata  (1'b1),
        .tx        (uart_tx)
    );

    // Instruction BRAM
    bram instr_mem (
        .clk   (int_osc),
        .addr  (imem_addr),
        .rdata (rom_data)
    );

    // Debug LEDs (optional)
    assign dbg_led[0] = uart_send;
    assign dbg_led[1] = dmem_awvalid;
    assign dbg_led[2] = dmem_wvalid;

    // Shakti CPU instantiation
    mkeclass cpu (
        .CLK(int_osc),
        .RST_N(rst_n),

        // Instruction fetch (AXI4 read)
        .master_i_ARVALID(imem_arvalid),
        .master_i_ARADDR(imem_addr),
        .master_i_ARPROT(),
        .master_i_ARLEN(),
        .master_i_ARSIZE(),
        .master_i_ARBURST(),
        .master_i_ARID(),
        .master_i_ARREADY(1'b1),
        .master_i_RVALID(1'b1),
        .master_i_RRESP(2'b00),
        .master_i_RDATA(rom_data),
        .master_i_RLAST(1'b1),
        .master_i_RID(4'd0),

        // Data write (UART only)
        .master_d_AWVALID(dmem_awvalid),
        .master_d_AWADDR(dmem_addr),
        .master_d_AWPROT(),
        .master_d_AWLEN(),
        .master_d_AWSIZE(),
        .master_d_AWBURST(),
        .master_d_AWID(),
        .master_d_AWREADY(),

        .master_d_WVALID(dmem_wvalid),
        .master_d_WDATA(dmem_wdata),
        .master_d_WSTRB(),
        .master_d_WLAST(),
        .master_d_WID(),
        .master_d_WREADY(),

        .master_d_BVALID(1'b1),
        .master_d_BRESP(2'b00),
        .master_d_BID(4'd0),

        // Data read (not used)
        .master_d_ARVALID(dmem_arvalid),
        .master_d_ARADDR(),
        .master_d_ARPROT(),
        .master_d_ARLEN(),
        .master_d_ARSIZE(),
        .master_d_ARBURST(),
        .master_d_ARID(),
        .master_d_ARREADY(1'b1),
        .master_d_RVALID(1'b1),
        .master_d_RRESP(2'b00),
        .master_d_RDATA(32'h0),
        .master_d_RLAST(1'b1),
        .master_d_RID(4'd0),

        // Interrupts disabled
        .sb_ext_interrupt_put(1'b0),
        .EN_sb_ext_interrupt_put(1'b0),
        .RDY_sb_ext_interrupt_put()
    );

endmodule
