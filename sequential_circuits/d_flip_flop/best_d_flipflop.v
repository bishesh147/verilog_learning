module d_flipflop(q, d, clk, preset, reset);
    input d, clk, preset, reset;
    output reg q;
    always @(negedge clk) begin
        if (reset) q <= 1'b0;
        else if (preset) q <= 1'b1;
        else q <= d;
    end
endmodule