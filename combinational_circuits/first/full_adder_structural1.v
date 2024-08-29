module full_adder(s, c, x, y, z);
    input x, y, z;
    output s, c;
    wire s1, c1, c2;
    xor x1(s1, x, y);
    xor x2(s, s1, z);
    and a1(c1, x, y);
    and a2(c2, s1, z);
    or o1(c, c1, c2);
endmodule