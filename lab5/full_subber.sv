module full_subber(input x, y, z,
						output s, c);
						
		assign s = x ^ y ^ z;
		assign c =((~x) ^ z)|((~x) & y)|(y & z);
endmodule 