module tb_mux2to1_1bit;

    reg in0, in1;
    reg sel;
    wire out;

    mux2to1_1bit DUT (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("sel | in0 | in1 | out");
        $display("----------------------");

        in0 = 0; in1 = 1;

        sel = 0; #10;
        $display(" %b  |  %b  |  %b  |  %b", sel, in0, in1, out);

        sel = 1; #10;
        $display(" %b  |  %b  |  %b  |  %b", sel, in0, in1, out);

        in0 = 1; in1 = 0;

        sel = 0; #10;
        $display(" %b  |  %b  |  %b  |  %b", sel, in0, in1, out);

        sel = 1; #10;
        $display(" %b  |  %b  |  %b  |  %b", sel, in0, in1, out);

        $finish;
    end

endmodule

