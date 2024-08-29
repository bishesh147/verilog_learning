`timescale 1ps/1ps
`include "decoder_2_4_df.v"

module decoder_2_4_tb;
    reg [1:0]I;
    reg En;
    wire [3:0]Y;
    integer i, j;
    decoder_2_4_df d24df(Y, I, En);
    initial begin
        for (i = 0; i < 2; i = i+1) begin
            En = i;
            for (j = 0; j < 4; j = j+1) begin
                I = j;
                #10 $display ("time=%d \t En=%b \t I=%b \t Y=%b", $time, En, I, Y);
            end
        end
    end
endmodule