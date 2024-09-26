/// Testbench para módulo semisumador visto antes

/// ` Esa cosa significa directiva de verilog
/// Es para los retardos
/// Unidad de tiempo con la que se leen los retardos
/// Escala / Precisión
/// Por debajo de precisión no va a detectar cambios
`timescale 1 ns / 10 ps

/// NO tiene entradas ni salidas
module compl1_tb; 

/// Son reg porque les damos valor dentro de una estructura
/// Es reg porque es conductual
reg test_cpl;
reg [3:0] test_Inp; 
/// No tiene que ver con el otro fichero
/// Es wire porque es estructual
wire [3:0] test_Out;

/// Módulo que queremos probar
compl1 compl1(test_Out, test_Inp, test_cpl); 

/// Probamos todas las combinaciones
/// Initial ejecuta todos en paralelo nada más empezar la simulación
/// Always ejecuta todo el rato
/// Podríamos tener varios initial
initial 
begin
  /// Es como un print
  /// Cada vez que cambia el valor de alguna señal, imprime
  $monitor("Inp(%b) cpl(%b) Out(%b)", test_Inp, test_cpl, test_Out);
  /// Estos dos son para visualizar
  /// dumpfile: traza
  /// dumpvars: qué queremos guardar en la traza (sin nada, guarda todo)
  /// Comando: gtkwave ejemplo_tb.vcd &
  $dumpfile("compl1_tb.vcd");
  $dumpvars;

  /// Test: input = 0000, cpl = 0
  test_Inp = 4'b0000;
  test_cpl = 1'b0;
  #20; /// Retardo (20 x 1)

  /// Test: input = 0000, cpl = 1
  test_Inp = 4'b0000;
  test_cpl = 1'b1;
  #20; /// Retardo (20 x 1)

  /// Todos los comandos internos de verilog tienen un $
  /// Si no lo ponemos, no salimos del entorno
  $finish;  

end
endmodule