module tb_mux2to1;

    reg [3:0] in0, in1;
    reg sel;
    wire [3:0] out;

    mux2to1 DUT (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("sel | in0  | in1  | out");
        $display("---------------------------");

        in0 = 4'b0000; in1 = 4'b1111;

        sel = 0; #10;
        $display(" %b  | %b | %b | %b", sel, in0, in1, out);

        sel = 1; #10;
        $display(" %b  | %b | %b | %b", sel, in0, in1, out);

        in0 = 4'b1010; in1 = 4'b0101;

        sel = 0; #10;
        $display(" %b  | %b | %b | %b", sel, in0, in1, out);

        sel = 1; #10;
        $display(" %b  | %b | %b | %b", sel, in0, in1, out);

        $finish;
    end

endmodule

