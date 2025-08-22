module decoder_1to2 (
    input write_addr,       // 0 ? A, 1 ? B
    input load,             // Enable loading
    output reg [1:0] sel    //The output(select line) - depends on the value of write_adder(selector)
);

    always @(*) begin
        if (load) begin
            sel = (write_addr == 1'b0) ? 2'b01 : 2'b10;  
        end else begin
            sel = 2'b00;
        end
    end

endmodule
