module sign_ext_8_16(a0,a1,a2,a3,a4,a5,a6,a7,b);
input a0,a1,a2,a3,a4,a5,a6,a7;
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
b[8]=a7;
b[9]=a7;
b[10]=a7;
b[11]=a7;
b[12]=a7;
b[13]=a7;
b[14]=a7;
b[15]=a7;
end
endmodule