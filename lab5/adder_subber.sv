module adder_subber
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
	 input 	logic 			add_sub,
    output  logic[7:0]    	Sum,
    output  logic          X
);
	  
//		logic c1, c2, addition_CO, subtraction_CO;
//		logic [7:0] addition, subtraction;
//		
//		four_bit_cra FCRA_0    (.x(A[3:0]),   .y(B[3:0]),  .z(0),   .s(addition[3:0]),  .c(c1));
//		four_bit_cra FCRA_1    (.x(A[7:4]),   .y(B[7:4]),  .z(c1),  .s(addition[7:4]),  .c(addition_CO));
//		
//		mux2_1bit mux_CO       (.A(addition_CO), .B(subtraction_CO),   .OUT(X),       .select(add_sub));
//		mux2_8bit mux_Sum      (.A(addition),    .B(subtraction),      .OUT(Sum[7:0]), .select(add_sub));
//		
//		four_bit_crs FCRS_0    (.x(A[3:0]),   .y(B[3:0]),  .z(0),   .s(subtraction[3:0]),  .c(c2));
//		four_bit_crs FCRS_1    (.x(A[7:4]),   .y(B[7:4]),  .z(c2),  .s(subtraction[7:4]),  .c(subtraction_CO));
		
		
		logic c0, c1, c2, c3, c4, c5, c6, c7; //internal carries in the 4-bit adder
		logic [7:0] BB; //internal B or NOT(B)
		logic A9, BB9; //internal sign extension bits
		
		assign BB = (B ^ {8{add_sub}}); // when add_sub=1, complement B
		
		// copied from sign-bits
		full_adder FA0(.x(A[0]), .y(BB[0]), .z(add_sub), .s(Sum[0]), .c(c0));
		full_adder FA1(.x(A[1]), .y(BB[1]), .z(c0), .s(Sum[1]), .c(c1));
		full_adder FA2(.x(A[2]), .y(BB[2]), .z(c1), .s(Sum[2]), .c(c2));
		full_adder FA3(.x(A[3]), .y(BB[3]), .z(c2), .s(Sum[3]), .c(c3));
		full_adder FA4(.x(A[4]), .y(BB[4]), .z(c3), .s(Sum[4]), .c(c4));
		full_adder FA5(.x(A[5]), .y(BB[5]), .z(c4), .s(Sum[5]), .c(c5));
		full_adder FA6(.x(A[6]), .y(BB[6]), .z(c5), .s(Sum[6]), .c(c6));
		full_adder FA7(.x(A[7]), .y(BB[7]), .z(c6), .s(Sum[7]), .c(c7));
		full_adder FA8(.x(A[7]), .y(BB[7]), .z(c7), .s (X), .c()); 
		
endmodule
