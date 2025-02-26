module SIGN2two #(parameter N = 8)
(
	input [N-1:0] A,
	output [N-1:0] B
);
	wire [N:0] ha;
	assign ha[0] = A[N-1];
	assign B[N-1] = A[N-1];
		genvar i;
		generate
			for(i=0; i<N-1; i=i+1)
				begin: twosFor
					halfADDER halfADDER_inst1
					(
						.s(B[i]) , 					// output s_sig
						.cout(ha[i+1]) , 			// output cout_sig
						.a((A[i])^(A[N-1])) , 	// input a_sig
						.b(ha[i]) 					// input b_sig
					);
				end
		endgenerate
endmodule

module halfADDER (s, cout, a, b);
	input a, b;
	output s, cout;
	and (cout, a, b);
	xor (s, a, b);
endmodule