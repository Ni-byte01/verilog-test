module mux4_1_tb;
   reg [3:0] i;
   reg [1:0] sel;
   wire y;

   mux4_1 dut(.i(i),.sel(sel),.y(y));

   initial begin
   $dumpfile("waveform.vcd");
   $dumpvars(0,mux4_1_tb);

   $monitor("time=%0t INPUT: i0=%b i1=%b i2=%b i3=%b sel=%d OUTPUT: y=%d",$time,i[0],i[1],i[2],i[3],sel,y);

   i=4'd0; sel=2'd0;
   #10 i=4'd14; sel=2'd0;
   #10 i=4'd2; sel=2'd1;
   #10 i=4'd7; sel=2'd2;
   #10 i=4'd8; sel=2'd3;
   #10 i=4'd6; sel=2'd0;
   #10 i=4'd13; sel=2'd1;

   #70 $finish;
   end
endmodule
