module logic_module( 
	input logic clk,
	input logic rst, 
	input logic btn1,    
	input logic btn2,
	input logic waiting_for_user,
	input logic start_verification,
   output logic finalAnalysis,
	output logic [3:0] last4Digits	
);

	logic [2:0]totalZeros = 000;
	logic waiting_for_use;
	logic dig0,dig1,dig2,dig3;
	logic internalClk;
	logic btnvalue;
	
	
	initial begin
	last4Digits = 0000;
	waiting_for_use = 1;
	dig1 = 1;
	
	end
	

  d_flip_flop Flipflop1 (
	 .clk(internalClk),
    .rst(rst),
    .en(waiting_for_user),
    .d(btnvalue),
	 .q(last4Digits[0])
  );
  
   d_flip_flop Flipflop2 (
	 .clk(internalClk),
    .rst(rst),
    .en(waiting_for_user),
    .d(last4Digits[0]),
	 .q(last4Digits[1])
  );
  
   d_flip_flop Flipflop3 (
	 .clk(internalClk),
    .rst(rst),
    .en(waiting_for_user),
    .d(last4Digits[1]),
	 .q(last4Digits[2])
  );
  
   d_flip_flop Flipflop4 (
	 .clk(internalClk),
    .rst(rst),
    .en(waiting_for_user),
    .d(last4Digits[2]),
	 .q(last4Digits[3])
  );
  
 
always_ff @(posedge clk or posedge start_verification) begin

    if (start_verification) begin
        totalZeros = 0;
        for (int k = 0; k < 3; k = k + 1) begin 
            if (last4Digits[k] == 1) begin
                totalZeros = totalZeros + 1;
            end
        end
    end
end
  
  
  assign finalAnalysis = (totalZeros >= 2);
  assign internalClk = (btn1 | btn2);
  assign btnvalue = (btn1 | (btn1 & (btn2 ^ btn2)));

	


endmodule 