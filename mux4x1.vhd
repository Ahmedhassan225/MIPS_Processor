----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:52 04/14/2019 
-- Design Name: 
-- Module Name:    mux4x1 - Behavioral 
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

entity mux4x1 is
  port(
    sw : in std_logic_vector(1 downto 0);
    x : in std_logic_vector(3 downto 0);
    y : out std_logic
  );
end mux4x1;

architecture behavior of mux4x1 is
  begin

    process(sw, x)
    begin
        case sw is
          when "00" =>
            y <= x(0);
          when "01" =>
            y <= x(1);
          when "10" =>
            y <= x(2);
          when "11" =>
            y <= x(3);
          when others =>
            y <= 'Z';
        end case;
    end process;

end behavior;

