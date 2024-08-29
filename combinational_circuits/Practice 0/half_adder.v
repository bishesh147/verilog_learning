module half_adder(a, b, sum, carry, inverse);
    input a,b;
    output sum, carry, inverse;
    xor x1(sum, a, b);
    and a1(carry, a, b);
    not n1(inverse, a);
endmodule