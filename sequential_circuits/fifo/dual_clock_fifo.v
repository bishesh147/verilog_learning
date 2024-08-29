module dual_clock_fifo(clk_wr, wr_en, wr_data, full, clk_rd, rd_en, rd_data, empty, rst);
    parameter fifo_depth = 16;
    parameter fifo_width = 8; 

    input wr_en, rd_en, clk_wr, clk_rd, rst;
    input [fifo_width-1:0] wr_data;
    output full, empty;
    output [fifo_width-1:0] rd_data;

    reg [fifo_width-1:0] mem_buffer[0:fifo_depth-1];
    reg [$clog2(fifo_depth):0] wr_ptr, rd_ptr;
    reg [fifo_width-1:0] rd_data2;

    always @(posedge clk_wr) begin
        if (rst) wr_ptr <= 0;
        else begin
            if (wr_en & !full) begin
                mem_buffer[wr_ptr] <= wr_data;
                wr_ptr <= wr_ptr + 1;
            end
        end
    end

    always @(posedge clk_rd) begin
        if (rst) begin
            rd_data2 <= 0;
            rd_ptr <= 0;
        end
        else begin
            if (rd_en & !empty) begin
                rd_data2 <= mem_buffer[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end
            else rd_data2 <= rd_data2;
        end
    end

    assign full = (wr_ptr == fifo_depth) ? 1:0;
    assign rd_data = rd_data2;
    assign empty = (rd_ptr < wr_ptr) ? 0:1;
endmodule

