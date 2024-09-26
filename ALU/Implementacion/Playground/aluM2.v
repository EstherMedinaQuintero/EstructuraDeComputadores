/// Modificación
/// Cambiar el compl2(A) por B + 1

/// Unidad aritmético-lógica
/// Forma estructural (wire)
module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l);
  /// Cables de salidas
  wire [3:0] op1, op2, out_mux, out1_sum, out2_sum;
  wire op1_A, op2_B, cpl, cin0;

  /// op1_A = AluOp[1] + l
  assign op1_A = ALUOp[1] | l;
  /// op2_B = AluOp[1] + AluOp[0] + l
  assign op2_B = 1;
  /// cpl = ~l~AluOP[1] + l~AluOp[0]
  // assign cpl = (~l & ~ALUOp[1]) | (~l & ALUOp[0]);
  assign cpl = ~l & ALUOp[0];
  /// cin0 = ~AluOp[1] + AluOp[0]
  assign cin0 = ~ALUOp[1] | ALUOp[0];

  /// Primer mux
  mux2_4 mux1(op1, 4'b0, A, op1_A);
  /// Segundo mux
  mux2_4 mux2(out_mux, A, B, op2_B);
  /// Complemento a 1
  compl1 compl(op2, out_mux, cpl);
  /// Sumador completo
  sum4 sum(out1_sum, carry, op1, op2, cin0);
  /// Unidad lógica
  ul4 ul(out2_sum, op1, op2, ALUOp);
  /// Tercer mux
  mux2_4 mux3(R, out1_sum, out2_sum, l);

  /// Zero, sign y carry
  assign zero = R ? 4'b0 : 4'b1;
  assign sign = R[3];

endmodule