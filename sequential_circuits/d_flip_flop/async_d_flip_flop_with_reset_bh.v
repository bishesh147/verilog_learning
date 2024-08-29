module dffwrb(q, d, clk, rst);
    input d, clk, rst;
    output reg q;
    always @(negedge clk or posedge rst) begin
        if (rst) q = 1'b0;
        else q <= d;
    end
endmodule