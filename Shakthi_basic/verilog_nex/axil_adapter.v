module axil_adapter (
    input         clk,
    input         rst,
    // AXI4 Interface
    input  [31:0] axi_awaddr,
    input         axi_awvalid,
    output        axi_awready,
    input  [31:0] axi_wdata,
    input  [3:0]  axi_wstrb,
    input         axi_wvalid,
    output        axi_wready,
    output        axi_bvalid,
    input         axi_bready,
    // AXI-Lite Interface
    output [3:0]  axil_awaddr,
    output        axil_awvalid,
    input         axil_awready,
    output [31:0] axil_wdata,
    output        axil_wvalid,
    input         axil_wready,
    input         axil_bvalid,
    output        axil_bready
);

    reg [1:0] state;
    localparam IDLE      = 2'b00;
    localparam SEND_ADDR = 2'b01;
    localparam SEND_DATA = 2'b10;
    localparam WAIT_RESP = 2'b11;

    reg [31:0] awaddr_reg;
    reg [31:0] wdata_reg;
    reg        awvalid_reg;
    reg        wvalid_reg;
    reg        bready_reg;

    assign axil_awaddr = awaddr_reg[3:0];
    assign axil_wdata = wdata_reg;
    assign axi_awready = (state == IDLE);
    assign axi_wready = (state == IDLE);

    assign axil_awvalid = awvalid_reg;
    assign axil_wvalid = wvalid_reg;
    assign axil_bready = bready_reg;
    assign axi_bvalid = axil_bvalid;

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            awvalid_reg <= 0;
            wvalid_reg <= 0;
            bready_reg <= 0;
            awaddr_reg <= 0;
            wdata_reg <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (axi_awvalid && axi_wvalid) begin
                        awaddr_reg <= axi_awaddr;
                        wdata_reg <= axi_wdata;
                        state <= SEND_ADDR;
                        awvalid_reg <= 1;
                    end
                end

                SEND_ADDR: begin
                    if (axil_awready) begin
                        awvalid_reg <= 0;
                        state <= SEND_DATA;
                        wvalid_reg <= 1;
                    end
                end

                SEND_DATA: begin
                    if (axil_wready) begin
                        wvalid_reg <= 0;
                        state <= WAIT_RESP;
                        bready_reg <= 1;
                    end
                end

                WAIT_RESP: begin
                    if (axil_bvalid) begin
                        bready_reg <= 0;
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule