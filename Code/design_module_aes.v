`timescale 1ns / 1ps

module AES_encryption(clock, plain_text, c_key, dataout);

    input clock;
    input [127:0] plain_text, c_key; 

    output [127:0] dataout;
    
    wire [127:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out;
    
    wire [127:0] keyout1, keyout2, keyout3, keyout4, keyout5, keyout6, keyout7, keyout8, keyout9;
	 
	 assign r0_out = c_key ^  plain_text;
	 
    Round R1(.clock(clock), .rc(4'b0001), .stateMatrix(r0_out), .in_key(c_key), .out_key(keyout1), .round_out(r1_out));
    Round R2(.clock(clock), .rc(4'b0010), .stateMatrix(r1_out), .in_key(keyout1), .out_key(keyout2), .round_out(r2_out));
    Round R3(.clock(clock), .rc(4'b0011), .stateMatrix(r2_out), .in_key(keyout2), .out_key(keyout3), .round_out(r3_out));
    Round R4(.clock(clock), .rc(4'b0100), .stateMatrix(r3_out), .in_key(keyout3), .out_key(keyout4), .round_out(r4_out));
    Round R5(.clock(clock), .rc(4'b0101), .stateMatrix(r4_out), .in_key(keyout4), .out_key(keyout5), .round_out(r5_out));
    Round R6(.clock(clock), .rc(4'b0110), .stateMatrix(r5_out), .in_key(keyout5), .out_key(keyout6), .round_out(r6_out));
    Round R7(.clock(clock), .rc(4'b0111), .stateMatrix(r6_out), .in_key(keyout6), .out_key(keyout7), .round_out(r7_out));
    Round R8(.clock(clock), .rc(4'b1000), .stateMatrix(r7_out), .in_key(keyout7), .out_key(keyout8), .round_out(r8_out));
    Round R9(.clock(clock), .rc(4'b1001), .stateMatrix(r8_out), .in_key(keyout8), .out_key(keyout9), .round_out(r9_out));
    finalRound R10(.clock(clock), .rc(4'b1010), .rin(r9_out), .finalKey(keyout9), .final_out(dataout));
    
endmodule
