/// Complemento a 1
/// Forma estructural (wire)
module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);
  /// Hace el complemento cuando cpl es 1
  xor xor0(Out[0], Inp[0], cpl);
  xor xor1(Out[1], Inp[1], cpl);
  xor xor2(Out[2], Inp[2], cpl);
  xor xor3(Out[3], Inp[3], cpl);
  // assign Out = cpl ? ~Inp : Inp;
endmodule

/// Forma conductual (reg)
// module compl1(output reg [3:0] Out, input wire [3:0] Inp, input wire cpl);
//   always @ (cpl, Inp)
//     if (cpl == 1'b1)
//       Out = ~Inp;
//     else
//       Out = Inp;
// endmodule