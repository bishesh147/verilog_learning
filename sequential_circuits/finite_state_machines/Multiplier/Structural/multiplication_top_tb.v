`timescale 1ps/1ps
`include "multiplcation_top.v"

module multiplication_top_tb;
    reg [3:0] a_in, b_in;
    reg clk, reset, start;
    wire ready;
    wire [8:0]result;

    multiplication_top mlt1(a_in, b_in, result, clk, reset, start, ready);

    always #10 clk = ~clk;

    initial begin
        reset = 1; clk = 0; a_in = 4'b0000; b_in = 4'b0000; start = 0;
        #30 reset = 0; start = 1; a_in = 4'd11; b_in = 4'd9;
        #20 start = 0;
    end

    initial begin
        $dumpfile("multiplcation_waveform.vcd");
        $dumpvars;
        #1000 $finish;
    end
endmodule