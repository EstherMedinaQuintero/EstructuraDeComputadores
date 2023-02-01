module cuenta1_tb;

  reg clk_test, start_test;
  wire fin_test;
  wire [3:0] salida_test;
  reg [2:0] entrada_test;

  cuenta1 cuenta1(entrada_test, start_test, clk_test, salida_test, fin_test);
  
  /// Reloj
  always
    #10
    clk_test = !clk_test;
  
  /// Empezar en cero
  initial
    begin
      clk_test = 0;
      start_test = 1'b1;  
      entrada_test = 3'b000;
      #10
      start_test = 1'b0;
    end

  initial
    begin
      $monitor("tiempo=%0d entrada_test=%b salida_test=%b start_test=%b fin=%b clk=%b", $time, entrada_test, salida_test, start_test, fin_test, clk_test);
      $dumpfile("cuenta1_tb.vcd");
      $dumpvars;

      entrada_test = 3'b101;
      #400
      $finish;  //fin simulacion
    end

endmodule