module mux4_1(y,sel,i);
   input [3:0] i;
   input [1:0] sel;
   output y;

   assign y=i[sel];

endmodule
