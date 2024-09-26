/// Celda lógica
/// Estructural (wire)
// module cl(output wire out, input wire a, b, input wire [1:0] S);
//   /// Cables de salidas
//   wire and_out, or_out, xor_out, not_out;
//   /// Operaciones
//   and and1(and_out, a, b);
//   or or1(or_out, a, b);
//   xor xor1(xor_out, a, b);
//   not not1(not_out, a);
//   /// Multiplexor para selecionar
//   mux4_1 mux(out, and_out, or_out, xor_out, not_out, S);
// endmodule

/// Forma conductual (reg)
module cl(output reg out, input wire a, b, input wire [1:0] S);
  always @ (S or a or b)
    begin
      case (S)
        2'b00: out = a & b; /// Puerta and
        2'b01: out = a | b; /// Puerta or
        2'b10: out = a ^ b; /// Puerta xor
        2'b11: out = ~a; /// Puerta not
      endcase
    end
endmodule
