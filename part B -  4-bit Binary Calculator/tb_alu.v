module tb_alu;

    reg clk, reset;
    reg [3:0] A, B;
    reg [2:0] op_code;
    reg [1:0] compute_op;
    wire [7:0] result;
    wire done, negative, div_by_zero;

    // Instantiate the ALU
    alu DUT (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .op_code(op_code),
        .compute_op(compute_op),
        .result(result),
        .done(done),
        .negative(negative),
        .div_by_zero(div_by_zero)
    );

    // Clock generation: toggles every 5 time units
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tOP\tA\tB\tResult\tDone\tNeg\tDiv0");

        // Reset
        reset = 1; #10; reset = 0;

        // Test ADD (5 + 3 = 8)
        A = 4'd5;
        B = 4'd3;
        op_code = 3'b101; // COMPUTE
        compute_op = 2'b00; // ADD
        #10;
        $display("%0t\tADD\t%d\t%d\t%b\t%b\t%b\t%b", $time, A, B, result, done, negative, div_by_zero);

        // Test SUB (3 - 5 = -2)
        A = 4'd3;
        B = 4'd5;
        op_code = 3'b101;
        compute_op = 2'b01; // SUB
        #10;
        $display("%0t\tSUB\t%d\t%d\t%b\t%b\t%b\t%b", $time, A, B, result, done, negative, div_by_zero);

        // Test MUL (4 * 2 = 8)
        A = 4'd4;
        B = 4'd2;
        op_code = 3'b101;
        compute_op = 2'b10; // MUL
        #10;
        $display("%0t\tMUL\t%d\t%d\t%b\t%b\t%b\t%b", $time, A, B, result, done, negative, div_by_zero);

        // Test DIV (7 / 3)
        A = 4'd7;
        B = 4'd3;
        op_code = 3'b101;
        compute_op = 2'b11; // DIV
        #10;
        $display("%0t\tDIV\t%d\t%d\t%b\t%b\t%b\t%b", $time, A, B, result, done, negative, div_by_zero);

        // Test DIV by 0
        A = 4'd7;
        B = 4'd0;
        op_code = 3'b101;
        compute_op = 2'b11; // DIV
        #10;
        $display("%0t\tDIV0\t%d\t%d\t%b\t%b\t%b\t%b", $time, A, B, result, done, negative, div_by_zero);

        // Test DISPLAY A
        A = 4'd9;
        op_code = 3'b010; // DISPLAY A
        #10;
        $display("%0t\tDISP_A\t%d\t-\t%b\t%b\t%b\t%b", $time, A, result, done, negative, div_by_zero);

        // Test DISPLAY B
        B = 4'd6;
        op_code = 3'b100; // DISPLAY B
        #10;
        $display("%0t\tDISP_B\t-\t%d\t%b\t%b\t%b\t%b", $time, B, result, done, negative, div_by_zero);

        // Test DISPLAY RESULT
        op_code = 3'b110; // DISPLAY RESULT
        #10;
        $display("%0t\tDISP_RES\t-\t-\t%b\t%b\t%b\t%b", $time, result, done, negative, div_by_zero);

        // Test NOOP
        op_code = 3'b000; // NOOP
        #10;
        $display("%0t\tNOOP\t-\t-\t%b\t%b\t%b\t%b", $time, result, done, negative, div_by_zero);

        $finish;
    end

endmodule
