module ffd (input wire clk, input wire reset, input wire d, output reg q);
  // reset asíncrono.
  always @(posedge clk, posedge reset) 
  if (reset)
   q <= 1'b0; //asignación no bloqueante q=0
  else
   q <= d; //asignación no bloqueante q =d 
endmodule