module signExtend(im,sel,signIm);
	input [15:0] im;
	input sel;
	output[31:0] signIm;
	  assign signIm[15:0] = im;  
     assign signIm[31:16] = sel? (im[15]? 16'hffff : 16'h0000) : 16'h0000;  
endmodule
