`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2018 13:09:02
// Design Name: 
// Module Name: volume_indicator
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


module volume_indicator(
    input clk_20k,
    input clk_5Hz,
    input sw4,
    input btnC,
    input [9:0] wave,
    output reg [15:0] LED = 0
    );
    
    reg [15:0] power = 16'b1111111111111111;

    wire [9:0] base;
    wire [9:0] interval;
    
    LED_calibrate calibrate(clk_20k, clk_5Hz, sw4, btnC, wave, base, interval);
    
    always @ (posedge clk_5Hz) begin
    
        LED <= (wave <= base) ? 0 :
                        (wave <= base + interval) ? power[1:0] :
                        (wave <= base + (interval * 2)) ? power[2:0] :
                        (wave <= base + (interval * 3)) ? power[3:0] :
                        (wave <= base + (interval * 4)) ? power[4:0] :
                        (wave <= base + (interval * 5)) ? power[5:0] :
                        (wave <= base + (interval * 6)) ? power[6:0] :
                        (wave <= base + (interval * 7)) ? power[7:0] :
                        (wave <= base + (interval * 8)) ? power[8:0] :
                        (wave <= base + (interval * 9)) ? power[9:0] :
                        (wave <= base + (interval * 10)) ? power[10:0] :
                        (wave <= base + (interval * 11)) ? power[11:0] :
                        (wave <= base + (interval * 12)) ? power[12:0] :
                        (wave <= base + (interval * 13)) ? power[13:0] :
                        (wave <= base + (interval * 14)) ? power[14:0] :
                        power;             
    end
    
endmodule
