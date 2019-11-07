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

begin
	

end Behavioral;

