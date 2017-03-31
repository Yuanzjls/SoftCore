-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/08/2017 23:52:01"
                                                            
-- Vhdl Test Bench template for design  :  memory
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;                              

ENTITY memory_vhd_tst IS
END memory_vhd_tst;
ARCHITECTURE memory_arch OF memory_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Address : STD_LOGIC_VECTOR(5 DOWNTO 0):=(others=>'0');
SIGNAL Data_Out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RD : STD_LOGIC;
COMPONENT memory
	PORT (
	Address : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	Data_Out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	RD : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : memory
	PORT MAP (
-- list connections between master ports and signals
	Address => Address,
	Data_Out => Data_Out,
	RD => RD
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
	RD<='1';
	wait;
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
   Address<=address+1;       -- code executes for every event on sensitivity list  
	WAIT for 5ns;
                                                      
END PROCESS always;                                          
END memory_arch;
