grayhex = fopen('output.hex', 'r'); %opening converted grayscale image hexfile
%imshow('test.bmp');                %original image
grayimg = fscanf(grayhex, '%x');    %reading values from converted file
fclose(grayhex);                     %closing file

sizehex = fopen('sizefile.hex', 'r'); %opening size file
sizefile = fscanf(sizehex, '%x');
fclose(sizehex);
rows = sizefile(1); cols = sizefile(2); %extracting rows and columns from sizefile

disp(sizefile);
k=1;
outimg  = ones(rows,cols, 3);
 for i = 1:rows
      for j = 1:cols
          outimg(i,j,1)=grayimg(k);
          outimg(i,j,2)=grayimg(k+1);
          outimg(i,j,3)=grayimg(k+2);
          k=k+3;
      end
 end
 
outimg=uint8(outimg);
figure
imshow(outimg);
