/// Half adder con assign
module ha_assign(output wire sum, carry, input wire a, b);
    assign sum = a ^ b; /// a xor b
    assign carry = a & b; /// a and b (Con dos es el lógico)
endmodule

/// Half adder con assign (pero concatenado)
module ha_concat(output wire sum, carry, input wire a, b);
    assign {carry, sum} = a + b; 
    /// n + 1 (n = número de bits)
    /// n bits + bit de carry
    /// Cable gordo: 
            /// el bit más significativo a carry,
            /// el menos a sum
endmodule

/// Half adder con assign (pero concatenado con array)
/// Este es de dos bits
/// Cuidado, con comas sigue afectando el [1:0]
module ha_concat_array(output wire [1:0]sum, output wire carry, input wire [1:0]a, b);
    /// El orden aquí afecta
    /// { más significativo, menos significativo }
    assign {carry, sum} = a + b; 
    /// No tenemos que cambiar na'
    /// 1 pa' carry, 2 pa' sum
endmodule

/// Half adder con asignación conductual
/// OJO: Al ser conductual no puede ser wire, debe ser reg
module ha_conduc(output reg sum, carry, input wire a, b);
    /// @ Es la lista de sensibilidad
    /// Señales de las que depende
    always @(a, b) /// Normalmente aquí van entradas 
        /// OJO: Cuidado con los retardos
        /// Si no, PE - TA (intenta hacer todo a la vez)
        begin
            /// NO se usa assign
            /// NO son cables
            sum = a ^ b; /// xor
            carry = a & b; /// and
        end
endmodule