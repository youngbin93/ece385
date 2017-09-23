module mux2_8bit
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
    output  logic[7:0]     OUT,
    input   logic          select
);


		always_comb
		begin
			if(select == 1'b1)
				begin
					OUT = B;
				end 
			else
				begin 
					OUT = A;
				end
		end 

endmodule