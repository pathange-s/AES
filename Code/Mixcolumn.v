`timescale 1ns / 1ps

module mixcolumn(shiftedRow, MixClm);
    input [127:0] shiftedRow;
    output [127:0] MixClm;



        assign MixClm[127:120]= mixcolumn32 (shiftedRow[127:120], shiftedRow[119:112], shiftedRow[111:104], shiftedRow[103:96]);
        assign MixClm[119:112]= mixcolumn32 (shiftedRow[119:112], shiftedRow[111:104], shiftedRow[103:96], shiftedRow[127:120]);
        assign MixClm[111:104]= mixcolumn32 (shiftedRow[111:104],shiftedRow[103:96],shiftedRow[127:120],shiftedRow[119:112]);
        assign MixClm[103:96]= mixcolumn32 (shiftedRow[103:96],shiftedRow[127:120],shiftedRow[119:112],shiftedRow[111:104]);

        assign MixClm[95:88]= mixcolumn32 (shiftedRow[95:88], shiftedRow[87:80], shiftedRow[79:72], shiftedRow[71:64]);
        assign MixClm[87:80]= mixcolumn32 (shiftedRow[87:80], shiftedRow[79:72], shiftedRow[71:64], shiftedRow[95:88]);
        assign MixClm[79:72]= mixcolumn32 (shiftedRow[79:72], shiftedRow[71:64], shiftedRow[95:88], shiftedRow[87:80]);
        assign MixClm[71:64]= mixcolumn32 (shiftedRow[71:64], shiftedRow[95:88], shiftedRow[87:80], shiftedRow[79:72]);

        assign MixClm[63:56]= mixcolumn32 (shiftedRow[63:56], shiftedRow[55:48], shiftedRow[47:40], shiftedRow[39:32]);
        assign MixClm[55:48]= mixcolumn32 (shiftedRow[55:48], shiftedRow[47:40], shiftedRow[39:32], shiftedRow[63:56]);
        assign MixClm[47:40]= mixcolumn32 (shiftedRow[47:40], shiftedRow[39:32], shiftedRow[63:56], shiftedRow[55:48]);
        assign MixClm[39:32]= mixcolumn32 (shiftedRow[39:32], shiftedRow[63:56], shiftedRow[55:48], shiftedRow[47:40]);

        assign MixClm[31:24]= mixcolumn32 (shiftedRow[31:24], shiftedRow[23:16], shiftedRow[15:8], shiftedRow[7:0]);
        assign MixClm[23:16]= mixcolumn32 (shiftedRow[23:16], shiftedRow[15:8], shiftedRow[7:0], shiftedRow[31:24]);
        assign MixClm[15:8]= mixcolumn32 (shiftedRow[15:8], shiftedRow[7:0], shiftedRow[31:24], shiftedRow[23:16]);
        assign MixClm[7:0]= mixcolumn32 (shiftedRow[7:0], shiftedRow[31:24], shiftedRow[23:16], shiftedRow[15:8]);


    function [7:0] mixcolumn32;
        input [7:0] in1, in2, in3, in4;
        begin
            mixcolumn32[7] = in1[6] ^ in2[6] ^ in2[7] ^ in3[7] ^ in4[7];
            mixcolumn32[6] = in1[5] ^ in2[5] ^ in2[6] ^ in3[6] ^ in4[6];
            mixcolumn32[5] = in1[4] ^ in2[4] ^ in2[5] ^ in3[5] ^ in4[5];
            mixcolumn32[4] = in1[3] ^ in1[7] ^ in2[3] ^ in2[4] ^ in2[7] ^ in3[4] ^ in4[4];
            mixcolumn32[3] = in1[2] ^ in1[7] ^ in2[2] ^ in2[3] ^ in2[7] ^ in3[3] ^ in4[3];
            mixcolumn32[2] = in1[1] ^ in2[1] ^ in2[2] ^ in3[2] ^ in4[2];
            mixcolumn32[1] = in1[0] ^ in1[7] ^ in2[0] ^ in2[1] ^ in2[7] ^ in3[1] ^ in4[1];
            mixcolumn32[0] = in1[7] ^ in2[7] ^ in2[0] ^ in3[0] ^ in4[0];
        end
    endfunction
endmodule
