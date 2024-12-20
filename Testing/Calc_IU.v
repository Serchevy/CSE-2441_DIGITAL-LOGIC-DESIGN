
module Calc_IU (
	input clock, reset, 
	input [3:0] row,
	output [3:0] col,
	output [7:0] LEDR,
	output invalid
	);
	
	wire [15:0] out_;
	
	keypad_input inpt (
		.clk(clock) ,
		.reset(reset) ,
		.row(row) ,
		.col(col) ,
		.out(out_) 
	);
	
	wire [7:0] binSM;
	wire BCD_invalid;
	
	BCD2BinarySM BinSM (
		.BCD(out_) ,
		.binarySM(binSM),
		.invalid(BCD_invalid)
	);
	
	
	SIGN2two num2s (
		.A(binSM) ,
		.B(LEDR) 
	);
	
	assign invalid = BCD_invalid;
	
endmodule 