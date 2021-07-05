`timescale 1ns / 1ps

module shiftrow(sb,shiftedRow);

input [127:0] sb;
output [127:0] shiftedRow;


    assign        shiftedRow[7:0] = sb[39:32]; 
    assign        shiftedRow[15:8] = sb[79:72];
    assign        shiftedRow[23:16] = sb[119:112];
    assign        shiftedRow[31:24] = sb[31:24];
    
    assign        shiftedRow[39:32] = sb[71:64];
    assign        shiftedRow[47:40] = sb[111:104];
    assign        shiftedRow[55:48] = sb[23:16];
    assign        shiftedRow[63:56] = sb[63:56];
    
    assign        shiftedRow[71:64] = sb[103:96];
    assign        shiftedRow[79:72] = sb[15:8];
    assign        shiftedRow[87:80] = sb[55:48];
    assign        shiftedRow[95:88] = sb[95:88];

    assign       shiftedRow[103:96] = sb[7:0]; 
    assign       shiftedRow[111:104] = sb[47:40];
    assign       shiftedRow[119:112] = sb[87:80];
    assign       shiftedRow[127:120] = sb[127:120];  

endmodule
