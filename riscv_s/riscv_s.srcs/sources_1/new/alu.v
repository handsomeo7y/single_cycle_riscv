`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 18:05:23
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input       [2:0]       ALUControl,
    input       [31:0]      SrcA,
    input       [31:0]      SrcB,
    output                  Zero,
    output  reg [31:0]      ALUResult
    );
    // wire define
  wire [31:0] condinvb, sum; 
  wire        cout;           // carry out of adder 
   
  assign condinvb = ALUControl[0] ? ~SrcB : SrcB; 
  assign {cout, sum} = SrcA + condinvb + ALUControl[0]; 
  assign Zero= (SrcA-SrcB==0)?1:0;
   
  always@(*)begin 
    case (ALUControl) 
      3'b000:   ALUResult = sum;                    // add 
      3'b001:   ALUResult = sum;                    // subtract 
      3'b010:   ALUResult = SrcA & SrcB;            // and 
      3'b011:   ALUResult = SrcA | SrcB;            // or 
      3'b101:   ALUResult = sum[31];                // slt 
      default:  ALUResult = 32'bx; 
    endcase
  end 
endmodule
