library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Softcore is 
generic(Data_Width:integer:=8);
port(Go:in std_logic;
	Clk:in std_logic;
	Constant_In:in std_logic_vector(Data_Width-1 downto 0);
	Data_In:in std_logic_vector(Data_Width-1 downto 0);
	DataA_Out, DataB_Out, DataD_Out:out std_logic_vector(Data_Width-1 downto 0);
	Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 :out std_logic_vector(Data_Width-1 downto 0);
	Status: out std_logic_vector(3 downto 0));
end Softcore;

architecture Softcore_Behavior of softcore is

component memory is
port(Address: in std_logic_vector(5 downto 0);
RD:in std_logic;
Data_Out:out std_logic_vector(15 downto 0));
end component;

component Datapath is
generic(Data_Width:integer:=8);
port(DA_In, AA_In, BA_In: in std_logic_vector (2 downto 0);
	MB_In, MD_In, RW_In: in std_logic;
	FS_In: in std_logic_vector(3 downto 0);	
	Constant_In:in std_logic_vector(Data_Width-1 downto 0);
	Data_In:in std_logic_vector(Data_Width-1 downto 0);
	DataA_Out, DataB_Out, DataD_Out:out std_logic_vector(Data_Width-1 downto 0);
	Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 :out std_logic_vector(Data_Width-1 downto 0);
	Clk:in std_logic;
	status:out std_logic_vector(3 downto 0));
end component;

component control is 
port(Go:in std_logic;
	AR:out std_logic_vector(5 downto 0);
	Clk:in std_logic;
	RD:out std_logic);
end component;

signal AR: std_logic_vector(5 downto 0);
signal RD: std_logic;
signal Instruction: std_logic_vector(15 downto 0);
begin
	u1:Control port map(go, AR, Clk, RD);
	u2:Memory port map(AR, RD, Instruction);
	u3:Datapath port map(Instruction(15 downto 13), Instruction(12 downto 10), Instruction(9 downto 7),
	Instruction(6), Instruction(1), Instruction(0), Instruction(5 downto 2), Constant_In, Data_In, DataA_Out,
	DataB_Out, DataD_Out, Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, Clk, Status);
end softcore_Behavior;