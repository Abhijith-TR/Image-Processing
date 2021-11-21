module color2gray; 

parameter m = 1024;  
parameter n = 768;

reg [7:0] hexfile[0:m*n*3-1];    
reg [7:0] grayfile[0:m*n-1];    
reg [7:0] red[0:m*n-1];         
reg [7:0] blue[0:m*n-1];        
reg [7:0] green[0:m*n-1];       
integer file;
reg [7:0] temp;
integer i, j, k=0;
reg [9:0] val;

initial begin 
	$readmemh("image.hex", hexfile); //Reading hex file generated from MATLAB       
end
initial begin
	for(i=0; i<m*n; i=i+1)begin
		
		//Storing RGB values from the hexfile in three separate registers
		red[i] = hexfile[k];          
		green[i] = hexfile[k+1];
		blue[i] = hexfile[k+2];
		
		//Assigning the average of RGB values of a pixel to grayfile i.e. the grayscale image
		val = red[i]+green[i]+blue[i];    
		grayfile[i] = (val)/8'h03; 
		
		//grayfile[i] = 255-grayfile[i];  Uncomment to do inversion operation
		k = k + 3;
		
	end	
end
initial begin
	for(i=0;i<n;i=i+1)begin
		for (j = 0; j < m/2; j++) begin
			//Mirror Image of original image by swapping the appropriate hex values.
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
