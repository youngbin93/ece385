module counter
(  
		input logic Clk,  
		input logic Reset,   
		input logic Run, 
		output reg  [4:0] out
);

logic count;

always_ff @(posedge Clk)
begin
	  
	  if(Run == 1)
	  begin
			count <= 1'b1;
	  end
	  else if (Reset | out == 17)
     begin
		 out <= 5'b00000;
		 count <= 1'b0;
	  end
	  if (count == 1'b1) 
	  begin
		 out ++;
	  end
end
	  
endmodule