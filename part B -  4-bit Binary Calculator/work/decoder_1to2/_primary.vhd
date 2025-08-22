library verilog;
use verilog.vl_types.all;
entity decoder_1to2 is
    port(
        write_addr      : in     vl_logic;
        load            : in     vl_logic;
        sel             : out    vl_logic_vector(1 downto 0)
    );
end decoder_1to2;
