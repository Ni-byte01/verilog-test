module mux_2_1tb;
   reg[1:0] i;
   reg sel;
   wire y;
   mux_2_1 dut(.i(i),.sel(sel),.y(y));

   initial begin
      
      $dumpfile("waveform.vcd");
      $dumpvars(0,mux_2_1tb);

      $monitor("time=%0t INPUT: i0=%b i1=%b sel=%b OUTPUT: y=%b",$time,i[0],i[1],sel,y);


      i[0]=0; i[1]=0; sel=0;
      #10 i[0]=0; i[1]=1; sel=0;
      #10 i[0]=0; i[1]=1; sel=1;
      #10 i[0]=1; i[1]=0; sel=0;
      #10 i[0]=1; i[1]=0; sel=1;
      #50 $finish;
   end
endmodule