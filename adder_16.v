`include "f_adder.v"

module adder_16(a,b,clk,cin,s,c);
input [15:0] a,b;
input clk,cin;
output [15:0]s;
output  c;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
f_adder h1(a[0],b[0],cin,clk,s[0],w1);
f_adder f1(a[1],b[1],w1,clk,s[1],w2);
f_adder f2(a[2],b[2],w2,clk,s[2],w3);
f_adder f3(a[3],b[3],w3,clk,s[3],w4);
f_adder f4(a[4],b[4],w4,clk,s[4],w5);
f_adder f5(a[5],b[5],w5,clk,s[5],w6);
f_adder f6(a[6],b[6],w6,clk,s[6],w7);
f_adder f7(a[7],b[7],w7,clk,s[7],w8);
f_adder f8(a[8],b[8],w8,clk,s[8],w9);
f_adder f9(a[9],b[9],w9,clk,s[9],w10);
f_adder f10(a[10],b[10],w10,clk,s[10],w11);
f_adder f11(a[11],b[11],w11,clk,s[11],w12);
f_adder f12(a[12],b[12],w12,clk,s[12],w13);
f_adder f13(a[13],b[13],w13,clk,s[13],w14);
f_adder f14(a[14],b[14],w14,clk,s[14],w15);
f_adder f15(a[15],b[15],w15,clk,s[15],c);
endmodule