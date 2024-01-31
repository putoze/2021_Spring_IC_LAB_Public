module SMC
  (
    W_0,V_GS_0,V_DS_0,
    W_1,V_GS_1,V_DS_1,
    W_2,V_GS_2,V_DS_2,
    W_3,V_GS_3,V_DS_3,
    W_4,V_GS_4,V_DS_4,
    W_5,V_GS_5,V_DS_5,
    mode,out_n
  );

input  [1:0] mode;
input  [2:0] W_0,V_GS_0,V_DS_0;
input  [2:0] W_1,V_GS_1,V_DS_1;
input  [2:0] W_2,V_GS_2,V_DS_2;
input  [2:0] W_3,V_GS_3,V_DS_3;
input  [2:0] W_4,V_GS_4,V_DS_4;
input  [2:0] W_5,V_GS_5,V_DS_5;
output reg [9:0] out_n; 

//-----------------------------------
//   compute
//-----------------------------------
wire [8:0] data [0:5];
compute x0(.mode(mode[0]), .W(W_0), .V_GS(V_GS_0), .V_DS(V_DS_0), .data(data[0]));
compute x1(.mode(mode[0]), .W(W_1), .V_GS(V_GS_1), .V_DS(V_DS_1), .data(data[1]));
compute x2(.mode(mode[0]), .W(W_2), .V_GS(V_GS_2), .V_DS(V_DS_2), .data(data[2]));
compute x3(.mode(mode[0]), .W(W_3), .V_GS(V_GS_3), .V_DS(V_DS_3), .data(data[3]));
compute x4(.mode(mode[0]), .W(W_4), .V_GS(V_GS_4), .V_DS(V_DS_4), .data(data[4]));
compute x5(.mode(mode[0]), .W(W_5), .V_GS(V_GS_5), .V_DS(V_DS_5), .data(data[5]));

//-----------------------------------
//   sort
//-----------------------------------

  wire [8:0] temp [0:23];
  comparator Id_comp1 (.in_1(data[0]),.in_2(data[1]),.out_1(temp[0]),.out_2(temp[1])) ;
  comparator Id_comp2 (.in_1(data[2]),.in_2(data[3]),.out_1(temp[2]),.out_2(temp[3])) ;
  comparator Id_comp3 (.in_1(data[4]),.in_2(data[5]),.out_1(temp[4]),.out_2(temp[5])) ;

  comparator Id_comp4 (.in_1(temp[0]),.in_2(temp[2]),.out_1(temp[6]),.out_2(temp[7])) ;
  comparator Id_comp5 (.in_1(temp[6]),.in_2(temp[4]),.out_1(temp[8]),.out_2(temp[9])) ;  //t8 max
  comparator Id_comp6 (.in_1(temp[7]),.in_2(temp[9]),.out_1(temp[10]),.out_2(temp[11])) ;

  comparator Id_comp7 (.in_1(temp[1]),.in_2(temp[3]),.out_1(temp[12]),.out_2(temp[13])) ;
  comparator Id_comp8 (.in_1(temp[5]),.in_2(temp[13]),.out_1(temp[14]),.out_2(temp[15])) ; //t15 min
  comparator Id_comp9 (.in_1(temp[12]),.in_2(temp[14]),.out_1(temp[16]),.out_2(temp[17])) ;

  comparator Id_comp10 (.in_1(temp[10]),.in_2(temp[16]),.out_1(temp[18]),.out_2(temp[19])) ; //t18 2st
  comparator Id_comp11 (.in_1(temp[11]),.in_2(temp[17]),.out_1(temp[20]),.out_2(temp[21])) ; //t21 5st
  comparator Id_comp12 (.in_1(temp[19]),.in_2(temp[20]),.out_1(temp[22]),.out_2(temp[23])) ; //t22 3st  t23 4st

//-----------------------------------
//   out_n
//-----------------------------------
always @(*) begin
  case (mode)
    2'd0:out_n =   temp[23] +   temp[21] +   temp[15];
    2'd1:out_n = (temp[23] << 1) + temp[23] + (temp[21] << 2) + (temp[15] << 2) + temp[15];
    2'd2:out_n =   temp[8]  +   temp[18] +   temp[22];
    2'd3:out_n = (temp[8] << 1) + temp[8] + (temp[18] << 2) + (temp[22] << 2) + temp[22];
    default : out_n = 'd0;
  endcase
end

endmodule // SMC

//================================================================
//   SUB MODULE
//================================================================

module comparator(
  input  [8:0] in_1,
  input  [8:0] in_2,
  output [8:0] out_1,
  output [8:0] out_2
  );
assign out_1 = in_1 > in_2 ? in_1 : in_2;
assign out_2 = in_1 < in_2 ? in_1 : in_2;

endmodule

module compute (mode, W, V_GS, V_DS, data);
 input [2:0] W, V_GS, V_DS;
 input mode;
 output [8:0]data;
 
 reg [2:0] txt_0;
 reg [3:0] txt_1;
 reg [6:0] txt_2;
 //wire [9:0] data_temp;
 wire [2:0] vgs;
 
assign vgs=V_GS-1;
 
always @(*) begin
  if(vgs > V_DS) txt_0=V_DS;
    else txt_0=vgs;
end

always @(*) begin
  if(vgs > V_DS) txt_1=(vgs<<1)-V_DS;
    else txt_1=vgs;
end

always @(*) begin
  case(mode)
    1: txt_2 = txt_0*txt_1; //Id
    default: txt_2 = (txt_0 << 1);//gm
  endcase
end

//assign data_temp=W*txt_2;
assign data=W*txt_2/3;

endmodule
