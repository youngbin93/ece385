module nzp_comp 
(
	/* nzp comes from cc_out while neg, zero, pos comes from dest */
	input logic [2:0] nzp, 
	input logic Clk, LD_CC, n, z, p,
	output logic br_enable
);

// internal registers for the nzp 
logic [2:0] data;

// initialize to zero
initial
begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 1'b0;
    end
end

// update internal registers when necessary
always_ff @(posedge Clk)
begin
	if(LD_CC)
	begin 
		data[2] = n;
		data[1] = z;
		data[0] = p;
	end
end 

// assign branch enable signal no matter what is happening
always_comb
begin 
	if(nzp[2] & nzp[1] & nzp[0])
		br_enable = 1;
	else if((nzp[2] && data[2]) ||	(nzp[1] && data[1]) || (nzp[0] && data[0]))
		br_enable = 1; 
	else
		br_enable = 0;	
end 

endmodule