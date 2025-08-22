module binary_multiplierTB();
  reg [1:0] A;
  reg [1:0] B;
  wire [3:0] C;
  
  //Instantiate the binary multiplier
  binary_multiplier DUT(A, B, C);
  
  initial 
    begin
    $display ("A B | C");
      
      A = 2'b00; B = 2'b00; #10 $display("%b %b |%b",A, B, C);
      A = 2'b00; B = 2'b01; #10 $display("%b %b |%b",A, B, C);
      A = 2'b00; B = 2'b10; #10 $display("%b %b |%b",A, B, C);
      A = 2'b00; B = 2'b11; #10 $display("%b %b |%b",A, B, C);
      A = 2'b01; B = 2'b00; #10 $display("%b %b |%b",A, B, C);
      A = 2'b01; B = 2'b01; #10 $display("%b %b |%b",A, B, C);
      A = 2'b01; B = 2'b10; #10 $display("%b %b |%b",A, B, C);
      A = 2'b01; B = 2'b11; #10 $display("%b %b |%b",A, B, C);
      A = 2'b10; B = 2'b00; #10 $display("%b %b |%b",A, B, C);
      A = 2'b10; B = 2'b01; #10 $display("%b %b |%b",A, B, C);
      A = 2'b10; B = 2'b10; #10 $display("%b %b |%b",A, B, C);
      A = 2'b10; B = 2'b11; #10 $display("%b %b |%b",A, B, C);
      A = 2'b11; B = 2'b00; #10 $display("%b %b |%b",A, B, C);
      A = 2'b11; B = 2'b01; #10 $display("%b %b |%b",A, B, C);
      A = 2'b11; B = 2'b10; #10 $display("%b %b |%b",A, B, C);
      A = 2'b11; B = 2'b11; #10 $display("%b %b |%b",A, B, C);
      #10
   $finish;  
end
endmodule
