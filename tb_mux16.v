`include "mux16.v"
module tb_mux16();
reg [3:0] a;
reg ip;
wire [15:0]s;
mux16 ad(ip,a[3],a[2],a[1],a[0],s[0],s[1],s[2],s[3],s[4],s[5],s[6],s[7],s[8],s[9],s[10],s[11],s[12],s[13],s[14],s[15]);
initial begin
ip=1'd1;
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