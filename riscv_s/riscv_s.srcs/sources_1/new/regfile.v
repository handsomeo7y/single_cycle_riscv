`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 11:34:46
// Design Name: 
// Module Name: regfile
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


module regfile(
    input                       clk ,
    input       [4:0]           A1  ,
    input       [4:0]           A2  ,
    input       [4:0]           A3  ,
    input       [31:0]          WD3 ,
    input                       WE3 ,
    output      [31:0]          RD1 ,
    output      [31:0]          RD2
    );
    // ref define
    reg [31:0] rf [31:0];
    always@(posedge clk)begin  // 写入是时序的 读出是组合的
        if(WE3)
            rf[A3] <= WD3;
        else
            rf[A3] <= rf[A3];
    end
    assign RD1 = (A1 != 0) ? rf[A1] : 0;
    assign RD2 = (A2 != 0) ? rf[A2] : 0;            
            
 
endmodule
