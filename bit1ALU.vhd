----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:04 04/14/2019 
-- Design Name: 
-- Module Name:    bit1ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyPackage.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit1ALU is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           oper : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC;
           cout : out  STD_LOGIC;
			  less : in  STD_LOGIC;
			  set : out  STD_LOGIC);
end bit1ALU;

architecture Behavioral of bit1ALU is
signal tmpres: std_logic_vector(3 downto 0) ;
--signal tb1: STD_LOGIC ;
signal ta: STD_LOGIC ;
signal tb: STD_LOGIC ;
signal tb2: STD_LOGIC ;


signal tb3: STD_LOGIC_VECTOR (1 downto 0);
signal tb4: STD_LOGIC_VECTOR (1 downto 0);
signal tb5: STD_LOGIC_VECTOR (1 downto 0);
signal nres: STD_LOGIC;
begin
--Smux1: mux2x1 GENERIC MAP (n) PORT MAP (oper(3)&oper(2),a,not(a),tb1);
tmpres(0) <= ta and tb;
tmpres(1) <= ta or tb;

S1mux: mux2x1 PORT MAP (oper(3),a,not(a),ta);
S2mux: mux2x1 PORT MAP (oper(2),b,not(b),tb);

fadd: fadder PORT MAP (ta ,tb ,cin,tb2 ,cout);
tmpres(2) <= tb2;
tb4(0) <= oper(0);
tb4(1) <= oper(1) ;
tmpres(3) <= less;
Bmux: mux4x1 PORT MAP (tb4 ,tmpres ,nres);
set <= tb2;
res <= nres;
end Behavioral;