module testbench();

timeunit 10ns; 

timeprecision 1ns;


logic           Clk;        		// 50MHz clock is only used to get timing estimate data
logic           Reset;      		// From push-button 0.  Remember the button is active low (0 when pressed)
logic           ClearA_LoadB;    // From push-button 1
logic           Run;        		// From push-button 2.
logic[7:0]      SW;         		// From slider switches
	 
	 
logic           X;          // Carry-out.  Goes to the green LED to the left of the hex displays.
logic[6:0]      AhexL;      // Hex drivers display both inputs to the adder.
logic[6:0]      AhexU;
logic[6:0]      BhexL;
logic[6:0]      BhexU;

always begin : CLOCK_GENERATION

#1 Clk = ~Clk;

end

initial begin : CLOCK_INITIALIZATION 

	Clk = 0;

end 

eight_bit_multiplier tp(.*);

initial begin : TEST_VECTORS

		/* Load B with FF */
	#2 SW = 8'b11111111;
		Reset = 0;
		Run = 1 ;
		ClearA_LoadB = 1;
		
		/* blank */
	#2 SW = 8'b11111111;
		Reset = 1;
		Run = 1 ;
		ClearA_LoadB = 1;
		
		/* Load B with FF */
	#2 SW = 8'b11111111;
		Reset = 1;
		Run = 1 ;
		ClearA_LoadB = 0;
		
		/* Blank */
	#2 SW = 8'b11111111;
		Reset = 1;
		ClearA_LoadB = 1;
		Run = 1;
		
		/* B is FF and multiply by FF */
	#2 SW = 8'b11111111;
		Reset = 1;
		ClearA_LoadB = 1;
		Run = 0;
		
		/* Release Run */
	#2 Run = 1;
	
end

endmodule
