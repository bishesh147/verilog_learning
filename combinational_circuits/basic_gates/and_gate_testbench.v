`timescale 1ps/1ps
`include "and_gate.v"

module and_gate_testbench;
    reg a, b;
    wire o;
    integer i;
    and_gate a1(o, a, b);
    always #10 a = ~a;
    initial begin
        $dumpfile("edge_triggering.vcd");
        $dumpvars;
        a = 0; b = 1;
        #1
        for (i = 0; i < 1000; i = i+1) begin
            #10 b = ~b;
        end
        #1000 $stop;
    end
endmodule
        