module multiplier(a_in, b_in, result, clk, reset, start, ready);
    input [3:0] a_in, b_in;
    input clk, reset, start;
    output reg ready;
    output reg [8:0] result;

    reg [3:0] a_reg;
    reg [1:0] state;
    reg [7:0] counter;

    always @(posedge clk) begin
        if (reset) begin
            state <= 2'b00; 
            counter <= 8'b0;
            a_reg <= 4'd0;
            ready <= 0;
            result <= 9'd0;
        end
        else begin
            case (state)
                2'b00: begin //Idle state
                    if (start == 1) state <= 2'b01;
                    ready <= 1;
                end

                2'b01: begin //Load state
                    counter <= 0;
                    result <= 9'd0 + b_in;
                    a_reg <= a_in;
                    state <= 2'b10;
                    ready <= 0;
                end
                
                2'b10: begin //op state
                    counter <= counter + 1;
                    if (result[0] == 1) begin
                        result <= {1'b0, (result[8:4] + {1'b0, a_in}), result[3:1]};
                    end
                    else
                        result <= {1'b0, result[8:1]};
                    if (counter == 3)
                        state <= 2'b00;
                    ready <= 0;
                end
            endcase
        end
    end
endmodule

