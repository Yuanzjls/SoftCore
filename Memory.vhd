library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memory is
port(Address: in std_logic_vector(5 downto 0);
RD:in std_logic;
Data_Out:out std_logic_vector(15 downto 0));
end memory;

architecture Behavior_Memory of memory is
type Memory_Rom is array (63 downto 0) of std_logic_vector(15 downto 0);
signal Rom:Memory_Rom:=(x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000",
x"A029", x"8003", x"0180", x"2049", x"FC05", x"8339", x"2995",x"0000");
signal Addr:integer range 0 to 63;
begin 
	Addr <= conv_integer(Address);
	process (RD, Addr, Rom)
		begin
		if (RD='1') then
			Data_Out <= Rom(Addr);
		else
			Data_Out <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
end Behavior_Memory;
