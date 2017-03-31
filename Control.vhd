library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity control is 
port(Go:in std_logic;
	AR:out std_logic_vector(5 downto 0);
	Clk:in std_logic;
	RD:out std_logic);
end control;

architecture Control_Stru of Control is
signal AR_Signal: std_logic_vector(5 downto 0):="000000";
signal RD_Signal: std_logic:='0';
begin
	process(Go, clk)
	begin
		if (rising_edge(clk)) then
			if (Go = '1') then
				AR_Signal <= AR_Signal + 1;
				RD_Signal <= '1';
			else
				AR_Signal <= "000000";
				RD_Signal <= '0';
			end if;
		end if;
	end process;
	
	AR <= AR_Signal;
	RD <= RD_Signal;
end Control_Stru;