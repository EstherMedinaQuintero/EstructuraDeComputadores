
/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module mux4_1_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg test_a, test_b, test_c, test_d;
reg [1:0] test_S; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire test_out;

/// Módulo que queremos probar
mux4_1 mux4_1(test_out, test_a, test_b, test_c, test_d, test_S); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("a(%b) b(%b) c(%b) d(%b) S(%b) out(%b)", test_a, test_b, test_c, test_d, test_S, test_out);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("mux4_1_tb.vcd");
  $dumpvars;

  /// Test: a = 0; b = 1; c = 1; d = 1; S = 00
  test_a = 1'b1; /// Tamaño ' base valor
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  test_S = 2'b00;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 1; c = 1; d = 1; S = 00
  test_a = 1'b0; /// Tamaño ' base valor
  test_b = 1'b1;
  test_c = 1'b1;
  test_d = 1'b1;
  test_S = 2'b00;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 0; c = 1; d = 1; S = 01
  test_a = 1'b1; /// Tamaño ' base valor
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b1;
  test_S = 2'b01;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 1; c = 0; d = 1; S = 10
  test_a = 1'b1; /// Tamaño ' base valor
  test_b = 1'b1;
  test_c = 1'b0;
  test_d = 1'b1;
  test_S = 2'b10;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 1; c = 1; d = 0; S = 11
  test_a = 1'b1; /// Tamaño ' base valor
  test_b = 1'b1;
  test_c = 1'b1;
  test_d = 1'b0;
  test_S = 2'b11;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 0; c = 0; d = 1; S = 01
  test_a = 1'b0; /// Tamaño ' base valor
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b1;
  test_S = 2'b01;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 0; c = 0; d = 1; S = 11
  test_a = 1'b0; /// Tamaño ' base valor
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b1;
  test_S = 2'b11;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule