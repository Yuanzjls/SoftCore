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
-- Generated on "03/09/2017 00:30:34"
                                                            
-- Vhdl Test Bench template for design  :  control
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY control_vhd_tst IS
END control_vhd_tst;
ARCHITECTURE control_arch OF control_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AR : STD_LOGIC_VECTOR(5 DOWNTO 0):="000000";
SIGNAL Clk : STD_LOGIC;
SIGNAL Go : STD_LOGIC:='1';
SIGNAL RD : STD_LOGIC:='0';
COMPONENT control
	PORT (
	AR : BUFFER STD_LOGIC_VECTOR(5 DOWNTO 0);
	Clk : IN STD_LOGIC;
	Go : IN STD_LOGIC;
	RD : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : control
	PORT MAP (
-- list connections between master ports and signals
	AR => AR,
	Clk => Clk,
	Go => Go,
	RD => RD
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
clk<='1';
wait for 5ns;
clk<='0';
wait for 5ns;                                                      
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END control_arch;
