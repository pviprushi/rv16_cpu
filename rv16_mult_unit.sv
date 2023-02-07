module rv16_mult_unit(rs1_mult_in,rs2_mult_in,cin,rd_mult_out);

	parameter DATA = 4;
	input [DATA-1:0]rs1_mult_in;
	input [DATA-1:0]rs2_mult_in;
	input cin;
	output [DATA-1:0]rd_mult_out;
	//reg [31:0]
	wire x1,x2,x3;
	wire FA1_out,FA2_out,FA3_out,FA4_out,FA5_out;
	wire HA1_cout,HA2_cout,HA3_cout,HA4_cout;
	wire FA1_cout,FA2_cout,FA3_cout,FA4_cout,FA5_cout,FA6_cout,FA7_cout;
	wire HA2_out;
	//reg [DATA-1:0]m,q //m = multilier, q = multiplicand
	
	//assign m = rs1_mult_in;
	//assign q = rs2_mult_in;
	
	//--------------ANDING OF ALL-----------------//
	and A0(rd_mult_out[0],rs2_mult_in[0],rs1_mult_in[0]);//1st output
	and A1(x1,rs2_mult_in[1],rs1_mult_in[1]);
	and A2(x2,rs2_mult_in[1],rs1_mult_in[1]);
	and A3(x3,rs2_mult_in[1],rs1_mult_in[1]);
	
	half_adder HA1(A0,A1,rd_mult_out[1],HA1_cout);//2nd out
	full_adder FA1(A1,A2,HA1_cout,FA1_out,FA1_cout);
	full_adder FA2(A2,A3,FA1_cout,FA2_out,FA2_cout);
	half_adder HA2(A3,FA2_cout,HA2_out,HA2_cout);
	
	half_adder HA3(A0,FA1_out,rd_mult_out[2],HA3_cout);//3rd output
	full_adder FA3(A1,FA2_out,HA3_cout,FA3_out,FA3_cout);
	full_adder FA4(A2,HA2_out,FA3_cout,FA4_out,FA4_cout);
	full_adder FA5(A3,HA2_cout,FA4_cout,FA5_out,FA5_cout);
	
	half_adder HA4(A0,FA3_out,rd_mult_out[3],HA4_cout);
	full_adder FA6(A1,FA4_out,HA4_cout,rd_mult_out[4],FA6_cout);
	full_adder FA7(A2,FA5_out,FA6_cout,rd_mult_out[5],FA7_cout);
	full_adder FA8(A3,FA5_cout,FA7_cout,rd_mult_out[6],rd_mult_out[7]);

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


