module mux2 #(parameter N = 8)
(
	input logic [N - 1:0] A, B,
	output logic [N - 1:0] C,
	output logic select
);

always_comb 
begin
	if(select == 1'b0)
	begin 
		C = A;
	end 
	else
	begin
		C = B;
	end
end
endmodule