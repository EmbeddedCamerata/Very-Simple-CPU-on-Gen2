-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Wed Mar 15 11:10:37 2023
-- Host        : kafcoppelia-arch running 64-bit Arch Linux
-- Command     : write_vhdl -force -mode synth_stub -rename_top ila_0 -prefix
--               ila_0_ ila_0_stub.vhdl
-- Design      : ila_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );

end ila_0;

architecture stub of ila_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[5:0],probe4[5:0],probe5[5:0],probe6[5:0],probe7[5:0],probe8[3:0],probe9[3:0],probe10[1:0],probe11[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2022.2";
begin
end;
