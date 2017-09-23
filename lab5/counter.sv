module counter(
			input logic  down_up,  
			input logic clk,  
			input logic reset,   
			output reg  [3:0] out, 

		);
  

	always_ff @(posedge clk)
	begin
		  if (reset)  
			 out <= 4'b0;
		  else 
			 out ++;

	end
		  
  endmodule