module d_flip_flop (
    input logic clk,    
    input logic rst,  
	 input logic en,
    input logic d,      
    output logic q      
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
           q <= 1'b0;   
        end else if (en) begin
			  q <= d;
		end     
    end

endmodule