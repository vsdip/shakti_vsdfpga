module clk_div_12_to_10 (
    input wire clk_12mhz,   // Input clock: 12 MHz
    input wire rst,         // Active high reset
    output reg clk_10mhz    // Output clock: ~10 MHz
);

    reg [3:0] count = 0;

    always @(posedge clk_12mhz or posedge rst) begin
        if (rst) begin
            count <= 0;
            clk_10mhz <= 0;
        end else begin
            if (count == 5) begin
                count <= 0;
                clk_10mhz <= ~clk_10mhz;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
