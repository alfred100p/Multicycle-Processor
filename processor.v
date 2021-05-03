`include "adder_16.v"
`include"reg16.v"
module procesor(pc_nuclk);
input clk;
reg[15:0]  pc_count;
wire[15:0]pc;//variable used to store content of program counter useful for cases like jump
reg instr_f;
reg [15:0] writebus;//reg used to store value to be written;
wire[15:0] readbus;
reg R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15;// WHEN CORRESPONDING REG HAS TO BE MODIFIED WILL BE MADE 1
reg rst;
reg pc0,pcr;//pc activation and reset

reg16 progc(pc_nu,pc0,pcr,pc);//made as its always after instr_f and pointer has to be increased and in case of jump will have to be rewritten
reg16 r0(writebus,R0,1'd1,readbus);//rst set to 1 as r0 always 0
reg16 r1(writebus,R1,rst,readbus);
reg16 r2(writebus,R2,rst,readbus);
reg16 r3(writebus,R3,rst,readbus);
reg16 r4(writebus,R4,rst,readbus);
reg16 r5(writebus,R5,rst,readbus);
reg16 r6(writebus,R6,rst,readbus);
reg16 r7(writebus,R7,rst,readbus);
reg16 r8(writebus,R8,rst,readbus);
reg16 r9(writebus,R9,rst,readbus);
reg16 r10(writebus,R10,rst,readbus);
reg16 r11(writebus,R11,rst,readbus);
reg16 r12(writebus,R12,rst,readbus);
reg16 r13(writebus,R13,rst,readbus);
reg16 r14(writebus,R14,rst,readbus);
reg16 r15(writebus,R15,rst,readbus);

adder_16 ad(pc,16'd16,instr_f,1'd0,pc_nu,_);



initial
begin
pc0=1;//load program counter
rst=1'd0;
R0=1'd1;
R1=1'd0;
R2=1'd0;
R3=1'd0;
R4=1'd0;
R5=1'd0;
R6=1'd0;
R7=1'd0;
R8=1'd0;
R9=1'd0;
R10=1'd0;
R11=1'd0;
R12=1'd0;
R13=1'd0;
R14=1'd0;
R15=1'd0;
#10
pc0=0;
instr_f=1'b1;//load instr_f after pc is intialiased
//keep await for clock to wite 0
end
 
always@(instr_f)
begin

//asign mem[15:0]pc=[pc_count+15:pc_count]instr_mem
#10//wait for add 
//pc_count=pc_nu;
//if instr_d happens always asfter instr_f set it to 1
instr_f=0;
end
endmodule