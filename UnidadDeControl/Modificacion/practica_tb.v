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
      /// LI #1, R1
      /// 0000_0000_0001_0001
      ALUOp_test = 000; /// Nos da igual
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 1; /// Queremos cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// LI #0, R2
      /// 0000_0000_0000_0010
      ALUOp_test = 000; /// Nos da igual
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 1; /// Queremos cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// LI #3, R3
      /// 0000_0000_0011_0011
      ALUOp_test = 000; /// Nos da igual
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 1; /// Queremos cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// SKIPNE R1 R3
      /// 1111_0001_0011_0001
      ALUOp_test = 011; /// Resta
      we_test = 0; /// No escribir
      s_skip_test = 1; /// Queremos saltar (2)
      s_inc_test = 1; /// PC + 2
      s_inm_test = 1; /// Nos da igual
      #20;

      /// Decodificación
      #20;
      /// ADD R2 R3 R2
      /// 0001_0010_0011_0010
      ALUOp_test = 010; /// A + B
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// SUB R3 R1 R3
      /// 0001_0011_0001_0011
      ALUOp_test = 011; /// A - B
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// JR Check (-4)
      /// 1111_1111_1111_1100
      ALUOp_test = 000; /// Nos da igual
      we_test = 0; /// No escribir
      s_skip_test = 0; /// Nos da igual
      s_inc_test = 0; /// PC + Desplazamiento
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// SKIPNE R1 R3
      /// 1111_0001_0011_0001
      ALUOp_test = 011; /// Resta
      we_test = 0; /// No escribir
      s_skip_test = 1; /// Queremos saltar (2)
      s_inc_test = 1; /// PC + 2
      s_inm_test = 1; /// Nos da igual
      #20;

      /// Decodificación
      #20;
      /// ADD R2 R3 R2
      /// 0001_0010_0011_0010
      ALUOp_test = 010; /// A + B
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// SUB R3 R1 R3
      /// 0001_0011_0001_0011
      ALUOp_test = 011; /// A - B
      we_test = 1; /// Permiso de escritura
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// JR Check (-4)
      /// 1111_1111_1111_1100
      ALUOp_test = 000; /// Nos da igual
      we_test = 0; /// No escribir
      s_skip_test = 0; /// Nos da igual
      s_inc_test = 0; /// PC + Desplazamiento
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// SKIPNE R1 R3
      /// 1111_0001_0011_0001
      ALUOp_test = 011; /// Resta
      we_test = 0; /// No escribir
      s_skip_test = 0; /// No queremos saltar (1)
      s_inc_test = 1; /// PC + 1
      s_inm_test = 1; /// Nos da igual
      #20;

      /// Decodificación
      #20;
      /// JR Check (+0)
      /// 1111_1100_0000_0000
      ALUOp_test = 000; /// Nos da igual
      we_test = 0; /// No escribir
      s_skip_test = 0; /// Nos da igual
      s_inc_test = 0; /// PC + Desplazamiento
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;
      /// JR Check (+0)
      /// 1111_1100_0000_0000
      ALUOp_test = 000; /// Nos da igual
      we_test = 0; /// No escribir
      s_skip_test = 0; /// Nos da igual
      s_inc_test = 0; /// PC + Desplazamiento
      s_inm_test = 0; /// No cargar inmediato
      #20;

      /// Decodificación
      #20;

      $finish;
    end
endmodule