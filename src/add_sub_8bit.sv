module top(
    input  [9:0] SW,
    input  KEY0,
    input  KEY1,
    output [9:0] LEDR
);

Lab1_ex2 u0(
    .A(SW[7:0]),       
    .clock(KEY1),      
    .reset(~KEY0),     
    .add_sub(SW[9]),   
    .overflow(LEDR[9]),
    .finalcarry(LEDR[8]),
    .S(LEDR[7:0])
);

endmodule

module Lab1_ex2 (
	input logic [7:0] A,
	input clock,
	input reset,
	input add_sub,
	output overflow,
	output finalcarry,
	output [7:0] S
	);
	wire [7:0] A_temp;
	wire [7:0] S_temp;
	wire tempco;	
	wire tempovf;
	wire cout;
	assign cout=tempco^add_sub;
	nbitreg u0 (.R(A),.rst(reset),.clk(clock),.Q(A_temp));
	nbitreg u1 (.R(S_temp),.rst(reset),.clk(clock),.Q(S));
	EBA u2 (.A(A_temp),.B(S),.S(S_temp),.M(add_sub),.Co(tempco),.ovf(tempovf));
	d_ff D_carry (.D(cout),.rst(reset),.clk(clock),.Q(finalcarry));
	d_ff D_ovf (.D(tempovf),.rst(reset),.clk(clock),.Q(overflow));
	
	
endmodule


module d_ff (
	input logic D,
	input clk,
	input logic rst,
   output logic Q
	);
	
	always_ff @(posedge clk, posedge rst)
		if (rst)
			Q <='b0;
		else
		Q <= D;
	
endmodule 

module nbitreg (
	input logic [7:0] R,
	input logic rst,
	input clk,
	output reg [7:0] Q
	);
	
	always_ff @(posedge clk, posedge rst) 
	if (rst) Q <= 'b0;
	else  Q <= R;
	
endmodule

 module EBA (
	input logic [7:0] A,
	input logic [7:0] B,
	input logic M,
	output logic [7:0] S,
	output logic Co,
	output logic ovf
	);
logic [6:0] temp;

	FA u0 (.a(B[0]),.b(A[0]^M),.ci(M),.s(S[0]),.co(temp[0]));
	FA u1 (.a(B[1]),.b(A[1]^M),.ci(temp[0]),.s(S[1]),.co(temp[1]));
	FA u2 (.a(B[2]),.b(A[2]^M),.ci(temp[1]),.s(S[2]),.co(temp[2]));
	FA u3 (.a(B[3]),.b(A[3]^M),.ci(temp[2]),.s(S[3]),.co(temp[3]));
	FA u4 (.a(B[4]),.b(A[4]^M),.ci(temp[3]),.s(S[4]),.co(temp[4]));
	FA u5 (.a(B[5]),.b(A[5]^M),.ci(temp[4]),.s(S[5]),.co(temp[5]));
	FA u6 (.a(B[6]),.b(A[6]^M),.ci(temp[5]),.s(S[6]),.co(temp[6]));
	FA u7 (.a(B[7]),.b(A[7]^M),.ci(temp[6]),.s(S[7]),.co(Co));
	assign ovf = Co^temp[6];
		
endmodule

	
module FA (
	input logic a,b,ci,
	output logic s, co
   );
	
	assign s = a^b^ci;
	assign co=a&b|ci&a|ci&b;
	
endmodule
