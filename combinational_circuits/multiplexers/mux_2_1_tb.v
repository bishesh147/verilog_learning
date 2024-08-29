`timescale 1ps/1ps
`include "mux_2_1_bh.v"

module mux_2_1_tb;
    reg [1:0]I;
    reg S;
    wire Y;
    integer i, j;
    mux_2_1_bh mbh(Y, I, S);
    initial begin
        for (i = 0; i < 4; i = i+1) begin
            I = i;
            for (j = 0; j < 2; j = j+1) begin
                S = j;
                #10 $display ("time=%d \t I=%b \t S=%b \t Y=%b", $time, I, S, Y);
            end
        end
    end
endmodule