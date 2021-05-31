`include "h_adder.v"
module tb_h_adder();
reg a,b;
reg clk;
wire s;
wire c;
h_adder f (a,b,clk,s,c);
initial begin
clk=0;
forever begin

#10 clk= ~clk;

end 
end
initial begin
a=1'd1;
b=1'd0;
#20
a=1'd1;
b=1'd1;
#20
a=1'd0;
b=1'd0;
#20
$finish;
end
initial
begin
$dumpfile("hadd.vcd");
$dumpvars;
end
endmodule