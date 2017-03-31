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
-- Generated on "03/08/2017 19:10:43"
                                                            
-- Vhdl Test Bench template for design  :  Datapath
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Datapath_vhd_tst IS
END Datapath_vhd_tst;
ARCHITECTURE Datapath_arch OF Datapath_vhd_tst IS
-- constants                                                 
-- signals   
SIGNAL DA_In : STD_LOGIC_VECTOR(2 DOWNTO 0);                                                
SIGNAL AA_In : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL BA_In : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Clk : STD_LOGIC;
SIGNAL Constant_In : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Data_In : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataA_Out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataB_Out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataD_Out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL FS_In : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL MB_In : STD_LOGIC;
SIGNAL MD_In : STD_LOGIC;
SIGNAL Reg0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reg7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RW_In : STD_LOGIC;
signal status: std_logic_vector(3 downto 0);
signal Instruction: std_LOGIC_VECTOR(15 downto 0);
COMPONENT Datapath
	PORT (
	AA_In : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	BA_In : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Clk : IN STD_LOGIC;
	Constant_In : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DA_In : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Data_In : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataA_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataB_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataD_Out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	FS_In : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	MB_In : IN STD_LOGIC;
	MD_In : IN STD_LOGIC;
	Reg0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg4 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg5 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg6 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reg7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	RW_In : IN STD_LOGIC;
	status:out std_logic_vector(3 downto 0)
	);
END COMPONENT;
BEGIN
	i1 : Datapath
	PORT MAP (
-- list connections between master ports and signals
	AA_In => AA_In,
	BA_In => BA_In,
	Clk => Clk,
	Constant_In => Constant_In,
	DA_In => DA_In,
	Data_In => Data_In,
	DataA_Out => DataA_Out,
	DataB_Out => DataB_Out,
	DataD_Out => DataD_Out,
	FS_In => FS_In,
	MB_In => MB_In,
	MD_In => MD_In,
	Reg0 => Reg0,
	Reg1 => Reg1,
	Reg2 => Reg2,
	Reg3 => Reg3,
	Reg4 => Reg4,
	Reg5 => Reg5,
	Reg6 => Reg6,
	Reg7 => Reg7,
	RW_In => RW_In,
	status => status
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
	clk <= '1';
	wait for 5ns;
	clk <= '0';
	wait for 5ns;                                               
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN 
	wait for 10ns;
	--1                                                        
	DA_In <= "001";
	AA_In <= "010";
	BA_In <= "011";
	FS_In <= "0101";
	MB_In <= '0';
	MD_In <= '0';
	RW_In <= '1';  	
	wait for 10ns;	
	
	--2
	DA_In <= "100";
	AA_In <= "000";
	BA_In <= "110";
	FS_In <= "1110";
	MB_In <= '0';
	MD_In <= '0';
	RW_In <= '1';  
	Data_In <= "00010010";
	wait for 10ns;
	
	--3
	DA_In <= "111";
	AA_In <= "111";
	BA_In <= "000";
	FS_In <= "0001";
	MB_In <= '0';
	MD_In <= '0';
	RW_In <= '1';  
	Data_In <= "00000000";
	wait for 10ns;
	
	--4
	DA_In <= "001";
	AA_In <= "000";
	BA_In <= "000";
	FS_In <= "0010";
	constant_In<="00000010";
	MB_In <= '1';
	MD_In <= '0';
	RW_In <= '1';  	
	Data_In <= "00010010";	
	wait for 10ns;
	
	--5
	DA_In <= "000";
	AA_In <= "000";
	BA_In <= "011";
	FS_In <= "0000";
	constant_In<="00000000";
	MB_In <= '0';
	MD_In <= '0';
	RW_In <= '0';  	
	Data_In <= "00010010";	
	wait for 10ns;
	
	--6
	DA_In <= "100";
	AA_In <= "000";
	BA_In <= "000";
	FS_In <= "0000";
	constant_In<="00000000";
	MB_In <= '0';
	MD_In <= '1';
	RW_In <= '1';  	
	Data_In <= "00010010";	
	wait for 10ns;
	
	--7
	DA_In <= "101";
	AA_In <= "000";
	BA_In <= "000";
	FS_In <= "1010";
	constant_In<="00000000";
	MB_In <= '0';
	MD_In <= '0';
	RW_In <= '1';  	
	Data_In <= "00010010";	
	wait for 10ns;
	wait;
	
END PROCESS always;  
	Instruction(15 downto 13) <= DA_In;
	Instruction(12 downto 10) <= AA_In;
	Instruction(9 downto 7) <= BA_In;
	Instruction(6) <= MB_In;
	Instruction(5 downto 2) <= FS_In;
	Instruction(1) <= MD_In;
	Instruction(0) <= RW_In;
END Datapath_arch;
