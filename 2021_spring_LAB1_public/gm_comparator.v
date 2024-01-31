module gm_comparator(
	input  [6:0] in_1,
	input  [6:0] in_2,
	output [6:0] out_1,
	output [6:0] out_2
	);
assign out_1 = in_1 > in_2 ? in_1 : in_2;
assign out_2 = in_1 < in_2 ? in_1 : in_2;

endmodule