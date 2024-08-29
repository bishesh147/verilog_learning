`timescale 1ps/1ps
`include "single_port_ram.v"

module single_port_ram_tb;
    reg clk, wr_en;
    reg [7:0] wr_data;
    reg [9:0] wr_addr, rd_addr;
    wire [7:0] rd_data;

    integer i;

    single_port_ram spr1(rd_data, wr_data, wr_en, wr_addr, rd_addr, clk);

    always #10 clk = ~clk;

    initial begin
        clk = 0; wr_en = 0; wr_data = 0; wr_addr = 0; rd_addr = 0;
        #10
        #20 wr_en = 1; wr_data = 8'd80; wr_addr = 10'd80; rd_addr = 10'd80;
        #20 wr_addr = 10'd0; wr_data = 8'd90;
        #20 wr_addr = 10'd80;
        #20 wr_addr = 10'd1023; rd_addr = 10'd0;
        #20 rd_addr = 10'd80;
        #20 rd_addr = 10'd1000;
        #20 rd_addr = 10'd1023;
    end

    initial begin
        $dumpfile ("single_port_ram.vcd");
        $dumpvars;
        $monitor("time = %d \t rd_addr = %d \t rd_data = %d", $time, rd_addr, rd_data);
        #1000 $finish;
    end
endmodule