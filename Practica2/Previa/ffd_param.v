module ffd #(parameter retardo = 1)(input wire clk, reset, d, output reg q);
//reset asíncrono
always @(posedge clk, posedge reset)
  if(reset)
    q <= #retardo 1'b0; // asignación no bloqueante q = 0
  else
    q <= #retardo d; // asignación no bloqueante a q = d
  
endmodule