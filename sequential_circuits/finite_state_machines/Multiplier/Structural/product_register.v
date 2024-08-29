module product_register(clk, reset, data_in, wr, initial_data_in, initial_wr, data_out);
    input [4:0] data_in;
    input [3:0] initial_data_in;
    input clk, reset, wr, initial_wr;
    output [8:0] data_out;

    reg [8:0] prod_reg;

    always @(posedge clk) begin
        if (reset) prod_reg <= 9'd0;
        else begin
            if (initial_wr == 1) prod_reg <= {5'd0, initial_data_in};
            else if (wr == 1) prod_reg <= {1'd0, data_in, data_out[3:0]};
        end
    end

    assign data_out = prod_reg;
endmodule

        