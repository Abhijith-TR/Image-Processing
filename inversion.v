module rgb_to_greyscale; //module name

	parameter m = 768;    //number of columns of image 
	parameter n = 1024;    //number of rows of image

	reg  [7:0] hexfile[0:m*n*3-1];    
	reg  [7:0] grayfile[0:m*n*3-1];     
	reg  [7:0] red[0:m*n-1];        
	reg  [7:0] blue[0:m*n-1];         
	reg [7:0] green[0:m*n-1];    
	integer file;
	integer i, j, k=0;
    integer flag = 0;
	reg [9:0] temp;

	initial begin 
		$readmemh("image.hex", hexfile);        //reading hexadecimal file of image into memory hexfile
	end

	initial begin
		for(i=0; i<m*n; i=i+1)begin
			red[i] = hexfile[k];           //transferring values of RGB from image hexfile to red, green, blue registers
			green[i] = hexfile[k+1];
			blue[i] = hexfile[k+2];
			
			//Subtracting all pixel intensities from 255 i.e. inverting all pixel values.
			grayfile[k] = 255 - red[i];
            grayfile[k+1] = 255 - green[i];
            grayfile[k+2] = 255 - blue[i];
			k = k + 3;
		end	
        flag = 1;
	end

	initial begin	
		if (flag == 1) begin
			file = $fopen("output.hex", "w");          //creating a hex file to store pixel values of converted image
            for(j=0; j<m*n*3; j=j+1)begin
                $fwrite(file, "%x\n", grayfile[j]);     //writing values into file
            end
            //$display("%b",grayfile[j-1]);
            $fclose(file);       //closing file
        end
	end

endmodule 
