module regfile(clk,WE,N1,N2,NI,DI,Q1,Q2);
	input WE;
	input clk;
	input[4:0] N1,N2,NI;
	input[31:0]  DI;
	output reg[31:0] Q1,Q2;
	integer i;
	
	reg[31:0] registers[0:31];
	
	initial
	$readmemh("regInit.txt",registers);
	
	always@(N1 or N2 or NI or DI)
	begin
		Q1 <= registers[N1];
		Q2 <= registers[N2];
	end
	
	always@(posedge clk)
		if(WE == 1)
			registers[NI] <= DI;

endmodule

	
		
	