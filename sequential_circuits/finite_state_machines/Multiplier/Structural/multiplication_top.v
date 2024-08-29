`include "adder_df.v"
`include "control.v"
`include "multiplier_register.v"
`include "product_register.v"


module multiplication_top(a_in, b_in, result, clk, reset, start, ready);
    input [3:0] a_in, b_in;
    input clk, reset, start;
    output ready;
    output [8:0] result;

    wire [3:0]multiplier_out;
    wire [4:0]adder_out;
    wire [8:0]product_out;
    wire control_wr;
    wire control_initial_wr;


    multiplier_register mru1(
        .data_out(multiplier_out), 
        .data_in(b_in), 
        .clk(clk), 
        .reset(reset));

    adder addu1(
        .sum(adder_out), 
        .a(multiplier_out), 
        .b(product_out[3:0]));

    product_register pru1(
        .clk(clk), 
        .reset(reset), 
        .data_in(adder_out), 
        .wr(control_wr), 
        .initial_data_in(a_in), 
        .initial_wr(control_intial_wr), 
        .data_out(product_out));

    control cu1(
        .clk(clk), 
        .reset(reset), 
        .start(start), 
        .data_in(product_out[0]), 
        .ready(ready), 
        .wr(control_wr), 
        .initial_wr(control_initial_wr));

    assign result = product_out;
endmodule

