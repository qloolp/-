//`include "alu.v"
`timescale 1ns/1ps
module alu_test;
	reg[31:0] src1,src2;
	reg[2:0] aluc;
	wire zero;
	wire[31:0] result;
	integer i,j,k,m,n;
	
	
	reg[2:0] op[4:0];
	
	initial
	begin
	src1 = 0;
	src2 = 0;
	aluc = 3'b000;
	op[0] = 3'b000;
	op[1] = 3'b001;
	op[2] = 3'b010;
	op[3] = 3'b110;
	op[4] = 3'b111;
	
	
	
	end
	
	initial
	for(i=0; i<255; i=i+1)
	begin
	#50 aluc = op[{$random}%5];   
			
	end
	
	initial
	for(j=0; j<255; j=j+1)
	begin
	#50 src1 = {$random}%100;
	end
	
	initial
	for(k=0; k<255; k=k+1)
	begin
	#50 src2 = {$random}%100;
	end
	
	alu alu1(src1,src2,aluc,zero,result);

	initial
	for(k=0; k<255; k=k+1)
	begin
	#55 $display("%d %d %b = %d  ... %b",src1,src2,aluc,result,zero);
	end
endmodule
