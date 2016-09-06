module alu(src1, src2, aluc, zero, result);
	input [31:0] src1,src2;
	input [2:0] aluc;
	output reg zero;

	output reg[31:0] result;
	
	always@(src1 or src2 or aluc)
	case(aluc)
	3'b000: result <= src1 & src2;
	3'b001: result <= src1 | src2;
	3'b010: result <= src1 + src2;
	3'b011: result <= src1 >> src2;
	3'b100: result <= (~src1 & src2) | (src1 & ~src2);
	3'b101: result <= src1 << src2;
	3'b110: result <= src1 - src2;
	3'b111: result <= src1<src2?1:0;
	endcase
	
	
	always@(result)
		if(result == 0)
			zero = 1'b1;
		else
			zero = 1'b0;
	

endmodule
	
		

	
	
	
	

