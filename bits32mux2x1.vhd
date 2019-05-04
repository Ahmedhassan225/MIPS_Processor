----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:01:59 04/24/2019 
-- Design Name: 
-- Module Name:    bits32mux2x1 - Behavioral 
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
use work.MyPackage.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bits32mux2x1 is
port(
		sw: in std_logic;
		input1: in std_logic_vector(31 downto 0);
		input2: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
);
end bits32mux2x1;

architecture Behavioral of bits32mux2x1 is
begin

		output <= input1 when sw = '0' else 
		input2 when sw='1';
		
end Behavioral;

