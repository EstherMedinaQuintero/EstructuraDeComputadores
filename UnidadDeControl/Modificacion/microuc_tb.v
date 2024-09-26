`timescale 1 ns/10 ps /// Directiva para el tiempo de simulación

module micro_tb;

  /// Señales (salidas)
  wire [5:0] Opcode_test;
  wire zero_test, carry_test;

  /// Señales (entradas)
  wire s_inc_test, s_skip_test, we_test, s_inm_test;
  wire [2:0] ALUOp_test;
  reg clk_test, reset_test;

  /// Módulos
  uc uc(clk_test, reset_test, zero_test, carry_test, Opcode_test, s_inc_test, s_skip_test, we_test, s_inm_test, ALUOp_test);
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
  
  /// Tiempo de simulación
  initial
    begin
      $dumpfile("micro_tb.vcd");
      $dumpvars;
      #800;
      $finish;
    end

endmodule