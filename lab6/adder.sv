module adder
(
	input logic [15:0] A, B, 
	output logic [15:0] C
);

assign C = A + B;

endmodule