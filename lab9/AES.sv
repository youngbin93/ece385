/************************************************************************
AES Decryption Core Logic

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES 
(
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
logic [4:0] key_wait;
logic [31:0] INV_MIX_COL_MUX_OUT, INV_MIX_COL_OUT;
logic [2:0] col_select, state_select;
logic Done;
enum logic [4:0] {  
						IDLE, 
						KEY_EXPANSION, 
						ADD_ROUND_KEY_0, 
						DECRYPTION_ROUND,
						SHIFT_ROWS,
						ADD_ROUND_KEY,
						MIX_COLS_0,
						MIX_COLS_1,
						MIX_COLS_2,
						MIX_COLS_3,
						SUB_BYTES_0, 
						SUB_BYTES_1,
						FINAL_ROUND, 
						DONE
						}   State, Next_state;   // Internal state logic
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
mux4 #(.N(128)) STATE_MUX
(
	.A(new_state), 
	.B(inv_shift_state), 
	.C(inv_mix_col_state), 
	.D(inv_sub_state),
	.E(state),
	.select(state_select)
);

mux4 #(.N(32)) INV_MIX_COL_MUX
(
	.A(state[31:0]), 
	.B(state[63:32]), 
	.C(state[95:64]), 
	.D(state[127:96]),
	.E(INV_MIX_COL_MUX_OUT),
	.select(col_select)
);

always_ff @(posedge CLK)
begin 
	if(RESET)
	begin
		State <= IDLE;
	end
	else 
	begin 
		State <= Next_state; 
	end
end

always_comb
begin 
	Next_state = State; 
	col_select = 2'b00; 
	state_select = 2'b00; 
	Done = Done;
	round = round;
	key_wait = key_wait;
	
	/*Next state logic */
	unique case(State)
		IDLE: 
		begin
			if(AES_START)
			begin 
				Next_state = KEY_EXPANSION;
			end
		end
		KEY_EXPANSION:
		begin
			if(key_wait == 0)
			begin 
				Next_state = ADD_ROUND_KEY_0;
			end
		end
		
		ADD_ROUND_KEY_0:
		begin
			Next_state = DECRYPTION_ROUND;
		end
				
		DECRYPTION_ROUND:
		begin
			Next_state = SHIFT_ROWS;
			if(round == 10)
			begin
				Next_state = FINAL_ROUND;
			end
		end
		SHIFT_ROWS:
		begin
			Next_state = SUB_BYTES_0;
		end
		
		SUB_BYTES_0:
		begin 
			Next_state = SUB_BYTES_1;
		end 
		
		SUB_BYTES_1:
		begin
			Next_state = 	ADD_ROUND_KEY;
		end
		ADD_ROUND_KEY:
		begin 
			Next_state = MIX_COLS_0;
			if(Done)
			begin
				Next_state = DONE;
			end
		end
		MIX_COLS_0:
		begin 	
			Next_state = MIX_COLS_1;
		end
		MIX_COLS_1:
		begin 	
			Next_state = MIX_COLS_2;
		end
		MIX_COLS_2:
		begin 
			Next_state = MIX_COLS_3;
		end
		MIX_COLS_3:
		begin 
			Next_state = DECRYPTION_ROUND;
		end
		
		FINAL_ROUND:
		begin 
			Next_state = SHIFT_ROWS;
		end
		DONE:
		begin 
			Next_state = IDLE;
		end
		default:;
		
	endcase
	
	/*Current state activity */
	case(State)
		IDLE: 
		begin 
			state = AES_MSG_ENC;
			round = 0;
			key_wait = 4'b1111;  
			Done = 1'b0;
		end
			
		KEY_EXPANSION:
		begin
			key_wait = key_wait - 1; 
		end
			
		ADD_ROUND_KEY_0:
		begin
			state_select = 2'b00; 
		end
			
		DECRYPTION_ROUND:
		begin
			round = round + 1;
		end
		
		SHIFT_ROWS:
		begin 
			state_select = 2'b01;
		end
		SUB_BYTES_0:
		begin 
		end
		SUB_BYTES_1:
		begin 
			state_select = 2'b11;
		end
		ADD_ROUND_KEY:
		begin 
			state_select = 2'b00;
		end
		MIX_COLS_0:
		begin 
			col_select = 2'b00;
			inv_mix_col_state[31:0] = INV_MIX_COL_OUT;
		end
		MIX_COLS_1:
		begin 
			col_select = 2'b01;
			inv_mix_col_state[63:32] = INV_MIX_COL_OUT;
		end
		MIX_COLS_2:
		begin 
			col_select = 2'b10;
			inv_mix_col_state[95:64] = INV_MIX_COL_OUT;
		end
		MIX_COLS_3:
		begin 
			col_select = 2'b11;
			inv_mix_col_state[127:96] = INV_MIX_COL_OUT;
			state_select = 2'b10; 
		end
		FINAL_ROUND:
		begin 
			Done = 1'b1;
		end
		DONE:
		begin 
			AES_DONE = 1'b1;
			AES_MSG_DEC = state;
		end
		default:;
	endcase
end
endmodule
