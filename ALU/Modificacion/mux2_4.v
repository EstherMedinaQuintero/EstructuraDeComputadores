/// Multiplexor con entradas de 4 bits
/// Estructural (wire)
module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);
  /// Operador ternario para asignar
  assign Out = s ? B : A;
endmodule

/// Conductual (reg)
// module mux2_4(output reg [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);
//   always @ (A, B, s)
//     case (s)
//       1'b0 : Out = A;
//       1'b1 : Out = B;
//     endcase
// endmodule