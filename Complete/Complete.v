// `include "./Birthdays.v"
// `include "./LedSwitches.v"
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Complete(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);


LedSwitches yey (
    .SW (SW),
	.KEY (KEY),
    .LEDR (LEDR)
);

Birthdays birthyay (
	.KEY (KEY),
	.HEX0 (HEX0), 
    .HEX1 (HEX1), 
    .HEX2 (HEX2), 
    .HEX3 (HEX3), 
    .HEX4 (HEX4), 
    .HEX5 (HEX5)
);
//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================



endmodule
