`timescale 1ns / 10ps

module useless();
  reg clk;

  //generación de reloj clk
  always 
    begin
      clk = 1;
      #20;
      clk = 0;
      #60;
    end
endmodule