module dat_file();
integer i;
reg [15:0] datamem[0:32767],instrmem[0:32767];
reg [15:0] registers[0:15];
initial begin
	for(i=0;i<32767;i++) begin
	datamem[i]=16'd0;
	instrmem[i]=16'd0;
	end
	for(i=0;i<16;i++) begin
	registers[i]=16'd0;
	end
	$writememh("datamem.dat",datamem);
	$writememh("instrmem.dat",instrmem);
	
	$writememh("reg.dat",registers);
end
endmodule