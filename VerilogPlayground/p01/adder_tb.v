/// Testbench para módulo semisumador visto antes

/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module adder_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg test_cin, test_a, test_b; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire test_cout, test_sum2;

/// Módulo que queremos probar
adder adder(test_sum2, test_cout, test_cin, test_a, test_a); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("tiempo=%0d a=%b b=%b cin=%b resultado=%b cout=%b", $time, test_a, test_b, test_cin, test_sum2, test_cout);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("adder_tb.vcd");
  $dumpvars;

  test_cin = 1'b0;

  /// Test: a = 0; b = 0
  test_a = 1'b0; /// Tamaño ' base valor
  test_b = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 1
  test_a = 1'b0;
  test_b = 1'b1;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 0
  test_a = 1'b1;
  test_b = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 1
  test_a = 1'b1;
  test_b = 1'b1;
  #20; /// Retardo (20 x 1)

  test_cin = 1'b1;

  /// Test: a = 0; b = 0
  test_a = 1'b0; /// Tamaño ' base valor
  test_b = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: a = 0; b = 1
  test_a = 1'b0;
  test_b = 1'b1;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 0
  test_a = 1'b1;
  test_b = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: a = 1; b = 1
  test_a = 1'b1;
  test_b = 1'b1;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule