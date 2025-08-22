library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_in         : in     vl_logic_vector(3 downto 0);
        op_code         : in     vl_logic_vector(2 downto 0);
        compute_op      : in     vl_logic_vector(1 downto 0);
        result          : out    vl_logic_vector(7 downto 0);
        done            : out    vl_logic;
        negative        : out    vl_logic;
        div_by_zero     : out    vl_logic
    );
end datapath;
