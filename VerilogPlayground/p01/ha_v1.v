/// Semisumador de dos entradas de 1 bit realizado a partir de puertas

module ha_v1(output wire sum, carry, input wire a, b);
/// Declaración de conexiones internas: no hay ninguna
/// Estructura interna: Instancias de puertas y sus conexiones
xor xor1(sum, a, b);
and and1(carry, a, b);
endmodule