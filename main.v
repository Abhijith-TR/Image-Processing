module color2gray; 

parameter m = 768;  
parameter n = 1024;

reg [7:0] hexfile[m*n*3];    
reg [7:0] grayfile[m*n];    
reg [7:0] red[m*n];         
reg [7:0] blue[m*n];        
reg [7:0] green[m*n];       
integer file;
reg [7:0] temp;
integer i, j, k=0;
reg [9:0] val;

initial begin 
	$readmemh("image.hex", hexfile);        
end
initial begin
	for(i=0; i<m*n; i=i+1)begin
			
		red[i] = hexfile[k];           
		green[i] = hexfile[k+1];
		blue[i] = hexfile[k+2];
		val = red[i]+green[i]+blue[i];    
		grayfile[i] = (val)/8'h03;        
		k = k + 3;
		
	end	
end
initial begin
	for(i=0;i<n;i=i+1)begin
		for (j = 0; j < m/2; j++) begin
			temp=grayfile[(m*i)+j];
			grayfile[(m*i)+j]=grayfile[(m*i)+(m-1)-j];
			grayfile[(m*i)+(m-1)-j]=temp;
		end
	end
end
initial begin	
	file = $fopen("grayimage.hex", "w");          //creating a hex file to store grayscale values of converted image
	for(j=0; j<m*n; j=j+1)begin
		$fwrite(file, "%x\n", grayfile[j]);     //writing values into file
	end
	$fclose(file);       //closing file
end
endmodule 


