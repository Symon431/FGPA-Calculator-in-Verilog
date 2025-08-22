module fsm_tb;
    reg clk, reset, start, enter;
    wire [2:0] state;

    fsm DUT (.clk(clk), .reset(reset), .start(start), .enter(enter), .state(state));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tStart\tEnter\tState");
        $monitor("%0t\t%b\t%b\t%b\t%03b", $time, reset, start, enter, state);

        // Initialize
        reset = 1; start = 0; enter = 0;
        #10 reset = 0;

        // Start sequence
        #10 start = 1; #10 start = 0;
        #20 enter = 1; #10 enter = 0;
        #20 enter = 1; #10 enter = 0;
        #50;

        $finish;
    end
endmodule