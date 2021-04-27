module procesor();
reg[15:0] pc;
int pc_count;
bit instr_f;

initial
begin
pc_count=0;
instr_f=1'b1;
end

always@(instr_f)
begin

//asign mem[15:0]pc=[pc_count+15:pc_count]instr_mem
pc_count+=16;
//if instr_d happens always asfter instr_f set it to 1
instr_f=0;
end