`include "config.vh"

module alu(
	input 					   		AddSub,
	input		[`CMD_LENGTH-1:0] 	A,
	input		[`CMD_LENGTH-1:0] 	BusWires,
	output wire [`CMD_LENGTH-1:0] 	sum
);

	assign sum = (AddSub == `ALU_ADD) ? (A + BusWires) : (A - BusWires);

endmodule