`include "full_adder.v"

module four_bit_adder(sum, overflow, a, b, cin);
    input [3:0]a, b;
    input cin;
    output [3:0]sum;
    output overflow;
    wire c1, c2, c3;
    full_adder fa1(sum[0], c1, a[0], b[0], cin);
    full_adder fa2(sum[1], c2, a[1], b[1], c1);
    full_adder fa3(sum[2], c3, a[2], b[2], c2);
    full_adder fa4(sum[3], overflow, a[3], b[3], c3);
endmodule