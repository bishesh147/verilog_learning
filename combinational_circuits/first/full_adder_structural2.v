`include "first_behavioral.v"

module full_adder(s, c, x, y, z);
    input x, y, z;
    output s, c;
    wire s1, c1, c2;
    half_adder ha1(s1, c1, x, y);
    half_adder ha2(s, c2, s1, z);
    or o1(c, c1, c2);
endmodule