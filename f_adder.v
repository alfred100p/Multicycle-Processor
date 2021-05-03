module f_adder(a,b,cin,clk,s,c);
input wire a,b,clk,cin;
reg t1,t2,t3;
output reg s,c;
always@(posedge clk)
begin
t1=a^b;
s=t1^cin;
t2=a&b;
t3=t1&cin;
c=t3|t2;
end
endmodule
