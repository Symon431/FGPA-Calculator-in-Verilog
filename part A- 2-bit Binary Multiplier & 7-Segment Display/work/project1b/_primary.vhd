library verilog;
use verilog.vl_types.all;
entity project1b is
    port(
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        seg             : out    vl_logic_vector(6 downto 0)
    );
end project1b;
