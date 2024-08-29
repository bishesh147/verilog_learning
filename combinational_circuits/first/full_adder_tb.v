`timescale 1ns/100ps //This defines time: time_unit/precision
`include "full_adder_behavioral.v"

module fa_bh_tb; //There is no inputs or outputs for test bench
    reg a, b, cin;
    wire s, c;
    fa_bh fa1(s, c, a, b, cin);
    initial begin
        $monitor("time = %d \t a = %b \t b = %b \t cin = %b \t s = %b \t c = %b", $time, a, b, cin, s, c); //This will print when any values are changed
        a = 0; b = 0; cin = 0; //At time 0
        #10     a = 1; //Wait 10 ns and change a to 1 {a, b, cin} = 100
        #10     b = 1; //{a, b, cin} = 110
        #10     cin = 1; //{a, b, cin} = 111
        #10     $stop;
    end
endmodule
