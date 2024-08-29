`timescale 1ps/1ps
`include "jk_flip_flop.v"

module jk_flip_flop_tb;
    reg j, k, clk;
    wire q, nq;
    integer i;
    jk_flip_flop jkff1(q, nq, j, k, clk);
    initial begin
        clk = 0;
        for (i = 0; i < 5000; i = i + 1) begin
            #10 clk = ~clk;
        end
    end
    initial begin
        $dumpfile("jk_flip_flop_tb.vcd");
        $dumpvars;
        j = 1; k = 0;
        #100 j = 0; k = 0;
        #100 j = 0; k = 1;
        #100 j = 0; k = 0;
        #100 j = 1; k = 1;
        #500 j = 0; k = 0;
    end
endmodule