module pc(clk, reset,jump, branch, signIm,insAddr,    outaddr);
	input clk,reset,jump,branch;
	input[31:0] signIm;
	input [25:0] insAddr;
	output reg[31:0] outaddr;
	
	initial 
	outaddr = 0;
	
	
	
	always@(negedge reset)
		if(reset == 1)
			outaddr = 0;
	always@(posedge clk)
		if(jump)         //J
			outaddr = insAddr*4;
		else if(branch)       //BEQ
			outaddr = outaddr+4+signIm*4;
		else
			outaddr = outaddr+4;
endmodule

	