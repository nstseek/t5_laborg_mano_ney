----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:04:12 11/07/2019 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is 
PORT ( 
	clock : in STD_LOGIC;

	carga : in STD_LOGIC;
	para_continua : in STD_LOGIC;
	novo_quarto : in STD_LOGIC;
	reset : in STD_LOGIC;
	
	c_quarto : in STD_LOGIC_VECTOR (1 downto 0);
	c_minutos : in STD_LOGIC_VECTOR (3 downto 0);
	c_segundos : in STD_LOGIC_VECTOR (1 downto 0);

	DSPL_cent_seg : out STD_LOGIC_VECTOR (7 downto 0);
	anodo : out STD_LOGIC_VECTOR (3 downto 0);

	minutos : out STD_LOGIC_VECTOR (3 downto 0);
	quarto_led : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

	signal centesimos: std_logic_vector(6 downto 0);
	signal segundos: std_logic_vector(5 downto 0);
	signal s_minutos: std_logic_vector(3 downto 0);
	signal quarto: std_logic_vector(1 downto 0);
	
	signal d1: std_logic_vector(5 downto 0);
	signal d2: std_logic_vector(5 downto 0);
	signal d3: std_logic_vector(5 downto 0);
	signal d4: std_logic_vector(5 downto 0);
	
	signal s_para_continua: std_logic;
	signal s_novo_quarto: std_logic;
	signal s_carga: std_logic;
	signal clk_100hz: std_logic;
	signal reset_N: std_logic;
	
	signal centesimos_int: integer:= 0;
	signal centesimos_dec: integer:= 0;
	signal segundos_int: integer:= 0;
	signal segundos_dec: integer:= 0;
	
	signal d1_int: integer:= 0;
	signal d2_int: integer:= 0;
	signal d3_int: integer:= 0;
	signal d4_int: integer:= 0;
	
begin
	
	minutos <= s_minutos;
	with quarto select
	quarto_led <= 	"0001" when "00",
						"0010" when "01",
						"0100" when "10",
						"1000" when "11",
						"1111" when others;
	with segundos_int select -- decimal seg
	d1 <= "100001" when 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9,
			"100011" when 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19,
			"100101" when 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29,
			"100111" when 30 | 31 | 32 | 33 | 34 | 35 | 36 | 37 | 38 | 39,
			"101001" when 40 | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48 | 49,
			"101011" when 50 | 51 | 52 | 53 | 54 | 55 | 56 | 57 | 58 | 59,
			"101101" when others;
	with segundos_int select -- unit seg
	d2 <= "100001" when 0 | 10 | 20 | 30 | 40 | 50 | 60,
			"100011" when 1 | 11 | 21 | 31 | 41 | 51,
			"100101" when 2 | 12 | 22 | 32 | 42 | 52,
			"100111" when 3 | 13 | 23 | 33 | 43 | 53,
			"101001" when 4 | 14 | 24 | 34 | 44 | 54,
			"101011" when 5 | 15 | 25 | 35 | 45 | 55,
			"101101" when 6 | 16 | 26 | 36 | 46 | 56,
			"101111" when 7 | 17 | 27 | 37 | 47 | 57,
			"110001" when 8 | 18 | 28 | 38 | 48 | 58,
			"110011" when others;
	with centesimos_int select -- decimal cent
	d3 <= "100001" when 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9,
			"100011" when 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19,
			"100101" when 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29,
			"100111" when 30 | 31 | 32 | 33 | 34 | 35 | 36 | 37 | 38 | 39,
			"101001" when 40 | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48 | 49,
			"101011" when 50 | 51 | 52 | 53 | 54 | 55 | 56 | 57 | 58 | 59,
			"101101" when 60 | 61 | 62 | 63 | 64 | 65 | 66 | 67 | 68 | 69,
			"101111" when 70 | 71 | 72 | 73 | 74 | 75 | 76 | 77 | 78 | 79,
			"110001" when 80 | 81 | 82 | 83 | 84 | 85 | 86 | 87 | 88 | 89,
			"110011" when others;
	with centesimos_int select -- unit cent
	d4 <= "100001" when 0 | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 90,
			"100011" when 1 | 11 | 21 | 31 | 41 | 51 | 61 | 71 | 81 | 91,
			"100101" when 2 | 12 | 22 | 32 | 42 | 52 | 62 | 72 | 82 | 92,
			"100111" when 3 | 13 | 23 | 33 | 43 | 53 | 63 | 73 | 83 | 93,
			"101001" when 4 | 14 | 24 | 34 | 44 | 54 | 64 | 74 | 84 | 94,
			"101011" when 5 | 15 | 25 | 35 | 45 | 55 | 65 | 75 | 85 | 95,
			"101101" when 6 | 16 | 26 | 36 | 46 | 56 | 66 | 76 | 86 | 96,
			"101111" when 7 | 17 | 27 | 37 | 47 | 57 | 67 | 77 | 87 | 97,
			"110001" when 8 | 18 | 28 | 38 | 48 | 58 | 68 | 78 | 88 | 98,
			"110011" when others;
	reset_N <= not reset;
	centesimos_int <= conv_integer(unsigned(centesimos));
	segundos_int  <= conv_integer(unsigned(segundos));
	contador: entity work.trab port map(
		clock => clock, 
		reset => reset, 
		carga => s_carga,
		para_continua => s_para_continua,
		novo_quarto => s_novo_quarto,
		c_quarto => c_quarto, 
		c_minutos => c_minutos,
		c_segundos => c_segundos,
		centesimos => centesimos,
		segundos => segundos,
		minutos => s_minutos,
		quarto => quarto,
		clk_div => clk_100hz);
		
	display: entity work.dspl_drv port map(
		clock => clock,
		reset => reset,
		dec_ddp => DSPL_cent_seg,
		an => anodo,
		d1 => d1,
		d2 => d2,
		d3 => d3,
		d4 => d4
	);
	
	debounce_carga: entity work.debouncezao port map(
		clock => clk_100hz,
		reset => reset,
		key => carga,
		key_deb => s_carga
	);
	
	debounce_para_cont: entity work.debouncezao port map(
		clock => clk_100hz,
		reset => reset,
		key => para_continua,
		key_deb => s_para_continua
	);
	
	debounce_n_quarto: entity work.debouncezao port map(
		clock => clk_100hz,
		reset => reset,
		key => novo_quarto,
		key_deb => s_novo_quarto
	);


end Behavioral;

