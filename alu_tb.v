`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2023 06:12:13
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
reg [7:0] a,b;
reg ctrl;
reg [1:0] S;

wire [7:0] Y1,Y2;
wire [7:0] Y;

alu dut(
    .a(a),
    .b(b),
    .ctrl(ctrl),
    .S(S),
    .Y1(Y1),
    .Y2(Y2),
    .Y(Y)
    );
initial begin
a=8'b10111111;
b=8'b00110011;
ctrl=1;
S=2'b11;
#10;
$finish();
end
endmodule
