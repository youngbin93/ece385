module testbench();

timeunit 10ns; 

timeprecision 1ns;

logic [15:0] S;
logic Clk, Reset, Run, Continue;
logic [19:0]  A;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
logic [11:0] LED;

always begin : CLOCK_GENERATION

#1 Clk = ~Clk;

end

initial begin : CLOCK_INITIALIZATION 
	Clk = 0;
end 

test_slc3 tp(.*, .ADDR(A));

initial begin : TEST_VECTORS

	
	#4 Reset = 0;
	
	#4 Reset = 1;
		Run = 0; 
	
	#4 Run = 1;
	
	#4 Continue = 0;
	
	#4 Continue = 1; 
	
	#4 Continue = 0;
			
end
endmodule
