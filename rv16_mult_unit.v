module full_add #(parameter DATA=16)
  (
    input [DATA-1:0] a,
    input [DATA-1:0] b,
    output [DATA-1:0] mul_o);
  
  mul_o = a + b;
   
endmodule

module rv16_mult_unit(rs1_mult_in, rs2_mult_in, rd_mult_out);
  
  parameter DATA = 16;
  input [DATA-1:0] rs1_mult_in,
  input  [DATA-1:0] rs2_mult_in,
  output [2*DATA-1:0] rd_mult_out
  
  
  wire [DATA:0][DATA-1:0] temp1;
  wire [DATA:0][2*DATA-1:0] temp2;
  
  wire [DATA:0][2*DATA-1:0]temp3;
  
  assign temp1[0] = rs2_mult_in[0] ? rs1_mult_in : 0;
  assign temp2[0] = rs1_mult_in[0] << 0;
  assign temp3[0] = rs2_mult_in[0];
  
  genvar i;
  
  generate 
    for(i=1; i<=DATA-1; i++)begin
      assign temp1[i] = rs2_mult_in[i] ? rs1_mult_in[i] : 0;
      assign temp2[i] = temp1[i] << i;
      full_add #(2*DATA) fa ( .rs1_mult_in (temp3[i-1]),
                          .rs2_mult_in (temp2[i]),
                          .mul_o (temp3[i])
                         );
    end 
  endgenerate
  
  assign rd_mult_out =temp3[DATA-1:0];
endmodule