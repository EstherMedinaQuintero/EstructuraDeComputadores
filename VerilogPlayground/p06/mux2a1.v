module mux21v1 (output out, input a, b, s);

  wire salida_and1, salida_and2, not_s;
  and and1(salida_and1, b, s);
  not not1(not_s, s); // Ojo cuidao' no lo conectes, zopenca
  and and2(salida_and2, a, not_s);
  or or1(out, salida_and1, salida_and2);
  
endmodule 