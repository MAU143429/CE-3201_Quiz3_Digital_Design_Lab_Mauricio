module FSM (
    input logic clk, rst, next, finalAnalysis,
    output logic waiting_for_user, start_verification, done
);

   
    logic [1:0] state, next_state;

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
            0: if (next) next_state = 1; else next_state = 0;
            1: if (finalAnalysis) next_state = 2; else  next_state = 1;
            2: next_state = 2;
            default: next_state = 0;
        endcase
    end
	 
   
    assign waiting_for_user = (state == 0);
    assign start_verification = (state == 1);
    assign done = (state == 2);

endmodule
