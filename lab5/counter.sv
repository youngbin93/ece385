module counter
(  
		input logic Clk,  
		input logic Reset,   
		output reg  [3:0] out
);
  
always_ff @(posedge Clk)
begin
	  if (Reset)  
		 out <= 4'b0;
	  else 
		 out ++;
end
	  
endmodule