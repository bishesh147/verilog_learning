`timescale 1ps/1ps
`include "counter_up_load.v"

module counter_up_load_tb;
    reg clk, rst, load;
    reg [7:0] data;
    wire [7:0] count;

    counter_up_load cul1(count, clk, load, rst, data);

    always #5 clk = ~clk;

    initial begin
        $monitor("time = %d \t count = %b", $time, count);
        clk = 0; load = 0; rst = 0; data = 8'b0;
        #10 rst = 1;
        #10 rst = 0;
        #150 load = 1; data = 8'b1011_1100;
        #10 load = 0;
        #1000 $stop;
    end
endmodule