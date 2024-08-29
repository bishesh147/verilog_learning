`timescale 1ps/1ps
`include "freq_div_3.v"

module freq_div_tb;
    reg clk, rst;
    wire clk_out;
    freq_div_3 fd1(clk_out, clk, rst);
    always #10 clk = ~clk;
    initial begin
        $dumpfile ("freq_div_3_tb.vcd");
        $dumpvars;
        rst = 1; clk = 0;
        #120 rst = 0;
        #1000 $stop;
    end
endmodule