`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2018 20:11:11
// Design Name: 
// Module Name: d_ff
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


module dff_module(
    input dff_clock, D, sw,
    output reg Q = 0
    );
    
        always @ (posedge dff_clock)
            
        begin
            Q <= (sw == 1) ? D : Q;
        end
        
endmodule
