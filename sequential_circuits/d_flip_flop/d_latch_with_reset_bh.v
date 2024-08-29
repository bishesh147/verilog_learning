module d_latch_bh(q, d, en, rst);
    input en, d, rst;
    output reg q;
    always @(en, q) begin
        if (rst) q = 1'b0;
        else if (en) q = d;
    end
endmodule