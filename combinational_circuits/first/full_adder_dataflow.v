module fa_df(s, c, a, b, cin);
    input a, b, cin;
    output s, c;
    assign s = a ^ b ^ cin;
    assign c = a&b | a&cin | b&cin;
endmodule