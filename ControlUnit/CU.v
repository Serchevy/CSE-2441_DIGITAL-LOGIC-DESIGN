module CU (
	input clock, enter, add_sub, clear,
	output reg reset, LdA, LdB, LdR, AddSub, LdOU, IUAU,
	output reg [1:0] LED
	);
	
	reg [1:0] state, nextstate;
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	
	wire enter_out;
	EdgeDetect EdgeDetect_inst (
		.in(enter),
		.clock(clock),
		.out(enter_out)
	);
	
	always @ (negedge enter_out, negedge clear)
		if (clear == 0) state <= S0; 
			else state <= nextstate;
		always @ (state)
			case ({state})
				S0: begin nextstate = S1; reset = 1'b1; LdA = 1'b0; LdB = 1'b0; LdR = 1'b0; LdOU = 1'b0; IUAU = 1'b1; LED = S0; end 
				S1: begin nextstate = S2; reset = 1'b0; LdA = 1'b1; LdB = 1'b0; LdR = 1'b0; LdOU = 1'b1; IUAU = 1'b1; LED = S1; end 
				S2: begin nextstate = S3; reset = 1'b0; LdA = 1'b0; LdB = 1'b1; LdR = 1'b0; LdOU = 1'b1; IUAU = 1'b1; LED = S2; end 
				S3: begin nextstate = S3; reset = 1'b0; LdA = 1'b0; LdB = 1'b0; LdR = 1'b1; LdOU = 1'b1; IUAU = 1'b0; LED = S3; end 
			endcase
endmodule

	