`timescale 1ns/1ns

module or_tb;
   reg a,b;
   wire y;
   or_gate_df dut(.a(a),.b(b),.y(y));

   initial begin
      $dumpfile("waveform.vcd");
      $dumpvars(0,or_tb);

     $monitor("time=%0t INPUT: a=%b b=%b OUTPUT: y=%b", $time, a, b, y);
      
      a=0; b=0;
      #10 a=0; b=1;
      #10 a=1; b=0;
      #10 a=1; b=1;
      
      #50 $finish;
   end
endmodule