//This is a synchronous design i.e. everything happens at the falling edge of the clock. This design is preferred.

module dffwrb(q, d, clk, rst);
    input d, clk, rst;
    output reg q;
    always @(negedge clk) begin
        if (rst) q = 1'b0;
        else q <= d;
    end
endmodule