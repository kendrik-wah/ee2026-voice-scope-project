`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2018 20:26:13
// Design Name: 
// Module Name: mass_hold
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


module mass_hold(
    input clk, btnL, btnR, btnU, btnD, btnC, sw,
    output held_btnL, held_btnR, held_btnU, held_btnD, held_btnC
    );
    
    dff_module hold_buttonL(clk, btnL, sw, held_btnL);
    dff_module hold_buttonR(clk, btnR, sw, held_btnR);
    dff_module hold_buttonU(clk, btnU, sw, held_btnU);
    dff_module hold_buttonD(clk, btnD, sw, held_btnD);
    dff_module hold_buttonC(clk, btnC, sw, held_btnC);
    
endmodule
