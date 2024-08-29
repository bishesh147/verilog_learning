module decoder_2_4_bh(Y, I, En);
    input En;
    input [1:0]I;
    output reg[3:0]Y;
    always @(*) begin
        case({En, I})  //The hardware for this will use a multiplexer.
            3'b100: Y = 4'b0001;
            3'b101: Y = 4'b0010;
            3'b110: Y = 4'b0100;
            3'b111: Y = 4'b1000;
            3'b000, 3'b001, 3'b010, 3'b011: Y = 4'b0000;
            default: $display("error");
        endcase
    end
endmodule