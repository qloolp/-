module dataMem(wb,address,dataIn,  dataOut); 
	input [31:0] address,dataIn;
	input wb;
	output reg[31:0] dataOut;
	reg[31:0] data[0:31];
	
	integer i;
	initial
	for(i=0; i<32; i=i+1)
		data[i] <= 0;
	
	always@(wb,address,dataIn)      //写
		if(wb==1)
			data[address] <= dataIn;
		else                         //读
			dataOut <= data[address];
		
endmodule
	