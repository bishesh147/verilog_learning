module freq_div_4(clk_out, clk, rst);
    input clk, rst;
    output reg clk_out;
    reg clk_div_2;
    always @(negedge clk) begin
        if (rst) clk_div_2 <= 0;
        else clk_div_2 <= ~clk_div_2;
    end
    always @(negedge clk_div_2) begin
        if (rst) clk_out <= 0;
        else clk_out <= ~clk_out;
    end
endmodule