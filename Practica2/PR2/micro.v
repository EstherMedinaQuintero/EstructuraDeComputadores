/// Microcontrolador sin memoria de datos de un solo ciclo
module microc(output wire [5:0] Opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);
  
  /// Cables que nos hacen falta
  wire [9:0] NewPC, CurrentPC;
  wire [15:0] out_mem; /// Salida de la memoria
  wire [9:0] out_mux1, out_mux2; /// Mux de la izquierda
  wire [9:0] Offset; /// Desplazamiento
  wire [3:0] RA1, RA2; /// Registros para operar
  wire [3:0] WA3; /// Registro destino 
  wire [7:0] RD1, RD2; /// Registros que salen del banco y el que entra de escritura
  wire [7:0] WD3; /// Constante para escribir
  wire [7:0] out_alu; /// Salida de la ALU
  wire [7:0] Inm; /// Inmediato

  /// 0: Preparamos el registro del PC
  registro #(10) PC(CurrentPC, clk, reset, NewPC); 

  /// 1: Accedemos a memoria para sacar la instrucción
  memprog memprog(out_mem, clk, CurrentPC);
  /// De aquí ya podemos sacar Offset(09-00) y Opcode(15-10)
  assign Offset = out_mem[9:0];
  assign Opcode = out_mem[15:10];

  /// 2: Avanzamos el PC sumándole lo que nos diga el mux
  sum sum(NewPC, out_mux2, CurrentPC);

  /// 3: Calculamos las salidas de los mux
  parameter NUM1 = 10'b0000000001;
  parameter NUM2 = 10'b0000000010;
  mux2 #(10) primer_mux(out_mux1, NUM1, NUM2, s_skip);
  mux2 #(10) segundo_mux(out_mux2, Offset, out_mux1, s_inc);

  /// 4: Extraemos los registros de la instrucción
  assign RA1 = out_mem[11:8];
  assign RA2 = out_mem[7:4];
  assign WA3 = out_mem[3:0];
  assign Inm = out_mem[11:4];

  /// 5: Cableamos el regfile
  regfile regfile(RD1, RD2, clk, we, RA1, RA2, WA3, WD3);

  /// 6: Cableamos el mux de la derecha y la ALU
  mux2 tercer_mux(WD3, out_alu, Inm, s_inm);
  alu alu(out_alu, zero, carry, RD1, RD2, ALUOp);

endmodule
