module mux4(i1,i2,o0,o1,o2,o3,op);
input [15:0] o0,o1,o2,o3;
input i1,i2;
output reg[15:0] op;
always@(*)
begin
if(i1&i2)
begin
op=o3;
end
else if(i2&~i1)
begin
op=o2;
end
else if(~i2&i1)
begin
op=o1;
end
else if(~i2&~i1)
begin
op=o0;
end
end
endmodule