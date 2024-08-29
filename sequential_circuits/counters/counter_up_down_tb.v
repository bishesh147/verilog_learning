`timescale 1ps/1ps
`include "counter_up_down.v"

module counter_up_down_tb;
    reg u_d, load, clk, rst;
    reg [7:0] data;
    wire [7:0] count;
    integer i;
    counter_up_down cud1(count, u_d, load, clk, rst, data);
    always #10 clk = ~clk;
    initial begin
        $monitor("time = %d \t count = %b", $time, count);
        clk = 0; rst = 1; load = 1; data = 8'b1011_1011; u_d = 0;
        #100 rst = 0;
        #20 load = 0;
        #300 u_d = 1;
        #300 $stop;
    end
endmodule