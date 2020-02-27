`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2018 11:59:35
// Design Name: 
// Module Name: TestWave_Gen
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


module TestWave_Gen(
    input clk_20k,
    output reg [9:0]ramp_sample = 0
    );
    
    reg [9:0]max_ramp_height = 10'd639;
    
    always @ (posedge clk_20k) begin
    
        ramp_sample <= (ramp_sample == max_ramp_height) ? 10'b0 : ramp_sample + 10'b1;
        
    end
    
endmodule
