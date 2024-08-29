module decoder_2_4_df(Y, I, En);
    input En;
    input [2:0]I;
    output [7:0]Y;
    assign Y = {En & I[2] & I[1] & I[0], 
                En & I[2] & I[1] & ~I[0], 
                En & I[2] & ~I[1] & I[0], 
                En & I[2] & ~I[1] & ~I[0],
                En & ~I[2] & I[1] & I[0], 
                En & ~I[2] & I[1] & ~I[0], 
                En & ~I[2] & ~I[1] & I[0], 
                En & ~I[2] & ~I[1] & ~I[0]};
endmodule