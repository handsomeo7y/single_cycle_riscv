`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 16:45:07
// Design Name: 
// Module Name: riscv_top
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


module riscv_top(
    input               clk,
    input               reset,
    output              MemWrite,
    output      [31:0]  DataAdr,
    output      [31:0]  WriteData
               
    );
    wire  [31:0] PC, Instr, ReadData;
    riscv_single riscv_single_u(
     .clk                   (clk)       , 
     .reset                 (reset)     , 
     .PC                    (PC)        , 
     .Instr                 (Instr)     , 
     .MemWrite              (MemWrite)  ,
     .ALUResult             (DataAdr) ,  
     .WriteData             (WriteData) , 
     .ReadData              (ReadData)
    );
    imem imem_u(
     .A                     (PC)        , 
     .RD                    (Instr)
    );
    dmem dmem_u(
    . clk                   (clk)       , 
    . we                    (MemWrite)  , 
    . a                     (DataAdr)   , 
    . wd                    (WriteData) , 
    . rd                    (ReadData)
    );
    
    
    
    
    
    
    
endmodule
