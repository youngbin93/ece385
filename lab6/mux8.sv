module mux8 #(N = 8)
(
	input logic [N - 1:0] A, B, C, D, E, F, G, H,
	output logic [N - 1:0] I,
	output logic [2:0] select
);
always_comb 
begin
	if(select == 3'b000)
	begin 
		I = A;
	end 
	else if(select == 3'b001)
	begin
		I = B;
	end
	else if(select == 3'b010)
	begin
		I = C;
	end
	else if (select == 3'b011)
	begin 
		I = D;
	end 
	else if(select == 3'b100)
	begin
		I = E;
	end
	else if(select == 3'b101)
	begin
		I = F;
	end
	else if (select == 3'b110)
	begin 
		I = G;
	end 
	else 
	begin
		I = H;
	end
end