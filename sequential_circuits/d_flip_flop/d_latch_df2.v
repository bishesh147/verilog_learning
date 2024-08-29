module d_latch_df(q, nq, d, en);
    input d, en;
    output q, nq;
    wire n1, n2, n3;
    assign n1 = d ~& en;
    assign n2 = ~d ~& en;
    assign q = n1 ~& nq;
    assign nq = n2 ~& q;
endmodule