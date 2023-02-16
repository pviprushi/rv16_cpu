module rv16_register_file(rd_addr_in,rs1_addr_in,rs2_addr_in,rd_reg_in,rv16_reg_clock,rv16_reg_reset,rs1_reg_out,rs2_reg_out);

	  parameter DATA = 16, OPCODE = 4;
	  input [OPCODE-1:0]rd_addr_in;
	  input [OPCODE-1:0]rs1_addr_in;
	  input [OPCODE-1:0]rs2_addr_in;
	  input [DATA-1:0]rd_reg_in;
	  input rv16_reg_clock, rv16_reg_reset;
	  output [DATA-1:0]rs1_reg_out;
	  output [DATA-1:0]rs2_reg_out;


	  reg[15:0] reg_file[15:0];
	  integer i;

	  assign rs1_reg_out = (rs1_addr_in == rd_addr_in) ? rd_reg_in : reg_file[rs1_addr_in];

	  assign rs2_reg_out = (rs2_addr_in == rd_addr_in) ? rd_reg_in : reg_file[rs2_addr_in];


	  always@(posedge rv16_reg_clock)
		begin
		  if(rv16_reg_reset)
			begin
			  for(i=0; i<32; i=i+1)
				reg_file[i] <=0;
			end
		  else if(rd_addr_in !=0)
			reg_file[rd_addr_in] <=rd_reg_in;
		end

endmodule