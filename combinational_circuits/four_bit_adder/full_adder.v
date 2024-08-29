`include "half_adder.v"

module full_adder(sum, carry, a, b, cin);
    input a, b, cin;
    output sum, carry;
    wire s1, c1, c2;
    half_adder ha1(s1, c1, a, b);
    half_adder ha2(sum, c2, s1, cin);
    or o1(carry, c1, c2);
endmodule