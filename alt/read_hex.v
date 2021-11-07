module image_read() ;
    reg [7:0] totalmem[0:768*512*3-1];
    $readmemh("kodim23.hex",totalmem,0,768*512*3-1);
    integer i = 0;

    initial begin
        for (i=0;i<768*512*3-1;i=i+1) begin
            $display("%b",totalmem[i][7:0]);
        end
    end

endmodule