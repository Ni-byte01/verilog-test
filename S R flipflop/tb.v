module sr_tb;
   reg clk, rst, s, r;
   wire q;

   // Instantiate the SR flip-flop module
   sr_ff dut(.clk(clk), .rst(rst), .s(s), .r(r), .q(q));

   // Clock generation: Toggle every 5 time units
   initial begin

      $dumpfile("waveform.vcd");
      $dumpvars(0,sr_tb);
      clk = 0;
      forever #5 clk = ~clk;
   end

   // Monitor changes
   initial begin
      $monitor("Time=%0t | rst=%b | s=%b | r=%b | q=%b", $time, rst, s, r, q);
   end

   // Reset stimulus
   initial begin
      rst = 1;
      #10 rst = 0;
   end

   // Stimulus for s and r
   initial begin
      s = 1; r = 0;   // Set
      #20 s = 0; r = 0; // Hold
      #20 s = 0; r = 1; // Reset
      #20 s = 1; r = 1; // Invalid condition
      #40 $finish;
   end
endmodule
