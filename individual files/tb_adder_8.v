`include "adder_8.v"
module tb_adder_8();
reg [7:0] a,b;
reg clk;
reg cin;
wire [7:0]s;
wire c;
adder_8 ad(a,b,clk,cin,s,c);
initial begin
clk=0;
forever begin

#30 clk= ~clk;

end 
end
initial begin
a=8'd8;
b=8'd80;
cin=1'd0;
#120

a=8'd80;
b=8'd80;
cin=1'd0;
#60
a=8'd208;
b=8'd308;
cin=1'd0;
#60

$finish;
end
initial
begin
$dumpfile("add8.vcd");
$dumpvars;
end
endmodule