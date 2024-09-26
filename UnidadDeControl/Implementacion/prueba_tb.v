`timescale 1 ns / 10 ps

module cuenta1_tb();

wire [3:0] Cuenta_test;
reg [2:0] Valor_test;
reg start_test, clk_test;
wire fin_test; 

cuenta1 cuenta1(Valor_test, start_test, clk_test, Cuenta_test, fin_test);

/// Reloj
always /// Siempre activo
  begin
    clk_test = 1;
    #50;
    clk_test = 0;
    #50;
  end

initial
  begin
    $monitor("tiempo=%0d valor=%b start=%b clk=%b cuenta=%b fin=%b", $time, Valor_test, start_test, clk_test, Cuenta_test, fin_test);
    $dumpfile("cuenta1_tb.vcd");
    $dumpvars;

    start_test = 0;
    #10;

    /// Empezamos en el cero
    Valor_test = 3'b000;
    #800;
    
    start_test = 1;
    #40;
    $finish;
  end
endmodule