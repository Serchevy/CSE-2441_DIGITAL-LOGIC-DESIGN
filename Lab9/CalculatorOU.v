module CalculatorOU
(
	input [7:0] x, 
	output HEX3,
	output [0:6] HEX2, HEX1, HEX0
);
		wire [7:0] sig_num;
	
	twoSIGN #(4'd8) two2sign
	(
		.A(x),
		.B(sig_num)
	);
	
		wire [3:0] ones, tens;
		wire [1:0] hunds;
	
	binary2bcd bcd_num 
	(
		.A(sig_num),
		.ONES(ones),
		.TENS(tens),
		.HUNDREDS(hunds)
	);
	
	binary2seven Hex0
	(
		.in(ones),
		.outbin(HEX0)
	);
	
	binary2seven Hex1
	(
		.in(tens),
		.outbin(HEX1)
	);
	
	binary2seven Hex2
	(
		.in(hunds),
		.outbin(HEX2)
	);
	
		assign HEX3 = ~x[7];
	
endmodule 