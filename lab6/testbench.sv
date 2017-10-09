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
	
	Continue = 1;
	Run = 1;
	Reset = 1;	
	
	/* Choose Test 1 */
	#2 S = 16'b0000000000000011;
	
	#4 Reset = 0;
	
	#4 Reset = 1;
	/* Choose Test 1 */
	
	#2 Run = 0; 
	
	#40 Run = 1;
	
	/* Choose Test 2 */
	#2 S = 16'b0000000000000110;
	
	#4 Reset = 0;
	
	#4 Reset = 1;
	/* Choose Test 2 */
	
	#2 Run = 0; 
	
	#30 Run = 1;
	
		// Set the switches during the first checkpoint then hit continue
	#12 S = 16'b1000000000000110;
	
	#2 Continue = 0; 
	
	#12 Continue = 1; 
	
	#12 S = 16'b1100000000000110;
	
	#2 Continue = 0; 
	
	#12 Continue = 1; 
	
	#12 S = 16'b1110000000000110;
	
	#2 Continue = 0; 
	
	#12 Continue = 1; 
	
	
		
end
endmodule
