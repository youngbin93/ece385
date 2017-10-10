module ALU
(		
	input logic [1:0] ALUK,
	input logic [15:0] A, B,
	output logic [15:0] ALU_OUT
);

// ALU does four operations : ADD, AND, NOT and PassB
always_comb
begin
	if(ALUK == 2'b00)
	begin 
		ALU_OUT = A + B;
	end 
	else if(ALUK == 2'b01)
	begin 
		ALU_OUT = A & B;
	end
	else if(ALUK == 2'b10)
	begin 
		ALU_OUT = ~A;
	end
	else
	begin 
		ALU_OUT = A;
	end
end 
endmodule

