library verilog;
use verilog.vl_types.all;
entity calculator is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        enter           : in     vl_logic;
        data_in         : in     vl_logic_vector(3 downto 0);
        op_code         : in     vl_logic_vector(2 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(2 downto 0);
        done            : out    vl_logic;
        negative        : out    vl_logic;
        div_by_zero     : out    vl_logic
    );
end calculator;
