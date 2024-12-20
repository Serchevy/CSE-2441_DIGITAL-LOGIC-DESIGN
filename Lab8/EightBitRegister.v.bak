
module RippleCarryAdderStructural (A, B, C0, R, Cout, OVR, NEG, Zero);
	input [3:0] A, B;
	input C0;
	output [3:0] R;
	output Cout, OVR, NEG, Zero;
	
		wire [4:0] C; 
		wire [3:0] BxorC0;
		assign C[0] = C0; // C[0] = Cin	

	xor (BxorC0[0], B[0], C[0]);
	xor (BxorC0[1], B[1], C[0]);
	xor (BxorC0[2], B[2], C[0]);
	xor (BxorC0[3], B[3], C[0]);
		
	//instantiate the full adder module for each stage of the ripple carry adder
	FAbehav s0 (A[0], BxorC0[0], C[0], R[0], C[1]); //stage 0
	FAbehav s1 (A[1], BxorC0[1], C[1], R[1], C[2]); //stage 1
	FAbehav s2 (A[2], BxorC0[2], C[2], R[2], C[3]); //stage 2
	FAbehav s3 (A[3], BxorC0[3], C[3], R[3], C[4]); //stage 3
		
		assign Cout = C[4];
		assign OVR = C[4] ^ C[3];
		assign NEG = R[3];
		assign Zero = ~(R[3] | R[2] | R[1] | R[0]);
endmodule 