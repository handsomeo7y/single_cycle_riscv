`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 17:31:46
// Design Name: 
// Module Name: imem
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


module imem(
    input       [31:0]      A,
    output      [31:0]      RD
    );
    // reg define
    reg    [31:0]  RAM[63:0];
    // initial �ǲ����ۺ���� ��������ֻ���з��� ����дû��ϵ
    initial begin
       $readmemh("D:/eda/riscv/single-cycle_processor/riscv_s/riscvtest.txt",RAM); 
    end
    assign RD = RAM[A[31:2]]; // word aligned ��ַ����Ϊ4 ���A�������λ���Ժ���
//    assign RD = RAM[4]; // word aligned ��ַ����Ϊ4 ���A�������λ���Ժ���


endmodule
