module ex2_testbench();
	logic [7:0] A;
	logic clk;
	logic rst;
	logic add_sub;
	logic ovf;
	logic finalcarry;
	logic [7:0] S;
	
	Lab1_ex2 DUT (.A(A),.clock(clk),.reset(rst),.add_sub(add_sub),.overflow(ovf),.finalcarry(finalcarry),.S(S));
	
	always
	begin 
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial
	begin 
		rst=1;A=8'b00000000;add_sub=0;
		#5; A=8'h55; 
		#5; rst=0;
		#5; add_sub=1; A=8'h24;
		#10; A=8'h48;
		#7; add_sub=0;
		#3; A=8'h71;
		#7; add_sub=1;
		#3; A=8'h95;
		#10; A=8'h30;
		#7; add_sub=0;
		#3; A=8'h9A;
		#7; add_sub=1;
		#3; A=8'h10;
		#7; add_sub=0;
		#3; A=8'h60;
		#7; add_sub=1;
		#3; A=8'h80;
	end
	
endmodule
		

    