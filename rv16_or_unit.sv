module rv16_or_unit(rs1_or_in,rs2_or_in,rd_or_out);

	parameter DATA = 4;
	input [DATA-1:0]rs1_or_in;
	input [DATA-1:0]rs2_or_in;
	output [DATA-1:0]rd_or_out;
	
	or OR(rd_or_out,rs1_or_in,rs2_or_in);
	
endmodule

