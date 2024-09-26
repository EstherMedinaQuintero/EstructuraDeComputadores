/// Unidad aritmético-lógica
/// Forma estructural (wire)
module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire l);
  /// Cables de salidas
  wire [3:0] op1, op2, out_mux, out_sum, out_ul;
  wire op1_A, op2_B, cpl, cin0;

  /// op1_A = AluOp[1] + l
  assign op1_A = ALUOp[1] | l;
  /// op2_B = AluOp[1] + AluOp[0] + l
  assign op2_B = ALUOp[1] | ALUOp[0] | l;
  /// cpl = ~l~AluOP[1] + l~AluOp[0]
  assign cpl = (~l & ~ALUOp[1]) | (~l & ALUOp[0]);
  /// cin0 = ~AluOp[1] + AluOp[0]
  assign cin0 = ~ALUOp[1] | ALUOp[0];

  /// Primer mux
  mux2_4 mux1(op1, 4'b0, A, op1_A);
  /// Segundo mux
  mux2_4 mux2(out_mux, A, B, op2_B);
  /// Complemento a 1
  compl1 compl(op2, out_mux, cpl);
  /// Sumador completo
  sum4 sum(out_sum, carry, op1, op2, cin0);
  /// Unidad lógica
  ul4 ul(out_ul, op1, op2, ALUOp);
  /// Tercer mux
  mux2_4 mux3(R, out_sum, out_ul, l);

  /// Zero, sign y carry
  assign zero = R ? 4'b0 : 4'b1;
  assign sign = R[3];

endmodule

/// ¿Objetivo final? Hacer una alu que hace op con 2 operandos de 4 bits: a y b
/// Op aritmeticas (full adder)
    /// Complemento
    /// Suma
    /// Resta
/// Op logicas 
    /// Bit a bit   

/// Camino de datos: forma estructural
    /// Dos operandos, operación y selector (logica o aritmetica)
    /// Resultado, carry (si es que hay), zero (a 1 si sale cero), sign (bit + significativo)
    /// En azul los puertos (parte externa)
        /// En la cabecera
    /// De forma estructural
    /// Todo lo negro son cabls internos (crea las instancias)
    /// Las cajas son el resto de modulos (otros ficheros)
        /// Instanciar y conectar
    /// En rojo están los bits de control
        /// Tenemos que diseñarlo
        /// Vamos a suponer: suma
            /// Empezamos de atrás hacia delante:
                /// Si la l es 0 deja pasar el resultado del sumador
                /// Hay que usar el sum4, que recibe dos operandos
                /// Op1 = A, Op2 = B
                /// Tenemos que elegir bien de los primeros
                /// mux1: Decidimos si pasa un cero o la A (en nuestro caso A)
                /// mux2: Decidimos si pasa la A o la B (en nuestro caso la B)
                /// ¿Necesitamos complementar? No, cero en el complemento
            /// Las operaciones lógicas van siempre con A y B
                /// Excepto negar una
                /// Siempre pasamos A y B y no complementamos
            /// ¿Problemas? Resta y complemento
                /// Resta en binario: sumando el complemento a 2
                /// Ej: complemento a 2 de A: complemento a 1 de A + 1
                    /// Cero por arriba
                    /// A por abajo complementado
                    /// Usamos el acarreo e entrada de Cin0: le ponemos un 1

/// (!) Usar la tabla de la verdad (!)
    /// Sacar las ecuaciones
    /// Simplificar y sacar la función lógica
    /// Tiene todos los posibles casos

/// (!) Traer la tabla de casa (!)
/// (!) Traer las funciones de casa (!)


    