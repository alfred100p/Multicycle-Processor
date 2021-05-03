`include "adder_16.v"
module procesor(clk);
input clk;
reg[15:0] pc;
int pc_count,pc_nu;//variable used to store content of program counter useful for cases like jump
bit instr_f;
adder_16 ad(pc_count,16'd16,instr_f,1'd0,pc_nu,_);
initial
begin
pc_count=0;
instr_f=1'b1;
end

always@(instr_f)
begin

//asign mem[15:0]pc=[pc_count+15:pc_count]instr_mem
#10//wait for add 
pc_count=pc_nu;
//if instr_d happens always asfter instr_f set it to 1
instr_f=0;
end