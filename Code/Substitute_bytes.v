`timescale 1ns / 1ps

module subbytes(stateMatrix, sb);

     input [127:0] stateMatrix;
     output [127:0] sb;

          sbox S0( .inputByte(stateMatrix[127:120]), .substitutedByte(sb[127:120]) );
          sbox S1( .inputByte(stateMatrix[119:112]), .substitutedByte(sb[119:112]) );
          sbox S2( .inputByte(stateMatrix[111:104]), .substitutedByte(sb[111:104]) );
          sbox S3( .inputByte(stateMatrix[103:96]), .substitutedByte(sb[103:96]) );
     
          sbox S4( .inputByte(stateMatrix[95:88]), .substitutedByte(sb[95:88]) );
          sbox S5( .inputByte(stateMatrix[87:80]), .substitutedByte(sb[87:80]) );
          sbox S6( .inputByte(stateMatrix[79:72]), .substitutedByte(sb[79:72]) );
          sbox S7( .inputByte(stateMatrix[71:64]), .substitutedByte(sb[71:64]) );
     
          sbox S8( .inputByte(stateMatrix[63:56]), .substitutedByte(sb[63:56]) );
          sbox S9( .inputByte(stateMatrix[55:48]), .substitutedByte(sb[55:48]) );
          sbox S10(.inputByte(stateMatrix[47:40]), .substitutedByte(sb[47:40]) );
          sbox S11(.inputByte(stateMatrix[39:32]), .substitutedByte(sb[39:32]) );
     
          sbox S12(.inputByte(stateMatrix[31:24]), .substitutedByte(sb[31:24]) );
          sbox S13(.inputByte(stateMatrix[23:16]), .substitutedByte(sb[23:16]) );
          sbox S14(.inputByte(stateMatrix[15:8]), .substitutedByte(sb[15:8]) );
          sbox S15(.inputByte(stateMatrix[7:0]), .substitutedByte(sb[7:0]) );
	  
endmodule
