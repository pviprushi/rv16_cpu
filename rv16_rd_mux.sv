module rv16_rd_fumux(rd_ADD_in, rd_SUB_in, rd_MUL_in, rd_DIV_in rd_XOR_in, rd_AND_in, rd_OR_in, rd_fumux_opcode, rd_fumux_out);

	parameter DATA = 16, OPCODE = 4;
	input [DATA-1:0]rd_ADD_in, rd_SUB_in, rd_MUL_in, rd_DIV_in rd_XOR_in, rd_AND_in, rd_OR_in;
	input [OPCODE-1:0]rd_fumux_opcode;
	output [DATA-1:0]rd_fumux_out;
	
	and ADD (rd_fumux_out, rd_ADD_in, ~rd_fumux_opcode[3], ~rd_fumux_opcode[2], ~rd_fumux_opcode[1], ~rd_fumux_opcode[0]);
	and SUB (rd_fumux_out, rd_SUB_in, ~rd_fumux_opcode[3], rd_fumux_opcode[2], rd_fumux_opcode[1], ~rd_fumux_opcode[0]);
	and MUL (rd_fumux_out, rd_MUL_in, ~rd_fumux_opcode[3], rd_fumux_opcode[2], ~rd_fumux_opcode[1], rd_fumux_opcode[0]);
	and DIV (rd_fumux_out, rd_DIV_in, ~rd_fumux_opcode[3], ~rd_fumux_opcode[2], rd_fumux_opcode[1], rd_fumux_opcode[0]);
	and XOR (rd_fumux_out, rd_XOR_in, ~rd_fumux_opcode[3], rd_fumux_opcode[2], ~rd_fumux_opcode[1], ~rd_fumux_opcode[0]);
	and AND (rd_fumux_out, rd_AND_in, ~rd_fumux_opcode[3], rd_fumux_opcode[2], ~rd_fumux_opcode[1], rd_fumux_opcode[0]);
	and OR  (rd_fumux_out, rd_OR_in, ~rd_fumux_opcode[3], rd_fumux_opcode[2], rd_fumux_opcode[1], ~rd_fumux_opcode[0]);
	
endmodule


	
	