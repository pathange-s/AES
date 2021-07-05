`timescale 1ns / 1ps

module finalRound(clock, rc, rin, finalKey, final_out);

    input clock;
    input [3:0] rc;
    input [127:0] rin, finalKey; 

    output [127:0] final_out;

    wire [127:0] sb, shiftedRow, MixClm, out_key;

    KeyGeneration k(rc, finalKey, out_key);

    subbytes sub(rin, sb);

    shiftrow sft(sb, shiftedRow); 

    assign final_out= shiftedRow ^ out_key;

endmodule
