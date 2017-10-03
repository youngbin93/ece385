module datapath
(
	input logic 			Clk,
	input logic  [15:0] 	S,
	input logic 			LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED, 
	input logic 			GatePC, GateMDR, GateALU, GateMARMUX,
	input logic  [1:0]  	PCMUX,
	input logic  			DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
	input logic  [1:0]  	ADDR2MUX, ALUK,
	input logic 			MIO_EN,
	input logic  [15:0]  MDR_In,
	inout logic  [15:0]  Data,
	output logic [15:0] 	MAR, IR, PC, MDR
);

logic [15:0] REG_MDR_OUT, REG_MAR_OUT, REG_IR_OUT, REG_PC_OUT, INC_PC;
logic [15:0] MDR_MUX_OUT, PC_MUX_OUT;
wire  [15:0] BUS; 
//logic [3:0] bus_select;
//assign bus_select[3] = GatePC;
//assign bus_select[2] = GateMDR;
//assign bus_select[1] = GateALU;
//assign bus_select[0] = GateMARMUX;

/* Datapath Registers */
register #(.size(16)) REG_MDR
(
	.Clk(Clk),
	.Load(LD_MDR),
	.in(MDR_MUX_OUT), 
	.out(REG_MDR_OUT)
);

register #(.size(16)) REG_MAR
(
	.Clk(Clk),
	.Load(LD_MAR),
	.in(BUS), 
	.out(REG_MAR_OUT)
);

register #(.size(16)) REG_IR
(
	.Clk(Clk),
	.Load(LD_IR),
	.in(BUS), 
	.out(REG_IR_OUT)
);
register #(.size(16)) REG_PC
(
	.Clk(Clk),
	.Load(LD_PC),
	.in(PC_MUX_OUT), 
	.out(REG_PC_OUT)
);
/* Combinational assigments for registers */
assign MDR = REG_MDR_OUT;
assign MAR = REG_MAR_OUT;
assign IR = REG_IR_OUT;
assign PC = REG_PC_OUT;
assign INC_PC = REG_PC_OUT + 16'b000000000001;

/* Datapath MUXes */ 
mux2 #(.N(16)) MDR_MUX
(
	.A(MDR_In),
	.B(BUS),
	.C(MDR_MUX_OUT),
	.select(MIO_EN)
);
 
bus_mux #(.N(16)) BUS_MUX
(
	.A(16'b0),
	.B(16'b0),
	.C(REG_MDR_OUT),
	.D(REG_PC_OUT),
	.E(BUS),
	.select({GatePC, GateMDR, GateALU, GateMARMUX})
);

mux4 #(.N(16)) PC_MUX
(
	.A(INC_PC),
	.B(16'b0),
	.C(BUS),
	.D(16'b0),
	.E(PC_MUX_OUT),
	.select(PCMUX)
);


endmodule