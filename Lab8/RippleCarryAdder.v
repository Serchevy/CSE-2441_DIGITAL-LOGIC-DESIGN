
module RippleCarryAdder(Aout, Bout, Add_Sub, R, Cout, OVR, Neg, Zero);
	input [7:0] Aout, Bout;
	input Add_Sub;
	output [7:0] R;
	output Cout, OVR, Neg, Zero;

		wire [8:0] C; 
		wire [7:0] Bxor;
		assign C[0] = Add_Sub;	

	xor (Bxor[0], Bout[0], C[0]);
	xor (Bxor[1], Bout[1], C[0]);
	xor (Bxor[2], Bout[2], C[0]);
	xor (Bxor[3], Bout[3], C[0]);
	xor (Bxor[4], Bout[4], C[0]);
	xor (Bxor[5], Bout[5], C[0]);
	xor (Bxor[6], Bout[6], C[0]);
	xor (Bxor[7], Bout[7], C[0]);
		
	//instantiate the full adder module for each stage of the ripple carry adder
	FAbehav s0 (Aout[0], Bxor[0], C[0], R[0], C[1]); //stage 0
	FAbehav s1 (Aout[1], Bxor[1], C[1], R[1], C[2]); //stage 1
	FAbehav s2 (Aout[2], Bxor[2], C[2], R[2], C[3]); //stage 2
	FAbehav s3 (Aout[3], Bxor[3], C[3], R[3], C[4]); //stage 3
	FAbehav s4 (Aout[4], Bxor[4], C[4], R[4], C[5]); //stage 4
	FAbehav s5 (Aout[5], Bxor[5], C[5], R[5], C[6]); //stage 5
	FAbehav s6 (Aout[6], Bxor[6], C[6], R[6], C[7]); //stage 6
	FAbehav s7 (Aout[7], Bxor[7], C[7], R[7], C[8]); //stage 7
	
	assign Cout = C[8];
	assign OVR = C[7] ^ C[8];
	assign Neg = R[7];
	assign Zero = ~(R[7] | R[6] | R[5] | R[4] | R[3] | R[2] | R[1] | R[0]);
		
endmodule 