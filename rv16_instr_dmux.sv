module instr_dmux(input [15:0]rv16_dminstr_in, output [3:0]opcode_out, output[3:0]rs1_addr_out,
                  output [3:0]rs2_addr_out, output [3:0]rd_addr_out);

  assign opcode_out = rv16_dminstr_in[3:0];
  assign rs1_addr_out	= rv16_dminstr_in[7:4];
  assign rs2_addr_out	= rv16_dminstr_in[11:8];
  assign rd_addr_out		= rv16_dminstr_in[15:12];

endmodule
