`include "p3.v"
module tb_p3();
reg clk;
reg[15:0]  pc_nu;
reg [15:0] datamem[0:32767],instrmem[0:32767];
reg [15:0] registers[0:15];
p3 p(pc_nu,clk);
integer i;

initial begin
clk=0;
forever begin

#5 clk= ~clk;

end 
end

initial begin
$readmemh("datamem.dat",datamem);
//$readmemh("instrmem.dat",instrmem);
$readmemh("reg.dat",registers);
	registers[0]=16'd1;
	registers[1]=16'd90;
	registers[2]=16'd3;
	registers[3]=16'd4;
	registers[4]=16'd5;
	registers[5]=16'd6;
	registers[6]=16'd7;
	registers[7]=16'd8;
	registers[8]=16'd9;
	registers[9]=16'd10;
	registers[10]=16'd0;
	registers[11]=16'd12;
	registers[12]=16'd13;
	registers[13]=16'd14;
	registers[14]=16'd15;
	registers[15]=16'd16;
	instrmem[0]=16'b1000100000001010;//r8=r0(0)+r10(10)=10
    instrmem[1]=16'b1000100100011010;	//r9=r1(1)+r10(10)=11
    instrmem[2]=16'b1001100100001010;//r9=r9+10=21
	instrmem[3]=16'b1001100111111011;//r9=r9+-5=16
	instrmem[4]=16'b1010100100001010;//r9=r9+10=26
	instrmem[5]=16'b1010100110000110;//r9=r9+134=160(128+32)
	instrmem[6]=16'b1100100000001010;//r8=r0(0)-r10(10)=-10
    instrmem[7]=16'b1100101100011010;	//r11=r1(1)-r10(10)=11
    instrmem[8]=16'b1101100100001010;//r9=r9-10=150
	instrmem[9]=16'b1101100111111011;//r9=r9--5=155
	instrmem[10]=16'b1110100100001010;//r9=r9-10=145
	instrmem[11]=16'b1110100110000110;//r9=145-134=11
	instrmem[12]=16'b0000001000110001;
	instrmem[13]=16'b0000010101110001;
	instrmem[14]=16'b0000010000110010;
	instrmem[15]=16'b0000010011110010;
	instrmem[16]=16'b0000010100110011;
	instrmem[17]=16'b0000010001110011;
	instrmem[18]=16'b1011100100110001;
	instrmem[19]=16'b1011100001110001;
	instrmem[20]=16'b1111100100110001;
	instrmem[21]=16'b1111100001110001;
	instrmem[22]=16'b0111100100110001;
	instrmem[23]=16'b0111100000000000;
	instrmem[24]=16'b0110100100110001;
	instrmem[25]=16'b0110100000000000;
	instrmem[26]=16'b0001101100110001;
	instrmem[27]=16'b0011100001110001;
	instrmem[86]=16'b0010110100110001;
	instrmem[87]=16'b0001100001110001;
	instrmem[88]=16'b0010100001110001;
	
    instrmem[89]=16'b0100001000110001;
	instrmem[721]=16'b0110100001110001;
	instrmem[722]=16'b0100001100001000;//equal
	instrmem[723]=16'b0000111100110101;
	instrmem[724]=16'b0000101100110001;
	
	
	$writememh("datamem.dat",datamem);
	$writememh("instrmem.dat",instrmem);
	$writememh("reg.dat",registers);

pc_nu=16'd0;
#1700//takes 1605s starts at 205s
$finish;
end
initial
begin
$dumpfile("p3.vcd");
$dumpvars;
end
endmodule
