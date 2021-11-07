module top; 

parameter m = 512;    //number of columns of image 
parameter n = 512;    //number of rows of image

reg  hexfile[m*n*3];
reg  grayfile[m*n]; 
reg  modfile[m*n*3];     
reg  red_pixels[m*n];        
reg  blue_pixels[m*n];         
reg  green_pixels[m*n]; 
reg [7:0] BMP_header[53:0];
reg flag = 0;
reg flagn = 0;
integer file;//output file to write the hex code for image
integer i, j, k=0;
reg [9:0] val;

initial begin 
	$readmemh("image.hex", hexfile);        //reading hexadecimal file of image into memory hexfile
end
	
	
initial begin
	//Code to convert the given hex file to manipulated hex file-in progress
end
	
initial begin
	//writing to hex file-in progress	
end


endmodule
