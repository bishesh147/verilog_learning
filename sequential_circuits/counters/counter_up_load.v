module counter_up_load(count, clk, load, rst, data);
    input clk, rst, load;
    input [7:0] data;
    output [7:0] count;
    reg [7:0] count_temp;
    always @(posedge clk) begin
        if (rst) count_temp <= 8'b0;
        else if (load) count_temp <= data;
        else count_temp <= count_temp + 1;
    end
    assign count = count_temp;
endmodule

