reg clk;

/// initial 
  /// clk = 1;
  /// Y luego en always
  /// clk = !clk;

always 
  begin
    clk = 1;
    #50;
    clk = 0;
    #50;
    /// El periodo de este reloj es 100
    /// El tiempo de ciclo es 100
    /// ¡OJO! Pregunta de examen
    /// Ciclo de trabajo del 50%   
    /// ¡OJO! Es en porcentaje SIEMPRE
  end

/// Flancos de subida
always (@posedge clk)

/// Tenemos caminos críticos que vamos a usar
/// Si no lo modulamos bien, cagamos.
/// Aislar bien en qué momentos escribimos sin perder eficiencia

/// Todo flip-flop debería tener un "reset"
  /// Para llevar a un estado conocido
  /// "solo cuando tengas flanco de subida y tengas permisos de escritura"
