`timescale 1ps/1ps
`include "decoder_3_8_df.v"

module decoder_3_8_tb;
    reg [2:0]I;
    reg En;
    wire [7:0]Y;
    integer i, j;
    decoder_2_4_df d24df(Y, I, En);
    initial begin
        for (i = 0; i < 2; i = i+1) begin
            En = i;
            for (j = 0; j < 8; j = j+1) begin
                I = j;
                #10 $display ("time=%d \t En=%b \t I=%b \t Y=%b", $time, En, I, Y);
            end
        end
    end
endmodule