/// Multiplexor con entradas de 4 bits
module mux2_4(output wire [3:0] Out, input wire [3:0] A, input wire [3:0] B, input wire s);
    /// Operador ternario para asignar
    assign Out = s ? B : A;
endmodule