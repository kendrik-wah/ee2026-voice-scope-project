`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2018 00:29:30
// Design Name: 
// Module Name: averaging
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


module averaging(
    input clk,
    input take_average,
    input [9:0] waveform,
    output reg [9:0] averaged_waveform = 0,
    output reg average_state = 0
    );
    
    reg [31:0] counter = 32'd0;
    reg [31:0] intermediate = 32'd0;
    
    always @ (posedge clk) begin
        intermediate <= (counter < 32'd4000 & take_average == 1) ? intermediate + waveform : intermediate;
        counter <= (counter < 32'd4000 & take_average == 1) ? (counter + 1) : counter;
        averaged_waveform <= (counter < 32'd4000 & take_average == 1) ? averaged_waveform : (intermediate / (counter+1));
        average_state <= (counter == 32'd4000 || take_average == 1) ? 1 : 0;
    end
    
endmodule
