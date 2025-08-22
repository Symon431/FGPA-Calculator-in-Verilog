library verilog;
use verilog.vl_types.all;
entity display is
    port(
        binary          : in     vl_logic_vector(7 downto 0);
        hundreds        : out    vl_logic_vector(3 downto 0);
        tens            : out    vl_logic_vector(3 downto 0);
        ones            : out    vl_logic_vector(3 downto 0)
    );
end display;
