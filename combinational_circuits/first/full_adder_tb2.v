`timescale 1ns/100ps //This defines time: time_unit/precision
`include "full_adder_structural2.v"

module fa_bh_tb; //There is no inputs or outputs for test bench
    reg a, b, cin;
    wire s, c;
    full_adder fa1(s, c, a, b, cin);
    initial begin
        $monitor("time = %d \t a = %b \t b = %b \t cin = %b \t s = %b \t c = %b", $time, a, b, cin, s, c); //This will print when any values are changed
        a = 0; b = 0; cin = 0; //At time 0
        #10     a = 0; b = 0; cin = 1;
        #10     a = 0; b = 1; cin = 0;
        #10     a = 0; b = 1; cin = 1;
        #10     a = 1; b = 0; cin = 0;
        #10     a = 1; b = 0; cin = 1;
        #10     a = 1; b = 1; cin = 0;
        #10     a = 1; b = 1; cin = 1;
        #10     $stop;
    end
endmodule