module four_bit_cla(input logic [3:0] a, b,
						  input logic c_in,
						  output logic p_out, g_out, c_out,
						  output logic [3:0] s);
						  
		logic [3:0] p, g;
		logic c1, c2, c3;
		
		
		fullpg_adder FA0(.x(a[0]),   .y(b[0]),  .z(c_in),   .s(s[0]),  .p(p[0]), .g(g[0]));
		fullpg_adder FA1(.x(a[1]),   .y(b[1]),  .z(c1),     .s(s[1]),  .p(p[1]), .g(g[1]));
		fullpg_adder FA2(.x(a[2]),   .y(b[2]),  .z(c2),     .s(s[2]),  .p(p[2]), .g(g[2]));
		fullpg_adder FA3(.x(a[3]),   .y(b[3]),  .z(c3),     .s(s[3]),  .p(p[3]), .g(g[3]));
		
		always_comb
		begin 
			c1 = (g[0] | (p[0] & c_in));
			c2 = (g[1] | (p[1] & c1));
			c3 = (g[2] | (p[2] & c2));
			p_out = p[0] & p[1] & p[2] & p[3];
			g_out = g[3] | (g[2] & p[3]) | (g[1] & p[3] & p[2]) | (g[0] & p[3] & p[2] & p[1]);
		end
		
endmodule 