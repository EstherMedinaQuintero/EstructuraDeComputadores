module ffdc (input wire clk, reset, carga, d, output reg q);
always @(posedge clk, posedge reset)
  if(reset)
    q <= 1'b0; // asignación no bloqueante q=0
  else 
   if (carga)
    q <= d; // asigación no bloqueante q=d
endmodule