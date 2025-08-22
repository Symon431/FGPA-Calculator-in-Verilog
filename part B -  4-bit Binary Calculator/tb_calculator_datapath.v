module tb_calculator_datapath;

    reg clk, reset;
    reg [3:0] data_in;
    reg [2:0] op_code;
    reg [1:0] compute_op;
    wire [7:0] result;
    wire done, negative, div_by_zero;

    reg [3:0] A_val, B_val;  // Keep track of loaded A and B

    // Instantiate calculator datapath
    calculator_datapath DUT (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .op_code(op_code),
        .compute_op(compute_op),
        .result(result),
        .done(done),
        .negative(negative),
        .div_by_zero(div_by_zero)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tOp\tA\tB\tCompOp\tResult\tDone\tNeg\tDiv0");

        // Reset system
        reset = 1; #10; reset = 0;

        // Load A = 7
        data_in = 4'd7;
        A_val = data_in;
        op_code = 3'b001;  // LOAD A
        #10;

        // Load B = 3
        data_in = 4'd3;
        B_val = data_in;
        op_code = 3'b011;  // LOAD B
        #10;

        // ADD: 7 + 3
        op_code = 3'b101;  // COMPUTE
        compute_op = 2'b00;  // ADD
        #10;
        $display("%0t\tADD\t%d\t%d\t%02b\t%b\t%b\t%b\t%b", $time, A_val, B_val, compute_op, result, done, negative, div_by_zero);

        // SUB: 7 - 3
        compute_op = 2'b01;  // SUB
        #10;
        $display("%0t\tSUB\t%d\t%d\t%02b\t%b\t%b\t%b\t%b", $time, A_val, B_val, compute_op, result, done, negative, div_by_zero);

        // Load A = 3
        data_in = 4'd3;
        A_val = data_in;
        op_code = 3'b001;  // LOAD A
        #10;

        // Load B = 7
        data_in = 4'd7;
        B_val = data_in;
        op_code = 3'b011;  // LOAD B
        #10;

        // SUB: 3 - 7
        op_code = 3'b101;
        compute_op = 2'b01;  // SUB
        #10;
        $display("%0t\tSUB2\t%d\t%d\t%02b\t%b\t%b\t%b\t%b", $time, A_val, B_val, compute_op, result, done, negative, div_by_zero);

        // MUL: 3 * 7
        compute_op = 2'b10;  // MUL
        #10;
        $display("%0t\tMUL\t%d\t%d\t%02b\t%b\t%b\t%b\t%b", $time, A_val, B_val, compute_op, result, done, negative, div_by_zero);

        // DIV: 3 / 7
        compute_op = 2'b11;  // DIV
        #10;
        $display("%0t\tDIV\t%d\t%d\t%02b\t%b\t%b\t%b\t%b", $time, A_val, B_val, compute_op, result, done, negative, div_by_zero);

        // DIV by 0 test: Load B = 0
        data_in = 4'd0;
        B_val = data_in;
        op_code = 3'b011;  // LOAD B
        #10;

        // DIV again (with B = 0)
        op_code = 3'b101;
        compute_op = 2'b11;  // DIV
        #10;
        $display("%0t\tDIV0\t%d\t%d\t%02b\t%b\t%b\t%b\t%b", $time, A_val, B_val, compute_op, result, done, negative, div_by_zero);

        $finish;
    end

endmodule
