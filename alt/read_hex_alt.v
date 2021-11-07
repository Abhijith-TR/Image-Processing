module image_read(brightness,inversion,threshold,updown) ;

    input brightness,inversion,threshold;  //Set one of these to one to implement required operation
    input [1:0] updown;     //Set to 00 to increase brightness and 01 to decrease brightness
    reg [7:0] totalmem [0:768*512*3-1];  //Memory to store the image
    reg [7:0] average ; //For grayscale operation
    reg [7:0] BMP_header[53:0];     //BMP files require a 54 bit header to store the objects

    initial begin
        BMP_header[0] = 66;BMP_header[28] =24; 
        BMP_header[1] = 77;BMP_header[29] = 0; 
        BMP_header[2] = 54;BMP_header[30] = 0; 
        BMP_header[3] = 0;BMP_header[31] = 0;
        BMP_header[4] = 18;BMP_header[32] = 0;
        BMP_header[5] = 0;BMP_header[33] = 0; 
        BMP_header[6] = 0;BMP_header[34] = 0; 
        BMP_header[7] = 0;BMP_header[35] = 0; 
        BMP_header[8] = 0;BMP_header[36] = 0; 
        BMP_header[9] = 0;BMP_header[37] = 0; 
        BMP_header[10] = 54;BMP_header[38] = 0; 
        BMP_header[11] = 0;BMP_header[39] = 0; 
        BMP_header[12] = 0;BMP_header[40] = 0; 
        BMP_header[13] = 0;BMP_header[41] = 0; 
        BMP_header[14] = 40;BMP_header[42] = 0; 
        BMP_header[15] = 0;BMP_header[43] = 0; 
        BMP_header[16] = 0;BMP_header[44] = 0; 
        BMP_header[17] = 0;BMP_header[45] = 0; 
        BMP_header[18] = 0;BMP_header[46] = 0; 
        BMP_header[19] = 3;BMP_header[47] = 0;
        BMP_header[20] = 0;BMP_header[48] = 0;
        BMP_header[21] = 0;BMP_header[49] = 0; 
        BMP_header[22] = 0;BMP_header[50] = 0; 
        BMP_header[23] = 2;BMP_header[51] = 0; 
        BMP_header[24] = 0;BMP_header[52] = 0; 
        BMP_header[25] = 0;BMP_header[53] = 0; 
        BMP_header[26] = 1; BMP_header[27] = 0; 
    end


    parameter width = 768;
    parameter height = 512;
    parameter size = 768*512*3-1;
    
    initial begin
        $readmemh("./image.hex",totalmem,0,768*512*3-1); //Reading the image into regs
    end

    reg [7:0] red [0:width*height-1];  //Registers to store red data
    reg [7:0] blue [0:width*height-1];  //Registers to store blue data 
    reg [7:0] green [0:width*height-1]; //Registers to store green data

    integer i,j;
    reg flag = 0;
    reg flagn = 0;

    initial begin  //Storing the required lengths onto the various registers
        for (i=0;i<height*width*3;i=i+1) begin
            if (i%3==0) red[i/3] = totalmem[i][7:0];
            else if (i%3==1) green[i/3] = totalmem[i][7:0];
            else if (i%3==2) blue[i/3] = totalmem[i][7:0];
        end
        flag = 1;
    end

    //Trying to implement the grayscale operation
    initial begin if (flag==1)
        begin
            for (i=0;i<width*height*3-1;i=i+3) begin
                average = (red[i/3]+blue[i/3]+green[i/3]);
                totalmem[i][7:0] = average[7:0];
                totalmem[i+1][7:0] = average[7:0];
                totalmem[i+2][7:0] = average[7:0];
            end
            flagn = 1;
            // j = $fopen("output.hex","w");
            // for (i=0;i<height*width*3;i=i+1) begin
            //     if (totalmem[i][7:0]!=8'b00000000) $fwrite(j,"%x\n",totalmem[i][7:0]);
            //     else $fwrite(j,"%x\n",0);
            // end
            j = $fopen("output.bmp","w");  //Attempt to write the data onto a output file (Not yet successful)
            for (i=0;i<54;i=i+1) $fwrite(j,"%c",BMP_header[i][7:0]);
            for (i=0;i<height*width*3-1;i=i+1) begin
                $fwrite(j,"%c",totalmem[i][7:0]);
            end
        end
    end

endmodule