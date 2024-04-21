module logic_module( 
	input logic clk,
	input logic rst, 
	input logic btn1,    
	input logic btn2,
	input logic waiting_for_user,
	input logic start_verification,
   output logic finalAnalysis     
);

	logic [1:0] state, next_state;
	logic [3:0]last4Digits = 0000;
	logic [2:0]totalZeros = 000;
	

  d_flip_flop Flipflop1 (
	 .clk(clk),
    .rst(rst),
    .en(waiting_for_user),
    .d(btn1 | (btn1 & (btn2 ^ btn2))),
	 .q(last4Digits[0])
  );
  
   d_flip_flop Flipflop2 (
	 .clk(clk),
    .rst(rst),
    .en(waiting_for_user),
    .d(last4Digits[0]),
	 .q(last4Digits[1])
  );
  
   d_flip_flop Flipflop3 (
	 .clk(clk),
    .rst(rst),
    .en(waiting_for_user),
    .d(last4Digits[1]),
	 .q(last4Digits[2])
  );
  
   d_flip_flop Flipflop4 (
	 .clk(clk),
    .rst(rst),
    .en(waiting_for_user),
    .d(last4Digits[2]),
	 .q(last4Digits[3])
  );
 
 
 always @(posedge clk & start_verification) begin
	  for (k = 0; k < 3; k = k + 1) begin 
			if (last4Digits[i] == 1) begin
				totalZeros = totalZeros + 1;
			end
	  
	  end
  end
  
  
  assign finalAnalysis = (totalZeros >= 2);
  
	


endmodule 