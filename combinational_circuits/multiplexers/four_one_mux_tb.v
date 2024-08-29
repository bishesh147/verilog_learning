`timescale 1ps/1ps
`include "four_one_mux.v"

module four_one_mux_tb;
    reg i0, i1, i2, i3, s0, s1;
    wire o;
    integer i;
    four_one_mux fom1(o, i0, i1, i2, i3, s0, s1);
    initial begin
        for (i = 0; i < 65; i = i + 1) begin
            i0 = i[0]; i1 = i[1]; i2 = i[2]; i3 = i[3]; s0 = i[4]; s1 = i[5];
            #10 $display("time = %d \t s1 = %b \t s0 = %b \t i3 = %b \t i2 = %b \t i1 = %b \t i0 = %b \t o = %b", $time, s1, s0, i3, i2, i1, i0, o);
        end
    $finish;
    end
endmodule