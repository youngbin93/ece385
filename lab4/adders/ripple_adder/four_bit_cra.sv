module four_bit_cra(input logic [3:0] x, y, 
						input logic z,
						output logic [3:0] s, 
						output logic c);
		
		logic c1, c2, c3;
		
		full_adder FA0(.x(x[0]),   .y(y[0]),  .z(z),   .s(s[0]),  .c(c1));
		full_adder FA1(.x(x[1]),   .y(y[1]),  .z(c1),  .s(s[1]),  .c(c2));
		full_adder FA2(.x(x[2]),   .y(y[2]),  .z(c2),  .s(s[2]),  .c(c3));
		full_adder FA3(.x(x[3]),   .y(y[3]),  .z(c3),  .s(s[3]),  .c(c));
endmodule 