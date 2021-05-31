

module ALU2(aip1,aip2,fctrl,aluctrl,clk,aop);
input [15:0] aip1,aip2;
input [1:0] fctrl;
input [3:0]aluctrl;
input clk;
output reg [15:0] aop;


always@(posedge clk)
begin
if(aluctrl[3:0]==4'd0) begin
if (fctrl[1:0]==2'd1) begin
aop=aip1<<aip2;
end
else if (fctrl[1:0]==2'd2) begin
aop=aip1>>>aip2;
end
else if (fctrl[1:0]==2'd3) begin
aop=aip1>>aip2;
end
end 
else if (aluctrl[3:0]==4'd8) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd9) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd10) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd12) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd13) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd14) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd11) begin
aop=~(aip1|aip2);
end
else if (aluctrl[3:0]==4'd15) begin
aop=aip1|aip2;
end
else if (aluctrl[3:0]==4'd7) begin
aop=~(aip1|aip2);
end
else if (aluctrl[3:0]==4'd6) begin
aop=aip1|aip2;
end
else if (aluctrl[3:0]==4'd4) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd5) begin
aop=aip1-aip2;
end
else if (aluctrl[3:0]==4'd3) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd2) begin
aop=aip1+aip2;
end
else if (aluctrl[3:0]==4'd1) begin
aop=aip1+aip2;
end
/*
reg[15:0] a,b,c;
wire temp;
wire [15:0] extn;
reg [15:0]aop1;
wire[15:0]aop2;
reg [15:0]orop;
wire [15:0] sftop;
reg [15:0] sllop,srlop,sarop;
reg [15:0]nandop;
//adder_16 a1(aip1,aip2,clk,aluctrl[2],aop1,temp);
mux4 shftop(fctrl[0],fctrl[1],sarop,sllop,srlop,sarop,sftop);
mux2 op1(aluctrl[3]^aluctrl[2]^aluctrl[0],nandop,orop,aop2);
mux4 op((~aluctrl[0]&~aluctrl[1]&~aluctrl[2]&~aluctrl[3]),((aluctrl[3]&aluctrl[0])|(aluctrl[2]&~aluctrl[3]))&aluctrl[1],aop1,aop2,sftop,16'd0,aop);

always@(posedge clk)
begin
orop=aip1|aip2;


nandop=~orop;
sllop=aip1<<aip2;
sarop=aip1>>>aip2;
srlop=aip1>>aip2;
if(aluctrl[2])
begin 
aop1=aip1-aip2;
end
else
begin
aop1=aip1+aip2;
end*/

end 
endmodule
