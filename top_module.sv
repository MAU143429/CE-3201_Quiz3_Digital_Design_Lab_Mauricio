module top_module(
	 input logic clk,
	 input logic rst, 
    input logic btn1,    
    input logic btn2,
	 input logic btn3,	 
    output logic led,
	 output logic [3:0]last4Digits
	
);

	
	// Inputs FSM
	logic finalAnalysis = 0;
	logic waiting_for_user = 0;
	logic start_verification = 0;	
	logic done = 0;	
	
	
	initial begin 
		last4Digits = 0000;
		led = 0;
	end


	
	
	
	FSM ME(					.clk(clk),
								.rst(rst),
								.next(btn3),
								.finalAnalysis(finalAnalysis),
								.waiting_for_user(waiting_for_user),
								.start_verification(start_verification),
								.done(led)
		
							);
   
	logic_module 	LM(   
								.clk(clk),
								.rst(rst),
								.btn1(btn1),
								.btn2(btn2),
								.waiting_for_user(waiting_for_user),
								.start_verification(start_verification),
								.last4Digits(last4Digits),
								.finalAnalysis(finalAnalysis)
											
							);


endmodule