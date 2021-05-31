`include "adder_16.v"
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
#240

$finish;
end
initial
begin
$dumpfile("add16.vcd");
$dumpvars;
end
endmodule