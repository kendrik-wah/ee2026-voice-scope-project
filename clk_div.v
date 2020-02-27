`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2018 09:33:45
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input CLK,
    output clk_20k,
    output clk_10k,
    output clk_5k,
    output clk_10Hz,
    output clk_20Hz,
    output clk_5Hz,
    output clk_100Hz
    );

    wire [31:0] twenty_k_hz = 32'd2499;
    wire [31:0] ten_k_hz = 32'd4999;
    wire [31:0] five_k_hz = 32'd9999;
    wire [31:0] ten_hz = 32'd4999999;
    wire [31:0] twenty_hz = 32'd2499999;
    wire [31:0] five_hz = 32'd9999999;
    wire [31:0] one_hundred_hz = 32'd499999;
    
    flex_clk_C freq_20k(CLK, twenty_k_hz, clk_20k);
    flex_clk_C freq_10k(CLK, ten_k_hz, clk_10k);
    flex_clk_C freq_5k(CLK, five_k_hz, clk_5k);
    flex_clk_C freq_10Hz(CLK, ten_hz, clk_10Hz);
    flex_clk_C freq_20Hz(CLK, twenty_hz, clk_20Hz);
    flex_clk_C freq_5Hz(CLK, five_hz, clk_5Hz);
    flex_clk_C freq_100Hz(CLK, one_hundred_hz, clk_100Hz);
    
    endmodule   
