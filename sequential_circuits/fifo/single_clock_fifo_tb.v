`timescale 1ps/1ps
`include "single_clock_fifo.v"

`define DELAY 10

module single_clock_fifo_tb;
    reg clk, wr_en, rd_en, rst;
    reg [7:0] wr_data;
    wire full, empty;
    wire [7:0] rd_data;

    parameter endtime = 10000;

    integer i;

    FIFO F1(clk, wr_en, wr_data, full, rd_en, rd_data, empty, rst);

    initial begin
        clk = 1'b0; rst = 1'b1; wr_en = 1'b0; rd_en = 1'b0;
        wr_data = 8'd0;
    end

    initial begin
        $dumpfile("single_clock_fifo.vcd");
        $dumpvars;
        main;
    end

    task main;
        fork 
            clock_generator;
            operation_process;
            simulation_result;
            endsimulation;
        join
    endtask

    task clock_generator;
        begin
            forever #`DELAY clk = !clk;
        end
    endtask

    task operation_process;
        begin
            #(`DELAY*10+`DELAY) rst = 0; wr_en = 1'b1; wr_data = $random;
            for (i = 0; i < 50; i = i+1) begin
                #(`DELAY*2) wr_data = $random;
            end
            rd_en = 1;
            for (i = 0; i < 100; i = i+1) begin
                #(`DELAY*2) wr_data = $random;
            end
        end
    endtask

    task simulation_result;
        begin
            $monitor("time = %d \t rst = %b \t rd_en = %b \t wr_en = %b \t wr_data = %h \t rd_data = %h \t full = %b \t empty = %b", $time, rst, rd_en, wr_en, wr_data, rd_data, full, empty);
        end
    endtask

    task endsimulation;
        begin
            #endtime 
            $display("-----------------The Simulation Ended---------------");
            $finish;
        end
    endtask

endmodule

