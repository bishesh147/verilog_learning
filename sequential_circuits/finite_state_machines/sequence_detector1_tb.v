`timescale 1ps/1ps
`include "sequence_detector1.v"

module sequence_detector1_tb;
    reg i, clk, rst;
    wire o;

    integer bit_stream = 20'b0101_1010_1010_1110_1010;
    integer j = 0;

    sequence_detector1 sd11(o, i, clk, rst);

    always #10 clk = ~clk;

    initial begin
        rst = 1; clk = 0; j = 0;
        #30 rst = 0;
        for (j = 19; j >= 0; j = j-1) begin
            #20 i = bit_stream[j];
        end
    end

    initial begin
        $dumpfile("seq1.vcd");
        $dumpvars;
        #1000 $finish;
    end
endmodule