module rv16_instr_dmux(rv16_dminstr_in,opcode_out,rs1_addr_out, rs2_addr_out, rd_addr_out);
	parameter DATA = 16, OPCODE = 4;
	input [DATA-1:0]rv16_dminstr_in; 
	output [OPCODE-1:0]opcode_out,;
	output[OPCODE-1:0]rs1_addr_out;
    output [OPCODE-1:0]rs2_addr_out; 
	output [OPCODE-1:0]rd_addr_out;

  assign opcode_out = rv16_dminstr_in[3:0];
  assign rs1_addr_out	= rv16_dminstr_in[7:4];
  assign rs2_addr_out	= rv16_dminstr_in[11:8];
  assign rd_addr_out		= rv16_dminstr_in[15:12];

endmodule