module project1b_tb;
    reg [1:0] A, B;  
    wire [6:0] seg;  
    // Instantiate the module
    project1b DUT (.A(A), .B(B), .seg(seg) );
    initial begin
        $display("A  B  |  Product (Decimal)  |  seg (Binary)  |  Display");
        $display("-------------------------------------------------------");
        A = 2'b00; B = 2'b00; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b00; B = 2'b01; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b00; B = 2'b10; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b00; B = 2'b11; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b01; B = 2'b00; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b01; B = 2'b01; #10 $display("%b  %b  |        1          |    %b     |   1", A, B, seg);
        A = 2'b01; B = 2'b10; #10 $display("%b  %b  |        2          |    %b     |   2", A, B, seg);
        A = 2'b01; B = 2'b11; #10 $display("%b  %b  |        3          |    %b     |   3", A, B, seg);
        A = 2'b10; B = 2'b00; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b10; B = 2'b01; #10 $display("%b  %b  |        2          |    %b     |   2", A, B, seg);
        A = 2'b10; B = 2'b10; #10 $display("%b  %b  |        4          |    %b     |   4", A, B, seg);
        A = 2'b10; B = 2'b11; #10 $display("%b  %b  |        6          |    %b     |   6", A, B, seg);
        A = 2'b11; B = 2'b00; #10 $display("%b  %b  |        0          |    %b     |   0", A, B, seg);
        A = 2'b11; B = 2'b01; #10 $display("%b  %b  |        3          |    %b     |   3", A, B, seg);
        A = 2'b11; B = 2'b10; #10 $display("%b  %b  |        6          |    %b     |   6", A, B, seg);
        A = 2'b11; B = 2'b11; #10 $display("%b  %b  |        9          |    %b     |   9", A, B, seg);
        $finish;
    end
endmodule
