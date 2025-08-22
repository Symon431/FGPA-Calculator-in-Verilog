library verilog;
use verilog.vl_types.all;
entity binary_multiplier is
    port(
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        C               : out    vl_logic_vector(3 downto 0)
    );
end binary_multiplier;
