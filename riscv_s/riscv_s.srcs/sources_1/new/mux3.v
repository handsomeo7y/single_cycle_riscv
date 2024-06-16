`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 17:59:20
// Design Name: 
// Module Name: mux3
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


module mux3#(parameter WITHD = 8)(
    input       [WITHD-1:0]     d0,
    input       [WITHD-1:0]     d1, 
    input       [WITHD-1:0]     d2,
    input       [1:0]           s,
    output      [WITHD-1:0]     y   
    );
    assign y = s[1]?d2:(s[0]?d1:d0);
    
endmodule
