library verilog;
use verilog.vl_types.all;
entity seg_decoder is
    port(
        num             : in     vl_logic_vector(3 downto 0);
        seg             : out    vl_logic_vector(6 downto 0)
    );
end seg_decoder;
