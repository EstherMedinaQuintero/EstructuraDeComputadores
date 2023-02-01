/// Unidad de control
module uc(input wire clk, reset, zero, carry, input wire [5:0] Opcode, output reg s_inc, s_skip, we, s_inm, output reg [2:0] ALUOp);
  always @(posedge clk, posedge reset)
    case (Opcode)
      /// Saltos condicionales
      000000: /// (SKIPEQ)
        begin
          ALUOp = 011; /// Resta
          #5;
          we <= 0; /// No escribir
          s_skip <= zero ? 1 : 0; 
          s_inc <= 1; /// Es un salto
          s_inm <= 0; /// Nos da igual
        end
      000100: /// (SKIPNE)
        begin
          ALUOp = 011; /// Resta
          #5;
          we <= 0; /// No escribir
          s_skip <= ~zero ? 1 : 0; 
          s_inc <= 1; /// Es un salto
          s_inm <= 0; /// Nos da igual
        end
      001000: /// (SKIPGT)
        begin
          ALUOp = 011; /// Resta
          #5;
          we <= 0; /// No escribir
          s_skip <= ~carry ? 1 : 0; 
          s_inc <= 1; /// Es un salto
          s_inm <= 0; /// Nos da igual
        end
      001100: /// (SKIPGE)
        begin
          ALUOp = 011; /// Resta
          #5;
          we <= 0; /// No escribir
          s_skip <= (carry || zero) ? 1 : 0; 
          s_inc <= 1; /// Es un salto
          s_inm <= 0; /// Nos da igual 
        end
      /// Salto incondicional
      010100: /// (JR)
        begin
          ALUOp = 000; /// Nos da igual
          we <= 0; /// No escribir
          s_skip <= 0; /// Nos da igual
          s_inc <= 0; /// Es un salto
          s_inm <= 0; /// Nos da igual  
        end
      /// Carga inmediata
      010000: /// (LI)
        begin
          ALUOp = 000; /// Nos da igual
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 1; /// Queremos cargar inmediato
        end
      /// Operaciones de la ALU
      100000: /// (A)
        begin
          ALUOp = 000; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      100100: /// (~A)
        begin
          ALUOp = 001; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      101000: /// (A + B = ADD)
        begin
          ALUOp = 010; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      101100: /// (A - B = SUB)
        begin
          ALUOp = 011; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      110000: /// (A & B = AND)
        begin
          ALUOp = 100; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      110100: /// (A | B = OR)
        begin
          ALUOp = 101; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      111000: /// (A ^ B = XOR)
        begin
          ALUOp <= 110; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
      111100: /// (-A = NOT)
        begin
          ALUOp <= 111; /// Opción 
          we <= 1; /// Permiso de escritura
          s_skip <= 0; /// No queremos saltar
          s_inc <= 1; /// No es un salto
          s_inm <= 0; /// No cargar inmediato
        end
    endcase

endmodule