`include "config.vh"

module regn(
	input 							clk,
	input 							resetn,
	input 		[`CMD_LENGTH-1:0] 	R,
	input 							Rin,
	output reg 	[`CMD_LENGTH-1:0] 	Q
);

	always @(posedge clk) begin
		if (~resetn)
			Q <= 0;
		else if (Rin)
			Q <= R;
	end
	
endmodule