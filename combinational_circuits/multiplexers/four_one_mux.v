`include "two_one_mux.v"

module four_one_mux(o, i0, i1, i2, i3, s0, s1);
    input i0, i1, i2, i3, s0, s1;
    output o;
    wire n1, n2;
    two_one_mux tom1(n1, i0, i2, s1);
    two_one_mux tom2(n2, i1, i3, s1);
    two_one_mux tom3(o, n1, n2, s0);
endmodule
