
/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module mux2_4_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg [3:0] test_A, test_B;
reg test_s; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire [3:0] test_Out;

/// Módulo que queremos probar
mux2_4 mux2_4(test_Out, test_A, test_B, test_s); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("A(%b) B(%b) s(%b) Out(%b)", test_A, test_B, test_s, test_Out);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("mux2_4_tb.vcd");
  $dumpvars;

  /// Test: A = 0000; B = 1111; s = 0
  test_A = 4'b0000; /// Tamaño ' base valor
  test_B = 4'b1111;
  test_s = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: A = 0000; b = 1100; s = 0
  test_A = 4'b0000; /// Tamaño ' base valor
  test_B = 4'b1100;
  test_s = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: A = 0010; b = 1010; s = 1
  test_A = 4'b0010; /// Tamaño ' base valor
  test_B = 4'b1010;
  test_s = 1'b1;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule