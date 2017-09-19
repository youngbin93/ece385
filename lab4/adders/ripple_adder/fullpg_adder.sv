module fullpg_adder(input x, y, z,
						output s, p, g);
						
		assign s = x^y^z;
		assign p = x^y;
		assign g = x&y;
endmodule 