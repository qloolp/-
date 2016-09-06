`timescale 1ns/1ps
module test;
	reg clk,reset;
 
	initial
	begin
		reset = 1;
		clk = 0;
	end
	
	always #10 clk = ~clk;
 
 
 
	cpu inscpu(clk,reset);
endmodule
 
 
 