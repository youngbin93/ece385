module mux2_1bit
(
    input   logic     A,
    input   logic     B,
    output  logic     OUT,
    input   logic     select
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