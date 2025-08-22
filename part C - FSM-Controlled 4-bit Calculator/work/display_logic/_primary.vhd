library verilog;
use verilog.vl_types.all;
entity display_logic is
    port(
        binary_in       : in     vl_logic_vector(7 downto 0);
        seg_hundreds    : out    vl_logic_vector(6 downto 0);
        seg_tens        : out    vl_logic_vector(6 downto 0);
        seg_ones        : out    vl_logic_vector(6 downto 0)
    );
end display_logic;
