module reg_16 (input  logic Clk, Reset,
              input  logic [15:0]  D,
              output logic [15:0]  Data_Out);

	 logic [15:0] data;
    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
		 begin 
			  data <= 16'h0;
		 end
		 else
		 begin
			  data <= D;
		 end	  
    end
	
    assign Data_Out = data;

endmodule