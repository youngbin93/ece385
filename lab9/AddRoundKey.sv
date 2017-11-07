module AddRoundKey 
(
	input  logic [127:0] state,
	input  logic [3:0] round,
	input logic  [1407:0] KeySchedule, 
	output logic [127:0] new_state
);
logic [127:0] RoundKey;

always_comb
begin 
	unique case(round)
		4'b0000:
			RoundKey = KeySchedule[127 : 0*128];
		4'b0001:
			RoundKey = KeySchedule[255 : 1*128];
		4'b0010:
			RoundKey = KeySchedule[383 : 2*128];
		4'b0011:
			RoundKey = KeySchedule[511 : 3*128];
		4'b0100:
			RoundKey = KeySchedule[639 : 4*128];
		4'b0101:
			RoundKey = KeySchedule[767 : 5*128];
		4'b0110:
			RoundKey = KeySchedule[895 : 6*128];
		4'b0111:
			RoundKey = KeySchedule[1023 : 7*128];
		4'b1000:
			RoundKey = KeySchedule[1151 : 8*128];
		4'b1001:
			RoundKey = KeySchedule[1279 : 9*128];
		4'b1010:
			RoundKey = KeySchedule[1407 : 10*128];
		default:
			RoundKey = state;
	endcase
end

assign new_state = state ^ RoundKey;

endmodule