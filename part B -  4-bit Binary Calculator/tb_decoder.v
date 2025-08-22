module tb_decoder_1to2;
    reg write_addr;
    reg load;
    wire [1:0] sel;

    decoder_1to2 DUT (write_addr, load, sel);

    initial begin
        // Test load=0 (disabled)
        load = 0;
        write_addr = 0; #10; $display("Load=0, addr=0 ? sel=%b (Expected: 00)", sel);
        write_addr = 1; #10; $display("Load=0, addr=1 ? sel=%b (Expected: 00)", sel);

        // Test load=1 (enabled)
        load = 1;
        write_addr = 0; #10; $display("Load=1, addr=0 ? sel=%b (Expected: 01)", sel);
        write_addr = 1; #10; $display("Load=1, addr=1 ? sel=%b (Expected: 10)", sel);
        
        $finish;
    end
endmodule