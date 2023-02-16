module rv16_sub_unit(rs1_sub_in,rs2_sub_in,bin,rd_sub_out,bout);

	parameter DATA = 16; 
	input [DATA-1:0]rs1_sub_in;
	input [DATA-1:0]rs2_sub_in;
	input bin;
	output [DATA-1:0]rd_sub_out;
	output bout;
	
	full_sub F0(rs1_sub_in[0],rs2_sub_in[0],bin,rd_sub_out[0],bout);
	full_sub F1(rs1_sub_in[1],rs2_sub_in[1],bin,rd_sub_out[1],bout);
	full_sub F2(rs1_sub_in[2],rs2_sub_in[2],bin,rd_sub_out[2],bout);
	full_sub F3(rs1_sub_in[3],rs2_sub_in[3],bin,rd_sub_out[3],bout);
	full_sub F4(rs1_sub_in[4],rs2_sub_in[4],bin,rd_sub_out[4],bout);
	full_sub F5(rs1_sub_in[5],rs2_sub_in[5],bin,rd_sub_out[5],bout);
	full_sub F6(rs1_sub_in[6],rs2_sub_in[6],bin,rd_sub_out[6],bout);
	full_sub F7(rs1_sub_in[7],rs2_sub_in[7],bin,rd_sub_out[7],bout);
	full_sub F8(rs1_sub_in[8],rs2_sub_in[8],bin,rd_sub_out[8],bout);
	full_sub F9(rs1_sub_in[9],rs2_sub_in[9],bin,rd_sub_out[9],bout);
	full_sub F10(rs1_sub_in[10],rs2_sub_in[10],bin,rd_sub_out[10],bout);
	full_sub F11(rs1_sub_in[11],rs2_sub_in[11],bin,rd_sub_out[11],bout);
	full_sub F12(rs1_sub_in[12],rs2_sub_in[12],bin,rd_sub_out[12],bout);
	full_sub F13(rs1_sub_in[13],rs2_sub_in[13],bin,rd_sub_out[13],bout);
	full_sub F14(rs1_sub_in[14],rs2_sub_in[14],bin,rd_sub_out[14],bout);
	full_sub F15(rs1_sub_in[15],rs2_sub_in[15],bin,rd_sub_out[15],bout);
endmodule;



module full_sub(a,b,bin,f_out,f_bout);

	input a,b,bin;
	output f_bout,f_out;
	
	wire b2;
	
	xor HXOR(h_out,a,b);
	and HAND(h_bout,~a,b);
	xor H2XOR(f_out,HXOR,bin);
	and HAND2(b2,~HXOR,bin);
	or HOR(f_bout,HAND2,HAND);
endmodule




