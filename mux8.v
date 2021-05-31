module mux8(i1,i2,i3,o0,o1,o2,o3,o4,o5,o6,o7,op);
input [15:0] o0,o1,o2,o3,o4,o5,o6,o7,o8;
input i1,i2,i3;
output reg[15:0] op;
always@(*)
begin
if(~i3&i1&i2)
begin
op=o3;
end
else if(~i3&i2&~i1)
begin
op=o2;
end
else if(~i3&~i2&i1)
begin
op=o1;
end
else if(~i3&~i2&~i1)
begin
op=o0;
end
if(i3&i1&i2)
begin
op=o7;
end
else if(i3&i2&~i1)
begin
op=o6;
end
else if(i3&~i2&i1)
begin
op=o5;
end
else if(i3&~i2&~i1)
begin
op=o4;
end
end
endmodule