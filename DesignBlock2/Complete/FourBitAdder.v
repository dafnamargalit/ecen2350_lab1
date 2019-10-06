module FourBitAdder(
input [3:0] inputx,
input [3:0] inputy,
output [9:0] SW,
output [1:0] KEY,
output overflow,
output [3:0] sum
);

wire [3:0] input_x;
wire [3:0] input_y;
wire [3:0] sum_out;
wire [3:0] carry_out;

assign input_x = SW[7:4];
assign input_y = ~KEY[0] ? SW[3:0] : ~SW[3:0];

FullAdder adder1(.input1 (input_x[0]), .input2 (input_y[0]), .carry_in (~KEY[0]), .sum (sum_out[0]), .carry_out (carry_out[0]));
FullAdder adder2(.input1 (input_x[1]), .input2 (input_y[1]), .carry_in (carry_out[0]), .sum (sum_out[1]), .carry_out (carry_out[1]));
FullAdder adder3(.input1 (input_x[2]), .input2 (input_y[2]), .carry_in (carry_out[1]), .sum (sum_out[2]), .carry_out (carry_out[2]));
FullAdder adder4(.input1 (input_x[3]), .input2 (input_y[3]), .carry_in (carry_out[2]), .sum (sum_out[3]), .carry_out (carry_out[3]));

assign overflow = carry_out[2] ^ carry_out[3];
assign sum = sum_out;
endmodule

