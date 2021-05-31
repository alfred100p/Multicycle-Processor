module h_adder(a,b,clk,s,c);
input  a,b,clk;
output reg s,c;
always@(posedge clk)
begin
s=a^b;
c=a&b;
end
endmodule
