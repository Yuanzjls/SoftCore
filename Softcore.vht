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
-- Generated on "03/09/2017 01:01:49"
                                                            
-- Vhdl Test Bench template for design  :  Softcore
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Softcore_vhd_tst IS
END Softcore_vhd_tst;
ARCHITECTURE Softcore_arch OF Softcore_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL Constant_In : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Data_In : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataA_Out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataB_Out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataD_Out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Go : STD_LOGIC;
SIGNAL Reg0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
Signal status: std_LOGIC_VECTOR(3 downto 0);
COMPONENT Softcore
	PORT (
	Clk : IN STD_LOGIC;
	Constant_In : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Data_In : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataA_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataB_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataD_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Go : IN STD_LOGIC;
	Reg0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	status: out std_LOGIC_VECTOR(3 downto 0)
	);
END COMPONENT;
BEGIN
	i1 : Softcore
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	Constant_In => Constant_In,
	Data_In => Data_In,
	DataA_Out => DataA_Out,
	DataB_Out => DataB_Out,
	DataD_Out => DataD_Out,
	Go => Go,
	Reg0 => Reg0,
	Reg1 => Reg1,
	Reg2 => Reg2,
	Reg3 => Reg3,
	Reg4 => Reg4,
	Reg5 => Reg5,
	Reg6 => Reg6,
	Reg7 => Reg7,
	Status => Status
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN  
	Clk<='1';
	wait for 5ns;
	Clk<='0';
	wait for 5ns;                                                        

END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN   
--1                                                      
  	go<='1';
	wait for 20ns;
	
	Data_In <= "00000000";
	wait for 10ns;  
--2	
	Data_In <= "00010010";
	wait for 10ns;	
--3
	Data_In <= "00000000";
	wait for 10ns;
--4
	constant_In<="00000010";
	Data_In <= "00010010";	
	wait for 10ns;
--5
	constant_In<="00000000";
	Data_In <= "00010010";	
	wait for 10ns;
--6
	constant_In<="00000000";
	Data_In <= "00010010";	
	wait for 10ns;
--7
	constant_In<="00000000";
	Data_In <= "00010010";	
	wait for 10ns;
	assert false
		report "simulation is completed (not error)."
		severity error;
	wait;
END PROCESS always;                                          
END Softcore_arch;
