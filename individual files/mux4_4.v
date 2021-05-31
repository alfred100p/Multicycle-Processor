module mux4_4(i1,i2,o00,o01,o02,o03,o10,o11,o12,o13,o20,o21,o22,o23,o30,o31,o32,o33,op0,op1,op2,op3);
input  o00,o01,o02,o03,o10,o11,o12,o13,o20,o21,o22,o23,o30,o31,o32,o33;
input i1,i2;
output reg op0,op1,op2,op3;
always@(*)
begin
if(~i2&i1)
begin
op0=o10;
op1=o11;
op2=o12;
op3=o13;
end
else if(~i2&~i1)
begin
op0=o00;
op1=o01;
op2=o02;
op3=o03;
end
else if(i2&i1)
begin
op0=o30;
op1=o31;
op2=o32;
op3=o33;
end
else if(i2&~i1)
begin
op0=o20;
op1=o21;
op2=o22;
op3=o23;
end
end
endmodule