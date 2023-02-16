module rv16_wb_dmux(rd_wb_in,rd_wb_addr,rd_wb_x0_out,rd_wb_x1_out,rd_wb_x2_out,rd_wb_x3_out,rd_wb_x4_out,rd_wb_x5_out,rd_wb_x6_out,
					rd_wb_x7_out,rd_wb_x8_out,rd_wb_x9_out,rd_wb_x10_out,rd_wb_x11_out,rd_wb_x12_out,rd_wb_x13_out,rd_wb_x14_out,rd_wb_x15_out);
					
	parameter DATA = 16;
	input [DATA-1:0]rd_wb_in;
	input [3:0]rd_wb_addr;
	
	output [DATA-1:0]rd_wb_x0_out;rd_wb_x1_out,rd_wb_x2_out,rd_wb_x3_out,rd_wb_x4_out,
					 rd_wb_x5_out,rd_wb_x6_out,rd_wb_x7_out,rd_wb_x8_out,rd_wb_x9_out,
					 rd_wb_x10_out,rd_wb_x11_out,rd_wb_x12_out,rd_wb_x13_out,
					 rd_wb_x14_out,rd_wb_x15_out;
	
	
	and X0(rd_wb_x0_out, rd_wb_in, ~rd_wb_addr[3], ~rd_wb_addr[2], ~rd_wb_addr[1], ~rd_wb_addr[0]);
	and X1(rd_wb_x1_out, rd_wb_in, ~rd_wb_addr[3], ~rd_wb_addr[2], ~rd_wb_addr[1], rd_wb_addr[0]);
	and X2(rd_wb_x2_out, rd_wb_in, ~rd_wb_addr[3], ~rd_wb_addr[2], rd_wb_addr[1], ~rd_wb_addr[0]);
	and X3(rd_wb_x3_out, rd_wb_in, ~rd_wb_addr[3], ~rd_wb_addr[2], rd_wb_addr[1], rd_wb_addr[0]);
	and X4(rd_wb_x4_out, rd_wb_in, ~rd_wb_addr[3], rd_wb_addr[2], ~rd_wb_addr[1], ~rd_wb_addr[0]);
	and X5(rd_wb_x5_out, rd_wb_in, ~rd_wb_addr[3], rd_wb_addr[2], ~rd_wb_addr[1], rd_wb_addr[0]);
	and X6(rd_wb_x6_out, rd_wb_in, ~rd_wb_addr[3], rd_wb_addr[2], rd_wb_addr[1], ~rd_wb_addr[0]);
	and X7(rd_wb_x7_out, rd_wb_in, ~rd_wb_addr[3], rd_wb_addr[2], rd_wb_addr[1], rd_wb_addr[0]);
	and X8(rd_wb_x8_out, rd_wb_in, rd_wb_addr[3], ~rd_wb_addr[2], ~rd_wb_addr[1], ~rd_wb_addr[0]);
	and X9(rd_wb_x9_out, rd_wb_in, rd_wb_addr[3], ~rd_wb_addr[2], ~rd_wb_addr[1], rd_wb_addr[0]);
	and X10(rd_wb_x10_out, rd_wb_in, rd_wb_addr[3], ~rd_wb_addr[2], rd_wb_addr[1], ~rd_wb_addr[0]);
	and X11(rd_wb_x11_out, rd_wb_in, rd_wb_addr[3], ~rd_wb_addr[2], rd_wb_addr[1], rd_wb_addr[0]);
	and X11(rd_wb_x12_out, rd_wb_in, rd_wb_addr[3], rd_wb_addr[2], ~rd_wb_addr[1], ~rd_wb_addr[0]);
	and X12(rd_wb_x13_out, rd_wb_in, rd_wb_addr[3], rd_wb_addr[2], ~rd_wb_addr[1], rd_wb_addr[0]);
	and X13(rd_wb_x14_out, rd_wb_in, rd_wb_addr[3], rd_wb_addr[2], rd_wb_addr[1], ~rd_wb_addr[0]);
	and X14(rd_wb_x15_out, rd_wb_in, rd_wb_addr[3], rd_wb_addr[2], rd_wb_addr[1], rd_wb_addr[0]);
endmodule 
