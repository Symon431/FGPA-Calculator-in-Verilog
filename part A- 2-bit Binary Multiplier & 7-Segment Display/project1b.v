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


module seg_decoder(
    input  [3:0] num, 
    output reg [6:0] seg  
);
    always @(*) begin
        case(num)
            4'd0: seg = 7'b1000000; 
            4'd1: seg = 7'b1111001; 
            4'd2: seg = 7'b0100100; 
            4'd3: seg = 7'b0110000; 
            4'd4: seg = 7'b0011001; 
            4'd5: seg = 7'b0010010; 
            4'd6: seg = 7'b0000010; 
            4'd7: seg = 7'b1111000; 
            4'd8: seg = 7'b0000000; 
            4'd9: seg = 7'b0010000; 
            default: seg = 7'b1111111; // Off (all segments=1)
        endcase
    end
endmodule


module project1b(
    input wire [1:0] A,  
    input wire [1:0] B,  
    output wire [6:0] seg  
);
    
    wire [3:0] C;

    // Instantiate the 2-bit binary multiplier
    binary_multiplier mult (
        .A(A),  
        .B(B),  
        .C(C)   
    );

    // Instantiate the 7-segment decoder
    seg_decoder dec (
        .num(C),  
        .seg(seg)  
    );
endmodule