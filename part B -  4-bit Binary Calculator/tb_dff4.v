module tb_dff4;

    reg clk, reset, load;
    reg [3:0] d;
    wire [3:0] q;

    dff4 DUT (
        .clk(clk),
        .reset(reset),
        .load(load),
        .d(d),
        .q(q)
    );

    // Clock generator
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tLoad\tD\tQ");

        // Initialize
        reset = 1; load = 0; d = 4'b0000; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, load, d, q);

        reset = 0;

        // Load value 1010 into register
        d = 4'b1010; load = 1; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, load, d, q);

        // Hold value (load = 0)
        load = 0; d = 4'b1111; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, load, d, q);

        // Load new value
        load = 1; d = 4'b0101; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, load, d, q);

        // Reset again
        reset = 1; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, load, d, q);

        $finish;
    end
endmodule

