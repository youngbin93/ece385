module ripple_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  // Internal carries the 2-bit adder
		wire c1, c2, c3;
		
		four_bit_cra CR0(.x(A[3:0]),   .y(B[3:0]),  .z(0),   .s(Sum[3:0]),  .c(c1));
		four_bit_cra CR1(.x(A[7:4]),   .y(B[7:4]),  .z(c1),  .s(Sum[7:4]),  .c(c2));
		four_bit_cra CR2(.x(A[11:8]),   .y(B[11:8]),  .z(c2),  .s(Sum[11:8]),  .c(c3));
		four_bit_cra CR3(.x(A[15:12]),   .y(B[15:12]),  .z(c3),  .s(Sum[15:12]),  .c(CO));

endmodule
