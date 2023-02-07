module rv16_sub_unit(rs1_sub_in,rs2_sub_in,bin,rd_sub_out,bout);

	parameter DATA = 4; 
	input [DATA-1:0]rs1_sub_in;
	input [DATA-1:0]rs2_sub_in;
	input bin;
	output [DATA-1:0]rd_sub_out;
	output bout;
	
	full_sub F1(rs1_sub_in[0],rs2_sub_in[0],bin,rd_sub_out[0],bout);
	full_sub F1(rs1_sub_in[1],rs2_sub_in[1],bin,rd_sub_out[1],bout);
	full_sub F1(rs1_sub_in[2],rs2_sub_in[2],bin,rd_sub_out[2],bout);
	full_sub F1(rs1_sub_in[3],rs2_sub_in[3],bin,rd_sub_out[3],bout);
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
