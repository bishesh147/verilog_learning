module ha_st(s, c, a, b);
    input a, b; //Both are wires
    output s, c; //Both are wires
    xor xor1(s, a, b);
    and and1(c, a, b);
endmodule
