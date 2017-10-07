module SEXT #(parameter N = 8)
(
	input logic [N-1:0] A,
	output logic [15:0] B
);
assign B = $signed(A);
endmodule