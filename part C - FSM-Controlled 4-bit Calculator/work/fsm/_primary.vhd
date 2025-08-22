library verilog;
use verilog.vl_types.all;
entity fsm is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        \START\         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        GET_A           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        DISP_A          : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        GET_B           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        DISP_B          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        COMPUTE         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        RESULT          : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        enter           : in     vl_logic;
        state           : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of \START\ : constant is 1;
    attribute mti_svvh_generic_type of GET_A : constant is 1;
    attribute mti_svvh_generic_type of DISP_A : constant is 1;
    attribute mti_svvh_generic_type of GET_B : constant is 1;
    attribute mti_svvh_generic_type of DISP_B : constant is 1;
    attribute mti_svvh_generic_type of COMPUTE : constant is 1;
    attribute mti_svvh_generic_type of RESULT : constant is 1;
end fsm;
