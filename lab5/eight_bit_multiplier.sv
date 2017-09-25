/*  Date Created: Mon Jan 25 2015.
 *  Written to correspond with the spring 2016 lab manual.
 *
 *  ECE 385 Lab 4 (adders) template code.  This is the top level entity which
 *  connects an adder circuit to LEDs and buttons on the device.  It also
 *  declares some registers on the inputs and outputs of the adder to help
 *  generate timing information (fmax) and multiplex the DE115's 16 switches
 *  onto the adder's 32 inputs.
 *
 *	 Make sure you instantiate only one of the modules for each demo! 
 *  See section called module instatiation below.
 

/* Module declaration.  Everything within the parentheses()
 * is a port between this module and the outside world */
 
module eight_bit_multiplier
(
    input   logic           Clk,        		// 50MHz clock is only used to get timing estimate data
    input   logic           Reset,      		// From push-button 0.  Remember the button is active low (0 when pressed)
    input   logic           ClearA_LoadB,    // From push-button 1
    input   logic           Run,        		// From push-button 2.
    input   logic[7:0]      SW,         		// From slider switches
    
    // all outputs are registered
    output  logic           X,          // Carry-out.  Goes to the green LED to the left of the hex displays.
    output  logic[6:0]      AhexL,      // Hex drivers display both inputs to the adder.
    output  logic[6:0]      AhexU,
    output  logic[6:0]      BhexL,
    output  logic[6:0]      BhexU
);

    /* Declare Internal Registers */
    logic[7:0]     A, B, Adder_Out,switch_mux_out;  // use this as an input to your adder
	 logic reg_X_out, A_0, Adder_X_Out;
    
    /* Declare Internal Wires
     * Wheather an internal logic signal becomes a register or wire depends
     * on if it is written inside an always_ff or always_comb block respectivly */
    logic[6:0]      AhexL_comb;
    logic[6:0]      AhexU_comb;
    logic[6:0]      BhexL_comb;
    logic[6:0]      BhexU_comb;
	 logic Add_Sub, Shift, M, Add_Mux, Load_A;
    
    /* Decoders for HEX drivers and output registers
     * Note that the hex drivers are calculated one cycle after Sum so
     * that they have minimal interfere with timing (fmax) analysis.
     * The human eye can't see this one-cycle latency so it's OK. */
    always_ff @(posedge Clk) begin
        
        AhexL <= AhexL_comb;
        AhexU <= AhexU_comb;
        BhexL <= BhexL_comb;
        BhexU <= BhexU_comb;
    end 
	 
	 /* Adder/Subtractor */
	 adder_subber nine_bit_adder
	 (
		  .A(A),
		  .B(switch_mux_out),
		  .add_sub(Add_Sub),
		  .Sum(Adder_Out),
		  .X(Adder_X_Out)
	 );
	 
	 /* Adds zero or switches */
	 mux2_8bit switch_mux
	 (
		.A(SW),
		.B(8'b00000000),
		.select(Add_Mux),
		.OUT(switch_mux_out)
	 );
	 
	 /* Control module */
	 control control
	 (
		.Clk(Clk),
		.Reset(~Reset),
		.Run(~Run),
		.M(M),
		.Shift(Shift),
		.Add_Sub(Add_Sub),
		.Load_A(Load_A),
		.Add_Mux(Add_Mux)
	 );
	 
	 /* Registers X, A and B */
	 reg_1 reg_X
	 (
		.Clk(Clk),
		.Reset(~Reset | ~ClearA_LoadB),
		.Shift_In(1'b0), 
		.Load(Load_A),
		.Shift_En(1'b0), 
		.D(Adder_X_Out), 
		.Data_Out(reg_X_out),
		.Shift_Out(X)
	 );
	  
	 reg_8 reg_A
	 (
		.Clk(Clk),
		.Reset(~Reset | ~ClearA_LoadB),
		.Shift_In(reg_X_out), 
		.Load(Load_A),
		.Shift_En(Shift), 
		.D(Adder_Out), 
		.Shift_Out(A_0),
		.Data_Out(A)
	 );
	 
	 reg_8 reg_B
	 (
		.Clk(Clk),
		.Reset(~Reset),
		.Shift_In(A_0), 
		.Load(~ClearA_LoadB),
		.Shift_En(Shift), 
		.D(SW), 
		.Shift_Out(M),
		.Data_Out(B)
	 );
	 
	 //add the control module here 
		
    HexDriver AhexL_inst
    (
        .In0(A[3:0]),   
        .Out0(AhexL_comb)
    );
    
    HexDriver AhexU_inst
    (
        .In0(A[7:4]),
        .Out0(AhexU_comb)
    );
    
    
    HexDriver BhexL_inst
    (
        .In0(B[3:0]),
        .Out0(BhexL_comb)
    );
    
    HexDriver BhexU_inst
    (
        .In0(B[7:4]),
        .Out0(BhexU_comb)
    );
    
endmodule
