//Two-always example for state machine

module control (input  logic Clk, Reset, ClearA_LoadB, Run, M,
                output logic Shift, Load_B, Clear_A, Add_Sub, Load_A, Add_Mux);

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., J as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    

	logic [4:0] count;
	logic Clear_A_counter;
    
    // Assign outputs based on state
	always_comb
    begin
		Shift = 1'b0;
		Load_A = 1'b0;
		Add_Sub = 1'b0;
		Add_Mux = 1'b0;
		
		/* when we are on the eigth bit check for whether we need to add or subtract*/
		if(count == 15)
		begin 
			Load_A = 1'b1;
			if(M  == 1'b1)
			begin
				Add_Sub = 1'b1;
			end
			else 
			begin
				Add_Mux = 1'b1;
			end
		end
		
		/* for all other states where we add */
		else if(count[0] == 1'b1)
		begin	
			Load_A = 1'b1;
			if(M  == 1'b0)
			begin
				Add_Mux = 1'b1;
			end
		end
		/* if the count does not equal zero and the count is even then we need to shift */
		else if(count != 0)
		begin 
			Shift = 1'b1;
		end
    end
assign Clear_A = Clear_A_counter | ClearA_LoadB; 
assign Load_B = ClearA_LoadB;
counter counter
(
	.Clk(Clk),
	.Reset(Reset),
	.Run(Run),
	.out(count),
	.Clear_A(Clear_A_counter)
);
endmodule
