`timescale 1ps/1ps
`include "best_d_flipflop.v"

module best_d_flip_flop_tb;
    reg d, clk, preset, reset;
    wire q;
    integer i;
    d_flipflop dff1(q, d, clk, preset, reset);

    initial begin
        clk = 0;
        for (i = 0; i<1000; i = i+1) begin
            #10 clk = ~clk;
        end
    end
    initial begin
        $dumpfile("best_d_flipflop.vcd");
        $dumpvars(0, dff1);
        d = 0; reset = 0; preset = 0;
        #30 d = 1;
        #30 d = 0;
        #30 d = 1;
        #30 reset = ~reset;
        #30 d = 0;
        #30 d = 1;
        #30 reset = ~reset;
        #30 d = 0;
        #30 d = 1;
        #30 d = 0;
        #30 d = 1;
        #30 preset = ~preset;
        #30 d = 0;
        #30 d = 1;
        #30 preset = ~preset;
        #30 d = 0;
    end
endmodule