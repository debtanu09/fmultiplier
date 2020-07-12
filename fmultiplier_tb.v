/*
MIT License

Copyright (c) 2020 Debtanu Mukherjee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
`include "fmultiplier.v"
module fmultiplier_tb;

reg [31:0] a, b;
wire [31:0] z;
reg clk, rst;

fmultiplier multiplier(clk , rst, a, b, z);

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, fmultiplier_tb);
end

initial begin
	clk <= 0;
	rst <= 1;
	repeat(17000)
		#5 clk <= ~clk;
end

initial #13 rst <= 0;

initial begin
	#3
	repeat(500) begin
		#80
		a = $random;
		b = $random;
	end
	#80 $finish;
end


endmodule
