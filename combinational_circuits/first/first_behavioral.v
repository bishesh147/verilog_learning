module half_adder(s, c, a, b); //Convention in verilog is to list outputs first and inputs later
    input a, b;
    output reg s, c;
    always @(a, b)
    begin
       s = a ^ b;
       c = a & b; 
    end
endmodule
