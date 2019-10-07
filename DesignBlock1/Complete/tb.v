`timescale 1 ns / 100 ps
module tb();

reg [1:0] KEY;
reg [9:0] SW;
wire [9:0] LEDR;
wire [7:0] HEX0;
wire [7:0] HEX1;
wire [7:0] HEX2;
wire [7:0] HEX3;
wire [7:0] HEX4;
wire [7:0] HEX5;

Complete test1(
    .HEX0 (HEX0),
    .HEX1 (HEX1),
    .HEX2 (HEX2),
    .HEX3 (HEX3),
    .HEX4 (HEX4),
    .HEX5 (HEX5),
    .KEY (KEY),
    .LEDR (LEDR),
    .SW (SW)
);

initial
begin
    $dumpfile("out.vcd");
    $dumpvars;
    $display($time, "<< Starting Simulation >>");
    KEY[0] = 1;
    KEY[1] = 1;
    SW[9:0] = 10'b1100110011;
    #10 KEY[0] = 0;
    #10 KEY[1] = 0;
    #10 SW[9:0] = 10'b0011001100;
    #20 KEY[0] = 0;
    #10 $display("<< Simulation ended >>");
    $finish;
end

initial
begin
    $monitor($time, "KEY[0] = %b, KEY[1] = %b, SW[9:0] = %b", KEY[0], KEY[1], SW[9:0]);
end

endmodule