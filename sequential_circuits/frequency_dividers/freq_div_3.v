module freq_div_3(clk_out, clk, rst);
    input clk, rst;
    output clk_out;
    reg clk_temp;
    reg [1:0]sel;
    always @(posedge clk) begin
        if (rst) begin
            sel <= 2'b01;
            clk_temp <= 0;
        end
        else begin
            case (sel)
                2'b01: sel <= 10;
                2'b10: sel <= 11;
                2'b11: begin
                    sel <= 01;
                    clk_temp <= ~clk_temp;
                end
            endcase
        end
    end
    always @(negedge clk) begin
        if (rst) clk_temp <= 0;
        else begin
            if (sel == 2'b10) clk_temp <= ~clk_temp;
        end
    end
    assign clk_out = clk_temp;
endmodule
