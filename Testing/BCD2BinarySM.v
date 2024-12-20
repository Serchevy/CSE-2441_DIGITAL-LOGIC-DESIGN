module BCD2BinarySM #(parameter N=8)
	(
	input [15:0] BCD,
	output [N-1:0] binarySM,
	output reg invalid
	);
	assign binarySM = BCD[15]*(8'b10000000) + BCD[11:8]*(8'b01100100) + BCD[7:4]*(8'b1010) + BCD[3:0];
	
	always @(BCD)
	begin
	if(BCD[11:0] > 12'b000100100111) begin
		invalid = 1'b1;
		end
	else begin 
		invalid = 1'b0;
		end
	end 
	/*else if() begin 
		assign 
		end
	else begin 
		assign invalid = 1'b0
		end*/
endmodule 