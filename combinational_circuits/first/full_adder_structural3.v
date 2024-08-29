module full_adder(s, c, a, b, cin);
    input a, b, cin;
    output s, c;
    wire n1, n2, n3, n4;
    xor x1(n1, a, b);
    xor x2(s, n1, cin);
    and a1(n2, a, b);
    and a2(n3, a, cin);
    and a3(n4, b, cin);
    or o1(c, n2, n3, n4);
endmodule