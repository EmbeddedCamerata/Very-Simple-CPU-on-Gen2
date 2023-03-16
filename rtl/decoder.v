`include "config.vh"

module decoder(
	input      [`CODE_WIDTH-1:0] 	W,
	input                    		en,
	output reg [3:0]  				Y
);
                    
	always @(*) begin
		if (en)
			case (W)
				2'b00:  Y = 'b1000;
				2'b01:  Y = 'b0100;
				2'b10:  Y = 'b0010;
				2'b11:  Y = 'b0001;         
			endcase
		else
			Y = 'b0000;
	end
 
endmodule