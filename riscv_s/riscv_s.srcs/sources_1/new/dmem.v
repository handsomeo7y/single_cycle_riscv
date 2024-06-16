`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 17:32:36
// Design Name: 
// Module Name: dmem
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


module dmem(
    input                   clk , 
    input                   we  ,
    input       [31:0]      a   , 
    input       [31:0]      wd  ,
    output      [31:0]      rd
    );
    //reg define
    reg [31:0] RAM[63:0];
    assign rd = RAM[a[31:2]]; // word aligned
    always @(posedge clk)
        if (we) RAM[a[31:2]] <= wd;
 endmodule
