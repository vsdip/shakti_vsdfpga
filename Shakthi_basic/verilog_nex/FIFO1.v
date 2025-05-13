`ifdef BSV_ASYNC_RESET
 `define BSV_ARESET_EDGE_META or `BSV_RESET_EDGE RST
`else
 `define BSV_ARESET_EDGE_META
`endif

`ifdef BSV_RESET_FIFO_HEAD
 `define BSV_ARESET_EDGE_HEAD `BSV_ARESET_EDGE_META
`else
 `define BSV_ARESET_EDGE_HEAD
`endif

module FIFO1(
    CLK,
    RST,
    D_IN,
    ENQ,
    FULL_N,
    D_OUT,
    DEQ,
    EMPTY_N,
    CLR
);
   parameter width = 1;
   parameter guarded = 1'b1;

   input     CLK;
   input     RST;
   input [width - 1 : 0] D_IN;
   input     ENQ;
   input     DEQ;
   input     CLR;

   output                FULL_N;
   output                EMPTY_N;
   output [width - 1 : 0] D_OUT;

   // BRAM Instantiation (iCE40 SB_RAM40_4K)
   SB_RAM40_4K #(
     .READ_MODE(0),      // 256x16 mode (unused for depth=1)
     .WRITE_MODE(0)
   ) bram (
     .RDATA(D_OUT),
     .RADDR(14'b0),      // Fixed read address (depth=1)
     .RCLK(CLK),
     .RCLKE(1'b1),       // Always enable read clock
     .RE(DEQ & EMPTY_N), // Read only when FIFO is not empty
     .WDATA(D_IN),
     .WADDR(14'b0),      // Fixed write address (depth=1)
     .WCLK(CLK),
     .WCLKE(1'b1),       // Always enable write clock
     .WE(ENQ & FULL_N)   // Write only when FIFO is not full
   );

   // Control Logic (Mirroring FIFO2's Structure)
   reg [1:0] count;      // Tracks 0 or 1 elements (depth=1)
   reg read_ptr;          // Unused (depth=1)
   reg write_ptr;         // Unused (depth=1)

   assign FULL_N  = (count < 1); // Full when count=1
   assign EMPTY_N = (count > 0); // Empty when count=0

   always @(posedge CLK `BSV_ARESET_EDGE_HEAD) begin
      if (RST || CLR) begin
         count <= 0;
         read_ptr  <= 0;  // Not used (depth=1)
         write_ptr <= 0;  // Not used (depth=1)
      end else begin
         case ({ENQ, DEQ})
            2'b10: begin // Enqueue
               if (count < 1) count <= count + 1;
            end
            2'b01: begin // Dequeue
               if (count > 0) count <= count - 1;
            end
            2'b11: begin // Simultaneous enq/deq
               // No change to count (overwrite data)
            end
            default: ; // No-op
         endcase
      end
   end

   // Error checks (optional)
   // synopsys translate_off
   always@(posedge CLK) begin
      if (!RST) begin
         if (ENQ && !FULL_N)
           $display("Error: FIFO1 overflow!");
         if (DEQ && !EMPTY_N)
           $display("Error: FIFO1 underflow!");
      end
   end
   // synopsys translate_on

endmodule