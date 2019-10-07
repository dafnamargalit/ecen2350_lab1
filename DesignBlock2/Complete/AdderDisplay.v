module AdderDisplay(
    input [7:0] SW,
	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY
);

wire signed [3:0] input_x, input_y;
wire [3:0] input1, input2;
wire [3:0] sign1, sign2;
wire overflow;
wire signed [3:0] sum;
wire [3:0] sign_out, sum_out;

assign input_x = SW[7:4];
assign input_y =  SW[3:0];

FourBitAdder adder(.carry_in (KEY[0]), .input_x (input_x), .input_y (input_y), .overflow (overflow), .sum (sum) );

//Display Input 1

assign sign1 = (input_x[3] == 1) ? 4'b1010 : 4'b1011;
assign input1 = (input_x[3] == 1) ? ~input_x + 1 : input_x;

HexNumbers sig(.NUM (sign1), .HEX (HEX5));
HexNumbers value1(.NUM (input1), .HEX (HEX4));

//Display Input 2

assign sign2 = (input_y[3] == 1) ? 4'b1010 : 4'b1011;
assign input2 = (input_y[3] == 1) ? ~input_y + 1 : input_y;

HexNumbers sign(.NUM (sign2), .HEX (HEX3));
HexNumbers value2(.NUM (input2), .HEX (HEX2));

//Display Sum or Overflow

assign sign_out = overflow ? 4'b0000 : (sum[3] == 1) ? 4'b1010 : 4'b1011;
assign sum_out = overflow ? 4'b1111 : (sum[3] == 1) ? ~sum + 1 : sum;

HexNumbers signout(.NUM (sign_out), .HEX (HEX1));
HexNumbers sumout(.NUM (sum_out), .HEX (HEX0));

endmodule
