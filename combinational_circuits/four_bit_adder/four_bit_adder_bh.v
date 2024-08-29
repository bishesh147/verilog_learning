module four_bit_adder_bh(sum, cout, a, b, cin);
    input [3:0] a, b;
    input cin;
    output reg [3:0] sum;
    output reg cout;
    always @(a, b, cin) begin
        {cout, sum} = a + b + cin;
    end
endmodule