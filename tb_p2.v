`include "p2.v"
module tb_p2();
reg clk;
reg[15:0]  pc_nu;
reg [64*1024-1:0] instrmem,datamem;//65536

p2 p(pc_nu,clk,instrmem,datamem);
initial begin
clk=0;
forever begin

#1 clk= ~clk;

end 
end
initial begin
pc_nu=16'd0;
instrmem=65536'd63;
instrmem[65535:65525]=10'd1023;
#100
$finish;
end
initial
begin
$dumpfile("p2.vcd");
$dumpvars;
end
endmodule
