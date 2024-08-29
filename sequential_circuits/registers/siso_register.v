module siso_register(so, clk, rst, si);
    input si, clk, rst;
    output so;
    reg [7:0] sr;
    always @(negedge clk) begin
        if (rst) sr <= 8'b0;
        else sr <= {si, sr[7:1]};
    end
    assign so = sr[0];
endmodule
