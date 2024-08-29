module full_adder(a, b, c, sum, carry);
    input a, b, c;
    output sum, carry;

    xor x1(temp1, a, b);
    and a1(temp2, a, b);
    xor x2(sum, temp1, c);
    and a2(temp3, temp1, c);
    or o1(carry, temp2, temp3);

endmodule