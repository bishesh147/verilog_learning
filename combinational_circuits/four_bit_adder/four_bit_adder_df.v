module four_bit_adder_df(sum, carry, a, b, cin);
    input [3:0]a, b;
    input cin;
    output [3:0]sum;
    output carry;

    assign {carry, sum} = a + b + cin;

endmodule
