`include "four_bit_adder_bh.v"

module four_bit_adder_tb;
    reg [3:0]a, b;
    reg cin;
    wire [3:0]sum;
    wire cout;
    four_bit_adder_bh fba1(sum, cout, a, b, cin);
    initial
        $monitor("time=%d \t a=%b \t b=%b \t cin=%b \t sum=%b \t cout=%b", $time, a, b, cin, sum, cout);
    initial begin
        a=0;
        b=0;
        cin=0;
        repeat(16) begin
            #10 a=a+1;
            repeat(16) begin
                #10 b=b+1;
                repeat(2) begin
                    #10 cin=~cin;
                end
            end
        end
    end
endmodule