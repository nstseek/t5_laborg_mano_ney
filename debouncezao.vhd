----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:43 11/15/2019 
-- Design Name: 
-- Module Name:    debouncezao - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncezao is 
   generic(clocks_interval: integer := 50);
	port(
	clock: in std_logic;
	reset: in std_logic;
	key: in std_logic;
	key_deb: out std_logic
);
end debouncezao;

architecture Behavioral of debouncezao is

	signal key_pressed: std_logic := '0';
	signal waiting_for_release: std_logic:= '0';
	signal key_output: std_logic:= '0';
	signal clocks_passed: integer:= 0;

begin
	key_deb <= key_output;
	
	process(clock, reset, key)
	begin
		if reset = '1' then
			key_pressed <= '0';
			key_output <= '0';
			waiting_for_release <= '0';
		elsif clock'event and clock = '0' then
			if waiting_for_release = '1' then
				if clocks_passed < clocks_interval then
					clocks_passed <= clocks_passed + 1;
				end if;
			end if;
			if key = '1' and waiting_for_release = '0' then
				key_pressed <= '1';
				waiting_for_release <= '1';
			elsif key = '0' and waiting_for_release = '1' and clocks_passed = clocks_interval then
				clocks_passed <= 0;
				waiting_for_release <= '0';
			end if;			
			if key_output = '1' then
				key_output <= '0';			
			elsif key_pressed = '1' then
				key_output <= '1';
				key_pressed <= '0';
			end if;
		end if;
	end process;
	
	

end Behavioral;

