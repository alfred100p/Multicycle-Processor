`include "adder_16.v"
`include"reg16.v"
`include "dec16.v"
`include "mux16.v"
`include "mux2.v"
`include "sign_ext_8_16.v"
module processor(pcnu,clk,instrmem,datamem);
input clk;
input[15:0]  pcnu;
wire[15:0] pc_nu;
reg [15:0]pcnu2;
input [64*1024-1:0] instrmem,datamem;
wire[15:0]pc;//variable used to store content of program counter useful for cases like jump
reg instr_f,instr_d;
reg [15:0] writebus;//reg used to store value to be written;
wire[15:0] readbus,sreadbus,mreadbus,areadbus,readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15;
reg [15:0]  ctrl;
wire[15:0] add_writebus;
//wire R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15;
wire R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,Rm;// WHEN CORRESPONDING REG HAS TO BE MODIFIED WILL BE MADE 1
reg rst;
reg pc0,pcr;//pc activation and reset
reg rf1;
reg [15:0]instr;
wire [15:0] extn;
reg c;//op of ctrl

//mux2 pc_mux(c,pc_nu,jmp,pcnu2);


//PC
reg16 progc(pcnu2,pc0,pcr,pc);//made as its always after instr_f and pointer has to be increased and in case of jump will have to be rewritten
adder_16 ad(pc,16'd2,clk,1'd0,pc_nu,_);//remove only have alu


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
reg16 mdr(writebus,Rm,rst,mreadbus);

reg16 aluout(writebus,Ra,rst,areadbus);

//dec for activate reg to write
dec16 regf1(rf1,clk,instr[11],instr[10],instr[9],instr[8],R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15);

//mux to read
mux16 regr1(instr[11],instr[10],instr[9],instr[8],readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15,readbus);
mux16 regr2(instr[7],instr[6],instr[5],instr[4],readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15,sreadbus);

//sign extend
sign_ext_8_16 se(instr[0],instr[1],instr[2],instr[3],instr[4],instr[5],instr[6],instr[7],extn);//shift 2 spaces before using as address

//todo
adder_16 alu_add(readbus,sreadbus,clk,instr[14],add_writebus,_);//remove only have alu





initial
begin
#1//without this wait below code line doesnt work may be related to load time
pcnu2[15:0]=pcnu[15:0];
pcr=1'd0;
rst=1'd0;
rf1=1'd1;//load 0 to r0
instr[11:8]=4'd0;
pc0=1'd0;
instr_f=1'd0;

instr_d=1'd0;
#1//load program counter
pc0=1'd1;
#1
pc0=1'd0;
#10//assume 10 is 1 clock cycle

instr_f=1'd1;//load instr_f after pc is intialiased
rf1=1'd0;
#1
instr_f=1'd0;
//keep await for clock to wite 0
end
 
always@(posedge instr_f)
begin

instr[15:0]=instrmem[pc];
#10//wait for add 
pcnu2[15:0]=pc_nu[15:0];

pc0=1'd1;
#1
pc0=1'd0;
//if instr_d happens always asfter instr_f set it to 1
instr_d=1'd1;
instr_f=1'd0;

end
always@(posedge instr_d)
begin
#1
ctrl=instr[15:12];
//load program counter
instr_d=1'd0;
instr_f=1'd1;
end
//always@(posedge exec)
//begin

//end


endmodule