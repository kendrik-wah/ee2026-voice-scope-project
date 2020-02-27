`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2018 20:10:51
// Design Name: 
// Module Name: sp_module
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


module sp_module(
    input slow_clock, D,
    input sw,
    output sp_dff_out
    );
    
    wire intermediate;
    wire dff_one_out, dff_two_out;
    
    assign intermediate = (sw == 1) ? D : 0;
    
    dff_module dff_one (slow_clock, intermediate, sw, dff_one_out);
    dff_module dff_two (slow_clock, dff_one_out, sw, dff_two_out);
    
    assign sp_dff_out = dff_one_out & ~dff_two_out;
    
    
endmodule
