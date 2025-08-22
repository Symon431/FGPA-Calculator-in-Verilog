module fsm (
    input clk,
    input reset,
    input start,
    input enter,

    output reg [2:0] op_code,      // Controls datapath (LOAD_A, COMPUTE, etc.)
    output reg wrt_addr,           // Selects register A or B
    output reg [1:0] compute_op,   // Operation selection (passed from top level)
    output reg [2:0] state         // Current FSM state (for HEX3 display)
);

    // FSM State Encoding
    localparam IDLE     = 3'b000,
               START    = 3'b001,
               GET_A    = 3'b010,
               DISP_A   = 3'b011,
               GET_B    = 3'b100,
               DISP_B   = 3'b101,
               COMPUTE  = 3'b110,
               RESULT   = 3'b111;

    reg [2:0] next_state;

    // Sequential logic: state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Combinational logic: next state + control outputs
    always @(*) begin
        // Default values
        op_code = 3'b000;       // NOOP
        wrt_addr = 0;
        compute_op = 2'b00;
        next_state = state;

        case (state)
            IDLE: begin
                if (start)
                    next_state = START;
            end

            START: begin
                op_code = 3'b111;       // RESET (optional)
                next_state = GET_A;
            end

            GET_A: begin
                wrt_addr = 0;           // Select reg_A
                if (enter)
                    next_state = DISP_A;
            end

            DISP_A: begin
                op_code = 3'b010;       // DISPLAY_A
                if (!enter)
                    next_state = GET_B;
            end

            GET_B: begin
                wrt_addr = 1;           // Select reg_B
                if (enter)
                    next_state = DISP_B;
            end

            DISP_B: begin
                op_code = 3'b100;       // DISPLAY_B
                if (!enter)
                    next_state = COMPUTE;
            end

            COMPUTE: begin
                op_code = 3'b101;       // COMPUTE
                // `compute_op` will be driven by top-level and passed through in datapath
                next_state = (enter) ? RESULT : COMPUTE;
            end

            RESULT: begin
                op_code = 3'b110;       // DISPLAY_RESULT
                next_state = IDLE;
            end
        endcase
    end

endmodule
