`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company:  Enspawn
// Engineer: Mrunmoy
// 
// Create Date: 11.01.2019 22:22:29
// Design Name: blinky
// Module Name: blinky
// Project Name: blinky2
// Target Devices: Basys 3
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


module blinky(
    input wire clk,
    input wire reset,
    input wire direction,
    output reg [7:0] leds
    );
    wire div_clk;
    clock_divider #(.DIVIDER(50_000_000)) div( .clk_in(clk),
                          .clk_out(div_clk)
    );
    
     always @ (posedge(div_clk)) begin
        if (reset == 1) begin
            // reset the leds to default state
            leds <= 1;
        end
        else begin
            // change direction from right to left
            if (direction == 1) begin
                // standard rotation in verilog
                leds <= { leds[6:0], leds[7] };            
            end
            // else change direction from left to right
            else begin
                leds <= { leds[0], leds[6:1] };            
            end
        end
    end
endmodule
