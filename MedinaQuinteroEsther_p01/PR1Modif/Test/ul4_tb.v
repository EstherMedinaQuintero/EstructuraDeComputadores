/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module ul4_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg [1:0] test_S;
reg [3:0] test_A, test_B; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire [3:0] test_Out;

/// Módulo que queremos probar
ul4 ul4(test_Out, test_A, test_B, test_S); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("A(%b) B(%b) S(%b) out(%b)", test_A, test_B, test_S, test_Out);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("ul4_tb.vcd");
  $dumpvars;

  /// And: S = 00
  test_S = 2'b00;
  /// Test: a = 0; b = 0; 
  test_A = 4'b0010;
  test_B = 4'b1010;
  #20; /// Retardo (20 x 1)
  /// Test: a = 1; b = 1; s = 00
  test_A = 4'b0000;
  test_B = 4'b0000;
  #20; /// Retardo (20 x 1)

  /// Or: S = 01
  test_S = 2'b01;
  /// Test: a = 0; b = 0; 
  test_A = 4'b0010;
  test_B = 4'b1010;
  #20; /// Retardo (20 x 1)
  /// Test: a = 1; b = 1; s = 00
  test_A = 4'b0000;
  test_B = 4'b0000;
  #20; /// Retardo (20 x 1)

  /// Xor: S = 10
  test_S = 2'b10;
  /// Test: a = 0; b = 0; 
  test_A = 4'b0010;
  test_B = 4'b1010;
  #20; /// Retardo (20 x 1)
  /// Test: a = 1; b = 1; s = 00
  test_A = 4'b0000;
  test_B = 4'b0000;
  #20; /// Retardo (20 x 1)

  /// Not: S = 11
  test_S = 2'b11;
  /// Test: a = 0; b = 0; 
  test_A = 4'b0010;
  #20; /// Retardo (20 x 1)
  /// Test: a = 1; b = 1; s = 00
  test_A = 4'b0000;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule