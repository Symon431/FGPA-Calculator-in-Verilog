module alu (
    input clk,
    input reset,
    input [3:0] A,
    input [3:0] B,
    input [2:0] op_code,       // Main instruction code
    input [1:0] compute_op,    // Specific compute operation: ADD, SUB, MUL, DIV
    output reg [7:0] result,   // 8-bit result
    output reg done,           // Operation complete flag
    output reg div_by_zero,    // Division-by-zero flag
    output reg negative        // Negative result flag (subtraction only)
);

    // Intermediate result from adder-subtractor
    wire [7:0] add_sub_result;

    // Adder-Subtractor instance
    adder_subtractor add_sub (
        .A(A),
        .B(B),
        .OP(compute_op[0]),  // 0 = ADD, 1 = SUB
        .S(add_sub_result)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset everything
            result <= 8'b0;
            done <= 0;
            div_by_zero <= 0;
            negative <= 0;
        end else begin
            // Default flag resets
            done <= 0;
            div_by_zero <= 0;
            negative <= 0;

            case (op_code)
                3'b101: begin
                    // COMPUTE operations
                    case (compute_op)
                        2'b00: begin
                            // ADD
                            result <= add_sub_result;
                            done <= 1;
                        end

                        2'b01: begin
                            // SUB
                            result <= add_sub_result;
                            done <= 1;
                            if (add_sub_result[4] == 0)  // Checking carry-out for negative
                                negative <= 1;
                        end

                        2'b10: begin
                            // MUL
                            result <= A * B;
                            done <= 1;
                        end

                        2'b11: begin
                            // DIV
                            if (B == 0) begin
                                div_by_zero <= 1;
                                result <= 8'b0;
                            end else begin
                                result <= {(A % B), (A / B)}; // Remainder then Quotient
                                done <= 1;
                            end
                        end

                        default: begin
                            // Should not happen
                            done <= 0;
                        end
                    endcase
                end

                3'b010: begin
                    // DISPLAY A
                    result <= {4'b0000, A}; // Pad A to 8 bits
                    done <= 1;
                end

                3'b100: begin
                    // DISPLAY B
                    result <= {4'b0000, B}; // Pad B to 8 bits
                    done <= 1;
                end

                3'b110: begin
                    // DISPLAY RESULT
                    done <= 1; // No change to result itself
                end

                3'b000: begin
                    // NOOP
                    done <= 0;
                end

                default: begin
                    // Unhandled op_code: don't touch result, just reset flags
                    done <= 0;
                    div_by_zero <= 0;
                    negative <= 0;
                end
            endcase
        end
    end

endmodule
