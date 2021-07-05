`timescale 1ns / 1ps

module Round(clock, rc, stateMatrix, in_key, out_key, round_out);
    input clock;
    input [3:0] rc;
    input [127:0] stateMatrix, in_key;

    output [127:0]out_key, round_out;

    wire [127:0]  MixClm, sb ,shiftedRow;

    KeyGeneration k(rc, in_key, out_key);

    subbytes sub(stateMatrix, sb); 

    shiftrow sft(sb, shiftedRow);

    mixcolumn mx(shiftedRow, MixClm);

    assign round_out = MixClm ^ out_key;

endmodule
