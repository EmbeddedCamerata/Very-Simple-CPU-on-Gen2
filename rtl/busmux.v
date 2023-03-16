`include "config.vh"

module busmux (
	input 		[`REG_NUM-1:0] 		Rout,	// Output from proc
	input 							Gout,	// Output from proc
	input 							DINout,
	input 		[`CMD_LENGTH-1:0] 	R0,
	input 		[`CMD_LENGTH-1:0] 	R1,
	input 		[`CMD_LENGTH-1:0] 	R2,
	input 		[`CMD_LENGTH-1:0] 	R3,
	input 		[`CMD_LENGTH-1:0] 	G,
	input 		[`CMD_LENGTH-1:0] 	DIN,
	output reg 	[`CMD_LENGTH-1:0] 	BusWires
);

	wire [`REG_NUM+1:0] sel;

	assign sel = {Rout, Gout, DINout};

	always @(*) begin
		case (sel)
			'b100_000: BusWires = R0;
			'b010_000: BusWires = R1;
			'b001_000: BusWires = R2;
			'b000_100: BusWires = R3;
			'b000_010: BusWires = G;
			'b000_001: BusWires = DIN;
			default: BusWires = DIN;
		endcase
	end
	
endmodule