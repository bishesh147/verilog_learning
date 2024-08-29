module d_latch_bh(q, d, en);
    input en, d;
    output reg q;
    always @(en, q) begin
        if (en) q = d;
    end
endmodule