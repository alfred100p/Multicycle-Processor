`include "f_adder.v"
`include "h_adder.v"
module adder_8(a,b,clk,cin,s,c);
input [7:0] a,b;
input clk,cin;
output [7:0]s;
output  c;
wire w1,w2,w3,w4,w5,w6,w7;
f_adder h1(a[0],b[0],cin,clk,s[0],w1);
f_adder f1(a[1],b[1],w1,clk,s[1],w2);
f_adder f2(a[2],b[2],w2,clk,s[2],w3);
f_adder f3(a[3],b[3],w3,clk,s[3],w4);
f_adder f4(a[4],b[4],w4,clk,s[4],w5);
f_adder f5(a[5],b[5],w5,clk,s[5],w6);
f_adder f6(a[6],b[6],w6,clk,s[6],w7);
f_adder f7(a[7],b[7],w7,clk,s[7],c);
endmodule