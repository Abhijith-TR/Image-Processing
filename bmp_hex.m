b = imread('image.jpeg'); 
k = 1;
s = size(b) ;
rows = s(1); cols = s(2);
a = ones(rows*cols, 1);
for i = 1:rows
      for j = 1:cols
            a(k)=b(i,j,1);     
            a(k+1)=b(i,j,2);
            a(k+2)=b(i,j,3);
            k=k+3;
           
      end
end
hexfile = fopen('image.hex', 'wt');  
fprintf(hexfile, '%x\n', a);    
disp('Text file write done');disp(' ');
fclose(hexfile);   
sizefile = fopen('sizefile.hex', 'wt'); 
fprintf(sizefile, '%x\n', s);
disp('Size file write done');
fclose(sizefile); 