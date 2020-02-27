`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2018 11:19:49
// Design Name: 
// Module Name: flex_clk_C
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


module flex_clk_C(
    input CLK,
    input [31:0]k,
    output reg signal = 0
    );
    
    reg [31:0] count = 32'b0;
    
    always @ (posedge CLK) begin
        count <= (k <= count) ? 0 : count + 1;
        signal <= (count == 0) ?  ~signal : signal;
    end
    
endmodule
