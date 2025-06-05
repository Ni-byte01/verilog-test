module mux_2_1(y,i,sel);
   input[1:0] i;
   input sel;
   output y;
   assign y=sel ? i[1]:i[0] ;
endmodule