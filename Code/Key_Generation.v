`timescale 1ns / 1ps

module KeyGeneration(rc, in_key, out_key);
    
   input [3:0] rc;
   input [127:0] in_key;
   output [127:0] out_key;
   
   wire [31:0] word0, word1, word2, word3, temp;
         
               
       assign word0 = in_key[127:96];
       assign word1 = in_key[95:64];
       assign word2 = in_key[63:32];
       assign word3 = in_key[31:0];
       
       sbox a1(.inputByte(word3[23:16]), .substitutedByte(temp[31:24]));
       sbox a2(.inputByte(word3[15:8]), .substitutedByte(temp[23:16]));
       sbox a3(.inputByte(word3[7:0]), .substitutedByte(temp[15:8]));
       sbox a4(.inputByte(word3[31:24]), .substitutedByte(temp[7:0]));

       assign  out_key[127:96] = word0 ^ temp ^ rcon(rc);
       assign  out_key[95:64] = word0 ^ word1 ^ temp ^ rcon(rc);
       assign  out_key[63:32] = word0 ^ word1 ^ word2 ^ temp ^ rcon(rc);
       assign  out_key[31:0]  = word0 ^ word1 ^ word2 ^ word3 ^ temp ^ rcon(rc);
       
     function [31:0]	rcon;
      input	[3:0]	rc;
      case(rc)	
         4'h1: rcon=32'h01_00_00_00;
         4'h2: rcon=32'h02_00_00_00;
         4'h3: rcon=32'h04_00_00_00;
         4'h4: rcon=32'h08_00_00_00;
         4'h5: rcon=32'h10_00_00_00;
         4'h6: rcon=32'h20_00_00_00;
         4'h7: rcon=32'h40_00_00_00;
         4'h8: rcon=32'h80_00_00_00;
         4'h9: rcon=32'h1b_00_00_00;
         4'ha: rcon=32'h36_00_00_00;
         default: rcon=32'h00_00_00_00;
       endcase

     endfunction

endmodule
