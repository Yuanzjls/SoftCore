LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;


entity Datapath is
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
end Datapath;

architecture Behavior_Datapath of Datapath is
	type Register_Array is array (7 downto 0) of std_logic_vector(Data_Width-1 downto 0);
	
	signal Reg:register_Array:=(x"07", x"06", x"05", x"04", x"03", x"02", x"01", x"00");
	signal V, C, N, Z: std_logic;
begin

	

	

	
	
	process(Clk)
	variable DA, AA, BA: integer range 0 to 7;
	variable MB, MD, RW: std_logic;
	variable FS: std_logic_vector(3 downto 0);
	variable MAA, MBA: std_logic_vector(Data_Width-1 downto 0);	
	variable Reg_Function: std_logic_vector(Data_Width downto 0);
	
	begin
	
		if (rising_edge(Clk)) then
			
			if (RW = '1') then
				if (MD = '1') then
					Reg(DA) <= Data_In;
				elsif (MD = '0') then
					Reg(DA) <= Reg_Function(Data_Width - 1 downto 0);
				end if;
			end if;	
			
			
			
			DA := conv_integer(DA_In);			
			AA := conv_integer(AA_In);			
			BA := conv_integer(BA_In);
			
			MB := MB_In;
			FS := FS_In;
			MD := MD_In;
			RW := RW_In;			
			MAA := Reg(AA);
			if (MB='0') then
				MBA := Reg(BA);
			elsif (MB='1') then
				MBA := constant_In;
			end if;
			
			
			V<='0';
			case FS is
				when "0000" => Reg_Function := '0' & MAA;
				when "0001" => Reg_Function := '0' & MAA+1;
									if (Reg_Function(7) = MAA(7)) then
										V<='0';
									else
										V<='1';
									end if;
									
				when "0010" => Reg_Function := ('0' & MAA)+ ('0' & MBA);
									if ( (MAA(7) and MBA(7) and not Reg_Function(7))='1') then
										V <= '1';
									elsif ((not MAA(7) and not MBA(7) and Reg_Function(7))='1') then
										V <= '1';
									else
										V <= '0';
									end if;
				when "0011" => Reg_Function := ('0' & MAA)+('0' & MBA)+1;
									if ( (MAA(7) and MBA(7) and not Reg_Function(7))='1') then
										V <= '1';
									elsif ((not MAA(7) and not MBA(7) and Reg_Function(7))='1') then
										V <= '1';
									else
										V <= '0';
									end if;									
				when "0100" => Reg_Function := ('0' & MAA) + ('0'& (not  MBA));
									if ( (MAA(7) and not MBA(7) and not Reg_Function(7))='1') then
										V <= '1';
									elsif ((not MAA(7) and MBA(7) and Reg_Function(7))='1') then
										V <= '1';
									else
										V <= '0';
									end if;			
				when "0101" => Reg_Function := ('0' & MAA) + ('0'& (not  MBA)) + 1;
									if ( (MAA(7) and not MBA(7) and not Reg_Function(7))='1') then
										V <= '1';
									elsif ((not MAA(7) and MBA(7) and Reg_Function(7))='1') then
										V <= '1';
									else
										V <= '0';
									end if;		
				when "0110" => Reg_Function := ('0' & MAA) - 1;
									if (Reg_Function(7) = MAA(7)) then
										V<='0';
									else
										V<='1';
									end if;
				when "0111" => Reg_Function := ('0' & MAA);
				when "1000" =>	Reg_Function := '0' & (MAA and MBA);

				when "1001" => Reg_Function := '0' & (MAA or MBA);

				when "1010" => Reg_Function := '0' & (MAA xor MBA);

				when "1011" => Reg_Function := '0' & (not MAA);

				when "1100" => Reg_Function := '0' & MBA;

				when "1101" => Reg_Function := "00" & MBA(Data_Width - 1 downto 1);

				when "1110" => Reg_Function := '0' & MBA(Data_Width - 2 downto 0) & '0';

				when others => 
			end case;
			
			if (Reg_Function(8) = '1') then
				C <= '1';
			else
				C <= '0';
			end if;
			
			if (Reg_Function(7) = '0') then
				N<='0';
			else
				N<='1';
			end if;
			
			if(Reg_Function(Data_Width - 1 downto 0) = "00000000") then
				Z <= '1';
			else
				Z <= '0';
			end if;
			

			DataB_Out<=MBA;
			DataA_Out<=MAA;
			DataD_Out<=Reg_Function(Data_Width - 1 downto 0);
		end if;
	end process;
	
	

	
	Reg0<=reg(0);
	Reg1<=reg(1);
	Reg2<=reg(2);
	Reg3<=reg(3);
	Reg4<=reg(4);
	Reg5<=reg(5);
	Reg6<=reg(6);
	Reg7<=reg(7);
	
	status<= V & C & N & Z;
end architecture;
		
