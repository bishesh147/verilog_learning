`timescale 1ps/1ps
`include "dual_clock_fifo.v"

module dual_clock_fifo_tb;
    parameter fifo_depth = 64;
    parameter fifo_width = 8; 

    reg wr_en, rd_en, clk_wr, clk_rd, rst;
    reg [fifo_width-1:0] wr_data;
    wire full, empty;
    wire [fifo_width-1:0] rd_data;
    integer i;

    dual_clock_fifo dcf1(clk_wr, wr_en, wr_data, full, clk_rd, rd_en, rd_data, empty, rst);

    always #20 clk_wr = ~clk_wr;
    always #10 clk_rd = ~clk_rd;
    initial begin
        $dumpfile ("dual_clock_fifo.vcd");
        $dumpvars;
        wr_en = 0; rd_en = 0; clk_wr = 0; clk_rd = 0; wr_data = 0; rst = 1;
        $monitor("time = %d \t rst = %b \t wr_en = %b \t wr_data = %h full = %b \t rd_en = %b \t rd_data = %h", $time, rst, wr_en, wr_data, full, rd_en, rd_data);
        #100 rst = 0; wr_en = 1; wr_data = $random;
        for (i = 0; i < 20; i = i+1) begin
            #40 wr_data = $random;
        end
    end
    initial begin
        #1000 rd_en = 1;
        #10000 
        $display("----------------------- The simulation has ended -------------------------");
        $finish;
    end
endmodule
    
