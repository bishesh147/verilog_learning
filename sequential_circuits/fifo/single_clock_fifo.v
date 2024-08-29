module FIFO(clk, wr_en, wr_data, full, rd_en, rd_data, empty, rst);
    input clk, wr_en, rd_en, rst;
    input [7:0] wr_data;
    output full, empty;
    output [7:0] rd_data;

    reg [7:0] rd_data2;
    reg [7:0] mem_buffer[31:0];
    reg [5:0] wr_ptr, rd_ptr;

    always @(posedge clk) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end
    end

    always @(posedge clk) begin
        if (wr_en & !full & !rst) begin
            mem_buffer[wr_ptr] <= wr_data;
            wr_ptr <= wr_ptr + 1;
        end
    end

    always @(posedge clk) begin
        if (rst) rd_data2 <= 0;
        else begin
            if (rd_en & !empty) begin
                rd_data2 <= mem_buffer[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end
            else rd_data2 <= rd_data2;
        end
    end

    assign full = (wr_ptr == 6'd32) ? 1:0;
    assign empty = ((rd_ptr <= wr_ptr) & (rd_ptr <= 6'd32)) ? 0:1;
    assign rd_data = rd_data2;

endmodule