`timescale 1ps/1ps
`include "equal.v"

module equal_tb;
    reg [3:0]a, b;
    wire o;
    integer i, j;
    equal e1(o, a, b);
    initial begin
        a = 0; b = 0;
        for (i = 0; i < 16; i = i+1) begin
            a = i;
            for (j = 0; j < 16; j = j+1) begin
                b = j;
                #10 $display("time = %d \t a = %b \t b = %b \t o = %b", $time, a, b, o);
            end
        end
    end
endmodule