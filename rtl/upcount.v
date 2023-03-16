
module upcount(
	input 				clk,
	input 				clr,
	output reg [1:0] 	Q
);

    always @(posedge clk) begin
		if (clr)
			Q <= 0;
		else
			Q <= Q + 1'b1;
	end

endmodule