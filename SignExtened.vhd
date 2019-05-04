----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:18:58 04/25/2019 
-- Design Name: 
-- Module Name:    SignExtened - Behavioral 
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
use work.MyPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SignExtened is
    Port ( input : in  STD_LOGIC_VECTOR(15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtened;

architecture Behavioral of SignExtened is

begin

	output(15 downto 0) <= input;
	output(31 downto 16) <= (others =>input(15));

end Behavioral;

