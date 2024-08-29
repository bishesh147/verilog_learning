`timescale 1ps/1ps
`include "full_adder_structural2.v"

module fa_tb;
    reg a, b, cin;
    wire s, c;
    integer i;
    full_adder fa1(s, c, a, b, cin);
    initial begin
        for (i = 0; i < 8; i = i+1) begin
            a = i[2]; b = i[1]; cin = i[0];
            #10 $display("time = %d \t a = %b \t b = %b \t cin = %b \t c = %b \t s = %b", $time, a, b, cin, c, s);
        end
        $finish;
    end
endmodule