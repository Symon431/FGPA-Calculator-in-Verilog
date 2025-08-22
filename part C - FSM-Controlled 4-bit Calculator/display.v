module display_logic (
    input  wire [7:0] binary_in,
    output reg  [6:0] seg_hundreds,
    output reg  [6:0] seg_tens,
    output reg  [6:0] seg_ones
);

    reg [3:0] hundreds, tens, ones;

    always @(*) begin
        hundreds = binary_in / 100;
        tens     = (binary_in % 100) / 10;
        ones     = binary_in % 10;

        // Hundreds
        case (hundreds)
            4'd0: seg_hundreds = 7'b1000000;
            4'd1: seg_hundreds = 7'b1111001;
            4'd2: seg_hundreds = 7'b0100100;
            4'd3: seg_hundreds = 7'b0110000;
            4'd4: seg_hundreds = 7'b0011001;
            4'd5: seg_hundreds = 7'b0010010;
            4'd6: seg_hundreds = 7'b0000010;
            4'd7: seg_hundreds = 7'b1111000;
            4'd8: seg_hundreds = 7'b0000000;
            4'd9: seg_hundreds = 7'b0010000;
            default: seg_hundreds = 7'b1111111;
        endcase

        // Tens
        case (tens)
            4'd0: seg_tens = 7'b1000000;
            4'd1: seg_tens = 7'b1111001;
            4'd2: seg_tens = 7'b0100100;
            4'd3: seg_tens = 7'b0110000;
            4'd4: seg_tens = 7'b0011001;
            4'd5: seg_tens = 7'b0010010;
            4'd6: seg_tens = 7'b0000010;
            4'd7: seg_tens = 7'b1111000;
            4'd8: seg_tens = 7'b0000000;
            4'd9: seg_tens = 7'b0010000;
            default: seg_tens = 7'b1111111;
        endcase

        // Ones
        case (ones)
            4'd0: seg_ones = 7'b1000000;
            4'd1: seg_ones = 7'b1111001;
            4'd2: seg_ones = 7'b0100100;
            4'd3: seg_ones = 7'b0110000;
            4'd4: seg_ones = 7'b0011001;
            4'd5: seg_ones = 7'b0010010;
            4'd6: seg_ones = 7'b0000010;
            4'd7: seg_ones = 7'b1111000;
            4'd8: seg_ones = 7'b0000000;
            4'd9: seg_ones = 7'b0010000;
            default: seg_ones = 7'b1111111;
        endcase
    end

endmodule
