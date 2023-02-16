module rv16_and_unit(rs1_and_in,rs2_and_in,rd_and_out);

	parameter DATA = 4;
	input [DATA-1:0]rs1_and_in;
	input [DATA-1:0]rs2_and_in;
	output [DATA-1:0]rd_and_out;
	
	and AND(rd_and_out,rs1_and_in,rs2_and_in);
	
endmodule