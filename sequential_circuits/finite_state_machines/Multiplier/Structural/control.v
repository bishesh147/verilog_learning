module control(clk, reset, start, data_in, ready, wr, initial_wr);
    input clk, reset, start;
    input data_in;
    output reg ready, wr, initial_wr;

    reg [1:0] state;
    reg [7:0] counter;

    always @(posedge clk) begin
        if (reset) begin
            state <= 2'd0;
            counter <= 8'd0;
            ready <= 0;
            wr <= 0;
            initial_wr <= 0;
        end
        else begin
            case (state)
                2'b00: begin //Idle state
                    if (start == 1) state <= 2'b01;
                    ready <= 1;
                end

                2'b01: begin //Load state
                    counter <= 0;
                    initial_wr <= 1;
                end

                2'b10: begin //Operation state
                    counter <= counter+1;
                    if (data_in == 1) begin
                        wr <= 1;
                    end
                    if (counter == 3)
                        state <= 2'b00;
                end
            endcase
        end
    end
endmodule
