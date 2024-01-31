module comparator(
	input  [8:0] in_1,
	input  [8:0] in_2,
	output [8:0] out_1,
	output [8:0] out_2
	);
assign out_1 = in_1 > in_2 ? in_1 : in_2;
assign out_2 = in_1 < in_2 ? in_1 : in_2;

endmodule