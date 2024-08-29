module priority_encoder_4_2_bh(Y, V, I);
    output reg[1:0]Y;
    output reg V;
    input [3:0]I;
    always @(*) begin
        if(I[3]) {V, Y} = 3'b111;
        else if(I[2]) {V, Y} = 3'b110;
        else if(I[1]) {V, Y} = 3'b101;
        else if(I[0]) {V, Y} = 3'b100;
        else {V, Y} = 3'b000;
    end
endmodule