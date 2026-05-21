// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_serial_adder;
  reg clk,rst,a,b;
  wire z;
  
  serial_adder uut(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .z(z)
  );
  always #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,tb_serial_adder);
      clk=1'b0;
      rst=1'b1;
      #15 rst=1'b0;
    end
  initial
    begin
      #12 a=0;b=0;
      #10 a=1;b=1;
      #10 a=1;b=0;
      #10 a=0;b=0;
      #10 a=0;b=0;
      #10 $finish;
    end
endmodule
