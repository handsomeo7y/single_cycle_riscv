`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 17:31:24
// Design Name: 
// Module Name: riscv_single
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


module riscv_single(
    input               clk,
    input               reset,
    input       [31:0]  Instr, 
    input       [31:0]  ReadData,
    output      [31:0]  PC,
    output      [31:0]  ALUResult,
    output      [31:0]  WriteData,
    output              MemWrite              
    );
    wire        ALUSrc, RegWrite, Jump, Zero;
    wire [1:0]  ResultSrc, ImmSrc;
    wire [2:0]  ALUControl;
    
controller controller_u(
    .op                     (Instr[6:0])     ,               
    .funct3                 (Instr[14:12])   ,
    .funct7b5               (Instr[30])      ,
    .Zero                   (Zero)           ,
    .ResultSrc              (ResultSrc)      ,
    .MemWrite               (MemWrite)       ,
    .PCSrc                  (PCSrc)          ,
    .ALUSrc                 (ALUSrc)         ,
    .RegWrite               (RegWrite)       ,
    .Jump                   (Jump)           ,
    .ImmSrc                 (ImmSrc)         ,
    .ALUControl             (ALUControl)     
    
    );
datapath datapath_u(
    .clk                    (clk)            ,                          
    .reset                  (reset)          ,
    .ResultSrc              (ResultSrc)      ,
    .PCSrc                  (PCSrc)          ,
    .ALUSrc                 (ALUSrc)         ,
    .ALUControl             (ALUControl)     ,
    .ImmSrc                 (ImmSrc)         ,
    .RegWrite               (RegWrite)       ,
    .Instr                  (Instr)          ,
    .ReadData               (ReadData)       ,
    .PC                     (PC)             ,
    .ALUResult              (ALUResult)      ,
    .WriteData              (WriteData)      ,
    .Zero                   (Zero)           
    
    
    );
    
    
    
    
    
    
    
endmodule
