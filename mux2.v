module mux2(i1,o0,o1,op);
input [15:0] o0,o1;
input i1;
output reg[15:0] op;
always@(*)
begin
if(i1)
begin
op=o1;
end
else if(~i1)
begin
op=o0;
end
end
endmodule