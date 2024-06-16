`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 20:25:57
// Design Name: 
// Module Name: testbanch
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


module testbench();
    reg              clk;
    reg              reset;
    wire [31:0]      WriteData, DataAdr;
    wire             MemWrite;
    // instantiate device to be tested
    riscv_top dut(
    .clk                (clk), 
    .reset              (reset), 
    .MemWrite           (MemWrite),
    .WriteData          (WriteData), 
    .DataAdr            (DataAdr) 
    );
    // initialize test
    initial 
     begin
         reset <= 1; # 150; reset <= 0;
     end
    // generate clock to sequence tests
    always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end
    // check results
    always @(negedge clk)
   begin
        if(MemWrite) begin
           if(DataAdr == 100 & WriteData == 25) begin
              $display("Simulation succeeded");
              $stop;
           end else if (DataAdr != 96) begin
              $display("Simulation failed");
              $stop;
           end
         end
        end
 endmodule
