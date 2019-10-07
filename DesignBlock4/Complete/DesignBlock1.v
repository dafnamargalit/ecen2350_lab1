module DesignBlock1(
input [9:0] SW,
input [1:0] KEY,
output [9:0] LEDR,
output [7:0] HEX0, 
output [7:0] HEX1, 
output [7:0] HEX2, 
output [7:0] HEX3, 
output [7:0] HEX4, 
output [7:0] HEX5
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


reg true;
reg [3:0] first;
reg [3:0] second;
reg [3:0] third;
reg [3:0] fourth;
reg [3:0] fifth;
reg [3:0] sixth;

always @(negedge KEY[1])
begin
if(KEY)
begin
true = ~true;
end
if(true)
begin
    first <= 4'b0000;
    second <= 4'b1001;
    third <= 4'b0001;
    fourth <= 4'b0010;
    fifth <= 4'b0000;
    sixth <= 4'b0000;
end
if(~true)
begin
    first <= 4'b0000;
    second <= 4'b0110;
    third <= 4'b0001;
    fourth <= 4'b0001;
    fifth <= 4'b0000;
    sixth <= 4'b0000;
    end
end

    HexNumbers first_zero(.NUM (first),.HEX (HEX5)); 

    HexNumbers six(.NUM (second),.HEX (HEX4));       

    HexNumbers first_one(.NUM (third),.HEX (HEX3));

    HexNumbers second_one(.NUM (fourth),.HEX (HEX2)); 

    HexNumbers second_zero(.NUM (fifth),.HEX (HEX1)); 

    HexNumbers third_zero(.NUM (sixth),.HEX (HEX0)); 

endmodule
