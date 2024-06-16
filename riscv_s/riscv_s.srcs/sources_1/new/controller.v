`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 17:38:10
// Design Name: 
// Module Name: controller
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


module controller(
    input       [6:0]       op          ,
    input       [2:0]       funct3      ,
    input                   funct7b5    ,
    input                   Zero        ,
    output      [1:0]       ResultSrc   ,
    output                  MemWrite    ,
    output                  PCSrc       , 
    output                  ALUSrc      ,
    output                  RegWrite    , 
    output                  Jump        ,
    output      [1:0]       ImmSrc      ,
    output      [2:0]       ALUControl
    );
    // wire define
     wire [1:0]     ALUOp;
     wire           Branch;
maindec md(
    .op                  (op)           ,     
    .ResultSrc           (ResultSrc)    ,
    .MemWrite            (MemWrite)     ,
    .Branch              (Branch)       ,
    .ALUSrc              (ALUSrc)       ,
    .RegWrite            (RegWrite)     ,
    .Jump                (Jump)         ,
    .ImmSrc              (ImmSrc)       ,
    .ALUOp               (ALUOp)        
     );
aludec  ad(
    .opb5                (op[5])         ,     
    .funct3              (funct3)       ,
    .funct7b5            (funct7b5)     ,
    .ALUOp               (ALUOp)        ,
    .ALUControl          (ALUControl)   
     );
     
     
     
     assign PCSrc = Branch & Zero | Jump;
                      
                      
endmodule                      
                      
                      
                      
                      
