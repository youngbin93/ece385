module counter(
			input logic  down_up,  
			input logic clk,  
			input logic reset,   
			output reg  [7:0] out, 

		);
  

	always_ff @(posedge clk)
  if (reset) begin // active high reset
    out <= 8'b0 ;
  end else if (up_down) begin
    out ++;
  end else begin
    out --;
  end
  
  endmodule