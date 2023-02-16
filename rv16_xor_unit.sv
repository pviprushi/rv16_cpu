module rv16_xor_unit(rs1_xor_in,rs2_xor_in,rd_xor_out);

	parameter DATA = 16;
	input [DATA-1:0]rs1_xor_in;
	input [DATA-1:0]rs2_xor_in;
	output [DATA-1:0]rd_xor_out;
	
	xor XOR(rd_xor_out,rs1_xor_in,rs2_xor_in);
	
endmodule






	