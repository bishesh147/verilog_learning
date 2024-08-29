`timescale 1ps/1ps
`include "counter1.v"

module counter_tb;
    reg clk, rst;
    wire [7:0]count;
    counter1 c1(count, clk, rst);

    always #10 clk = ~clk;

    initial begin
        $monitor("time = %d \t count = %b", $time, count);
        clk = 0; rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #50 rst = 1;
        #10 rst = 0;
        #5000 $stop;
    end
endmodule