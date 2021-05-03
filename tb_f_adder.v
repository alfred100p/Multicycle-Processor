`include "f_adder.v"
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
#20
$finish;
end
initial
begin
$dumpfile("fadd.vcd");
$dumpvars;
end
endmodule