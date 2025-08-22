module tb_adder_subtractor;

    reg [3:0] A, B;
    reg OP;
    wire [7:0] S;

    adder_subtractor DUT (
        .A(A),
        .B(B),
        .OP(OP),
        .S(S)
    );

    initial begin
        $display("OP |   A   |   B   | Result (S)");
        $display("-------------------------------");

        // Addition: 5 + 3 = 8
        A = 4'b0101; B = 4'b0011; OP = 0; #10;
        $display(" %b |  %b |  %b |   %b", OP, A, B, S);

        // Addition: 7 + 9 = 16
        A = 4'b0111; B = 4'b1001; OP = 0; #10;
        $display(" %b |  %b |  %b |   %b", OP, A, B, S);

        // Subtraction: 10 - 3 = 7
        A = 4'b1010; B = 4'b0011; OP = 1; #10;
        $display(" %b |  %b |  %b |   %b", OP, A, B, S);

        // Subtraction: 3 - 10 = -7 (two?s comp ? result will look like 9, Cout = 0)
        A = 4'b0011; B = 4'b1010; OP = 1; #10;
        $display(" %b |  %b |  %b |   %b", OP, A, B, S);

        // Addition: 15 + 15 = 30
        A = 4'b1111; B = 4'b1111; OP = 0; #10;
        $display(" %b |  %b |  %b |   %b", OP, A, B, S);

        // Subtraction: 15 - 15 = 0
        A = 4'b1111; B = 4'b1111; OP = 1; #10;
        $display(" %b |  %b |  %b |   %b", OP, A, B, S);

        $finish;
    end

endmodule

