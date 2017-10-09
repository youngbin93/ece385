module test_slc3
(
	input logic [15:0] S,
	input logic Clk, Reset, Run, Continue,
	output logic [11:0] LED,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
	output logic [19:0] ADDR
); 

wire [15:0] Data;
logic [19:0]  A; 
logic CE, UB, LB, OE, WE;
assign ADDR = A; 

slc3 LC3(.*, .ADDR(A));
test_memory tm(.*, .I_O(Data));

endmodule