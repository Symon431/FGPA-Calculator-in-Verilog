module calculator_tb;

    reg clk = 0;
    reg reset, start, enter;
    reg [3:0] data_in;
    reg [2:0] op_code;
    reg [1:0] compute_op;

    wire [7:0] result;
    wire done, negative, div_by_zero;
    wire [6:0] HEX0, HEX1, HEX2;
    wire [2:0] HEX3;  // FSM State

    calculator DUT (
        .clk(clk),
        .reset(reset),
        .start(start),
        .enter(enter),
        .data_in(data_in),
        .op_code(op_code),
        .compute_op(compute_op),
        .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3),
        .done(done), .negative(negative), .div_by_zero(div_by_zero),
        .result(result)
    );

    always #5 clk = ~clk;

    // === Tasks ===

    task pulse_enter;
        begin
            enter = 1; #10 enter = 0;
        end
    endtask

    task load_A;
        input [3:0] val;
        begin
            op_code = 3'b001;
            data_in = val;
            $display("\n--- Time: %0t | Loading A = %0d ---", $time, val);
            pulse_enter;
            #10;
        end
    endtask

    task load_B;
        input [3:0] val;
        begin
            op_code = 3'b011;
            data_in = val;
            $display("--- Time: %0t | Loading B = %0d ---", $time, val);
            pulse_enter;
            #10;
        end
    endtask

    task compute;
        input [1:0] cop;
        input [127:0] label;
        begin
            compute_op = cop;
            op_code = 3'b101;
            $display("\n>>> Time: %0t | Starting Operation: %s <<<", $time, label);
            #40;
            $display("--------------------------------------------------");
            $display(" ALU Result       : %08b (%0d)", result, result);
            $display(" FSM State (HEX3) : %03b", HEX3);
            $display(" HEX2 (Hundreds)  : %07b", HEX2);
            $display(" HEX1 (Tens)      : %07b", HEX1);
            $display(" HEX0 (Ones)      : %07b", HEX0);
            $display(" Status Flags     : Done=%b | Negative=%b | Div0=%b", done, negative, div_by_zero);
            $display("--------------------------------------------------");
        end
    endtask

    // === Test Sequence ===
    initial begin
        $display("\n======= Simulation Start =======");

        reset = 1; start = 0; enter = 0;
        data_in = 0; op_code = 3'b000; compute_op = 2'b00;
        #20 reset = 0;

        start = 1; #10 start = 0;

        // --- SUB 5 - 2 ---
        load_A(4'd5);
        load_B(4'd2);
        compute(2'b01, "SUB 5 - 2");

        // --- SUB 3 - 7 (Expect Negative) ---
        load_A(4'd3);
        load_B(4'd7);
        compute(2'b01, "SUB 3 - 7");

        // --- DIV 6 / 3 ---
        load_A(4'd6);
        load_B(4'd3);
        compute(2'b11, "DIV 6 / 3");

        // --- DIV 6 / 0 (Division by Zero) ---
        load_B(4'd0);
        compute(2'b11, "DIV 6 / 0");

        // --- ADD 7 + 8 ---
        load_A(4'd7);
        load_B(4'd8);
        compute(2'b00, "ADD 7 + 8");

        // --- MUL 4 * 5 ---
        load_A(4'd4);
        load_B(4'd5);
        compute(2'b10, "MUL 4 * 5");

        $display("\n======= Simulation End =======");
        $finish;
    end
endmodule
