module fa_bh(s, c, a, b, cin);
    input a, b, cin;
    output reg s, c;
    always @(*) begin //All the inputs go to sensitivity list
        s = a ^ b ^ cin; //^ means xor
        c = a&b | a&cin | b&cin;
    end
endmodule