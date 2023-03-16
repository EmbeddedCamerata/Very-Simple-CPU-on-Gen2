`include "config.vh"

module proc(
	input 							clk, 	// Manual clock(button)
	input 		[1:0] 				Tstep,	// INput from upcounter
	input 							run, 	// Input ftom switch
	input 							resetn,	// Input ftom switch
	
	input 		[`CMD_LENGTH-1:0] 	IR,		// Input from reg IR
	input 		[`CMD_LENGTH-1:0] 	DIN,	// Input ftom switches

	output reg 						done,	// Output to LED
	output wire 					clr,	// Output to upcounter

	output reg 						Ain,	// Output to reg A
	output reg 						Gin,	// Output to reg G
	output reg  					AddSub,	// Output to ALU
	output reg 						IRin,	// Output to reg IR
	output reg 	[`REG_NUM-1:0]		Rin,	// output to reg groups
	output reg						Gout,	// Output to reg G
	output reg						DINout,	// Output to Busmux
	output reg 	[`REG_NUM-1:0]		Rout	// Output to Busmux
);

	wire [1:0] I;
	wire [`REG_NUM-1:0] X, Y;

	assign I = IR[5:4];
	
	decoder decX(.W(IR[3:2]), .en(1'b1), .Y(X));
	decoder decY(.W(IR[1:0]), .en(1'b1), .Y(Y));

	assign clr = (~resetn) | done | (~run & (Tstep == 0));

	always @(Tstep or X or Y or I) begin
		done = 1'b0;
		Ain = 1'b0;
		Gin = 1'b0;
		AddSub = 1'b0;
		IRin = 1'b0;
		Rin = 'd0;
		Gout = 1'b0;
		DINout = 1'b0;
		Rout = 'd0;

		case (Tstep)
			2'b00: begin
				IRin = 1'b1;
				done = 1'b0;
				{Rout, Gout, DINout} = {4'b0, 1'b0, 1'b0};
				Rin = 'b0;
				Ain = 1'b0;
				Gin = 1'b0;
				AddSub = `ALU_ADD;	
			end

			2'b01: begin
				IRin = 1'b0;
				case (I)
					`CMD_MV:  begin
						{Rout, Gout, DINout} = {Y, 1'b0, 1'b0};
						Rin = X;
						done = 1'b1;
						
						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_MVI: begin
						{Rout, Gout, DINout} = {4'b0, 1'b0, 1'b1};
						Rin = X;
						done = 1'b1;
						
						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_ADD: begin
						{Rout, Gout, DINout} = {X, 1'b0, 1'b0};
						Ain = 1'b1;
						done = 1'b0;
						
						Rin = 'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_SUB: begin
						{Rout, Gout, DINout} = {X, 1'b0, 1'b0};
						Ain = 1'b1;
						done = 1'b0;
						
						Rin = 'b0;
						Gin = 1'b0;
						AddSub = `ALU_SUB;
					end
				endcase
			end

			2'b10: begin
				IRin = 1'b0;
				done = 1'b0;
				case (I)
					`CMD_MV:  begin
						{Rout, Gout, DINout} = {4'b0, 1'b0, 1'b0};
						Rin = 'b0;
						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end
					
					`CMD_MVI:  begin
						{Rout, Gout, DINout} = {4'b0, 1'b0, 1'b0};
						Rin = 'b0;
						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_ADD: begin
						{Rout, Gout, DINout} = {Y, 1'b0, 1'b0};
						Gin = 1'b1;
						AddSub = `ALU_ADD;
						
						Rin = 'b0;
						Ain = 1'b0;
					end

					`CMD_SUB: begin
						{Rout, Gout, DINout} = {Y, 1'b0, 1'b0};
						Gin = 1'b1;
						AddSub = `ALU_SUB;

						Rin = 'b0;
						Ain = 1'b0;
					end
				endcase
			end

			2'b11: begin
				IRin = 1'b0;
				case (I)
					`CMD_MV:  begin
						{Rout, Gout, DINout} = {4'b0, 1'b0, 1'b0};
						Rin = 'b0;
						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_MVI:  begin
						{Rout, Gout, DINout} = {4'b0, 1'b0, 1'b0};
						Rin = 'b0;
						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_ADD: begin
						{Rout, Gout, DINout} = {4'b0, 1'b1, 1'b0};
						Rin = X;
						done = 1'b1;

						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_ADD;
					end

					`CMD_SUB: begin
						{Rout, Gout, DINout} = {4'b0, 1'b1, 1'b0};
						Rin = X;
						done = 1'b1;

						Ain = 1'b0;
						Gin = 1'b0;
						AddSub = `ALU_SUB;
					end
				endcase
			end
		endcase
	end

endmodule