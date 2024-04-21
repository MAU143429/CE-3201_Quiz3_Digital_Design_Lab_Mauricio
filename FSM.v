module FSM (
    input logic clk, rst, next, finalAnalysis,
    output wire waiting_for_user, start_verification, done
);

    // Declaration of internal signals with logic data type
    logic [1:0] state, next_state;

     always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            prev_next <= 0;
        end else begin
            prev_next <= next;
        end
    end

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= 0;
        end else begin
            state <= next_state;
        end
    end

	  
	  always_comb begin
        next_state = state;
        case (state)
            0: if (next) next_state = 2; else next_state = 0;
            1: if (finalAnalysis) next_state = 2; else  next_state = 1;
            2: next_state = 4;
             default: next_state = 0;
        endcase
    end
	 
    // Continuous assignments for outputs
    assign waiting_for_user = (state == 2'b00);
    assign start_verification = (state == 2'b01);
    assign done = (state == 2'b10);

endmodule





/**
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            prev_next <= 1'b0;
        end else begin
            prev_next <= next;
        end
    end

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state <= 2'b00;
        end else begin
            state <= next_state;
        end
    end*/