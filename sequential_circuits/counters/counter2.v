//Mod-6 counter


module counter2(count, clk, rst);
    input clk, rst;
    output [2:0]count;
    reg [2:0]count_temp;

    always @(posedge clk) begin
        if (rst | count_temp >= 3'd5) count_temp <= 3'd0;
        else count_temp <= count_temp + 1;
    end
    assign count = count_temp;
endmodule