module rv16_cpu_top(rv16_cpu_clock, rv16_cpu_reset, rv16_cpu_dminstr_in, rv16_cpu_dmdata_in, rv16_cpu_addr_out, rv16_cpu_dmdata_out);
	
	parameter DATA = 16;
	parameter OPCODE = 4;
	//-----------Wires for INSTR DMUX ---------------//

	wire [OPCODE-1:0]opcode_out;
	wire [OPCODE-1:0]rs1_addr_out;
	wire [OPCODE-1:0]rs2_addr_out;
	wire [OPCODE-1:0]rd_addr_out;
	wire [DATA-1:0]rv16_dminstr_in;
  
	instr_dmux IDMUX (.rv16_dminstr_in(rv16_dminstr_in), .opcode_out(opcode_out), .rs1_addr_out(rs1_addr_out), .rs2_addr_out(rs1_addr_out), .rd_addr_out(rd_addr_out));
	
	
	//----- Wires for register file ------------//
	wire [OPCODE-1:0]rd_addr_in;
	wire [OPCODE-1:0]rs1_addr_in;
	wire [OPCODE-1:0]rs2_addr_in;
	wire [DATA-1:0]rd_reg_in;
	wire rv16_reg_clock, rv16_reg_reset;
	wire [DATA-1:0]rs1_reg_out;
	wire [DATA-1:0]rs2_reg_out;

	register_file REGF (.rd_addr_in(rd_addr_in), .rs1_addr_in(rs1_addr_in), .rs2_addr_in(rs2_addr_in), .rd_reg_in(rd_reg_in), 
						.rv16_reg_clock(rv16_reg_clock), .rv16_reg_reset(rv16_reg_reset), .rs1_reg_out(rs1_reg_out), .rs2_reg_out(rs2_reg_out));
						
	assign IDMUX.rs1_addr_out = REGF.rs1_addr_in;
	assign IDMUX.rs2_addr_out = REGF.rs2_addr_in;
	//assign 					  = REGF.rd_reg_in; //from wb dmux
	assign IDMUX.rd_addr_in = REGF.rd_addr_in;
	
	assign REGF.rs1_reg_out = RS1DMUX.rs1_fudmux_in;//rs1
	assign REGF.rs2_reg_out = RS2DMUX.rs2_fudmux_in;//rs2 
	assign rv16_cpu_clock = REGF.rv16_reg_clock;
	assign rv16_cpu_reset = REGF.rv16_reg_reset;
	

//-----------Wires for rs1_dmux------------------//
	wire [DATA-1:0]rs1_fudmux_in;//input rs1 
	wire [DATA-1:0]rs1_fudemux_opcode;
	wire [DATA-1:0]rs1_ADD_unit_reg, rs1_SUB_unit_reg ,rs1_MUL_unit_reg, rs1_DIV_unit_reg, rs1_XOR_unit_reg, rs1_AND_unit_reg, rs1_OR_unit_reg;

	rv16_rs1_demux RS1DMUX (rs1_fudmux_in, rs1_fudemux_opcode, rs1_ADD_unit_reg, rs1_SUB_unit_reg ,
		rs1_MUL_unit_reg, rs1_DIV_unit_reg, rs1_DIV_unit_reg, rs1_XOR_unit_reg, rs1_AND_unit_reg, rs1_OR_unit_reg);
		
	assign IDMUX.opcode_out = RS1DMUX.rs1_fudemux_opcode;
	assign RS1DMUX.rs1_ADD_unit_reg =  ADDERUNIT.rs1_add_in ;
	assign RS1DMUX.rs1_SUB_unit_reg =  SUBUNIT.rs1_sub_in ;
	assign RS1DMUX.rs1_MUL_unit_reg =  MULTUNIT.rs1_mult_in ;
	assign RS1DMUX.rs1_DIV_unit_reg =  DIVUNIT.rs1_div_in ;
	assign RS1DMUX.rs1_XOR_unit_reg =  XORUNIT.rs1_xor_in ;
	assign RS1DMUX.rs1_AND_unit_reg =  ANDUNIT.rs1_and_in ;
	assign RS1DMUX.rs1_OR_unit_reg =  ORUNIT.rs1_or_in ;
	
	//-----------Wires for rs2_dmux------------------//
	wire [DATA-1:0]rs2_fudmux_in;//input rs2 
	wire [DATA-1:0]rs2_fudemux_opcode;
	wire [DATA-1:0]rs2_ADD_unit_reg, rs2_SUB_unit_reg ,rs2_MUL_unit_reg, rs2_DIV_unit_reg, rs2_XOR_unit_reg, rs2_AND_unit_reg, rs2_OR_unit_reg;

	rv16_rs2_demux RS2DMUX (rs2_fudmux_in, rs2_fudemux_opcode, rs2_ADD_unit_reg, rs2_SUB_unit_reg ,
		rs2_MUL_unit_reg, rs2_DIV_unit_reg, rs2_XOR_unit_reg, rs2_AND_unit_reg, rs2_OR_unit_reg);
		
	assign IDMUX.opcode_out = rs2DMUX.rs2_fudemux_opcode;
	assign rs2DMUX.rs2_ADD_unit_reg =  ADDERUNIT.rs2_add_in ;
	assign rs2DMUX.rs2_SUB_unit_reg =  SUBUNIT.rs2_sub_in ;
	assign rs2DMUX.rs2_MUL_unit_reg =  MULTUNIT.rs2_mult_in ;
	assign rs2DMUX.rs2_DIV_unit_reg =  DIVUNIT.rs2_div_in ;
	assign rs2DMUX.rs2_XOR_unit_reg =  XORUNIT.rs2_xor_in ;
	assign rs2DMUX.rs2_AND_unit_reg =  ANDUNIT.rs2_and_in ;
	assign rs2DMUX.rs2_OR_unit_reg =  ORUNIT.rs2_or_in ;
	
	//--------wires for add unit ------------//
	wire [DATA-1:0]rs1_add_in;
	wire [DATA-1:0]rs2_add_in;
	//wire rp_cin;
	wire [DATA-1:0]rd_add_out;
	//wire rp_cout;
	rv16_addrer_unit ADDERUNIT (.rs1_add_in(rs1_add_in), .rs2_add_in(rs2_add_in), .rd_add_out(rd_add_out));
	
	
	
	//--------Wires for SUB unit --------//
	wire [DATA-1:0]rs1_sub_in;
	wire [DATA-1:0]rs2_sub_in;
	//input bin;
	wire [DATA-1:0]rd_sub_out;
	
	rv16_sub_unit SUBUNIT (.rs1_sub_in(rs1_sub_in), .rs2_sub_in(rs2_sub_in), .rd_sub_out(rd_sub_out));
	
	//assign 
	
	//--------Wires for mult unit --------//
	wire [DATA-1:0]rs1_mult_in;
	wire [DATA-1:0]rs2_mult_in;
	//input cin;
	wire [DATA-1:0]rd_mult_out;
	rv16_mult_unit MULTUNIT(.rs1_mult_in(rs1_mult_in), .rs2_mult_in(rs2_mult_in), .rd_mult_out(rd_mult_out));
	
	//----Wires DIV unit ----------//
	wire [DATA-1:0] rs1_div_in, rs2_div_in;
	wire [DATA-1:0] rd_div_quo, rd_div_rem;
	
	rv16_div_unit DIVUNIT(.rs1_div_in(rs1_div_in), .rs2_div_in(rs2_div_in), .rd_div_quo(rd_div_quo), .rd_div_rem(rd_div_rem));
	
	
	
	//--------wires for XOR unit ----//
	wire [DATA-1:0]rs1_xor_in;
	wire [DATA-1:0]rs2_xor_in;
	wire [DATA-1:0]rd_xor_out;
	
	rv16_xor_unit XORUNIT(.rs1_xor_in(rs1_xor_in), .rs2_xor_in(rs2_xor_in), .rd_xor_out(rd_xor_out));
	
	wire [DATA-1:0]rs1_or_in;
	wire [DATA-1:0]rs2_or_in;
	wire [DATA-1:0]rd_or_out;
	
	rv16_and_unit ANDUNIT (rs1_or_in,rs2_or_in,rd_or_out);
	
	wire [DATA-1:0]rs1_and_in;
	wire [DATA-1:0]rs2_and_in;
	wire [DATA-1:0]rd_and_out;
	
	rv16_or_unit ORUNIT (rs1_and_in,rs2_and_in,rd_and_out);
	
	
	//---------wires for rd_mux ----------//
	wire [DATA-1:0]rd_ADD_in, rd_SUB_in, rd_MUL_in, rd_DIV_in, rd_XOR_in, rd_AND_in, rd_OR_in;
	wire [DATA-1:0]rd_fumux_opcode;
	wire [DATA-1:0]rd_fumux_out;
	
	rv16_rd_mux RDMUX (rd_ADD_in, rd_SUB_in, rd_MUL_in, rd_DIV_in, rd_XOR_in, rd_AND_in, rd_OR_in, rd_fumux_opcode, rd_fumux_out);
	
	
	//----------RD MUX signals assignment --------------//
	assign ADDERUNIT.rd_add_out = RDMUX.rd_ADD_in;
	assign SUBUNIT.rd_sub_out = RDMUX.rd_SUB_in;
	assign MULTUNIT.rd_mult_out = RDMUX.rd_MUL_in;
	assign DIVUNIT.rd_div_quo = RDMUX.rd_DIV_in;
	assign XORUNIT.rd_xor_out = RDMUX.rd_XOR_in;
	assign ANDUNIT.rd_and_out = RDMUX.rd_AND_in;
	assign ORUNIT.rd_or_out = RDMUX.rd_OR_in
	
	//---------16x1 WB DMUX --------------------------//
	wire [DATA-1:0]rd_wb_in;
	wire [3:0]rd_wb_addr;
	
	wire [DATA-1:0]rd_wb_x0_out,rd_wb_x1_out,rd_wb_x2_out,rd_wb_x3_out,rd_wb_x4_out,
					 rd_wb_x5_out,rd_wb_x6_out,rd_wb_x7_out,rd_wb_x8_out,rd_wb_x9_out,
					 rd_wb_x10_out,rd_wb_x11_out,rd_wb_x12_out,rd_wb_x13_out,
					 rd_wb_x14_out,rd_wb_x15_out;
	
	
	rv16_wb_dmux WBDMUX (rd_wb_in,rd_wb_addr,rd_wb_x0_out,rd_wb_x1_out,rd_wb_x2_out,rd_wb_x3_out,rd_wb_x4_out,rd_wb_x5_out,rd_wb_x6_out,
					rd_wb_x7_out,rd_wb_x8_out,rd_wb_x9_out,rd_wb_x10_out,rd_wb_x11_out,rd_wb_x12_out,rd_wb_x13_out,rd_wb_x14_out,rd_wb_x15_out);
					
	
	assign WBDMUX.rd_wb_addr   = IDMUX.rd_addr_out;
	assign WBDMUX.rd_wb_in     = RDMUX.rd_fumux_out;
	assign WBDMUX.rd_wb_x0_out = REGF.reg_file[0];
	assign WBDMUX.rd_wb_x1_out = REGF.reg_file[1];
	assign WBDMUX.rd_wb_x2_out = REGF.reg_file[2];
	assign WBDMUX.rd_wb_x3_out = REGF.reg_file[3];
	assign WBDMUX.rd_wb_x4_out = REGF.reg_file[4];
	assign WBDMUX.rd_wb_x5_out = REGF.reg_file[5];
	assign WBDMUX.rd_wb_x6_out = REGF.reg_file[6];
	assign WBDMUX.rd_wb_x7_out = REGF.reg_file[7];
	assign WBDMUX.rd_wb_x8_out = REGF.reg_file[8];
	assign WBDMUX.rd_wb_x9_out = REGF.reg_file[9];
	assign WBDMUX.rd_wb_x10_out = REGF.reg_file[10];
	assign WBDMUX.rd_wb_x11_out = REGF.reg_file[11];
	assign WBDMUX.rd_wb_x12_out = REGF.reg_file[12];
	assign WBDMUX.rd_wb_x13_out = REGF.reg_file[13];
	assign WBDMUX.rd_wb_x14_out = REGF.reg_file[14];
	assign WBDMUX.rd_wb_x15_out = REGF.reg_file[15];
	
	
endmodule