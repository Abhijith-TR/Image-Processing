module testbench();
    reg brightness,inversion,threshold,updown; //All inputs (outputs entirely managed by the other file)

    image_read im(brightness,inversion,threshold,updown) ;

    initial begin
    end

endmodule