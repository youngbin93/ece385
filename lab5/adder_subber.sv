module adder_subber
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
	 input 	logic 			add_sub,
    output  logic[7:0]    	Sum,
    output  logic          X
);
	  
		logic c1, c2, addition_CO, subtraction_CO;
		logic [7:0] addition, subtraction;
		
		four_bit_cra FCRA_0    (.x(A[3:0]),   .y(B[3:0]),  .z(0),   .s(addition[3:0]),  .c(c1));
		four_bit_cra FCRA_1    (.x(A[7:4]),   .y(B[7:4]),  .z(c1),  .s(addition[7:4]),  .c(addition_CO));
		
		mux2_1bit mux_CO       (.A(addition_CO), .B(subtraction_CO),   .OUT(X),       .select(add_sub));
		mux2_8bit mux_Sum      (.A(addition),    .B(subtraction),      .OUT(Sum[7:0]), .select(add_sub));
		
		four_bit_crs FCRS_0    (.x(A[3:0]),   .y(B[3:0]),  .z(0),   .s(subtraction[3:0]),  .c(c2));
		four_bit_crs FCRS_1    (.x(A[7:4]),   .y(B[7:4]),  .z(c2),  .s(subtraction[7:4]),  .c(subtraction_CO));
endmodule
