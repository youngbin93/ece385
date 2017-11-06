/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

logic [31:0] register_file[16];
assign AVL_READDATA = (AVL_CS && AVL_READ) ?
                         register_file[AVL_ADDR]
                        :32'b0;
								
assign EXPORT_DATA =  {register_file[7][31:16],register_file[4][15:0]};


always_ff @ (posedge CLK) begin:REGISTER_FILE
if(RESET)
    for(int i = 0; i< 16; i++)
        register_file[i] <= 0;
		  
else if(AVL_WRITE && AVL_CS) begin: SW_WRITE_TO_REG

	 case(AVL_BYTE_EN)
		4'b1111 : 
			register_file[AVL_ADDR][ 31:0] <= AVL_WRITEDATA[ 31:0];
		4'b1100 :
			register_file[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
		4'b0011 :
			register_file[AVL_ADDR][ 15:0] <= AVL_WRITEDATA[ 15:0];
		4'b1000 :
			register_file[AVL_ADDR][ 31:24] <= AVL_WRITEDATA[ 31:24];
		4'b0100 :
			register_file[AVL_ADDR][ 23:16] <= AVL_WRITEDATA[ 23:16];
		4'b0010 :
			register_file[AVL_ADDR][ 15:8] <= AVL_WRITEDATA[ 15:8];
		4'b0001 :
			register_file[AVL_ADDR][ 7:0] <= AVL_WRITEDATA[ 7:0];
		

	endcase

end
//else if(hardware_write) begin: HW_WRITE_TO_REG
//you declare hardware_write
//        register_file[2] <= AES_MSG_DEC;
//end
 
end



endmodule
