`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2018 23:02:19
// Design Name: 
// Module Name: Draw_Waveform_2
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


module Draw_Waveform_2(
    input clk_sample,
    input clk_record,
    input [3:0]sw,
    input [12:11]sw_bar,

    input [3:0] my_wave_r,
    input [3:0] my_wave_g,
    input [3:0] my_wave_b,

    input [7:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_waveform_2,
    output [3:0] VGA_Green_waveform_2,
    output [3:0] VGA_Blue_waveform_2
    );

    reg [7:0]MIC_records [29999:0]; // Array to store the MIC values

    reg [31:0]counter = 32'd0;

    always @ (posedge clk_record) begin // At a frequency of 10kHz, store the current state into the register
                                     
        MIC_records[counter] <= (sw[0] == 1 & counter < 30000) ? wave_sample :                       // record wave
                            (sw[3] == 1) ? 383 :                                                 // delete recording
                            MIC_records[counter];                                               // keep at current entry

        counter <= (counter < 30000 & sw[0] == 1 || (sw[3] == 1 & counter < 30000)) ? counter + 1 :                        // jump to next entry for modification
               ((sw[0] == 0) ? 0 :                                                                // stay at current entry
               29999);                                                                            // stay at max value when not recording or when record is full
        
    end
    
    //The Sample_Memory represents the memory array used to store the voice samples.
    //There are 1280 points and each point can range from 0 to 1023. 
    reg [7:0] Sample_Memory[29999:0];
    reg [10:0] i;
    reg [31:0] intermediate = 32'd0;
    reg [31:0] hist_count = 32'd0;
    
    wire [11:0]k = (sw[1] == 1 || sw[3] == 1) ? 0 : 1119; // freeze the small graph
    
    wire clk_display;
    
    assign clk_display = (sw[2] == 1) ? clk_record : clk_sample; // show record based on recording frequency if sw2 ON
    
    always @ (posedge clk_display) begin
     
        i = (i == k) ? 0 : i + 1;

        intermediate <= (sw_bar[11] == 1 & sw[2] == 0 & (i % 16) == 0) ? wave_sample :
                        (sw_bar[11] == 1 & sw[2] == 1 & (i % 16) == 0) ? MIC_records[hist_count] :
                        intermediate;

        Sample_Memory[i] <= (hist_count < 30000 & sw_bar[11] == 0 & sw[2] == 1) ? MIC_records[hist_count] :
                            (hist_count < 30000 & sw_bar[11] == 1 & sw_bar[12] == 1) ? intermediate :            
                            ((hist_count == 30000) ? 383 :                   
                            wave_sample);
                            
        hist_count <= (hist_count < 30000 & sw[2] == 1)? (hist_count + 1) :                // access record entries if replay ON
                      ((sw[2] == 0) ? 0 :                                                  // go back to start if replay OFF
                      hist_count);                                                         // prevent replay
    end
    
    assign VGA_Red_waveform_2 = ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD == (383 - Sample_Memory[VGA_HORZ_COORD - 160]))) ||
                                ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119 && VGA_HORZ_COORD % 16) && (VGA_VERT_COORD >= (383 - Sample_Memory[VGA_HORZ_COORD - 160])) && sw_bar[12] && sw_bar[11]  && VGA_VERT_COORD < 383) ||
                                ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD >= (383 - Sample_Memory[VGA_HORZ_COORD - 160])) && sw_bar[12] && VGA_VERT_COORD < 383) ? my_wave_r : 0;

    assign VGA_Green_waveform_2 = ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD == (383 - Sample_Memory[VGA_HORZ_COORD - 160]))) ||
                                  ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119 && VGA_HORZ_COORD % 16) && (VGA_VERT_COORD >= (383 - Sample_Memory[VGA_HORZ_COORD - 160])) && sw_bar[12] && sw_bar[11]  && VGA_VERT_COORD < 383) ||
                                  ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD >= (383 - Sample_Memory[VGA_HORZ_COORD - 160])) && sw_bar[12] && VGA_VERT_COORD < 383) ? my_wave_g : 0;

    assign VGA_Blue_waveform_2 = ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD == (383 - Sample_Memory[VGA_HORZ_COORD - 160]))) ||
                                 ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119 && VGA_HORZ_COORD % 16) && (VGA_VERT_COORD >= (383 - Sample_Memory[VGA_HORZ_COORD - 160])) && sw_bar[12] && sw_bar[11]  && VGA_VERT_COORD < 383) ||
                                 ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD >= (383 - Sample_Memory[VGA_HORZ_COORD - 160])) && sw_bar[12] && VGA_VERT_COORD < 383) ? my_wave_b : 0;
    
endmodule

