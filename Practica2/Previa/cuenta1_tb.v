`timescale 1ns/10ps

module cuenta1_tb();
  wire [3:0] Cuenta_test;
  reg [2:0] Valor_test;
  reg start_test, clk_test;
  wire fin_test;
  
  cuenta1 cuenta1_1(Valor_test, start_test, clk_test, Cuenta_test, fin_test);
    initial
      begin
        $monitor("Valor=%b start=%b clk=%b Cuenta=%b fin=%b", Valor_test, start_test, clk_test, Cuenta_test, fin_test);
        $dumpfile("cuenta1_tb.vcd");
        $dumpvars;

        /// No queremos reiniciar
        start_test = 0;

        /// Primera prueba Q: 000 (0)
        Valor_test = 3'b000;

        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Segunda prueba Q: 001 (1)
        Valor_test = 3'b001;

        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Tercera prueba Q: 010 (2)
        Valor_test = 3'b010;
        
        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Cuarta prueba Q: 011 (3)
        Valor_test = 3'b011;
        
        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Quinta prueba Q: 100 (4)
        Valor_test = 3'b100;

        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Sexta prueba Q: 101 (5)
        Valor_test = 3'b101;
        
        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Séptima prueba Q: 110 (6)
        Valor_test = 3'b110;

        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20
        
        /// Octava prueba Q: 111 (7)
        Valor_test = 3'b111;

        /// Cambiamos flancos de reloj
        clk_test = 0;
        #20
        clk_test = 1;
        #20

        /// Reseteamos
        start_test = 1;
        #20

        $finish;
      end
endmodule