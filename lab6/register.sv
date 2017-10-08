module register #(parameter size = 16)
(
	input logic Clk, Load, Reset,
	input logic [size - 1:0] in,
	output logic [size - 1:0] out
);

logic [size - 1:0] data; 

/* Registers start with zero in them */
initial 
begin 
	data = 1'b0;
end 

always_ff @(posedge Clk)
begin
	if(Load)
	begin
		data = in;
	end
	
	else if(Reset)
	begin 
		data = {size{1'b0}};
	end
end

assign out = data;

endmodule
