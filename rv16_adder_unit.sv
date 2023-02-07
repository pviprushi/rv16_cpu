module rv16_addrer_unit(rs1_add_in, rs2_add_in, rp_cin, rd_add_out, rp_cout);
	parameter DATA = 4;
	//input [3:0]adder_opcode;
	input [DATA-1:0]rs1_add_in;
	input [DATA-1:0]rs2_add_in;
	input rp_cin;
	output [DATA-1:0]rd_add_out;
	output rp_cout;
	
	wire c1,c2,c3;
	
	full_adder RP1(.a(rs1_add_in[0]), .b(rs2_add_in[0]), .cin(rp_cin), .f_out(rd_add_out[0]), .f_cout(rp_cout));
	full_adder RP1(.a(rs1_add_in[1]), .b(rs2_add_in[1]), .cin(rp_cin), .f_out(rd_add_out[1]), .f_cout(rp_cout));
	full_adder RP1(.a(rs1_add_in[2]), .b(rs2_add_in[2]), .cin(rp_cin), .f_out(rd_add_out[2]), .f_cout(rp_cout));
	full_adder RP1(.a(rs1_add_in[3]), .b(rs2_add_in[3]), .cin(rp_cin), .f_out(rd_add_out[3]), .f_cout(rp_cout));
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
