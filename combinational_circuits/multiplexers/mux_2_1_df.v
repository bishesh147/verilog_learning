module mux_2_1_df(Y, I, S);
    input [1:0]I;
    input S;
    output Y;
    assign Y = S?I[1]:I[0];
endmodule