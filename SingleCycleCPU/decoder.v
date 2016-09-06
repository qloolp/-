module decoder(op,func,zero,  aluc,writeReg,writeMem,branch,jump,aluSrcB,memToReg,regDes);
	input[5:0] op;
	input[5:0] func;
	input zero;
	
	output reg[2:0] aluc;
	output reg writeReg,writeMem,branch,jump,aluSrcB,memToReg,regDes;
	
	initial
	begin 
	writeMem = 0;
	writeReg = 0;
	branch = 0;
	jump = 0;
	aluSrcB = 0;
	memToReg = 0;
	regDes = 0;
	end
	
	
	always@(op or func or zero)
	begin
		case(op)
			6'b000000:
			case(func)
				6'b100000: aluc <= 3'b010;  //add
				6'b100010: aluc <= 3'b110;  //sub
				6'b100100: aluc <= 3'b000;  //and
				6'b100101: aluc <= 3'b001;  //or
				6'b100110: aluc <= 3'b100;  //xor
				6'b101010: aluc <= 3'b111;  //slt
				6'b000000: aluc <= 3'b101;  //sll
				6'b000010: aluc <= 3'b011;  //srl
			endcase
			6'b100011:            //lw
				begin
				aluc <= 3'b010; //add
				aluSrcB = 1;
				memToReg = 1;
				regDes = 1;
				end
			6'b101011:              //sW
				begin
				aluc <= 3'b010; //add
				aluSrcB = 1;
				writeMem = 1;
				end
			6'b000100:             //beq
				begin
				aluc <= 3'b110; //sub
				if(zero == 1)
					branch = 1;
				else
					branch = 0;
				end
			6'b000010:             //j
				jump = 1;
		endcase
		
		case(op)
		6'b101011,              //sW
		6'b000100,             //beq
		6'b000010:             //j
		writeReg = 0;
		default:
		writeReg	= 1;
		endcase
	end
		
		
		
	
		


endmodule

	
	
		
	
	
		