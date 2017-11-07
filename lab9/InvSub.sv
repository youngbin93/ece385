module InvSub
(
	input  logic clk,
	input  logic [127:0] in,
	output logic [127:0] out
);

InvSubBytes(.clk(clk), .in(in[7:0])    , .out(out[7:0]));
InvSubBytes(.clk(clk), .in(in[15:8])   , .out(out[15:8]));
InvSubBytes(.clk(clk), .in(in[23:16])  , .out(out[23:16]));
InvSubBytes(.clk(clk), .in(in[31:24])  , .out(out[31:24]));
InvSubBytes(.clk(clk), .in(in[39:32])  , .out(out[39:32]));
InvSubBytes(.clk(clk), .in(in[47:40])  , .out(out[47:40]));
InvSubBytes(.clk(clk), .in(in[55:48])  , .out(out[55:48]));
InvSubBytes(.clk(clk), .in(in[63:56])  , .out(out[63:56]));
InvSubBytes(.clk(clk), .in(in[71:64])  , .out(out[71:64]));
InvSubBytes(.clk(clk), .in(in[79:72])  , .out(out[79:72]));
InvSubBytes(.clk(clk), .in(in[87:80])  , .out(out[87:80]));
InvSubBytes(.clk(clk), .in(in[95:88])  , .out(out[95:88]));
InvSubBytes(.clk(clk), .in(in[103:96]) , .out(out[103:96]));
InvSubBytes(.clk(clk), .in(in[111:104]), .out(out[111:104]));
InvSubBytes(.clk(clk), .in(in[119:112]) , .out(out[119:112]));
InvSubBytes(.clk(clk), .in(in[127:120]), .out(out[127:120]));

endmodule