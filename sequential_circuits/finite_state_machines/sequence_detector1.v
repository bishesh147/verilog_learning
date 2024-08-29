//Sequence detector for 1010

module sequence_detector1(o, i, clk, rst);
    input i, clk, rst;
    output reg o;

    reg [1:0] state;

    always @(posedge clk) begin
        if (rst) state <= 2'b00;
        else begin
            case (state)
                2'b00: begin
                    if (i == 1) state <= 2'b01;
                    o <= 0;
                end
                2'b01: begin
                    if (i == 0) state <= 2'b10;
                    o <= 0;
                end
                2'b10: begin
                    if (i == 1) state <= 2'b11;
                    else state <= 2'b00;
                    o <= 0;
                end
                2'b11: begin
                    if (i == 0) begin
                        state <= 2'b10;
                        o <= 1;
                    end
                    else begin
                        state <= 2'b01;
                        o <= 0;
                    end
                end
            endcase
        end
    end
endmodule
                