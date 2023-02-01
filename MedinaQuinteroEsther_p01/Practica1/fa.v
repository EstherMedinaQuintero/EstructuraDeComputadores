/// Full Adder
/// Con concatenación
/// Estructural (wire)
module fa(output wire c_out, sum, input wire a, b, c_in);
  /// Asignación: carry out suma
  ///               [1]     [0]
  assign {c_out, sum} = a + b + c_in;
endmodule

/// Conductual (reg)
// module fa(output reg c_out, sum, input wire a, b, c_in);
//   always @ (a, b, c_in)
//   begin
//     sum = a ^ b ^ c_in;
//     c_out = (a & b) | (b & c_in) | (a & c_in);
//   end
// endmodule