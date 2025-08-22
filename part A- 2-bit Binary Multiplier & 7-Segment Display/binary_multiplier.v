module binary_multiplier(input [1:0] A, input [1:0] B, output [3:0] C);
  wire w1,w2,w3,w4;
  
  and and_gate1(w1,A[0],B[1]);
  and and_gate2(C[0], A[0], B[0]);
  and and_gate3(w2, A[1], B[0]);
  and and_gate4(w3, A[1], B[1]);
  and and_gate5(w4,w1, w2);
  and and_gate6(C[3],w4, w3 );
  
  xor xor_gate1(C[1], w1, w2);
  xor xor_gate2(C[2], w4, w3);
  
endmodule
