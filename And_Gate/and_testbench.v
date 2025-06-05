`timescale 1ns/1ns

module and_tb;
   reg a,b;
   wire y;
   and_gate_df dut(.a(a),.b(b),.y(y));

   initial begin
      $dumpfile("waveform.vcd");
      $dumpvars(0,and_tb);

     $monitor("time=%0t INPUT: a=%b b=%b OUTPUT: y=%b", $time, a, b, y);
      
      a=0; b=0;
      #10 a=0; b=1;
      #10 a=1; b=0;
      #10 a=1; b=1;
      #10 a=0; b=1;
      #10 a=1; b=1;
      #10 a=0; b=0;
      #10 a=1; b=1;
      #100 $finish;
   end
endmodule