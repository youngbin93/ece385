module carry_lookahead_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	
	
		logic c1, c2, c3;
		logic [3:0] p, g;
		
		four_bit_cla CLA0(.a(A[3:0]),   .b(B[3:0]),   .s(Sum[3:0]),  .c_in(0),  .c_out(),  .p_out(p[0]),  .g_out(g[0]));
		four_bit_cla CLA1(.a(A[7:4]),   .b(B[7:4]),   .s(Sum[7:4]),  .c_in(c1), .c_out(),  .p_out(p[1]),  .g_out(g[1]));
		four_bit_cla CLA2(.a(A[11:8]),  .b(B[11:8]),  .s(Sum[11:8]), .c_in(c2), .c_out(),  .p_out(p[2]),  .g_out(g[2]));
		four_bit_cla CLA3(.a(A[15:12]), .b(B[15:12]), .s(Sum[15:12]),.c_in(c3), .c_out(CO),  .p_out(p[3]),  .g_out(g[3]));
		
		always_comb
		begin 
			c1 = (g[0] | (p[0] & 0));
			c2 = (g[1] | (p[1] & c1));
			c3 = (g[2] | (p[2] & c2));
			CO = (g[3] | (p[3] & c3));
		end
	
endmodule
