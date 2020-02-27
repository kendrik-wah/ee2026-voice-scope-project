`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2018 20:55:45
// Design Name: 
// Module Name: LED_calibrate
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


module LED_calibrate(
    input clk_20k,
    input clk_5Hz,
    input sw4, 
    input btnC,
    input [9:0]wave,
    output reg [9:0]new_threshold = 10'd575,
    output reg [9:0]interval = 10'd28
    );
    
    reg [9:0] max_value = 10'd1023;
    reg [9:0] base = 10'd575;
    reg [9:0] LEDs_needed;
    reg [9:0] difference;
    wire [9:0] average;
    wire average_state;
    
    averaging averaged(clk_20k, sw4, wave, average, average_state);
 
    always @ (posedge clk_5Hz) begin
        base <= (sw4 == 1) ? ((wave < average) ? (wave + average) : wave) : (btnC == 0) ? base : 10'd575;
        new_threshold <= base;
        difference <= max_value - new_threshold;
        LEDs_needed <= (difference < 16) ? difference : 10'd16;
        interval <= (btnC == 1) ? (difference / LEDs_needed) : (difference < 16 && sw4 == 1) ? 10'd1 : ((sw4 == 1) ? (difference / LEDs_needed) : interval);
    end

endmodule
