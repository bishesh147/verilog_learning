module counter_up_down(count, u_d, load, clk, rst, data);
    input u_d, load, clk, rst;
    input [7:0]data;
    output [7:0]count;
    reg [7:0]count_temp;
    always @(posedge clk) begin
        if (rst) count_temp <= 0;
        else if (load) count_temp <= data;
        else if (u_d) count_temp <= count_temp+1;
        else count_temp <= count_temp-1;
    end
    assign count = count_temp;
endmodule
