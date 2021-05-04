module mux16(i1,i2,i3,i4,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,op);
input [15:0] o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15;
input i1,i2,i3,i4;
output reg[15:0] op;
always@(*)
begin
if(~i1&~i2&~i3&~i4)
begin
op=o0;
end
else if(~i1&~i2&~i3&i4)
begin
op=o1;
end
else if(~i1&~i2&i3&~i4)
begin
op=o2;
end
else if(~i1&~i2&i3&i4)
begin
op=o3;
end
else if(~i1&i2&~i3&~i4)
begin
op=o4;
end
else if(~i1&i2&~i3&i4)
begin
op=o5;
end
else if(~i1&i2&i3&~i4)
begin
op=o6;
end
else if(~i1&i2&i3&i4)
begin
op=o7;
end
else if(i1&~i2&~i3&~i4)
begin
op=o8;
end
else if(i1&~i2&~i3&i4)
begin
op=o9;
end
else if(i1&~i2&i3&~i4)
begin
op=o10;
end
else if(i1&~i2&i3&i4)
begin
op=o11;
end
else if(i1&i2&~i3&~i4)
begin
op=o12;
end
else if(i1&i2&~i3&i4)
begin
op=o13;
end
else if(i1&i2&i3&~i4)
begin
op=o14;
end
else if(i1&i2&i3&i4)
begin
op=o15;
end
end

endmodule