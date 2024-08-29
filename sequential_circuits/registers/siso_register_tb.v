`timescale 1ps/1ps
`include "siso_register.v"

module siso_register_tb;
    reg si, clk, rst;
    wire so;
    integer i, k;
    integer j = 32'b 1100_0110_1110_1111_0001_0101_1010_1101;
    siso_register sisor1(so, clk, rst, si);
    initial begin
        clk = 0;
        $dumpfile("siso_register_tb.vcd");
        $dumpvars;
        for (i = 0; i < 1000; i = i+1) begin
            #10 clk <= ~clk;
        end
    end
    initial begin
        rst = 0;
        for (k = 0; k < 32; k = k+1)begin
            #20 si <= j[k];
        end
    end
endmodule

