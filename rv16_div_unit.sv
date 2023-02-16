module rv16_div_unit(rs1_div_in, rs2_div_in, rd_div_rem, rd_div_quo);
	parameter DATA=16;
	input [DATA-1:0] rs1_div_in, rs2_div_in;
	output reg [DATA-1:0] rd_div_quo, rd_div_rem;

	integer i;
	reg [DATA-1:0] divisor_copy, dividend_copy;
	reg [DATA-1:0] temp;

	always @(rs1_div_in or rs2_div_in)
		begin
			divisor_copy = rs2_div_in;
			dividend_copy = rs1_div_in;
			temp = 0; 
		 
		 
		  for(i = 0;i < DATA;i = i + 1)
			begin
			  temp = {temp[DATA-2:0], dividend_copy[DATA-1]};
			  dividend_copy[DATA-1:1] = dividend_copy[DATA-2:0];
				
				temp = temp - divisor_copy;
				
			  if(temp[DATA-1] == 1)
				begin
				
					dividend_copy[0] = 0;
					temp = temp + divisor_copy;
				end
				else
				begin
				
					dividend_copy[0] = 1;
				end
			end
			rd_div_quo = dividend_copy;
			rd_div_rem = temp;
			//remainder = dividend - (divisor_copy*dividend_copy);
		end
 
endmodule