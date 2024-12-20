module binary2seven (
	input [3:0] in,
	output reg [0:6] outbin);
	always @ in 
		case ({in})
			4'b0000: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0000001;   //0
			4'b0001: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b1001111;   //1
			4'b0010: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0010010;   //2
			4'b0011: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0000110;   //3
			4'b0100: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b1001100;   //4
			4'b0101: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0100100;   //5
			4'b0110: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0100000;   //6
			4'b0111: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0001111;   //7
			4'b1000: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0000000;   //8
			4'b1001: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b0001100;   //9
			default: {outbin[0], outbin[1], outbin[2], outbin[3], outbin[4], outbin[5], outbin[6] } = 7'b1111111;   //' '
		endcase
endmodule