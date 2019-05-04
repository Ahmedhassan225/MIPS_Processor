----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:10 04/23/2019 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

entity ALUControl is
port(
fn: in std_logic_vector (5 downto 0);
ALUopt0: in std_logic;
ALUopt1: in std_logic;
output: out std_logic_vector (3 downto 0)
);
end ALUControl;

architecture Behavioral of ALUControl is

signal cpe :std_logic_vector(3 downto 0);

begin
cpe(0)<= ((fn(0) or fn(3)) and ALUopt1) and not cpe(3) ;
cpe(1)<= not fn(2) or (not ALUopt1);
cpe(2)<= (ALUopt1 and fn(1)) or ALUopt0 ;
cpe(3)<= (fn(0) and fn(1)) and ALUopt1;

output <= cpe;
end Behavioral;

