/************************************************************************
AES Decryption Core Logic

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES (
	input	 logic CLK,
	input  logic RESET,
	input  logic AES_START,
	output logic AES_DONE,
	input  logic [127:0] AES_KEY,
	input  logic [127:0] AES_MSG_ENC,
	output logic [127:0] AES_MSG_DEC
);

/* Internals */
logic [1407:0] KeySchedule;
logic [127:0] state;
logic [127:0] new_state, inv_shift_state, inv_mix_col_state, inv_sub_state;
logic [3:0] round;
logic [31:0] INV_MIX_COL_MUX_OUT, INV_MIX_COL_OUT;
logic [2:0] col_select, state_select;

initial
begin
    state = AES_MSG_ENC;
	 round = 0;
end

/* Key Pieces of Decryption Algorithm */
KeyExpansion 	KeyExpansion 	(.clk(CLK), .Cipherkey(AES_KEY), .KeySchedule(KeySchedule));
AddRoundKey 	AddRoundKey 	(.state(state), .round(round) , .KeySchedule(KeySchedule), .new_state(new_state));
InvShiftRows 	InvShiftRows	(.data_in(state), .data_out(inv_shift_state));
InvMixColumns  InvMixColumns	(.state(INV_MIX_COL_MUX_OUT), .out(INV_MIX_COL_OUT));
InvSub			InvSub			(.in(state), .out(inv_sub_state));

/* MUXes*/
mux4 #(N(128)) STATE_MUX
(
	.A(new_state), 
	.B(inv_shift_state), 
	.C(inv_mix_col_state), 
	.D(inv_sub_state),
	.E(state),
	.select(state_select)
);

mux4 #(N(32)) INV_MIX_COL_MUX
(
	.A(state[31:0]), 
	.B(state[63:32]), 
	.C(state[95:64]), 
	.D(state[127:96]),
	.E(INV_MIX_COL_MUX_OUT),
	.select(col_select)
);



endmodule
