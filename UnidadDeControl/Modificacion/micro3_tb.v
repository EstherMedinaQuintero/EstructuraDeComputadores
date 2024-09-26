`timescale 1 ns/10 ps /// Directiva para el tiempo de simulación

module micro_tb;

  /// Señales (salidas)
  wire [5:0] Opcode_test;
  wire zero_test, carry_test;

  /// Señales (entradas)
  reg s_inc_test, s_skip_test, we_test, s_inm_test;
  reg [2:0] ALUOp_test;
  reg clk_test, reset_test;

  /// Módulo
  microc micro_test(Opcode_test, zero_test, carry_test, clk_test, reset_test, s_skip_test, s_inc_test, s_inm_test, we_test, ALUOp_test);

  /// Reloj
  always
    begin
      clk_test <= 1'b1;
      #20;
      clk_test <= 1'b0;
      #20;
    end
  
  /// Reset inicial
  initial
    begin
      reset_test <= 1'b1;
      #3;
      reset_test <= 1'b0;
      #2;
    end

  /// Pruebas
  initial 
    begin
      $monitor("ALU(%b) we(%b) skip(%b) inc(%b) inm(%b)", ALUOp_test, we_test, s_skip_test, s_inc_test, s_inm_test);
      $dumpfile("micro_tb.vcd");
      $dumpvars;

      /// Decodificación
      #20;
      /// Salto condicional
      ALUOp_test = 011; /// Nos da igual
      #5;
      we_test = 0;
      s_skip_test = zero_test ? 1 : 0; 
      s_inc_test = 1;
      s_inm_test = 0; /// Nos da igual
      #35;

      $finish;
    end
endmodule