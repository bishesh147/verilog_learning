//8-bits universal shift register

module universal_shift_register(PO, SO, PI, SI, clk, sel, rst);
    input clk, rst, SI;
    input [1:0] sel;
    input [7:0] PI;
    output SO;
    output [7:0] PO;
    always @(negedge clk) begin
        if (rst) PO <= 8'b0;
        else begin
            case (sel)
                2'b00: PO <= PO;
                2'b01: PO <= {PO[6:0], SI};
                2'b10: PO <= {SI, PO[7:1]};
                2'b11: PO <= PI;
            endcase
        end
    end
    assign SO = (sel == 2'b01)? PO[7]: PO[0];
endmodule
