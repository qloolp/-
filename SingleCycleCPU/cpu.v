module cpu(clk,reset);
	input  clk,reset;
	
	 reg sel;
	 reg[4:0] NI;
	 wire [4:0] N1,N2,rs,rt,rd;
	 reg [31:0] src2,DI;
	 wire [5:0] op;
	 wire [15:0] im; 
	 wire [5:0] func;
    wire[2:0] aluc;
	 wire writeMem,writeReg,wb,branch,jump,aluSrcB,memToReg,regDes,zero;
	 wire [25:0] insAddr;
	 wire[31:0] dataIn,src1,Outaddr,signIm,address,Q1,Q2,dataOut,result;
	 
	 initial
		begin
		sel = 1;
		end
	 
	 signExtend inssignExtend(im,sel,     signIm);
	 
	 
	 
	 pc inspc(clk, reset,jump, branch, signIm,insAddr,    Outaddr);
	 
	 
	 insMem insinsMem(Outaddr,       op,func,insAddr,rs,rt,rd,im);  
	
	
	 decoder insdecoder(op,func,zero,        aluc,writeReg,writeMem,branch,jump,aluSrcB,memToReg,regDes);
	 
	 
	 assign src1=Q1;
	 always@(posedge clk)
		if(aluSrcB==1)
			src2 = signIm;
		else
			src2 = Q2;
	 alu insalu(src1, src2, aluc,           zero, result);	 
	 
	 
	 
	 assign wb=writeMem;
	 assign dataIn=Q2;
	 assign address = result;
	 dataMem insdataMem(wb,address,dataIn,     dataOut);
	 
	 
	 
	 assign WE=writeReg;
	 always@(posedge clk)
		if(regDes == 1)
			NI = rt;
		else
			NI = rd;
	 always@(posedge clk)
		if(memToReg==1)
			DI = dataOut;
		else
			DI = result;
	 assign N1 = rs;
	 assign N2 = rt;
	 regfile insregfile(clk,WE,N1,N2,NI,DI,    Q1,Q2);
endmodule
