module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a carry select.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	 
		logic c1A, c2A, c3A, c1B, c2B, c3B;
		logic select1, select2, select3;
		logic [3:0] mux1A, mux1B, mux2A, mux2B, mux3A, mux3B ;
		
		four_bit_cra CRA0(.x(A[3:0]),   .y(B[3:0]),   .s(Sum[3:0]),  .z(0),  .c(select1));
		
		four_bit_cra CRA_1A(.x(A[7:4]),   .y(B[7:4]),   .s(mux1A),  .z(0), .c(c1A));
		four_bit_cra CRA_1B(.x(A[7:4]),   .y(B[7:4]),   .s(mux1B),  .z(1), .c(c1B));
		
		mux2 mux_1(.A(mux1A), .B(mux1B), .select(select1), .OUT(Sum[7:4]));
		
		four_bit_cra CRA_2A(.x(A[11:8]),  .y(B[11:8]),  .s(mux2A), .z(c2), .c(c2A));
		four_bit_cra CRA_2B(.x(A[11:8]),  .y(B[11:8]),  .s(mux2B), .z(c2), .c(c2B));
		
		mux2 mux_2(.A(mux2A), .B(mux2B), .select(select2), .OUT(Sum[11:8]));
		
		four_bit_cra CRA_3A(.x(A[15:12]), .y(B[15:12]), .s(mux3A),.z(c3), .c(c3A));
		four_bit_cra CRA_3B(.x(A[15:12]), .y(B[15:12]), .s(mux3B),.z(c3), .c(c3B));
		
		mux2 mux_3(.A(mux3A), .B(mux3B), .select(select3), .OUT(Sum[15:12]));
		
		always_comb
		begin
			select2 = (select1 & c1B) | c1A ; 
			select3 = (select2 & c2B) | c2A ;
			CO = (select3 & c3B) | c3A ;
		end     
endmodule
