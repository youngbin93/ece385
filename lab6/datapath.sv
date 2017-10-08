module datapath
(
	input logic 			Clk, Reset,
	input logic  [15:0] 	S,
	input logic 			LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED, 
	input logic 			GatePC, GateMDR, GateALU, GateMARMUX,
	input logic  [1:0]  	PCMUX,
	input logic  			DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
	input logic  [1:0]  	ADDR2MUX, ALUK,
	input logic 			MIO_EN, 
	output logic BEN,
	input logic  [15:0]  MDR_In,
	output logic [15:0] 	MAR, IR, PC, MDR,
	output logic [11:0]  LED
);

logic [15:0] REG_MDR_OUT, REG_MAR_OUT, REG_IR_OUT, REG_PC_OUT, INC_PC, SR1_OUT, SR2_OUT, SR2_MUX_OUT, ALU_OUT, SEXT5_OUT, SEXT6_OUT, SEXT9_OUT, SEXT11_OUT, ADDR2_MUX_OUT, ADDR1_MUX_OUT, ADDER_OUT;
logic [15:0] MDR_MUX_OUT, PC_MUX_OUT;
wire  [15:0] BUS; 
logic [2:0] SR2, DR_MUX_OUT, SR1_MUX_OUT;
logic br_enable, REG_BEN_OUT;
logic [11:0] REG_LED_OUT;

// n, z, p assignments 
logic n, z, p;
always_comb
begin 
	n = 1'b0;
	z = 1'b0;
	p = 1'b0;
	
	if(BUS[15] == 1'b1)
	begin
		n = 1'b1;
	end 
	else if(BUS == 16'b000000000000)
	begin 
		z = 1'b1;
	end 
	else 
	begin 
		p = 1'b1;
	end
end 

/* Combinational assigments for registers */
assign MDR = REG_MDR_OUT;
assign MAR = REG_MAR_OUT;
assign IR = REG_IR_OUT;
assign PC = REG_PC_OUT;
assign INC_PC = REG_PC_OUT + 16'b000000000001;
assign SR2 = REG_IR_OUT[2:0];
assign BEN  = REG_BEN_OUT; 
assign LED = REG_LED_OUT;

/* Datapath Registers */
register #(.size(16)) REG_MDR
(
	.Clk(Clk),
	.Load(LD_MDR),
	.Reset(Reset),
	.in(MDR_MUX_OUT), 
	.out(REG_MDR_OUT)
);

register #(.size(16)) REG_MAR
(
	.Clk(Clk),
	.Load(LD_MAR),
	.Reset(Reset),
	.in(BUS), 
	.out(REG_MAR_OUT)
);

register #(.size(16)) REG_IR
(
	.Clk(Clk),
	.Load(LD_IR),
	.Reset(Reset),
	.in(BUS), 
	.out(REG_IR_OUT)
);

register #(.size(16)) REG_PC
(
	.Clk(Clk),
	.Load(LD_PC),
	.Reset(Reset),
	.in(PC_MUX_OUT), 
	.out(REG_PC_OUT)
);

register #(.size(12)) REG_LED
(
	.Clk(Clk),
	.Load(LD_LED),
	.Reset(Reset),
	.in(REG_IR_OUT[11:0]), 
	.out(REG_LED_OUT)
);

register #(.size(1)) REG_BEN
(
	.Clk(Clk),
	.Load(LD_BEN),
	.Reset(Reset),
	.in(br_enable), 
	.out(REG_BEN_OUT)
); 

/* Datapath MUXes */ 
bus_mux #(.N(16)) BUS_MUX
(
	.A(ADDER_OUT),
	.B(ALU_OUT),
	.C(REG_MDR_OUT),
	.D(REG_PC_OUT),
	.E(BUS),
	.select({GatePC, GateMDR, GateALU, GateMARMUX})
);

mux2 #(.N(16)) MDR_MUX
(
	.A(BUS),
	.B(MDR_In),
	.C(MDR_MUX_OUT),
	.select(MIO_EN)
);

mux4 #(.N(16)) PC_MUX
(
	.A(INC_PC),
	.B(ADDER_OUT),
	.C(BUS),
	.D(16'b0),
	.E(PC_MUX_OUT),
	.select(PCMUX)
);

mux2 #(.N(3)) SR1_MUX
(
	.A(REG_IR_OUT[8:6]),
	.B(REG_IR_OUT[11:9]),
	.select(SR1MUX),
	.C(SR1_MUX_OUT)
);

mux2 #(.N(3)) DR_MUX
(
	.A(REG_IR_OUT[11:9]),
	.B(3'b111),
	.select(DRMUX),
	.C(DR_MUX_OUT)
);
 
mux2 #(.N(16)) SR2_MUX
(
	.A(SR2_OUT),
	.B(SEXT5_OUT),
	.select(SR2MUX),
	.C(SR2_MUX_OUT)
);

mux4 #(.N(16)) ADDR2_MUX
(
	.A(16'b0000000000000000),
	.B(SEXT6_OUT),
	.C(SEXT9_OUT),
	.D(SEXT11_OUT),
	.select(ADDR2MUX),
	.E(ADDR2_MUX_OUT)
);

mux2 #(.N(16)) ADDR1_MUX
(
	.A(REG_PC_OUT),
	.B(SR1_OUT),
	.select(ADDR1MUX),
	.C(ADDR1_MUX_OUT)
);

/* Standalone Modules */
REGFILE regfile
(
	.Clk(Clk),
	.LD_REG(LD_REG),
	.Reset(Reset),
	.REGFILE_IN(BUS),
	.SR1(SR1_MUX_OUT),
	.SR2(SR2),
	.DR(DR_MUX_OUT),
	.SR1_OUT(SR1_OUT),
	.SR2_OUT(SR2_OUT)
);

ALU alu
(
	.A(SR1_OUT),
	.B(SR2_MUX_OUT),
	.ALUK(ALUK),
	.ALU_OUT(ALU_OUT)
);

ADDER adder
(
	.A(ADDR1_MUX_OUT),
	.B(ADDR2_MUX_OUT),
	.C(ADDER_OUT)
);

nzp_comp nzp_comp
(
	.nzp(REG_IR_OUT[11:9]),
	.n(n),
	.z(z),
	.p(p),
	.Clk(Clk),
	.LD_CC(LD_CC),
	.br_enable(br_enable)
);

/* Sign extenders */
SEXT #(.N(5)) sext5
(
	.A(REG_IR_OUT[4:0]),
	.B(SEXT5_OUT)
);

SEXT #(.N(6)) sext6
(
	.A(REG_IR_OUT[5:0]),
	.B(SEXT6_OUT)
);

SEXT #(.N(9)) sext9
(
	.A(REG_IR_OUT[8:0]),
	.B(SEXT9_OUT)
);

SEXT #(.N(11)) sext11
(
	.A(REG_IR_OUT[10:0]),
	.B(SEXT11_OUT)
);

endmodule