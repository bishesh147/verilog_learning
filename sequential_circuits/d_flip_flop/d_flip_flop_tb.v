`timescale 1ps/1ps
`include "d_flip_flop_with_reset_bh.v"

module dffwrbhtb;
    reg d, clk, rst;
    wire q;
    integer i;
    dffwrb dffwrb1(q, d, clk, rst);

    initial begin
        clk = 0;
        for (i = 0; i<1000; i = i+1) begin
            #10 clk = ~clk;
        end
    end
    initial begin
        $dumpfile("d_flip_flop_with_reset_bh.vcd");
        $dumpvars(0, dffwrb1);
        d = 0; rst = 0;
        #30 d = 1;
        #30 d = 0;
        #30 d = 1;
        #30 rst = ~rst;
        #30 d = 0;
        #30 d = 1;
        #30 rst = ~rst;
        #30 d = 0;
    end
endmodule