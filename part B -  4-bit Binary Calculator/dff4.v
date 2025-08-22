module dff4 (
    input clk,
    input reset,
    input load,             // Enables writing into register
    input [3:0] d,          // Input data
    output reg [3:0] q      // Stored output
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (load)
            q <= d;
    end

endmodule

//The calculator needs two 4-bit registers (reg_A and reg_B) to hold input numbers before computation. The module comes into play
