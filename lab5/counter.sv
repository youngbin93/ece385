module counter
(  
		input logic Clk,  
		input logic Reset,   
		input logic Run, 
		output logic Clear_A,
		output reg  [4:0] out
		
);

logic count;

always_ff @(posedge Clk)
begin
	  Clear_A <= 1'b0;
	  
	  if (Reset | out == 17)
     begin
		 out <= 5'b00000;
		 count <= 1'b0;
		 Clear_A <= 1'b1;
	  end
	  else if (count == 1'b1) 
	  begin
		 out ++;
	  end
	  else if(Run == 1)
	  begin
			count <= 1'b1;
	  end
end
	  
endmodule