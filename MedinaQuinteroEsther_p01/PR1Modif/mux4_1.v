/// Multiplexor 4 a 1 con entradas de 1 bit
/// Forma: conductual (reg)
module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] S);
  /// Lista de sensibilidad
  always @(a or b or c or d or S) 
  /// No hace falta begin y end porque el always contiene una sola sentencia, el case
    case (S)  
      /// Dos bits en binario            
      2'b00: out = a;
      2'b01: out = b;
      2'b10: out = c;
      2'b11: out = d;
      default: out = 'bx; /// Desconocido en cualquier otro caso                   
    endcase
endmodule

/// Forma estructural (wire)
// module mux4_1(output wire out, input wire a, b, c, d, input wire [1:0] S);
//   assign out = S[1] ? (S[0] ? d : c) : (S[0] ? b : a);
//   /// Si S[1] es 0, se seleccionan las primeras dos entradas
//   /// Si S[1] es 1, se seleccionan las otras dos entradas
//   /// Si S[0] es 0, se selecciona la primera de las dos seleccionadas
// endmodule