module FullAdder(
    input input1,
    input input2,
	input carry_in,
	output sum,
	output carry_out
);

assign sum_out = input1 ^ input2 ^ carry_in;
assign carry_out = ((input1 ^ input2) && carry_in) | (input1 && input2);

endmodule