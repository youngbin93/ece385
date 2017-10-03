module bus_mux #(parameter N = 8)
(
	input logic [N - 1:0] A, B, C, D,
	output logic [N - 1:0] E,
	input logic [3:0] select
);

always_comb 
begin
	if(select[0])
	begin 
		E = A;
	end 
	else if(select[1])
	begin
		E = B;
	end
	else if(select[2])
	begin
		E = C;
	end
	else if(select[3])
	begin
		E = D;
	end 
	else
	begin
		E = {N{1'bx}};
	end 
end
endmodule