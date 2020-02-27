`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2018 20:25:59
// Design Name: 
// Module Name: mass_debounce
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


module mass_debounce(
    input clk, btnL, btnR, btnU, btnD, btnC, sw,
    output debounced_btnL, debounced_btnR, debounced_btnU, debounced_btnD, debounced_btnC
    );
    
    sp_module debounce_btnL(clk, btnL, sw, debounced_btnL);
    sp_module debounce_btnR(clk, btnR, sw, debounced_btnR);      
    sp_module debounce_btnU(clk, btnU, sw, debounced_btnU);
    sp_module debounce_btnD(clk, btnD, sw, debounced_btnD);    
    sp_module debounce_btnC(clk, btnC, sw, debounced_btnC);  
    
endmodule
