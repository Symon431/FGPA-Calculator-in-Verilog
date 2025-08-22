module tb_ripple_carry_adder;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    ripple_carry_adder_4bit DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $display("   A    +   B   + Cin = Sum  Cout");
        $display("------------------------------------");

        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        $display("%b + %b +  %b  = %b   %b", A, B, Cin, Sum, Cout);

        A = 4'b0010; B = 4'b0100; Cin = 0; #10;
        $display("%b + %b +  %b  = %b   %b", A, B, Cin, Sum, Cout);

        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        $display("%b + %b +  %b  = %b   %b", A, B, Cin, Sum, Cout);

        A = 4'b1111; B = 4'b1111; Cin = 1; #10;
        $display("%b + %b +  %b  = %b   %b", A, B, Cin, Sum, Cout);

        A = 4'b1010; B = 4'b0101; Cin = 1; #10;
        $display("%b + %b +  %b  = %b   %b", A, B, Cin, Sum, Cout);

        $finish;
    end
endmodule

