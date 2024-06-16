`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 17:40:19
// Design Name: 
// Module Name: datapath
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


module datapath(
    input               clk         ,
    input               reset       ,
    input   [1:0]       ResultSrc   ,
    input               PCSrc       ,
    input               ALUSrc      ,
    input   [2:0]       ALUControl  ,
    input   [1:0]       ImmSrc      ,
    input               RegWrite    ,
    input   [31:0]      Instr       ,
    input   [31:0]      ReadData    ,
    output  [31:0]      PC          ,
    output  [31:0]      ALUResult   ,
    output  [31:0]      WriteData   ,
    output              Zero
    );
 
 // wire define
    wire   [31:0] PCNext, PCPlus4, PCTarget;
    wire   [31:0] ImmExt;
    wire   [31:0] SrcA, SrcB;
    wire   [31:0] Result;
 
 
    
// next PC logic  这一段书本上的写法让我感觉非常惊讶。
// 居然把触发器，加法器全部都模块化，把模块化应用到了极致，
//如果我按自己的思路写，这个模块就不会有更细的分块了。
    flopr#(32) pcreg(
    .clk               (clk)    ,
    .reset             (reset)  ,
    .d                 (PCNext) ,
    .q                 (PC)
    );
    adder pcadd4(
    .a              (PC)        ,
    .b              (32'd4)     ,
    .y              (PCPlus4)
    );
    adder pcaddbranch(
    .a              (PC)        ,
    .b              (ImmExt)    ,
    .y              (PCTarget)
    );
    mux2#(32)  pcmux(
    .d0             (PCPlus4)   ,
    .d1             (PCTarget)  ,
    .s              (PCSrc)     ,
    .y              (PCNext)    
    );
//  register file logic
    regfile rf(
    .clk            (clk)           ,
    .A1             (Instr[19:15])  ,
    .A2             (Instr[24:20])  ,
    .A3             (Instr[11:7])   ,
    .WD3            (Result)     ,
    .WE3            (RegWrite)      ,
    .RD1            (SrcA)          ,
    .RD2            (WriteData)        
    );
    extend  ext(
    .instr          (Instr[31:7])   , 
    .immsrc         (ImmSrc)        ,
    .immext         (ImmExt)        
    );
    //ALU logic
     mux2 #(32)   srcbmux(
     .d0            (WriteData)     , 
     .d1            (ImmExt)        , 
     .s             (ALUSrc)        , 
     .y             (SrcB)
     );
     alu alu_u(
     .ALUControl    (ALUControl)    ,
     .SrcA          (SrcA)          ,      
     .SrcB          (SrcB)          ,      
     .Zero          (Zero)          ,      
     .ALUResult     (ALUResult)
     );
     mux3#(32) resultmux(
     .d0            (ALUResult)     ,            
     .d1            (ReadData)      ,
     .d2            (PCPlus4)       ,
     .s             (ResultSrc)     ,
     .y             (Result)        
     );
    
endmodule
