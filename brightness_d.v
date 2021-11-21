module rgb_to_greyscale; //module name

	parameter m = 768;    //number of columns of image 
	parameter n = 1024;    //number of rows of image

	reg  [7:0] hexfile[0:m*n*3-1];    
	reg  [7:0] bright[0:m*n*3-1];     
	reg  [7:0] red[0:m*n-1];        
	reg  [7:0] blue[0:m*n-1];         
	reg [7:0] green[0:m*n-1];    
	integer file;
	integer flag = 0;
	integer i, j, k=0;
	reg [9:0] val;

	initial begin 
		$readmemh("image.hex", hexfile);        //reading hexadecimal file of image into memory hexfile
	end

	initial begin
		for(i=0; i<m*n; i=i+1)begin
			//transferring values of RGB from image hexfile to red, green, blue registers
			red[i] = hexfile[k];           
			green[i] = hexfile[k+1];
			blue[i] = hexfile[k+2];
			
			//Multiplying the RGB register values by a factor 0.5 to decrease the brighness. This factor can be any +ve number <1.
			bright[k] = red[i]*0.5; 
			bright[k+1] = green[i]*0.5;
			bright[k+2] = blue[i]*0.5;
			k = k + 3;
		end	
		flag = 1;
	end

	initial begin	
		if (flag == 1) begin
			file = $fopen("output.hex", "w");          //creating a hex file to store pixel values of converted image
			for(j=0; j<m*n*3; j=j+1)begin
				$fwrite(file, "%x\n", bright[j]);     //writing values into hex file
			end
			//$display("%b",grayfile[j-1]);
			$fclose(file);       //closing file
		end
	end

endmodule 
