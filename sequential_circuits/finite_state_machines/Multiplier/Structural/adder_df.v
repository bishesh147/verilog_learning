module adder(sum, a, b);
    input [3:0]a, b;
    output [4:0]sum;
    assign sum = a + b;
endmodule
