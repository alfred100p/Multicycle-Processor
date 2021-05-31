//Alfred William Jacob 2018A7PS0266P

module f_adder(a,b,cin,clk,s,c);
input  a,b,clk,cin;
reg t1,t2,t3;
output reg s,c;
always@(posedge clk)
begin
t1=a^b;
s=t1^cin;
t2=a&b;
t3=t1&cin;
c=t3|t2;
end
endmodule

module tb_f_adder();
reg a,b;
reg cin,clk;
wire s;
wire c;
f_adder f (a,b,cin,clk,s,c);
initial begin
clk=0;
forever begin

#10 clk= ~clk;

end 
end
initial begin
a=1'd1;
b=1'd0;
cin=1'd1;
#20
a=1'd1;
b=1'd1;
cin=1'd1;
#20
a=1'd0;
b=1'd0;
cin=1'd1;
//#20
//$finish;
end
initial
begin
//$dumpfile("fadd.vcd");
//$dumpvars;
end
endmodule

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

module tb_adder_16();
reg [15:0] a,b;
reg clk;
reg cin;
wire [15:0]s;
wire c;
adder_16 ad(a,b,clk,cin,s,c);
initial begin
clk=0;
forever begin

#1 clk= ~clk;

end 
end
initial begin
a=16'd8;
b=16'd80;
cin=1'd0;
#240

a=16'd80;
b=16'd80;
cin=1'd0;
#240
a=16'd208;
b=16'd308;
cin=1'd0;
//#240

//$finish;
end
initial
begin
//$dumpfile("add16.vcd");
//$dumpvars;
end
endmodule

module dec16(ip,clk,i1,i2,i3,i4,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15);
input ip,i1,i2,i3,i4,clk;
output reg o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15;
initial begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end

always@(*)
begin
if(~i1&~i2&~i3&~i4)
begin
o0=ip&clk;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&~i2&~i3&i4)
begin
o0=1'd0;
o1=ip&clk;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&~i2&i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=ip&clk;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&~i2&i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=ip&clk;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&i2&~i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=ip&clk;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&i2&~i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=ip&clk;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&i2&i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=ip&clk;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(~i1&i2&i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=ip&clk;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(i1&~i2&~i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=ip&clk;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(i1&~i2&~i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=ip&clk;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(i1&~i2&i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=ip&clk;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(i1&~i2&i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=ip&clk;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(i1&i2&~i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=ip&clk;
o13=1'd0;
o14=1'd0;
o15=1'd0;
end
else if(i1&i2&~i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=ip&clk;
o14=1'd0;
o15=1'd0;
end
else if(i1&i2&i3&~i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=ip&clk;
o15=1'd0;
end
else if(i1&i2&i3&i4)
begin
o0=1'd0;
o1=1'd0;
o2=1'd0;
o3=1'd0;
o4=1'd0;
o5=1'd0;
o6=1'd0;
o7=1'd0;
o8=1'd0;
o9=1'd0;
o10=1'd0;
o11=1'd0;
o12=1'd0;
o13=1'd0;
o14=1'd0;
o15=ip&clk;
end
end

endmodule

module tb_dec16();
reg [3:0] a;
reg ip,clk;
wire [15:0]s;
dec16 ad(ip,clk,a[3],a[2],a[1],a[0],s[0],s[1],s[2],s[3],s[4],s[5],s[6],s[7],s[8],s[9],s[10],s[11],s[12],s[13],s[14],s[15]);
initial begin
clk=0;
forever begin

#1 clk= ~clk;

end 
end
initial begin
ip=1'd1;
a=4'd0;
#5
a=4'd1;
#5
a=4'd2;
#5
a=4'd3;
#5
a=4'd4;
#5
a=4'd5;
#5
a=4'd6;
#5
a=4'd7;
#5
a=4'd8;
#5
a=4'd9;
#5
a=4'd10;
#5
a=4'd11;
#5
a=4'd12;
#5
a=4'd13;
#5
a=4'd14;
#5
a=4'd15;
//#5
//$finish;
end
initial
begin
//$dumpfile("dec16.vcd");
//$dumpvars;
end
endmodule

module dff(d,clk,rst,q);
input  d,clk,rst;
output reg q;
always@(posedge clk)
begin
if(rst)
begin
q=0;
end
else
begin
q=d;
end
end
endmodule

module mux16(i1,i2,i3,i4,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,op);
input [15:0] o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15;
input i1,i2,i3,i4;
output reg[15:0] op;
always@(*)
begin
if(~i1&~i2&~i3&~i4)
begin
op=o0;
end
else if(~i1&~i2&~i3&i4)
begin
op=o1;
end
else if(~i1&~i2&i3&~i4)
begin
op=o2;
end
else if(~i1&~i2&i3&i4)
begin
op=o3;
end
else if(~i1&i2&~i3&~i4)
begin
op=o4;
end
else if(~i1&i2&~i3&i4)
begin
op=o5;
end
else if(~i1&i2&i3&~i4)
begin
op=o6;
end
else if(~i1&i2&i3&i4)
begin
op=o7;
end
else if(i1&~i2&~i3&~i4)
begin
op=o8;
end
else if(i1&~i2&~i3&i4)
begin
op=o9;
end
else if(i1&~i2&i3&~i4)
begin
op=o10;
end
else if(i1&~i2&i3&i4)
begin
op=o11;
end
else if(i1&i2&~i3&~i4)
begin
op=o12;
end
else if(i1&i2&~i3&i4)
begin
op=o13;
end
else if(i1&i2&i3&~i4)
begin
op=o14;
end
else if(i1&i2&i3&i4)
begin
op=o15;
end
end

endmodule

module mux2_4(i1,o00,o01,o02,o03,o10,o11,o12,o13,op0,op1,op2,op3);
input  o00,o01,o02,o03,o10,o11,o12,o13;
input i1;
output reg op0,op1,op2,op3;
always@(*)
begin
if(i1)
begin
op0=o10;
op1=o11;
op2=o12;
op3=o13;
end
else if(~i1)
begin
op0=o00;
op1=o01;
op2=o02;
op3=o03;
end
end
endmodule

module mux2(i1,o0,o1,op);
input [15:0] o0,o1;
input i1;
output reg[15:0] op;
always@(*)
begin
if(i1)
begin
op=o1;
end
else if(~i1)
begin
op=o0;
end
end
endmodule


module mux4_4(i1,i2,o00,o01,o02,o03,o10,o11,o12,o13,o20,o21,o22,o23,o30,o31,o32,o33,op0,op1,op2,op3);
input  o00,o01,o02,o03,o10,o11,o12,o13,o20,o21,o22,o23,o30,o31,o32,o33;
input i1,i2;
output reg op0,op1,op2,op3;
always@(*)
begin
if(~i2&i1)
begin
op0=o10;
op1=o11;
op2=o12;
op3=o13;
end
else if(~i2&~i1)
begin
op0=o00;
op1=o01;
op2=o02;
op3=o03;
end
else if(i2&i1)
begin
op0=o30;
op1=o31;
op2=o32;
op3=o33;
end
else if(i2&~i1)
begin
op0=o20;
op1=o21;
op2=o22;
op3=o23;
end
end
endmodule

module mux4(i1,i2,o0,o1,o2,o3,op);
input [15:0] o0,o1,o2,o3;
input i1,i2;
output reg[15:0] op;
always@(*)
begin
if(i1&i2)
begin
op=o3;
end
else if(i2&~i1)
begin
op=o2;
end
else if(~i2&i1)
begin
op=o1;
end
else if(~i2&~i1)
begin
op=o0;
end
end
endmodule

module mux8(i1,i2,i3,o0,o1,o2,o3,o4,o5,o6,o7,op);
input [15:0] o0,o1,o2,o3,o4,o5,o6,o7,o8;
input i1,i2,i3;
output reg[15:0] op;
always@(*)
begin
if(~i3&i1&i2)
begin
op=o3;
end
else if(~i3&i2&~i1)
begin
op=o2;
end
else if(~i3&~i2&i1)
begin
op=o1;
end
else if(~i3&~i2&~i1)
begin
op=o0;
end
if(i3&i1&i2)
begin
op=o7;
end
else if(i3&i2&~i1)
begin
op=o6;
end
else if(i3&~i2&i1)
begin
op=o5;
end
else if(i3&~i2&~i1)
begin
op=o4;
end
end
endmodule

module reg16(ip,clk,rst,op);
input [15:0]ip;
input clk,rst;
output [15:0]op;
dff d0(ip[0],clk,rst,op[0]);
dff d1(ip[1],clk,rst,op[1]);
dff d2(ip[2],clk,rst,op[2]);
dff d3(ip[3],clk,rst,op[3]);
dff d4(ip[4],clk,rst,op[4]);
dff d5(ip[5],clk,rst,op[5]);
dff d6(ip[6],clk,rst,op[6]);
dff d7(ip[7],clk,rst,op[7]);
dff d8(ip[8],clk,rst,op[8]);
dff d9(ip[9],clk,rst,op[9]);
dff d10(ip[10],clk,rst,op[10]);
dff d11(ip[11],clk,rst,op[11]);
dff d12(ip[12],clk,rst,op[12]);
dff d13(ip[13],clk,rst,op[13]);
dff d14(ip[14],clk,rst,op[14]);
dff d15(ip[15],clk,rst,op[15]);
endmodule

module sign_ext_12_16(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,b);
input a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11;
output reg [15:0]b;
always@(*)
begin
b[0]=a0;
b[1]=a1;
b[2]=a2;
b[3]=a3;
b[4]=a4;
b[5]=a5;
b[6]=a6;
b[7]=a7;
b[8]=a8;
b[9]=a9;
b[10]=a10;
b[11]=a11;
b[12]=a11;
b[13]=a11;
b[14]=a11;
b[15]=a11;
end
endmodule

module sign_ext_8_16(a0,a1,a2,a3,a4,a5,a6,a7,b);
input a0,a1,a2,a3,a4,a5,a6,a7;
output reg [15:0]b;
always@(*)
begin
b[0]=a0;
b[1]=a1;
b[2]=a2;
b[3]=a3;
b[4]=a4;
b[5]=a5;
b[6]=a6;
b[7]=a7;
b[8]=a7;
b[9]=a7;
b[10]=a7;
b[11]=a7;
b[12]=a7;
b[13]=a7;
b[14]=a7;
b[15]=a7;
end
endmodule

module tb_mux16();
reg [3:0] a;
wire[15:0] op;
reg [15:0]s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;
mux16 ad(a[3],a[2],a[1],a[0],s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,op);
initial begin
s0=16'd0;
s1=16'd1;
s2=16'd2;
s3=16'd3;
s4=16'd4;
s5=16'd5;
s6=16'd6;
s7=16'd7;
s8=16'd8;
s9=16'd9;
s10=16'd10;
s11=16'd11;
s12=16'd12;
s13=16'd13;
s14=16'd14;
s15=16'd15;


a=4'd0;
#5
a=4'd1;
#5
a=4'd2;
#5
a=4'd3;
#5
a=4'd4;
#5
a=4'd5;
#5
a=4'd6;
#5
a=4'd7;
#5
a=4'd8;
#5
a=4'd9;
#5
a=4'd10;
#5
a=4'd11;
#5
a=4'd12;
#5
a=4'd13;
#5
a=4'd14;
#5
a=4'd15;
//#5
//$finish;
end
initial
begin
//$dumpfile("mux16.vcd");
//$dumpvars;
end
endmodule

//actual code starts at 205s due to loading registers

module p3(progc,clk);

//use dat files
//inputs
input clk;//clock
input[15:0]  progc;//intial value of program counter
reg [15:0] datamem[0:32767],instrmem[0:32767]; //list of instructions and memory used for storage
reg [15:0] registers[0:15];
wire R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15;//used to activate corresponding reg when writing to it
wire Rm;//MDR
wire [15:0] readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15; //used to read value from reg
wire [15:0] pc;//progrma counter current value
wire[15:0] readbus,sreadbus;//used to store value of selected reg
wire[15:0] areadbus,mreadbus;//stores value computed by ALU out and MDR
wire [15:0] extn,extn2;//var storing sign extended value from 8 and 12 bits
wire[15:0] aip1,aip2;//alu ip

wire [15:0]addr;//final value sent used by instr memory due to mux
wire [15:0]writebus,writbus,wribus;
wire [3:0]rr1,rr2;//ip to read register

reg instr_f,instr_d,exc,exclock;//used to activate corresponding phases in multicycle approah
reg [15:0]instr;//used to store instruction
reg rst;//rest for registers
reg regw;//signal to allow wirting to registers
reg [15:0]pcnu;//value after adding 2 
reg pcwrite,pcr,pc0,pc1;//pc0 is when to accept value into program counter, pcr is reset, pc1 and pcwrite are intermediates in calculation of pc0
wire[15:0]aop;//ouput of alu
reg[15:0] zex8,zex4;//used to store zero exended of 8 and 4 bits
reg pcwritecond;//when aluzero is active if this is also activ this will allow wirting to pc
reg [1:0]RR1;//selection line for mux to rrq
reg RR2,alusrca;//selection lines for rr2 and a
reg [2:0]alusrcb;//selection line for b
reg aluzero;//becomes 1 if alu op is 0 useful for branch statements
reg [15:0]shextn;//sign extension shifted by 1 bit
reg Ra;//activation for alu out to be written  on
reg pcIP;
reg[3:0]aluctrl;
reg [1:0]fctrl;
reg memtoreg;
reg [15:0] regload;
reg RL,mem;


//Program Counter
reg16 prog_counter(pcnu,pc0,pcr,pc);//made as its always after instr_f and pointer has to be increased and in case of jump will have to be rewritten


//16 registers
reg16 r0(writebus,R0,1'd1,readbus0);//rst set to 1 as r0 always 0
reg16 r1(writebus,R1,rst,readbus1);
reg16 r2(writebus,R2,rst,readbus2);
reg16 r3(writebus,R3,rst,readbus3);
reg16 r4(writebus,R4,rst,readbus4);
reg16 r5(writebus,R5,rst,readbus5);
reg16 r6(writebus,R6,rst,readbus6);
reg16 r7(writebus,R7,rst,readbus7);
reg16 r8(writebus,R8,rst,readbus8);
reg16 r9(writebus,R9,rst,readbus9);
reg16 r10(writebus,R10,rst,readbus10);
reg16 r11(writebus,R11,rst,readbus11);
reg16 r12(writebus,R12,rst,readbus12);
reg16 r13(writebus,R13,rst,readbus13);
reg16 r14(writebus,R14,rst,readbus14);
reg16 r15(writebus,R15,rst,readbus15);

reg_loader rload(regload,RL&clk,writbus);

//dec for activate reg to write
dec16 regf1(regw,clk,instr[11],instr[10],instr[9],instr[8],R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15);

//mux to read
mux16 regr1(rr1[3],rr1[2],rr1[1],rr1[0],readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15,readbus);
mux16 regr2(rr2[3],rr2[2],rr2[1],rr2[0],readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15,sreadbus);

ALU2 alu(aip1,aip2,fctrl,aluctrl,clk,aop);

//ALU Out

mux2 pcip(pcIP,aop,areadbus,addr);

mux4_4 readreg1(RR1[0],RR1[1],instr[8],instr[9],instr[10],instr[11],instr[4],instr[5],instr[6],instr[7],instr[10],instr[11],1'd1,1'd1,1'd0,1'd0,1'd0,1'd0,rr1[0],rr1[1],rr1[2],rr1[3]);
mux2_4 readreg2(RR1[1],instr[0],instr[1],instr[2],instr[3],instr[8],instr[9],1'd0,1'd1,rr2[0],rr2[1],rr2[2],rr2[3]);
mux2 wd_mux(memtoreg,areadbus,mreadbus,wribus);
mux2 wd_mux2(RL,wribus,writbus,writebus);
mux2 aluA(alusrca,pc,readbus,aip1);
mux8 aluB(alusrcb[0],alusrcb[1],alusrcb[2],sreadbus,16'd1,extn,shextn,zex8,zex4, extn2,16'd0 ,aip2);

reg16 aluout(aop,Ra,rst,areadbus);
//MDR
reg16 mdr(writebus,Rm,rst,mreadbus);

//sign extend
sign_ext_8_16 se(instr[0],instr[1],instr[2],instr[3],instr[4],instr[5],instr[6],instr[7],extn);
sign_ext_12_16 se12(instr[0],instr[1],instr[2],instr[3],instr[4],instr[5],instr[6],instr[7],instr[8],instr[9],instr[10],instr[11],extn2);


//control
always@(*)
begin
pc1=pcwritecond&aluzero;
pc0=pcwrite|pc1;
exclock=exc&clk;
shextn[15:1]=extn[14:0];
RR1[0]=aluctrl[3]&((~aluctrl[0]&~aluctrl[1])|(aluctrl[0]&aluctrl[1]));
RR1[1]=~aluctrl[3]&~aluctrl[2]&(aluctrl[0]|aluctrl[1]);
end
always@(negedge exclock) 
begin

zex8[7:0]=instr[7:0];
zex4[3:0]=instr[7:4];
fctrl[1:0]=instr[1:0];
aluzero=~areadbus[0]&~areadbus[1]&~areadbus[2]&~areadbus[3]&~areadbus[4]&~areadbus[5]&~areadbus[6]&~areadbus[7]&~areadbus[8]&~areadbus[9]&~areadbus[10]&~areadbus[11]&~areadbus[12]&~areadbus[13]&~areadbus[14]&~areadbus[15];

memtoreg=~aluctrl[3]&~aluctrl[2]&aluctrl[0]&~aluctrl[1];
alusrca=~(~aluctrl[3]&~aluctrl[2]&aluctrl[0]&aluctrl[1]);
alusrcb[2]=(aluctrl[3]&aluctrl[1]&~aluctrl[0])|(~aluctrl[3]&~aluctrl[2]&~aluctrl[0])|(~aluctrl[3]&~aluctrl[2]&aluctrl[1]);
alusrcb[1]=(~aluctrl[3]&~aluctrl[2]&aluctrl[0])|(~aluctrl[3]&aluctrl[2]&aluctrl[1])|(aluctrl[3]&~aluctrl[1]&aluctrl[0]);
alusrcb[0]=(~aluctrl[3]&~aluctrl[2]&~aluctrl[0]);
//pcIP=~aluctrl[3]&aluctrl[2]&~aluctrl[1];

end

initial begin
#20//intial wait required as new register values are written and have to be stored
$readmemh("datamem.dat",datamem);
$readmemh("instrmem.dat",instrmem);
$readmemh("reg.dat",registers);
//load registers
//memtoreg=1'd1;
RL=1'd1;
regw=1'd1;
regload=registers[0];
instr[11:8]=4'd0;
#10;
regload=registers[1];
instr[11:8]=4'd1;#10
regload=registers[2];
instr[11:8]=4'd2;#10
regload=registers[3];
instr[11:8]=4'd3;#10
regload=registers[4];
instr[11:8]=4'd4;#10
regload=registers[5];
instr[11:8]=4'd5;#10
regload=registers[6];
instr[11:8]=4'd6;#10
regload=registers[7];
instr[11:8]=4'd7;#10
regload=registers[8];
instr[11:8]=4'd8;#10
regload=registers[9];
instr[11:8]=4'd9;#10
regload=registers[10];
instr[11:8]=4'd10;#10
regload=registers[11];
instr[11:8]=4'd11;#10
regload=registers[12];
instr[11:8]=4'd12;#10
regload=registers[13];
instr[11:8]=4'd13;#10
regload=registers[14];
instr[11:8]=4'd14;#10
regload=registers[15];
instr[11:8]=4'd15;
#10
//memtoreg=1'd0;
//180 seconds

//initialisation to 0 unless specified
regw=1'd0;
RL=1'd0;
instr_f=1'd0;
instr_d=1'd0;
mem=1'd0;
exc=1'd0;
shextn[0]=1'd0;
zex8[15:8]=8'd0;
zex4[15:4]=12'd0;
instr_d=1'd0;
regw=1'd0;
instr=16'd0;
rst=1'd0;
pcwrite=1'd0;
pcr=1'd0;
pcwritecond=1'd0;
RR1=2'd0;
//RR2=1'd0;
alusrca=1'd0;
alusrcb=3'd0;
Ra=1'd0;
pcIP=1'd0;
//aluclk=1'd0;
//loading pc
#14
pcnu[15:0]=progc[15:0];
pcwrite=1'd1;
#1
pcwrite=1'd0;
alusrca=1'd0;
alusrcb=3'd1;
aluctrl[3:0]=4'b1000;
#10
instr_f=1'd1;

end
always@(posedge instr_f)
begin

instr[15:0]=instrmem[pc];
alusrca=1'd0;
alusrcb=3'd1;
aluctrl[3:0]=4'b1000;
#5//5 is half clock cycle
pcnu=addr;
alusrcb=3'd3;

instr_f=1'd0;
#3

pcwrite=1'd1;


#2
pcwrite=1'd0;
instr_d=1'd1;
end
always@(posedge instr_d)
begin
aluctrl[3:0]=instr[15:12];
exc=1'd1;


#5
Ra=1'd1;

#5
Ra=1'd0;
instr_d=1'd0;

end
always@(posedge exc)
begin
#10
if(~aluctrl[3]&aluctrl[2]&~aluctrl[1])
begin
pcIP=1'd1;
pcwrite=1'd1;
#5
pcIP=1'd0;
pcwrite=1'd0;
#5
exc=1'd0;
instr_f=1'd1;
end
else if(~aluctrl[3]&~aluctrl[2]&aluctrl[1]&aluctrl[0])
begin
pcIP=1'd1;
pcwrite=1'd1;
#5
pcIP=1'd0;
pcwrite=1'd0;
#5
exc=1'd0;
instr_f=1'd1;

end
else
begin
#5
Ra=1'd1;

#5
Ra=1'd0;
exc=1'd0;
mem=1'd1;
end
end
always@(posedge mem)
begin
if(~aluctrl[3]&~aluctrl[2]&~aluctrl[1]&aluctrl[0])
begin
#10

alusrca=1'd0;
alusrcb=3'd1;
aluctrl[3:0]=4'b1000;
instr_f=1'd1;
end
else if(~aluctrl[3]&~aluctrl[2]&aluctrl[1]&aluctrl[0]) begin
datamem[areadbus]=sreadbus;

$writememh("datamem.dat",datamem);
#10
instr_f=1'd1;
end
else begin
regw=1'd1;
#5
alusrca=1'd0;
alusrcb=3'd1;
aluctrl[3:0]=4'b1000;
regw=1'd0;
#5


instr_f=1'd1;
$display("[$display] opcode 0x%0h ip1=0x%0h ip2=0x%0h op=0x%0h",instr[15:12],readbus,sreadbus,writebus);
end
mem=1'd0;
end
endmodule

module tb_p3();
reg clk;
reg[15:0]  pc_nu;
reg [15:0] datamem[0:32767],instrmem[0:32767];
reg [15:0] registers[0:15];
p3 p(pc_nu,clk);
integer i;

initial begin
clk=0;
forever begin

#5 clk= ~clk;

end 
end

initial begin
$readmemh("datamem.dat",datamem);
//$readmemh("instrmem.dat",instrmem);
$readmemh("reg.dat",registers);
	registers[0]=16'd1;
	registers[1]=16'd90;
	registers[2]=16'd3;
	registers[3]=16'd4;
	registers[4]=16'd5;
	registers[5]=16'd6;
	registers[6]=16'd7;
	registers[7]=16'd8;
	registers[8]=16'd9;
	registers[9]=16'd10;
	registers[10]=16'd0;
	registers[11]=16'd12;
	registers[12]=16'd13;
	registers[13]=16'd14;
	registers[14]=16'd15;
	registers[15]=16'd16;
	instrmem[0]=16'b1000100000001010;//r8=r0(0)+r10(10)=10
    instrmem[1]=16'b1000100100011010;	//r9=r1(1)+r10(10)=11
    instrmem[2]=16'b1001100100001010;//r9=r9+10=21
	instrmem[3]=16'b1001100111111011;//r9=r9+-5=16
	instrmem[4]=16'b1010100100001010;//r9=r9+10=26
	instrmem[5]=16'b1010100110000110;//r9=r9+134=160(128+32)
	instrmem[6]=16'b1100100000001010;//r8=r0(0)-r10(10)=-10
    instrmem[7]=16'b1100101100011010;	//r11=r1(1)-r10(10)=11
    instrmem[8]=16'b1101100100001010;//r9=r9-10=150
	instrmem[9]=16'b1101100111111011;//r9=r9--5=155
	instrmem[10]=16'b1110100100001010;//r9=r9-10=145
	instrmem[11]=16'b1110100110000110;//r9=145-134=11
	instrmem[12]=16'b0000001000110001;
	instrmem[13]=16'b0000010101110001;
	instrmem[14]=16'b0000010000110010;
	instrmem[15]=16'b0000010011110010;
	instrmem[16]=16'b0000010100110011;
	instrmem[17]=16'b0000010001110011;
	instrmem[18]=16'b1011100100110001;
	instrmem[19]=16'b1011100001110001;
	instrmem[20]=16'b1111100100110001;
	instrmem[21]=16'b1111100001110001;
	instrmem[22]=16'b0111100100110001;
	instrmem[23]=16'b0111100000000000;
	instrmem[24]=16'b0110100100110001;
	instrmem[25]=16'b0110100000000000;
	instrmem[26]=16'b0001101100110001;
	instrmem[27]=16'b0011100001110001;
	instrmem[86]=16'b0010110100110001;
	instrmem[87]=16'b0001100001110001;
	instrmem[88]=16'b0010100001110001;
	
    instrmem[89]=16'b0100001000110001;
	instrmem[721]=16'b0110100001110001;
	instrmem[722]=16'b0100001100001000;//equal
	instrmem[723]=16'b0000111100110101;
	instrmem[724]=16'b0000101100110001;
	
	
	$writememh("datamem.dat",datamem);
	$writememh("instrmem.dat",instrmem);
	$writememh("reg.dat",registers);

pc_nu=16'd0;
#1700//takes 1605s starts at 205s
$finish;
end
initial
begin
$dumpfile("p3.vcd");
$dumpvars;
end
endmodule



module ALU2(aip1,aip2,fctrl,aluctrl,clk,aop);
input [15:0] aip1,aip2;
input [1:0] fctrl;
input [3:0]aluctrl;
input clk;
output reg [15:0] aop;


always@(posedge clk)
begin
if(aluctrl[3:0]==4'd0) begin
if (fctrl[1:0]==2'd1) begin
aop=aip1<<aip2;
end
else if (fctrl[1:0]==2'd2) begin
aop=aip1>>>aip2;
end
else if (fctrl[1:0]==2'd3) begin
aop=aip1>>aip2;
end
end 
else if (aluctrl[3:0]==4'd8) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd9) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd10) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd12) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd13) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd14) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd11) begin
aop=~(aip1|aip2);
end
else if (aluctrl[3:0]==4'd15) begin
aop=aip1|aip2;
end
else if (aluctrl[3:0]==4'd7) begin
aop=~(aip1|aip2);
end
else if (aluctrl[3:0]==4'd6) begin
aop=aip1|aip2;
end
else if (aluctrl[3:0]==4'd4) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd5) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd3) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd2) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd1) begin
aop=aip1+aip2;
end
/*
reg[15:0] a,b,c;
wire temp;
wire [15:0] extn;
reg [15:0]aop1;
wire[15:0]aop2;
reg [15:0]orop;
wire [15:0] sftop;
reg [15:0] sllop,srlop,sarop;
reg [15:0]nandop;
//adder_16 a1(aip1,aip2,clk,aluctrl[2],aop1,temp);
mux4 shftop(fctrl[0],fctrl[1],sarop,sllop,srlop,sarop,sftop);
mux2 op1(aluctrl[3]^aluctrl[2]^aluctrl[0],nandop,orop,aop2);
mux4 op((~aluctrl[0]&~aluctrl[1]&~aluctrl[2]&~aluctrl[3]),((aluctrl[3]&aluctrl[0])|(aluctrl[2]&~aluctrl[3]))&aluctrl[1],aop1,aop2,sftop,16'd0,aop);

always@(posedge clk)
begin
orop=aip1|aip2;


nandop=~orop;
sllop=aip1<<aip2;
sarop=aip1>>>aip2;
srlop=aip1>>aip2;
if(aluctrl[2])
begin 
aop1=aip1-aip2;
end
else
begin
aop1=aip1+aip2;
end*/

end 
endmodule

module reg_loader(ip,on,op);
input [15:0] ip;
input on;
output reg [15:0] op;
always @(posedge on)
begin
op=ip;
end
endmodule
