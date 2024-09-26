/// Módulo para los flags
/// Estructural (wire)
module flags(output wire zero, carry, sign, input wire [3:0] R, input wire temporal_carry);
  assign zero = R ? 4'b0 : 4'b1;
  assign sign = R[3];
  assign carry = temporal_carry;
endmodule