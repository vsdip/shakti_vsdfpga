module Counter (
    input CLK,
    input RST,
    input ENABLE,
    output reg [WIDTH-1:0] Q_OUT
);

    parameter WIDTH = 8; // Default width of 8 bits

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            Q_OUT <= 0;
        end else if (ENABLE) begin
            Q_OUT <= Q_OUT + 1;
        end
    end

endmodule