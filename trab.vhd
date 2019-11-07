----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:45 11/06/2019 
-- Design Name: 
-- Module Name:    trab - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity trab is PORT (
	clock : in STD_LOGIC;
	reset : in STD_LOGIC;

	carga : in STD_LOGIC;
	para_continua : in STD_LOGIC;
	novo_quarto : in STD_LOGIC;

	c_quarto : in STD_LOGIC_VECTOR (1 downto 0);
	c_minutos : in STD_LOGIC_VECTOR (3 downto 0);
	c_segundos : in STD_LOGIC_VECTOR (1 downto 0);

	centesimos : out STD_LOGIC_VECTOR (6 downto 0);
	segundos : out STD_LOGIC_VECTOR (5 downto 0);
	minutos : out STD_LOGIC_VECTOR (3 downto 0);
	quarto : out STD_LOGIC_VECTOR (1 downto 0)
);
end trab;

architecture Behavioral of trab is

	signal clk_half_const: INTEGER:= 25;
	signal clk_full_const: INTEGER:= 49;
	signal clk_100hz: STD_LOGIC:= '0';
	signal clk_100hz_counter: INTEGER:= 0;
	
	signal rst_centesimos: INTEGER:= 0;
	signal rst_segundos: INTEGER:= 0;
	signal rst_minutos: INTEGER:= 15;
	
	signal s_centesimos: INTEGER:= rst_centesimos;
	signal s_segundos: INTEGER:= rst_segundos;
	signal s_minutos: INTEGER:= rst_minutos;
	
	signal end_quarto: STD_LOGIC:= '0';
	signal s_quarto: INTEGER:= 1;
	
	signal count: INTEGER:= 1;
	
	
	signal quart: INTEGER;
	signal seg: INTEGER;
	signal min: INTEGER;

begin
	centesimos <= conv_std_logic_vector(s_centesimos, centesimos'length);
	segundos <= conv_std_logic_vector(s_segundos, segundos'length);
	minutos <= conv_std_logic_vector(s_minutos, minutos'length);
	quarto <= conv_std_logic_vector(s_quarto, quarto'length);
	
	with c_quarto select quart <=
		1 when "00",
		2 when "01",
		3 when "10",
		4 when others;
		
	with c_segundos select seg <=
		0 when "00",
		15 when "01",
		30 when "10",
		45 when others;
		
	with c_minutos select min <=
		15 when "1111",
		14 when "1110",
		13 when "1101",
		12 when "1100",
		11 when "1011",
		10 when "1010",
		9 when "1001",
		8 when "1000",
		7 when "0111",
		6 when "0110",
		5 when "0101",
		4 when "0100",
		3 when "0011",
		2 when "0010",
		1 when "0001",
		0 when others;

	process(clock)
	begin
		if clock'event and clock = '1' then
			if clk_100hz_counter < clk_half_const then
				clk_100hz_counter <= clk_100hz_counter + 1;
				clk_100hz <= '0';
			elsif clk_100hz_counter = clk_full_const then
				clk_100hz_counter <= 0;
				clk_100hz <= '1';
			else
				clk_100hz_counter <= clk_100hz_counter + 1;
				clk_100hz <= '1';				
			end if;
		end if;
	end process;
	
	process(clk_100hz, reset)
	begin
		if reset = '1' then
			s_centesimos <= rst_centesimos;
			s_segundos <= rst_segundos;
			s_minutos <= rst_minutos;
			count <= 0;
		elsif clk_100hz'event and clk_100hz = '1' then
			if para_continua = '1' then
				if count = 1 then
					count <= 0;
				else
					count <= 1;
				end if;
			elsif carga = '1' and count = 0 then				
				s_centesimos <= rst_centesimos;
				s_quarto <= quart;
				s_minutos <= min;
				s_segundos <= seg;
			elsif novo_quarto = '1' and end_quarto = '1' then
				if s_quarto < 4 then				
					s_centesimos <= rst_centesimos;
					s_segundos <= rst_segundos;
					s_minutos <= rst_minutos;
					end_quarto <= '0';
					s_quarto <= s_quarto + count;
				else
					s_centesimos <= rst_centesimos;
					s_segundos <= rst_segundos;
					s_minutos <= rst_minutos;
					end_quarto <= '0';
					s_quarto <= 1;
				end if;
			else
				if s_centesimos > 0 then
					s_centesimos <= s_centesimos - count;
				elsif s_segundos > 0 then
					s_centesimos <= 99;
					s_segundos <= s_segundos - count;
				elsif s_minutos > 0 then
					s_centesimos <= 99;
					s_segundos <= 59;
					s_minutos <= s_minutos - count;
				else
					end_quarto <= '1';
				end if;
			end if;			
		end if;
	end process;

end Behavioral;

