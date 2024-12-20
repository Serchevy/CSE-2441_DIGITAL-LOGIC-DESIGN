
module EightBitRegister(X, inA, inB, Add_Sub, Out, Clear, CCout, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, Rout);
	input [7:0] X;
	input inA, inB, Add_Sub, Out, Clear;
	output [3:0] CCout;
	output [0:6] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	output [7:0] Rout;
		wire [7:0] Aout, Bout;
		//wire [7:0] Rout;
	
	NBitRegister #(4'd8) regA
	(
		.D(X) , 			// Register A input
		.CLK(inA) , 	// Register A load
		.CLR(Clear) , 	// Register A clear
		.Q(Aout) 		// Register A output
	);
	
	
	NBitRegister #(4'd8) regB
	(
		.D(X) , 			
		.CLK(inB) , 	
		.CLR(Clear) , 	
		.Q(Bout) 		
	);
	
	binary2seven hex5
	(
		.in(Aout [7:4]),
		.outbin(HEX5)
	);
	
	binary2seven hex4
	(
		.in(Aout [3:0]),
		.outbin(HEX4)
	);
	
	binary2seven hex3
	(
		.in(Bout [7:4]),
		.outbin(HEX3)
	);
	
	binary2seven hex2
	(
		.in(Bout [3:0]),
		.outbin(HEX2)
	);

	wire Cout, OVR, Neg, Zero;
	wire [7:0] R_RCA;
	
	RippleCarryAdder Logic 
	(
		.Aout(Aout),
		.Bout(Bout),
		.Add_Sub(Add_Sub),
		.R(R_RCA),
		.Cout(Cout),
		.OVR(OVR),
		.Neg(Neg),
		.Zero(Zero)
	);
	
	
	NBitRegister #(4'd8) regR
	(
		.D(R_RCA) , 		
		.CLK(Out) , 
		.CLR(Clear) , 	
		.Q(Rout) 		
	);
	
	binary2seven hex1
	(
		.in(Rout [7:4]),
		.outbin(HEX1)
	);
	
	binary2seven hex0
	(
		.in(Rout [3:0]),
		.outbin(HEX0)
	);
	
	
	NBitRegister #(3'd4) regCC
	(
		.D({Cout, OVR, Neg, Zero}) , 		
		.CLK(Out) , 
		.CLR(Clear), 	
		.Q(CCout) 		
	);
	
	assign test = Add_Sub;
		
endmodule 