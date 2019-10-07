module DesignBlock3( output [7:0] HEX0,
output [7:0] HEX1,
output [7:0] HEX4,
output [7:0] HEX5,
output [9:0] LEDR,
input  [9:0] SW
);

wire signed [3:0] input1, input2;

assign input1 = SW[7:4];
assign input2 = SW[3:0];

wire twosComp;

assign twosComp = (SW[9:8] == 2'b11) ? 1 : 0;

wire [3:0] sign1, sign2;

assign sign1 = (twosComp && input1[3]) ? 4'b1010 : 4'b1011;
assign sign2 = (twosComp && input2[3]) ? 4'b1010 : 4'b1011;

HexNumbers inputSign1(.NUM (sign1), .HEX (HEX5));
HexNumbers inputSign2(.NUM (sign2), .HEX (HEX1));

wire [3:0] abs1, abs2;

assign abs1 = (twosComp && input1[3]) ? ~input1 + 1 : input1;
assign abs2 = (twosComp && input2[3]) ? ~input2 + 1 : input2;

HexNumbers inputVal1(.NUM (abs1), .HEX (HEX4));
HexNumbers inputVal2(.NUM (abs2), .HEX (HEX0));

assign LEDR[0] = ((twosComp && (input1 < input2)) || (~twosComp && (input1 > input2))) ? 1 : 0;
assign LEDR[1] = ((twosComp && (input1 > input2)) || (~twosComp && (input1 < input2))) ? 1 : 0;
assign LEDR[2] = (input1 == input2) ? 1 : 0;

endmodule








