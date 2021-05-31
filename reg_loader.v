module reg_loader(ip,on,op);
input [15:0] ip;
input on;
output reg [15:0] op;
always @(posedge on)
begin
op=ip;
end
endmodule