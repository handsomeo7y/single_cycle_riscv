`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 11:13:52
// Design Name: 
// Module Name: flopr
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


module flopr#(parameter WIDTH=8)(
    input                       clk,
    input                       reset,
    input       [WIDTH-1:0]     d,
    output  reg [WIDTH-1:0]     q

    );
    always@(posedge clk or posedge reset)begin
        if(reset)
            q <= 32'd0;
        else
            q <= d;
    end
           
    
    
    
endmodule
