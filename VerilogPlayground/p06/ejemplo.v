module half_adder(output wire sum, carry, input wire a, b);
  xor xor1(sum, a, b);
  and and1(carry, a, b);
endmodule