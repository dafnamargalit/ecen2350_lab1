
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
module HexSign(
    input [3:0] sign,
    output [7:0] HEX
);


reg [7:0] sig;
//=======================================================
//  Structural coding
//=======================================================


    always @(sign)
    begin
        case (sign)
        4'b0000: sig <= 8'b11111111; //blank
        4'b1000: sig <= 8'b10111111; //minus
        4'b0001: sig <= 8'b11000000; //0
        4'b1111: sig <= 8'b10010000; //F
        default:  sig <= 8'b11111111;
        endcase
    end

assign HEX = sig;

endmodule