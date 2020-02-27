`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2018 20:06:53
// Design Name: 
// Module Name: button_control_module
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

module button_control_module(
    input clk_20Hz, btnU, btnD, btnC, btnL, btnR,
    output reg [3:0] my_grid_r = 4'h0,
    output reg [3:0] my_grid_g = 4'hF,
    output reg [3:0] my_grid_b = 4'hF,
    output reg [3:0] my_bg_r = 4'h1,
    output reg [3:0] my_bg_g = 4'h0,
    output reg [3:0] my_bg_b = 4'h5,
    output reg [3:0] my_wave_r = 4'hF,
    output reg [3:0] my_wave_g = 4'hF,
    output reg [3:0] my_wave_b = 4'hF
    );
    
    reg [2:0] count = 0;
    
    always @ (posedge clk_20Hz)
    begin
    
        count <= (count < 4) ? count + 1 : 0;
    
        if (btnU && btnD)    //reset
            begin
            my_grid_r <= 4'h0;
            my_grid_g <= 4'hF;
            my_grid_b <= 4'hF;
            my_bg_r <= 4'h1;
            my_bg_g <= 4'h0;
            my_bg_b <= 4'h5;
            my_wave_r <= 4'hF;
            my_wave_g <= 4'hF;
            my_wave_b <= 4'hF;
            end    

        else if (btnU)
            begin
            my_grid_r <= my_grid_r + 1;
            my_grid_g <= my_grid_g + 2;
            my_grid_b <= my_grid_b + 3;
            end
            
        else if (btnD)
            begin
            my_grid_r <= my_grid_r - 1;
            my_grid_g <= my_grid_g - 2;
            my_grid_b <= my_grid_b - 3;
            end
            
        if (btnL && count == 3)
            begin
            my_bg_r <= my_bg_r + 2;
            my_bg_g <= my_bg_g + 3;
            my_bg_b <= my_bg_b + 4;
            end  
                    
        if (btnR && count == 3)
            begin
            my_bg_r <= my_bg_r - 2;
            my_bg_g <= my_bg_g - 3;
            my_bg_b <= my_bg_b - 4;
            end            
 
        if (btnC && count == 3)
            begin
            my_wave_r <= my_wave_r + 2;
            my_wave_g <= my_wave_g + 3;
            my_wave_b <= my_wave_b + 4;
            end            
            
    end

endmodule

