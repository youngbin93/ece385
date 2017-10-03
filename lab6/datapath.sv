module datapath
(
	input logic [15:0] S,
	input logic Clk, Reset, Run, Continue,
	inout wire [15:0] Data //tristate buffers need to be of type wire
);

endmodule