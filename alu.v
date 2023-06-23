`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2023 06:09:40
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//Full Adder
module fa(input wire [7:0] a,input wire [7:0] b,input wire ctrl,output wire [7:0] Add,output wire [7:0] Carry);
assign {Carry,Add} = (ctrl)?a+b:0;
endmodule

//Full Subtractor
module fs(input wire [7:0] a,input wire [7:0] b,input wire ctrl,output wire [7:0] Diff,output wire [7:0] Borrow);
assign {Borrow,Diff} = (ctrl)?a-b:0;
endmodule



//Dividor
module dv(input wire [7:0] a,input wire [7:0] b,output wire [7:0] quotient,output wire [7:0] remainder);
assign quotient=a/b;
assign remainder=a%b;
endmodule



//Multiplier
module mul(input wire [7:0] a,input wire [7:0] b,output wire [15:0] mul);
assign mul=a*b;
endmodule


//4x1 mux
module mux(input wire [7:0] a,input wire [7:0] b,input wire [7:0] c,input wire [7:0] d,input wire [1:0] S,output wire [7:0] Y);
assign Y=S[0]?(S[1]?d:c):(S[1]?b:a);
endmodule

module alu(input wire [7:0] a, input wire [7:0] b,input wire ctrl,input wire [1:0] S,output wire [7:0] Y1,output wire [7:0] Y2,output wire [7:0] Y);
wire [7:0] Add;
wire [7:0] Carry;
wire [7:0] Diff;
wire [7:0] Borrow;
wire [7:0] quotient;
wire [7:0] remainder;
wire [15:0] m;
fa f1(a,b,ctrl,Add,Carry);
fs s1(a,b,ctrl,Diff,Borrow);
dv d1(a,b,quotient,remainder);
mul p(a,b,m);
mux m1(Add,Diff,quotient,m[15:8],S,Y1);
mux m2(Carry,Borrow,remainder,m[7:0],S,Y2);
assign Y=Y1&Y2;
endmodule