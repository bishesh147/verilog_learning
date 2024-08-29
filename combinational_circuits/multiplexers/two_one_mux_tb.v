`timescale 1ps/1ps
`include "two_one_mux.v"

module two_one_mux_tb;
    reg i0, i1, s;
    wire o;
    integer i;
    two_one_mux m1(o, i0, i1, s);
    initial begin
        for (i = 0; i < 8; i++) begin
            i0 = i[0]; i1 = i[1]; s = i[2];
            #10 $display("time = %d \t i0 = %b \t i1 = %b \t s = %b \t o = %b", $time, i0, i1, s, o);
        end
        $finish;
    end
endmodule