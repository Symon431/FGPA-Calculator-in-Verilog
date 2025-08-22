library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        load            : in     vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end decoder;
