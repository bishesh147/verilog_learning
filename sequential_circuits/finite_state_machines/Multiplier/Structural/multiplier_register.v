module multiplier_register(data_out, data_in, clk, reset);
    input [3:0]data_in;
    input clk, reset;
    output [3:0]data_out;
    reg [3:0]mul_reg;
    always @(posedge clk) begin //Register process block
        if (reset) mul_reg <= 4'd0;
        else mul_reg <= data_in;
    end
    assign data_out = mul_reg;
endmodule