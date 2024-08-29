//8-bit twin registers set

module register_set(q1, q2, clk, rst, d1, d2);
    input clk, rst;
    input [7:0] d1, d2;
    output [7:0] q1, q2;
    always @(negedge clk) begin
        if (rst) begin
            q1 = 8'b0;
            q2 = 8'b0;
        end
        else begin
            q1 <= d1;
            q2 <= d2;
        end
    end
endmodule