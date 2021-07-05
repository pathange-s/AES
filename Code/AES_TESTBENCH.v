`timescale 1ns / 1ps

module AES_testbench;

	reg clock;
	reg [127:0] plain_text, c_key;

	wire [127:0] encryptedKey;

	AES_encryption u1(.clock(clock), .plain_text(plain_text), .c_key(c_key), .dataout(encryptedKey));
 
	initial 
	begin
		clock = 0;

        plain_text = 128'h00112233445566778899aabbccddeeff;
		c_key = 128'h000102030405060708090a0b0c0d0e0f;

		#50;
		plain_text = 128'h54776F204F6E65204E696E652054776F;
		c_key = 128'h5468617473206D79204B756E67204675;

		#50;
		plain_text = 128'h3243f6a8885a308d313198a2e0370734;
		c_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;

	end
      
endmodule

