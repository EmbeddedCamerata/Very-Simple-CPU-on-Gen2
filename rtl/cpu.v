`include "config.vh"

module cpu(
	input 				sysclk_n,	// Differential system clock for ILA
	input 				sysclk_p,
	input 				key,
	input 		[7:0] 	sw,
	output wire [7:0] 	led
);

	wire manual_clock;
	wire resetn;
	wire run;
	wire [`CMD_LENGTH-1:0] DIN;
	wire [1:0] Tstep;
	wire clr;

	assign manual_clock = key;
	assign resetn = sw[6];
	assign DIN = sw[5:0];
	assign run = sw[7];

	// counter
	upcount upcount(.clk(manual_clock), .clr(clr), .Q(Tstep));

	wire Ain;
	wire Gin;
	wire IRin;
	wire [`REG_NUM-1:0] Rin;
	wire [`CMD_LENGTH-1:0] R0, R1, R2, R3, A, G, Sum;
	wire [`CMD_LENGTH-1:0] BusWires;

	// Reg groups
	regn reg_0(.clk(manual_clock), .R(BusWires), .Rin(Rin[3]), .Q(R0), .resetn(resetn));
	regn reg_1(.clk(manual_clock), .R(BusWires), .Rin(Rin[2]), .Q(R1), .resetn(resetn));
	regn reg_2(.clk(manual_clock), .R(BusWires), .Rin(Rin[1]), .Q(R2), .resetn(resetn));
	regn reg_3(.clk(manual_clock), .R(BusWires), .Rin(Rin[0]), .Q(R3), .resetn(resetn));

	// Reg A
	regn reg_A(.clk(manual_clock), .R(BusWires), .Rin(Ain), .Q(A), .resetn(resetn));
	
	// Reg G
	regn reg_G(.clk(manual_clock), .R(Sum), .Rin(Gin), .Q(G), .resetn(resetn));

	// Reg IR
	wire [`CMD_LENGTH-1:0] IR;
	regn reg_IR(.clk(manual_clock), .R(DIN), .Rin(IRin), .Q(IR), .resetn(resetn));

	wire AddSub;
	
	// ALU
	alu alu(.AddSub(AddSub), .A(A), .BusWires(BusWires), .sum(Sum));

	wire [`REG_NUM-1:0] Rout;
	wire Gout;
	wire DINout;

	// Busmux
	busmux busmux(
		.Rout 		(Rout),
		.Gout 		(Gout),
		.DINout 	(DINout),
		.R0 		(R0),
		.R1 		(R1),
		.R2 		(R2),
		.R3 		(R3),
		.G 			(G),
		.DIN 		(DIN),
		// Output
		.BusWires 	(BusWires)
	);

	wire done;

	proc proc(
		// Control
		.clk 	(manual_clock),
		.Tstep 	(Tstep),
		.run 	(run),
		.resetn (resetn),
		// Input
		.IR 	(IR),
		.DIN 	(DIN),
		// Output
		.done 	(done),
		.clr 	(clr),

		.Ain 	(Ain),
		.Gin 	(Gin),
		.AddSub (AddSub),
		.IRin 	(IRin),
		.Rin 	(Rin),
		.Gout	(Gout),
		.DINout (DINout),
		.Rout 	(Rout)
	);

	assign led[`CMD_LENGTH-1:0] = BusWires;
	assign led[6] = 1'b0;
	assign led[7] = done;

	// Clock & ILA
	wire sysclk_50M;

    clk_wiz_0 u_clk_wiz(
    	// Clock out ports
    	.clk_out1 	(sysclk_50M),
    	// Clock in ports
    	.clk_in1_p 	(sysclk_p),
    	.clk_in1_n 	(sysclk_n)
	);

	ila_0 u_ila(
		.clk 		(sysclk_50M),
		.probe0 	(manual_clock),
		.probe1 	(resetn),
		.probe2 	(run),
		.probe3 	(BusWires),
		.probe4 	(R0),
		.probe5 	(R1),
		.probe6 	(R2),
		.probe7 	(R3),
		.probe8 	(Rin),
		.probe9 	(Rout),
		.probe10 	(Tstep),
		.probe11 	(done)
	);

endmodule