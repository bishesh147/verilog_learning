module priority_encoder_4_2_df(Y, V, I);
    output [1:0]Y;
    output V;
    input [3:0]I;
    assign Y = {I[2] | I[3], 
                I[3] | (I[1]& ~I[2])};
    assign V = |I;
endmodule