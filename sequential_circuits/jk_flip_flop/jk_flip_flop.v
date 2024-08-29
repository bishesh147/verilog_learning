module jk_flip_flop(q, nq, j, k, clk);
    input j,k,clk;
    output reg q,nq;
    integer i;
    always @(posedge clk) begin
        i = {j, k};
        case (i)
            2'b00: begin
                q <= q; nq <= nq;
            end
            2'b01: begin
                q <= 0; nq <= 1;
            end
            2'b10: begin
                q <= 1; nq <= 0;
            end
            2'b11: begin 
                q <= nq; nq <= q;
            end
        endcase
    end
endmodule