`include "adder_16.v"
`include"reg16.v"
`include "dec16.v"
`include "mux16.v"
`include "mux2.v"
`include "sign_ext_8_16.v"
`include "mux2_4.v"
`include "mux4.v"
module p2(progc,clk,instrmem,datamem);

//inputs
input clk;//clock
input[15:0]  progc;//intial value of program counter
input [64*1024-1:0] instrmem,datamem; //list of instructions and memory used for storage

wire R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15;//used to activate corresponding reg when writing to it
wire Ra,Rm;//activates ALU Out and MDR
wire [15:0] readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15; //used to read value from reg
wire [15:0] pc;//progrma counter current value
wire[15:0] readbus,sreadbus;//used to store value of selected reg
wire[15:0] areadbus,mreadbus;//stores value computed by ALU out and MDR
wire [15:0] extn;//var storing sign extended value
wire[15:0] aip1,aip2;
wire [15:0]pcinp;
wire [15:0]addr;//final value sent used by instr memory due to mux
wire [3:0]wri_reg;
wire [15:0]writebus;

reg instr_f,instr_d;//used to activate corresponding phases in multicycle approah
reg [15:0]instr;//used to store instruction
reg regw;// when this is 1 and clock is 1 value will be written to reg selected by decoder
reg rst;
reg [15:0]pcnu;//value after adding 2 or 4
reg pcr;//pcwrite is when to accept value ino program counter, pcr is reset
reg[15:0]aop;
reg [1:0] alusrcb,pcsource;
reg pcwrite,IorD,memread,memwrite,memtoreg,irwrite,aluop,alusrca,regwrite,regdst;
reg[3:0] aluctrl;
//Program Counter
reg16 prog_counter(pcnu,pcwrite,pcr,pc);//made as its always after instr_f and pointer has to be increased and in case of jump will have to be rewritten


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

//dec for activate reg to write
dec16 regf1(regw,clk,wri_reg[3],wri_reg[2],wri_reg[1],wri_reg[0],R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15);

//mux to read
mux16 regr1(instr[11],instr[10],instr[9],instr[8],readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15,readbus);
mux16 regr2(instr[7],instr[6],instr[5],instr[4],readbus0,readbus1,readbus2,readbus3,readbus4,readbus5,readbus6,readbus7,readbus8,readbus9,readbus10,readbus11,readbus12,readbus13,readbus14,readbus15,sreadbus);

//ALU(aip1,aip2,aluctrl,aop)

//ALU Out
reg16 aluout(aop,Ra,rst,areadbus);

mux2 pc_mux(IorD,pc,areadbus,addr);
mux2 wd_mux(memtoreg,areadbus,mreadbus,writebus);
mux2_4 wr_mux(regdst,instr[4],instr[5],instr[6],instr[7],instr[0],instr[1],instr[2],instr[3],wri_reg[0],wri_reg[1],wri_reg[2],wri_reg[3]);
mux2 aluA(alusrca,pc,readbus,aip1);
mux4 aluB(alusrcb[0],alusrcb[1],sreadbus,16'd16,extn,shiftleftop,aip2);
mux4 pcip(pcsource[0],pcsource[1],aop,areadbus,shiftleftop2,shiftleftop2,pcinp);

//MDR
reg16 mdr(writebus,Rm,rst,mreadbus);

//sign extend
sign_ext_8_16 se(instr[0],instr[1],instr[2],instr[3],instr[4],instr[5],instr[6],instr[7],extn);//shift 2 spaces before using as address




initial begin//initialisation to 0 unless specified
instr_f=1'd0;
instr_d=1'd0;
regw=1'd0;
instr=16'd0;
rst=1'd0;
pcwrite=1'd0;
pcr=1'd0;
aop=16'd0;

//initialize control
alusrcb=2'd1;
pcsource=2'd0;
pcwrite=1'd0;
IorD=1'd0;
memread=1'd0;
memwrite=1'd0;
memtoreg=1'd0;
irwrite=1'd0;
aluop=1'd0;
alusrca=1'd0;
regwrite=1'd0;
regdst=1'd0;


#5

pcnu=progc;

instr_f=1'd1;

end
always@(posedge instr_f)
begin

pcwrite=1'd1;
#5
instr[15:0]=instrmem[addr];
instr_f=1'd0;
#15//clock cycle
pcwrite=1'd0;
instr_d=1'd1;
end
always@(posedge instr_d)
begin
#10
//ctrl=instr[15:12];
//load program counter
instr_d=1'd0;
end
//pcnu=pc_inp;
endmodule
