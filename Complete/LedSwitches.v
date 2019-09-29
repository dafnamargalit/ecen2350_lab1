
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
`timescale 1ns/1ps
module LedSwitches(
input [9:0] SW,
input [1:0] KEY,
output [9:0] LEDR
);

assign LEDR[0] = SW[0]^KEY[0];
assign LEDR[1] = SW[1]^KEY[0];
assign LEDR[2] = SW[2]^KEY[0];
assign LEDR[3] = SW[3]^KEY[0];
assign LEDR[4] = SW[4]^KEY[0];
assign LEDR[5] = SW[5]^KEY[0];
assign LEDR[6] = SW[6]^KEY[0];
assign LEDR[7] = SW[7]^KEY[0];
assign LEDR[8] = SW[8]^KEY[0];
assign LEDR[9] = SW[9]^KEY[0];
endmodule
