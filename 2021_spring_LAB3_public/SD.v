// -----------------------------------------------------------------------------
// Copyright (c) 2014-2024 All rights reserved
// -----------------------------------------------------------------------------
// Author : putoze
// File   : SD.v
// Create : 2024-01-24 18:31:04
// Revise : 2024-01-24 18:31:14
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------
module SD(
    // Input signals
    clk,
    rst_n,
	in_valid,
	in,
    // Output signals
    out_valid,
    out
);
//================================================================
//  INPUT AND OUTPUT DECLARATION                         
//================================================================
input clk, rst_n, in_valid;
input [3:0] in;
output reg out_valid;
output reg [3:0] out;
//================================================================
//  integer / genvar / parameters
//================================================================
integer i, j;
genvar idx, idy;
// FSM
parameter STATE_IDLE    = 2'd0 ;
parameter STATE_FORWARD = 2'd1 ;
parameter STATE_BAKWARD = 2'd2 ;
parameter STATE_OUTPUT  = 2'd3 ;
parameter BAKWARD_STACK_DEPTH  = 6;
parameter BAKWARD_STACK_LENGTH = 3;
//================================================================
//   Wires & Registers 
//================================================================

// FSM
reg [1:0] curr_state,next_state;

// in
reg in_valid_ff;
reg [3:0] in_ff;

// table
reg [3:0] sd_table[0:8][0:8];
reg [3:0] sd_table_row_pt,sd_table_col_pt;

reg [3:0] empty_table_pt;
reg [3:0] empty_table_row[0:14];
reg [3:0] empty_table_col[0:14];

reg [8:0] dirty_bit_table[0:BAKWARD_STACK_DEPTH-1];
reg [8:0] dirty_bit_value;
reg [3:0] backward_stack[0:BAKWARD_STACK_DEPTH-1]; //store empty_table_pt
reg [BAKWARD_STACK_LENGTH - 1:0] backward_stack_wpt; //write pt

reg fail;

//state
wire STATE_FORWARD_w = curr_state == STATE_FORWARD;
wire STATE_BAKWARD_w = curr_state == STATE_BAKWARD;
wire STATE_IDLE_w    = curr_state == STATE_IDLE   ;
wire STATE_OUTPUT_w  = curr_state == STATE_OUTPUT ;

// flag
wire change_row   = sd_table_col_pt == 'd8;
wire empty_flag   = in_valid_ff && (in_ff == 'd0);
wire empty_pt_end = empty_table_pt == 'd14;
wire backward_stack_wpt_empty = backward_stack_wpt == 'd0;
reg  forward_early_break_w; 


wire [BAKWARD_STACK_LENGTH - 1:0] backward_stack_rpt = backward_stack_wpt - 'd1; //read pt
wire [3:0] empty_table_row_cur = empty_table_row[empty_table_pt];
wire [3:0] empty_table_col_cur = empty_table_col[empty_table_pt];
reg  [3:0] next_value_w;

// FORWARD row & col & box
wire [8:0] match_row[0:8];
wire [8:0] match_col[0:8];
wire [8:0] match_box[0:8];
wire [8:0] exist_row = match_row[0] | match_row[1] | match_row[2] | match_row[3] | match_row[4] | match_row[5] | match_row[6] | match_row[7] | match_row[8];
wire [8:0] exist_col = match_col[0] | match_col[1] | match_col[2] | match_col[3] | match_col[4] | match_col[5] | match_col[6] | match_col[7] | match_col[8];
wire [8:0] exist_box = match_box[0] | match_box[1] | match_box[2] | match_box[3] | match_box[4] | match_box[5] | match_box[6] | match_box[7] | match_box[8];
wire [8:0] not_exist_total = ~(exist_row | exist_col | exist_box | dirty_bit_value);
wire [3:0] not_exist_number = not_exist_total[0] + not_exist_total[1] + not_exist_total[2] + not_exist_total[3] + not_exist_total[4] + not_exist_total[5] + not_exist_total[6] +
not_exist_total[7] + not_exist_total[8];

// check in valid
wire [8:0] exist_row_sum = match_row[0] + match_row[1] + match_row[2] + match_row[3] + match_row[4] + match_row[5] + match_row[6] + match_row[7] + match_row[8];
wire [8:0] exist_col_sum = match_col[0] + match_col[1] + match_col[2] + match_col[3] + match_col[4] + match_col[5] + match_col[6] + match_col[7] + match_col[8];
wire [8:0] exist_box_sum = match_box[0] + match_box[1] + match_box[2] + match_box[3] + match_box[4] + match_box[5] + match_box[6] + match_box[7] + match_box[8];

// FSM flag
wire front_start = in_valid_ff && !in_valid;
wire front_done  = (empty_pt_end || forward_early_break_w) && STATE_FORWARD_w;
wire back_start  = next_value_w == 'd0 && STATE_FORWARD_w;
wire back_done   = backward_stack_wpt_empty && STATE_BAKWARD_w;
wire out_done    = fail || empty_pt_end && STATE_OUTPUT_w;


//================================================================
//  FSM
//================================================================

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		curr_state <= STATE_IDLE;
	end 
	else begin
		curr_state <= next_state;
	end
end

always @(*) begin 
	case (curr_state)
		STATE_IDLE     : next_state = front_start ? STATE_FORWARD : STATE_IDLE;
		STATE_FORWARD  : next_state = back_start  ? STATE_BAKWARD : front_done ? STATE_OUTPUT : STATE_FORWARD;
		STATE_BAKWARD  : next_state = back_done   ? STATE_OUTPUT  : STATE_FORWARD;
		STATE_OUTPUT   : next_state = out_done    ? STATE_IDLE    : STATE_OUTPUT;
		default        : next_state = STATE_IDLE;
	endcase	
end

//================================================================
//  OUTPUT : out_valid & out
//================================================================

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		out_valid <= 0;
		out       <= 'd0;
	end 
	else begin
		if (STATE_OUTPUT_w) begin
			out_valid <= 1;
			if (fail) begin
				out <= 4'd10;
			end
			else begin
				out <= sd_table[empty_table_row_cur][empty_table_col_cur];
			end
		end
		else begin
			out_valid <= 0;
			out       <= 'd0;
		end
	end
end

//================================================================
// 	DATA IN
//================================================================

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		in_ff       <= 0;
		in_valid_ff <= 0;
	end 
	else begin
		if (in_valid) begin
			in_ff       <= in;
			in_valid_ff <= in_valid;
		end
		else begin
			in_ff       <= 'd0;
			in_valid_ff <= in_valid;
		end
	end
end

//================================================================
// 	FORWARD
//================================================================

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		fail <= 0;
	end 
	else begin
		if (back_done || forward_early_break_w) begin
			fail <= 1;
		end
		else begin
			fail <= 0;
		end
	end
end

//forward_early_break_w
always @(*) begin
	if (STATE_FORWARD_w) begin
		if (exist_row_sum != exist_row) begin
			forward_early_break_w = 1;
		end
		else if (exist_box_sum != exist_box) begin
			forward_early_break_w = 1;
		end
		else if (exist_col_sum != exist_col) begin
			forward_early_break_w = 1;
		end
		else begin
			forward_early_break_w = 0;
		end
	end
	else begin
		forward_early_break_w = 0;
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		for (i = 0; i < 9; i=i+1) begin
		    for (j = 0; j < 9; j=j+1) begin
		        sd_table[i][j] <= 'd0;
		    end
		end
	end 
	else begin
		if (in_valid_ff) begin
			sd_table[sd_table_row_pt][sd_table_col_pt] <= in_ff;
		end
		else if (STATE_FORWARD_w) begin
			sd_table[empty_table_row_cur][empty_table_col_cur] <= next_value_w;
		end
		else if (STATE_BAKWARD_w) begin
			for (i = 0; i < 15; i=i+1) begin
			    if (i > backward_stack[backward_stack_rpt]) begin
			    	sd_table[empty_table_row[i]][empty_table_col[i]] <= 'd0;
			    end
			end
		end
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		sd_table_row_pt <= 'd0;
	end 
	else begin
		if (in_valid_ff) begin
			sd_table_row_pt <= change_row ? sd_table_row_pt + 'd1 : sd_table_row_pt;
		end
		else begin
			sd_table_row_pt <= 'd0;
		end
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		sd_table_col_pt <= 'd0;
	end 
	else begin
		if (in_valid_ff) begin
			sd_table_col_pt <= change_row ? 'd0 : sd_table_col_pt + 'd1;
		end
		else begin
			sd_table_col_pt <= 'd0;
		end
	end
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		empty_table_pt <= 0;
	end
	else begin
		if (front_start || out_done || front_done) begin
			empty_table_pt <= 'd0;
		end
		else if (STATE_BAKWARD_w) begin
			empty_table_pt <= backward_stack[backward_stack_rpt];
		end
		else if (empty_pt_end) begin
			empty_table_pt <= empty_table_pt;
		end
		else if (empty_flag || STATE_FORWARD_w || STATE_OUTPUT_w) begin
			empty_table_pt <= empty_table_pt + 'd1;
		end
	end
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		for (i = 0; i < 15; i=i+1) begin
		    empty_table_row[i] <= 'd0;
		    empty_table_col[i] <= 'd0;
		end
	end 
	else begin
		if (in_valid_ff && empty_flag) begin
			empty_table_row[empty_table_pt] <= sd_table_row_pt;
			empty_table_col[empty_table_pt] <= sd_table_col_pt;
		end
	end
end

//dirty_bit_table
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		for (i = 0; i < BAKWARD_STACK_DEPTH; i=i+1) begin
		    dirty_bit_table[i] <= 'd0;
		end
	end 
	else begin
		if (STATE_FORWARD_w && (not_exist_number > 1)) begin
			if     (not_exist_total[0] & !dirty_bit_value[0]) dirty_bit_table[backward_stack_wpt][0] <= 1;
			else if(not_exist_total[1] & !dirty_bit_value[1]) dirty_bit_table[backward_stack_wpt][1] <= 1;
			else if(not_exist_total[2] & !dirty_bit_value[2]) dirty_bit_table[backward_stack_wpt][2] <= 1;
			else if(not_exist_total[3] & !dirty_bit_value[3]) dirty_bit_table[backward_stack_wpt][3] <= 1;
			else if(not_exist_total[4] & !dirty_bit_value[4]) dirty_bit_table[backward_stack_wpt][4] <= 1;
			else if(not_exist_total[5] & !dirty_bit_value[5]) dirty_bit_table[backward_stack_wpt][5] <= 1;
			else if(not_exist_total[6] & !dirty_bit_value[6]) dirty_bit_table[backward_stack_wpt][6] <= 1;
			else if(not_exist_total[7] & !dirty_bit_value[7]) dirty_bit_table[backward_stack_wpt][7] <= 1;
			else if(not_exist_total[8] & !dirty_bit_value[8]) dirty_bit_table[backward_stack_wpt][8] <= 1;
		end
		else if (STATE_BAKWARD_w | STATE_FORWARD_w) begin
			dirty_bit_table[backward_stack_wpt] <= 'd0;
		end
		else if (STATE_OUTPUT_w) begin
			for (i = 0; i < BAKWARD_STACK_DEPTH; i=i+1) begin
			    dirty_bit_table[i] <= 'd0;
			end
		end
	end
end

//dirty_bit_value
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		dirty_bit_value <= 'd0;
	end 
	else begin
		if (STATE_BAKWARD_w) begin
			dirty_bit_value <= dirty_bit_table[backward_stack_rpt];
		end
		else begin
			dirty_bit_value <= 'd0;
		end
	end
end

//next_value_w
always @(*) begin
	if     (not_exist_total[0] & !dirty_bit_value[0]) next_value_w = 1;
	else if(not_exist_total[1] & !dirty_bit_value[1]) next_value_w = 2;
	else if(not_exist_total[2] & !dirty_bit_value[2]) next_value_w = 3;
	else if(not_exist_total[3] & !dirty_bit_value[3]) next_value_w = 4;
	else if(not_exist_total[4] & !dirty_bit_value[4]) next_value_w = 5;
	else if(not_exist_total[5] & !dirty_bit_value[5]) next_value_w = 6;
	else if(not_exist_total[6] & !dirty_bit_value[6]) next_value_w = 7;
	else if(not_exist_total[7] & !dirty_bit_value[7]) next_value_w = 8;
	else if(not_exist_total[8] & !dirty_bit_value[8]) next_value_w = 9;
	else                                              next_value_w = 0;
end

generate
    for (idx = 0; idx < 9; idx = idx + 1) begin
    	MATCH match_inst_row(.in_val(sd_table[empty_table_row_cur][idx]),.match_index(match_row[idx]));
    	MATCH match_inst_col(.in_val(sd_table[idx][empty_table_col_cur]),.match_index(match_col[idx]));
    end
endgenerate

generate
    for (idx = 0; idx < 3; idx = idx + 1) begin
    	for (idy = 0; idy < 3; idy = idy + 1) begin
    	    MATCH match_inst_box(.in_val(sd_table[3*(empty_table_row_cur/3)+idx][3*(empty_table_col_cur/3)+idy]),.match_index(match_box[3*idx+idy]));
    	end
    end
endgenerate


//================================================================
// 	BACKWARD
//================================================================

//backward_stack_wpt
always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		backward_stack_wpt <= 'd0;
	end 
	else begin
		if (STATE_FORWARD_w && (not_exist_number > 1)) begin
			backward_stack_wpt <= backward_stack_wpt + 1; // the number of prob fill value
		end
		else if (STATE_BAKWARD_w && !back_done) begin
			backward_stack_wpt <= backward_stack_rpt;
		end
		else if (STATE_OUTPUT_w) begin
			backward_stack_wpt <= 'd0;
		end
	end
end

//backward_stack
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		for (i = 0; i < BAKWARD_STACK_DEPTH; i=i+1) begin
		    backward_stack[i] <= 'd0;
		end
	end 
	else begin
		if (STATE_FORWARD_w && (not_exist_number > 1)) begin
			backward_stack[backward_stack_wpt] <= empty_table_pt;
		end
	end
end


endmodule

//================================================================
// 	Submodule
//================================================================

module MATCH (
	input      [3:0] in_val,
	output reg [8:0] match_index
	
);

always @(*) begin 
	case (in_val)
		4'd0    : match_index = 9'b000_000_000;
		4'd1    : match_index = 9'b000_000_001;
		4'd2    : match_index = 9'b000_000_010;
		4'd3    : match_index = 9'b000_000_100;
		4'd4    : match_index = 9'b000_001_000;
		4'd5    : match_index = 9'b000_010_000;
		4'd6    : match_index = 9'b000_100_000;
		4'd7    : match_index = 9'b001_000_000;
		4'd8    : match_index = 9'b010_000_000;
		4'd9    : match_index = 9'b100_000_000;
		default : match_index = 9'b111_111_111;
	endcase
end

endmodule 
