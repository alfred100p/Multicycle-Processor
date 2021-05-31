module mux2_4(i1,o00,o01,o02,o03,o10,o11,o12,o13,op0,op1,op2,op3);
input  o00,o01,o02,o03,o10,o11,o12,o13;
input i1;
output reg op0,op1,op2,op3;
always@(*)
begin
if(i1)
begin
op0=o10;
op1=o11;
op2=o12;
op3=o13;
end
else if(~i1)
begin
op0=o00;
op1=o01;
op2=o02;
op3=o03;
end
end
endmodule