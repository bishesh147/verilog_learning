`timescale 1ps/1ps
`include "counter2.v"

module counter_tb;
    reg clk, rst;
    wire [2:0]count;
    counter2 c2(count, clk, rst);

    always #10 clk = ~clk;

    initial begin
        $monitor("time = %d \t count = %b", $time, count);
        clk = 0; rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #1000 $stop;
    end
endmodule