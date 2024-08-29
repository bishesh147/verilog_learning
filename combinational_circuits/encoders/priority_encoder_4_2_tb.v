`timescale 1ps/1ps
`include "priority_encoder_4_2_bh.v"

module priority_encoder_4_2_tb;
    reg [3:0]I;
    wire V;
    wire [1:0]Y;
    integer i, j;
    priority_encoder_4_2_bh pe42bh(Y, V, I);
    initial begin
        for (i = 0; i < 16; i = i+1) begin
            I = i;
            #10 $display ("time=%d \t I=%b \t V=%b \t Y=%b", $time, I, V, Y);
        end
    end
endmodule