`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company:  Enspawn
// Engineer: Mrunmoy
// 
// Create Date: 11.01.2019 22:50:20
// Design Name: clock_divider
// Module Name: clock_divider
// Project Name: blink2
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


module clock_divider(
    input wire clk_in,
    output reg clk_out
    );
    
    parameter DIVIDER = 10000;
    reg [$clog2(DIVIDER)-1:0] count = 0;
    reg reset = 1;
    
    always @ (posedge (clk_in)) begin
        if (reset ==1) begin
            reset <= 0;
            clk_out <= 0;
            count <= 0;
        end
        else begin
            if (count == DIVIDER) begin
                clk_out = ~clk_out;
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end    
    end    
endmodule
