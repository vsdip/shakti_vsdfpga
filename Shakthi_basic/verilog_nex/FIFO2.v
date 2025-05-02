module FIFO2 #(
    parameter width  = 1,       // Data width
    parameter guarded = 1'b1    // Guarded mode parameter
) (
    input  wire CLK,
    input  wire RST,
    input  wire [width-1:0] D_IN,
    input  wire ENQ,
    output wire FULL_N,
    output wire [width-1:0] D_OUT,
    input  wire DEQ,
    output wire EMPTY_N,
    input  wire CLR
);
    reg [width-1:0] mem[0:1];   // Depth=2 storage
    reg [1:0] count;            // Occupancy count
    reg rptr, wptr;             // Read/write pointers

    // Status flags
    assign FULL_N  = (count < 2);
    assign EMPTY_N = (count > 0);
    assign D_OUT   = mem[rptr];

    // Guarded mode logic
    wire write_en = ENQ & (FULL_N | (guarded & DEQ));
    wire read_en  = DEQ & EMPTY_N;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            rptr  <= 0;
            wptr  <= 0;
            count <= 0;
            mem[0] <= 0;
            mem[1] <= 0;
        end else if (CLR) begin
            rptr  <= 0;
            wptr  <= 0;
            count <= 0;
        end else begin
            case ({write_en, read_en})
                2'b10: begin // Enqueue
                    mem[wptr] <= D_IN;
                    wptr <= wptr + 1;
                    count <= count + 1;
                end
                2'b01: begin // Dequeue
                    rptr <= rptr + 1;
                    count <= count - 1;
                end
                2'b11: begin // Simultaneous
                    mem[wptr] <= D_IN;
                    wptr <= wptr + 1;
                    rptr <= rptr + 1;
                end
                default: ; // No change
            endcase
        end
    end
endmodule