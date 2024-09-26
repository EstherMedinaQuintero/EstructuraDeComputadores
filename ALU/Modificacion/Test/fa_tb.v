/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module fa_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg test_a, test_b, test_cin; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire test_out;
wire test_sum;

/// Módulo que queremos probar
fa fa(test_out, test_sum, test_a, test_b, test_cin); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("a(%b) b(%b) in(%b) out(%b) sum(%b)", test_a, test_b, test_cin, test_out, test_sum);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("fa_tb.vcd");
  $dumpvars;

  /// Test: a = 0; b = 0; in = 0
  test_cin = 1'b0;
  test_a = 1'b0;
  test_b = 1'b0;
  #20; /// Retardo (20 x 1)
  
  /// Test: a = 0; b = 0; in = 1
  test_cin = 1'b1;
  test_a = 1'b0;
  test_b = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 1; in = 0
  test_cin = 1'b0;
  test_a = 1'b0;
  test_b = 1'b1;
  #20; /// Retardo (20 x 1)
  /// Test: a = 0; b = 1; in = 1
  test_cin = 1'b1;
  test_a = 1'b0;
  test_b = 1'b1;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule