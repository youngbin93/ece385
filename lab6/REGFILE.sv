import SLC3_2::*;

module REGFILE
(
    input logic Clk, LD_REG, Reset,
    input logic [15:0] REGFILE_IN,
    input logic [2:0] SR1, SR2, DR,
    output logic [15:0] SR1_OUT, SR2_OUT
);

logic [15:0] data [7:0];

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */
initial
begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 16'b0;
    end
end

always_ff @(posedge Clk)
begin
    if (LD_REG == 1)
    begin
        data[DR] = REGFILE_IN;
    end
	 else if(Reset)
	 begin
		 for (int i = 0; i < $size(data); i++)
		 begin
        data[i] = 16'b0;
       end
	 end
end

always_comb
begin
    SR1_OUT = data[SR1];
    SR2_OUT = data[SR2];
end

endmodule
