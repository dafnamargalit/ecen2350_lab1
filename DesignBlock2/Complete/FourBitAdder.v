module FourBitAdder(
input [3:0] inputx,
input [3:0] inputy,
input carryin,
output [9:0] SW,
output [1:0] KEY,
output overflow
);

wire [3:0] input_x;
wire [3:0] input_y;
wire [3:0] carry_in;
wire [3:0] sum;
wire [3:0] carry_out;
assign input_x = SW[7:4];


always @(KEY)
begin
    if(KEY[0])
    begin
        assign input_y = SW[3:0];
    end
    if(~KEY[0])
    begin
        assign input_y = ~SW[3:0];
    end
end

FullAdder adder1(.input1 (input_x[0]), .input2 (input_y[0]), .carry_in (~KEY[0]), .sum (sum[0]), .carry_out (carry_out[0]));
FullAdder adder2(.input1 (input_x[1]), .input2 (input_y[1]), .carry_in (carry_out[0]), .sum (sum[1]), .carry_out (carry_out[1]));
FullAdder adder3(.input1 (input_x[2]), .input2 (input_y[2]), .carry_in (carry_out[1]), .sum (sum[2]), .carry_out (carry_out[2]));
FullAdder adder4(.input1 (input_x[3]), .input2 (input_y[3]), .carry_in (carry_out[2]), .sum (sum[3]), .carry_out (carry_out[3]));

assign overflow = carry_out[2] ^ carry_out[3];

endmodule

//if overflow, of
// if positive, positive
//if negative, negative sign, two's complement