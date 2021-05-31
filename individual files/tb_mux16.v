`include "mux16.v"
module tb_mux16();
reg [3:0] a;
wire[15:0] op;
reg [15:0]s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;
mux16 ad(a[3],a[2],a[1],a[0],s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,op);
initial begin
s0=16'd0;
s1=16'd1;
s2=16'd2;
s3=16'd3;
s4=16'd4;
s5=16'd5;
s6=16'd6;
s7=16'd7;
s8=16'd8;
s9=16'd9;
s10=16'd10;
s11=16'd11;
s12=16'd12;
s13=16'd13;
s14=16'd14;
s15=16'd15;


a=4'd0;
#5
a=4'd1;
#5
a=4'd2;
#5
a=4'd3;
#5
a=4'd4;
#5
a=4'd5;
#5
a=4'd6;
#5
a=4'd7;
#5
a=4'd8;
#5
a=4'd9;
#5
a=4'd10;
#5
a=4'd11;
#5
a=4'd12;
#5
a=4'd13;
#5
a=4'd14;
#5
a=4'd15;
#5
$finish;
end
initial
begin
$dumpfile("mux16.vcd");
$dumpvars;
end
endmodule