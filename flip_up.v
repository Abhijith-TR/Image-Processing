module rgb_to_greyscale; //module name

	parameter m = 768;    //number of columns of image 
	parameter n = 1024;    //number of rows of image

	reg  [7:0] hexfile [0:m*n*3-1];    
	reg  [7:0] grayfile [0:m*n*3-1];     
	reg  [7:0] red [0:m*n-1];        
	reg  [7:0] blue [0:m*n-1];         
	reg [7:0] green [0:m*n-1];    
	integer file;
	integer i, j, k=0;
    integer left = 0,right = 1023;
    integer flag = 0;
	reg [7:0] t1,t2,t3;

	initial begin 
		$readmemh("image.hex", hexfile);        //reading hexadecimal file of image into memory hexfile
	end

	initial begin
		for (i=0;i<m*n/2;i=i+1) begin //Going from the start to the middle of the image
            t1 = hexfile[k];
            t2 = hexfile[k+1];
            t3 = hexfile[k+2];
			
	    //Swapping the values at both ends of the image
            hexfile[k] = hexfile[m*n*3-(k+3)];
            hexfile[k+1] = hexfile[m*n*3-(k+2)];
            hexfile[k+2] = hexfile[m*n*3-(k+1)];
            hexfile[m*n*3-k-3] = t1;
            hexfile[m*n*3-k-2] = t2;
            hexfile[m*n*3-k-1] = t3;
            k = k + 3;
        end
        flag = 1;
	end

	initial begin	
		if (flag == 1) begin
			file = $fopen("output.hex", "w");          //creating a hex file to store pixel values of converted image
            for(j=0; j<m*n*3; j=j+1)begin
                $fwrite(file, "%x\n", hexfile[j]);     //writing values into file
            end
            //$display("%b",grayfile[j-1]);
            $fclose(file);       //closing file
        end
	end

endmodule 
