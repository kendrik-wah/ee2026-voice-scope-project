`timescale 1ns / 1ps

module Draw_Background_Small(
    input sw10,
    input sw4,
    input sw3,
    input sw1,
    input sw0,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );
    
    wire Condition_For_Grid = (sw10 && ((VGA_HORZ_COORD >= 160 && VGA_HORZ_COORD <= 1119) && (VGA_VERT_COORD >= 192 && VGA_VERT_COORD <= 384)))
                              ||
                              ((sw0 || sw3) && ((VGA_HORZ_COORD >= 4 && VGA_HORZ_COORD <= 150) && (VGA_VERT_COORD >= 585 && VGA_VERT_COORD <=600)))
                              ||
                              (sw1 && ((VGA_HORZ_COORD >= 2 && VGA_HORZ_COORD <= 60) && (VGA_VERT_COORD >= 585 && VGA_VERT_COORD <=600)))
                              ||
                              (sw4 && ((VGA_HORZ_COORD >= 4 && VGA_HORZ_COORD <= 120) && (VGA_VERT_COORD >= 585 && VGA_VERT_COORD <=600)));


    assign VGA_Red_Grid = Condition_For_Grid ? 4'h1 : 4'h0 ;
    assign VGA_Green_Grid = Condition_For_Grid ? 4'h3 : 4'h0 ;
    assign VGA_Blue_Grid = Condition_For_Grid ? 4'h1 : 4'h0;
     
endmodule
