/// Adder usando hafl adder
module adder (output wire sum2, cout, input wire cin, a, b);
  wire sum1, carry1, carry2;
  /// Primer semisumador
        // xor xor1(sum1, a, b);
        // and and1(carry2, a, b);
  ha_v1 ha1(sum1, carry1, a, b);
  /// Segundo semisumador
        // xor xor2(sum2, cin, sum1);
        // and and2(carry2, cin, sum1);
  ha_v1 ha2(sum2, carry2, cin, sum1);
  /// El or
  or or1(cout, carry1, carry2);
endmodule