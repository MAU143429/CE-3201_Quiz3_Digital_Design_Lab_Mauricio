module logic_module_tb ();

	logic clk = 0;
	logic rst = 0;
	logic btn1 = 0;
	logic btn2 = 0;
	logic btn3 = 0;
	logic finalAnalysis = 0;
	logic waiting_for_user = 0;
	logic start_verification = 0;
	logic led = 0;


	logic [3:0] last4Digits = 0000;

	
	
	
		FSM ME(				.clk(clk),
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
	
	always begin
		#5 clk=~clk;
	end
	
	initial begin
		rst = 1;
		#100;
		rst = 0;
		//SETTING BOAT NUMBER
		#100;
		//Ingresando un 1
		btn1 = 1;
		#10;
		btn1 = 0;
		#100;
		//Ingresando un 1
		btn1 = 1;
		#10;
		btn1 = 0;
		//Ingresando un 0
		btn2 = 1;
		#10;
		btn2 = 0;
		#100;
		//Ingresando un 0
		btn2 = 1;
		#10;
		btn2 = 0;
		#100;
		//Ingresando un 0
		btn2 = 1;
		#10;
		btn2 = 0;
		#100;
		//Ingresando un 1
		btn1 = 1;
		#10;
		btn1 = 0;
		#100;
		//Ingresando un 1
		btn1 = 1;
		#10;
		btn1 = 0;
		//Ingresando un 0
		btn2 = 1;
		#10;
		btn2 = 0;
		#100;
		//Ingresando un 0
		btn2 = 1;
		#10;
		btn2 = 0;
		//Mandar a revisar 
		btn3 = 1;
		#10;
		btn3 = 0;
		
		#100;
		#1000;
		
		
		$stop;

		
	end

	
endmodule