module rv16_rs2_demux(rs2_fudmux_in, rs2_fudemux_opcode, rs2_ADD_unit_reg, rs2_SUB_unit_reg ,
			rs2_MUL_unit_reg, rs2_DIV_unit_reg, rs2_XOR_unit_reg, rs2_AND_unit_reg, rs2_OR_unit_reg);

	parameter DATA = 16, OPCODE = 4;
	input [DATA-1:0]rs2_fudmux_in;
	input [OPCODE-1:0]rs2_fudemux_opcode;
	//output [DATA-1:0]rs2_fudmux_out;
	
	output [DATA-1:0]rs2_ADD_unit_reg, rs2_SUB_unit_reg ,rs2_MUL_unit_reg, rs2_DIV_unit_reg, rs2_XOR_unit_reg, rs2_AND_unit_reg, rs2_OR_unit_reg; 
	
	and ADD(rs2_ADD_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], ~rs2_fudemux_opcode[2], ~rs2_fudemux_opcode[1], ~rs2_fudemux_opcode[0]);
	and SUB(rs2_SUB_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], ~rs2_fudemux_opcode[2], ~rs2_fudemux_opcode[1], rs2_fudemux_opcode[0]);
	and MUL(rs2_MUL_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], ~rs2_fudemux_opcode[2], rs2_fudemux_opcode[1], ~rs2_fudemux_opcode[0]);
	and DIV(rs2_DIV_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], ~rs2_fudemux_opcode[2], rs2_fudemux_opcode[1], rs2_fudemux_opcode[0]);
	and XOR(rs2_XOR_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], rs2_fudemux_opcode[2], ~rs2_fudemux_opcode[1], ~rs2_fudemux_opcode[0]);
	and AND(rs2_AND_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], rs2_fudemux_opcode[2], ~rs2_fudemux_opcode[1], rs2_fudemux_opcode[0]);
	and OR(rs2_OR_unit_reg,rs2_fudmux_in, ~rs2_fudemux_opcode[3], rs2_fudemux_opcode[2], rs2_fudemux_opcode[1], ~rs2_fudemux_opcode[0]);
	
	
	
endmodule
/*
	//--------wires for rs2_demux----------------//

	wire [DATA-1:0]rs2_fudmux_in;//input rs2 
	wire [DATA-1:0]rs2_fudemux_opcode;
	wire [DATA-1:0]rs2_ADD_unit_reg, rs2_SUB_unit_reg ,rs2_MUL_unit_reg, rs2_DIV_unit_reg, rs2_XOR_unit_reg, rs2_AND_unit_reg, rs2_OR_unit_reg;

	rv16_rs2_demux rs2DMUX (rs2_fudmux_in, rs2_fudemux_opcode, rs2_ADD_unit_reg, rs2_SUB_unit_reg ,
		rs2_MUL_unit_reg, rs2_DIV_unit_reg, rs2_XOR_unit_reg, rs2_AND_unit_reg, rs2_OR_unit_reg);
		
	assign rs2_fudmux_in = rs2DMUX.rs2_fudmux_in;
	assign rs2_fudemux_opcode = rs2DMUX.rs2_fudemux_opcode;
	assign rs2_ADD_unit_reg = rs2DMUX.rs2_ADD_unit_reg;
	assign rs2_SUB_unit_reg = rs2DMUX.rs2_SUB_unit_reg;
	assign rs2_MUL_unit_reg = rs2DMUX.rs2_MUL_unit_reg;
	assign rs2_DIV_unit_reg = rs2DMUX.rs2_DIV_unit_reg;
	assign rs2_XOR_unit_reg = rs2DMUX.rs2_XOR_unit_reg;
	assign rs2_AND_unit_reg = rs2DMUX.rs2_AND_unit_reg;
	assign rs2_OR_unit_reg  = rs2DMUX.rs2_OR_unit_reg;
	*/