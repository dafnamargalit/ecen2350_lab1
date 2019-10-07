module Birthdays(
    input [1:0] KEY,
    output [7:0] HEX0, 
    output [7:0] HEX1, 
    output [7:0] HEX2, 
    output [7:0] HEX3, 
    output [7:0] HEX4, 
    output [7:0] HEX5
);

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
