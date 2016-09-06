module insMem(pc,    op,func,insAddr,rs,rt,rd,im);           //存放指令
	input[31:0] pc;
	output reg[5:0] op,func;
	output reg[4:0] rs,rt,rd;
	output reg[25:0] insAddr;
	output reg[15:0] im;
	
	reg[7:0] mem[0:255];
	integer i;
	
	initial
	begin
	$readmemb("ins.txt",mem);
	for(i=0; i<255; i=i+1)
		$display("%h",mem[i]);
	end

	

	always@(pc)
	begin
		op <= mem[pc][7:2];     //31:26
		func <= mem[pc+3][5:0]; //5:0
		rs <= {mem[pc][1:0],mem[pc+1][7:5]};   //25:21
		rt <= mem[pc+1][4:0];            //20:16
		rd <= mem[pc+2][7:3];           //15:11
		insAddr <= {mem[pc][0:0],mem[pc+1][7:0]+mem[pc+2][7:0]+mem[pc+3][7:0]};        //25:0
		im <= {mem[pc+2][7:0],mem[pc+3][7:0]};         //15:0
	end
endmodule
