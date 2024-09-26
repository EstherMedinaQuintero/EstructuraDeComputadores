/// Conductual --> reg
module flipflop(output reg q, input wire d, clk, reset, carga);
  always @(posedge clk, posedge reset)
    begin
      /// Cuidado con el reset, tiene preferencia
      if (reset) q <= 1'b0; /// Asignación no bloqueante
      else
        if (carga) q <= d;
    end
endmodule

/// Todo lo que ocurre entre retardos, suele hacerse al MISMO TIEMPO
/// Lo que evaluas, lo dejas anotado
  /// "a va a valer esto, pero no modifico aún"
  /// Cuando encuentra un retardo, asigna al mismo tiempo los valores
  /// Usa los valores anteriores mientras

/// Retardos intra-asignación
  /// Bloqueante mira cuánto vale "b" AHORA, espera tiempo y asigna a "a"
    /// El retardo de las bloqueantes PARA pa' todos
  /// No bloqueante mira cuánto vale "b" AHORA, espera tiempo y asigna a "a"
    /// Aquí el retardo no afecta al resto

/// Combinaciones -> bloqueante
/// Secuenciales -> no bloqueantes
