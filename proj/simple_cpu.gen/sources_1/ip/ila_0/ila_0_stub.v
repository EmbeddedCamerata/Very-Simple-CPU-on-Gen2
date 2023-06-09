// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Mar 15 11:10:37 2023
// Host        : kafcoppelia-arch running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub -rename_top ila_0 -prefix
//               ila_0_ ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2022.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[5:0],probe4[5:0],probe5[5:0],probe6[5:0],probe7[5:0],probe8[3:0],probe9[3:0],probe10[1:0],probe11[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [5:0]probe3;
  input [5:0]probe4;
  input [5:0]probe5;
  input [5:0]probe6;
  input [5:0]probe7;
  input [3:0]probe8;
  input [3:0]probe9;
  input [1:0]probe10;
  input [0:0]probe11;
endmodule
