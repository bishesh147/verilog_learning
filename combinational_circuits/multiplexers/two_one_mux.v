module two_one_mux(o, i0, i1, s);
    input i0, i1, s;
    output o;
    assign o = (i0 & (~s)) | (i1 & s);
endmodule