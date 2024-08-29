`timescale 1ps/1ps
`include "comparator_df1.v"

module comparator_tb;
    reg [3:0] A, B;
    wire Eq, Gt, Sm;
    integer i, j;
    comparator_df1 cdf(Eq, Gt, Sm, A, B);
    initial begin
        for (i = 0; i < 16; i = i+1) begin
            A = i;
            for (j = 0; j < 16; j = j+1) begin
                B = j;
                #10 $display("time = %d \t A = %b \t B = %b \t Eq = %b \t Gt = %b \t Sm = %b", $time, A, B, Eq, Gt, Sm);
            end
        end
    end
endmodule

