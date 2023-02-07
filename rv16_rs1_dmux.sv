module rv16_rs1_demux(rs1_fudmux_in, rs1_fudemux_opcode, rs1_ADD_unit_reg, rs1_SUB_unit_reg ,
		rs1_MUL_unit_reg, rs1_DIV_unit_reg, rs1_XOR_unit_reg, rs1_AND_unit_reg, rs1_OR_unit_reg);

	parameter DATA = 4;
	input [DATA-1:0]rs1_fudmux_in;
	input [DATA-1:0]rs1_fudemux_opcode;
	output[DATA-1:0]rs1_ADD_unit_reg, rs1_SUB_unit_reg ,rs1_MUL_unit_reg, rs1_DIV_unit_reg, rs1_XOR_unit_reg, rs1_AND_unit_reg, rs1_OR_unit_reg;
	
	and ADD(rs1_ADD_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], ~rs1_fudemux_opcode[2], ~rs1_fudemux_opcode[1], ~rs1_fudemux_opcode[0]);
	and SUB(rs1_SUB_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], ~rs1_fudemux_opcode[2], ~rs1_fudemux_opcode[1], rs1_fudemux_opcode[0]);
	and MUL(rs1_MUL_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], ~rs1_fudemux_opcode[2], rs1_fudemux_opcode[1], ~rs1_fudemux_opcode[0]);
	and DIV(rs1_DIV_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], ~rs1_fudemux_opcode[2], rs1_fudemux_opcode[1], rs1_fudemux_opcode[0]);
	and XOR(rs1_XOR_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], rs1_fudemux_opcode[2], ~rs1_fudemux_opcode[1], ~rs1_fudemux_opcode[0]);
	and AND(rs1_AND_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], rs1_fudemux_opcode[2], ~rs1_fudemux_opcode[1], rs1_fudemux_opcode[0]);
	and OR(rs1_OR_unit_reg,rs1_fudmux_in, ~rs1_fudemux_opcode[3], rs1_fudemux_opcode[2], rs1_fudemux_opcode[1], ~rs1_fudemux_opcode[0]);
	
	
	
endmodule
