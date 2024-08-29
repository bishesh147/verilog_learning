module encoder_4_2_df(Y, V, I);
    output reg[1:0]Y;
    output reg V;
    input [3:0]I;
    always @(*) begin
        case(I)
            4'b0001: {V, Y} = 3'b100;
            4'b0010: {V, Y} = 3'b101;
            4'b0100: {V, Y} = 3'b110;
            4'b1000: {V, Y} = 3'b111;
            4'd0, 4'd3, 4'd5, 4'd6, 4'd7, 4'd9, 4'd10, 4'd11, 4'd12, 4'd13, 4'd14, 4'd15: {V, Y} = 3'b100;
            default: $display("Error!");
        endcase
    end
endmodule