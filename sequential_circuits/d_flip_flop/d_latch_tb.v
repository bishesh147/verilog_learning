`timescale 1ps/1ps
`include "d_latch_df2.v"

module d_latch_tb;
    reg d, en;
    wire q, nq;
    integer i;
    d_latch_df dldf(q, nq, d, en);
    initial begin
        en = 0; d = 1;
        #10
        for (i = 1; i < 11; i = i+1) begin
            en = ~en;
            d = 1;
            #10 $display("en = %b \t d = %b \t q = %b \t nq = %b", en, d, q, nq);
        end
    end
endmodule