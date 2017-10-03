module mux4 #(parameter N = 8)
(
	input logic [N - 1:0] A, B, C, D,
	output logic [N - 1:0] E,
	input logic [1:0] select
);

always_comb 
begin
	if(select == 2'b00)
	begin 
		E = A;
	end 
	else if(select == 2'b01)
	begin
		E = B;
	end
	else if(select == 2'b10)
	begin
		E = C;
	end
	else
	begin
		E = D;
	end 
end
endmodule