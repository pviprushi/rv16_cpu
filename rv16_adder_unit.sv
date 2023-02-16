
module rv16_add_unit(rs1_add_in, rs2_add_in, rp_cin, rd_add_out, rp_cout);
	parameter DATA = 16;
	//input [3:0]adder_opcode;
	input [DATA-1:0]rs1_add_in;
	input [DATA-1:0]rs2_add_in;
	input rp_cin;
	output [DATA-1:0]rd_add_out;
	output rp_cout;
	
	wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c12,c13,c14,c15;
	
	full_adder RP0(.a(rs1_add_in[0]), .b(rs2_add_in[0]), .cin(rp_cin), .f_out(rd_add_out[0]), .f_cout(rp_cout));
	full_adder RP1(.a(rs1_add_in[1]), .b(rs2_add_in[1]), .c1(rp_cin), .f_out(rd_add_out[1]), .f_cout(rp_cout));
	full_adder RP2(.a(rs1_add_in[2]), .b(rs2_add_in[2]), .c2(rp_cin), .f_out(rd_add_out[2]), .f_cout(rp_cout));
	full_adder RP3(.a(rs1_add_in[3]), .b(rs2_add_in[3]), .c3(rp_cin), .f_out(rd_add_out[3]), .f_cout(rp_cout));
	full_adder RP4(.a(rs1_add_in[4]), .b(rs2_add_in[4]), .c4(rp_cin), .f_out(rd_add_out[4]), .f_cout(rp_cout));
	full_adder RP5(.a(rs1_add_in[5]), .b(rs2_add_in[5]), .c5(rp_cin), .f_out(rd_add_out[5]), .f_cout(rp_cout));
	full_adder RP6(.a(rs1_add_in[6]), .b(rs2_add_in[6]), .c6(rp_cin), .f_out(rd_add_out[6]), .f_cout(rp_cout));
	full_adder RP7(.a(rs1_add_in[7]), .b(rs2_add_in[7]), .c7(rp_cin), .f_out(rd_add_out[7]), .f_cout(rp_cout));
	full_adder RP8(.a(rs1_add_in[8]), .b(rs2_add_in[8]), .c8(rp_cin), .f_out(rd_add_out[8]), .f_cout(rp_cout));
	full_adder RP9(.a(rs1_add_in[9]), .b(rs2_add_in[9]), .c9(rp_cin), .f_out(rd_add_out[9]), .f_cout(rp_cout));
	full_adder RP10(.a(rs1_add_in[10]), .b(rs2_add_in[10]), .c10(rp_cin), .f_out(rd_add_out[10]), .f_cout(rp_cout));
	full_adder RP11(.a(rs1_add_in[11]), .b(rs2_add_in[11]), .c11(rp_cin), .f_out(rd_add_out[11]), .f_cout(rp_cout));
	full_adder RP12(.a(rs1_add_in[12]), .b(rs2_add_in[12]), .c12(rp_cin), .f_out(rd_add_out[12]), .f_cout(rp_cout));
	full_adder RP13(.a(rs1_add_in[13]), .b(rs2_add_in[13]), .c13(rp_cin), .f_out(rd_add_out[13]), .f_cout(rp_cout));
	full_adder RP14(.a(rs1_add_in[14]), .b(rs2_add_in[14]), .c14(rp_cin), .f_out(rd_add_out[14]), .f_cout(rp_cout));
	full_adder RP15(.a(rs1_add_in[15]), .b(rs2_add_in[15]), .c15(rp_cin), .f_out(rd_add_out[15]), .f_cout(rp_cout));
endmodule	

endmodule 


module half_adder(a,b,h_out,h_cout);
	input a,b;
	output out, h_cout;
	xor(out,a,b);
	and(h_cout,a,b);
endmodule
	

module full_adder(a,b,cin,f_out,f_cout);

	input a,b cin;
	output f_cout, f_out;
	
	wire carry1, carry2, s;
	
	
	half_adder F1(.a(a), .b(b), .h_out(carry1), .h_cout(carry2));
	half_adder F2(.a(carry1), .b(cin), .h_out(f_out), .h_cout(s));
	or OR(f_cout,s,carry2);
	
endmodule

	
