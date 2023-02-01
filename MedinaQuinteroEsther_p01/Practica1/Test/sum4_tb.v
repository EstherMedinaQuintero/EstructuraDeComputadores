/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module sum4_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg [3:0] test_A, test_B;
reg test_in; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire [3:0] test_S;
wire test_out;

/// Módulo que queremos probar
sum4 sum4(test_S, test_out, test_A, test_B, test_in); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("a(%b) b(%b) in(%b) out(%b)", test_A, test_B, test_in, test_out);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("sum4_tb.vcd");
  $dumpvars;

  /// Test: a = 0; b = 0; in = 0
  test_in = 1'b0;
  test_A = 4'b0000;
  test_B = 4'b0000;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 1; in = 0
  test_in = 1'b0;
  test_A = 4'b0000;
  test_B = 4'b0001;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 1; in = 0
  test_in = 1'b0;
  test_A = 4'b0001;
  test_B = 4'b0001;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 0; in = 1
  test_in = 1'b1;
  test_A = 4'b0000;
  test_B = 4'b0000;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule