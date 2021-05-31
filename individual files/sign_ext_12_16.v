module sign_ext_12_16(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,b);
input a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11;
output reg [15:0]b;
always@(*)
begin
b[0]=a0;
b[1]=a1;
b[2]=a2;
b[3]=a3;
b[4]=a4;
b[5]=a5;
b[6]=a6;
b[7]=a7;
b[8]=a8;
b[9]=a9;
b[10]=a10;
b[11]=a11;
b[12]=a11;
b[13]=a11;
b[14]=a11;
b[15]=a11;
end
endmodule