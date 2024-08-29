module single_port_ram(rd_data, wr_data, wr_en, wr_addr, rd_addr, clk);
    input clk, wr_en;
    input [7:0] wr_data;
    input [9:0] wr_addr, rd_addr;
    output [7:0] rd_data;


    reg[7:0] rd_data2;
    reg [7:0] ram_memory[0:1023];

    always @(posedge clk) begin
        if (wr_en) ram_memory[wr_addr] <= wr_data;
        rd_data2 <= ram_memory[rd_addr];
    end

    assign rd_data = rd_data2;
endmodule
