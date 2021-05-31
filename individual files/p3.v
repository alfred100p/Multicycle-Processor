//actual code starts at 205s due to loading registers
`include "adder_16.v"
`include"reg16.v"
`include "dec16.v"
`include "mux16.v"
`include "mux2.v"
`include "sign_ext_8_16.v"
`include "sign_ext_12_16.v"
`include "mux2_4.v"
`include "mux4.v"
`include "mux4_4.v"
`include "mux8.v"
`include"ALU.v"
`include"alu2.v"
`include"reg_loader.v"
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
