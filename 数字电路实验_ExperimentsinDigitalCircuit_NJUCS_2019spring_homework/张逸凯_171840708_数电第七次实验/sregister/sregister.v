module sregister(clk, choose, en, data_in, inone, Q);
	input [2:0] choose;
	input en;
	input [7:0] data_in;
	input inone;
	input clk;
	output reg [7:0] Q;
	reg replace = 0;
	always @(posedge clk)
	begin
		if(en)
			begin
				case(choose)
				0:Q = 0;
				1:Q = data_in;
				2:Q = {replace, Q[7:1]};
				3:Q = {Q[6:0], replace};
				4:Q = {Q[7], Q[7:1]};
				5:Q = {inone, Q[7:1]};
				6:Q = {Q[0], Q[7:1]};
				7:Q = {Q[6:0], Q[7]};
				endcase
			end
		else
			Q = 0;
	end
endmodule
