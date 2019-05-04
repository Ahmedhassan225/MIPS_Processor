----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:41:07 04/22/2019 
-- Design Name: 
-- Module Name:    CU - Behavioral 
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

entity CU is
PORT(
         Op : IN  std_logic_vector(5 downto 0);
         
         RegDst : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         MemtoReg : OUT  std_logic;
			RegWrite : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
			Branch : OUT  std_logic;
			NotBranch : OUT std_logic;
         ALUOp1 : OUT  std_logic;
         ALUOp0 : OUT  std_logic;
			Jump : OUT std_logic
        );
end CU;

architecture Behavioral of CU is
signal r_Format: std_logic ;
signal lw: std_logic ;
signal sw: std_logic ;
signal beq: std_logic ;
signal notbeq: std_logic ;	


begin

r_Format <= not(op(5)) and not(op(4)) and not(op(3)) and not(op(2)) and not(op(1)) and not(op(0));
lw			<= op(5) and not(op(4)) and not(op(3)) and not(op(2)) and op(1) and op(0);
sw 		<= op(5) and not(op(4)) and op(3) and not(op(2)) and op(1) and op(0);
beq 		<= not(op(5)) and not(op(4)) and not(op(3)) and op(2) and not(op(1)) and not(op(0));
notbeq 	<= not(op(5)) and not(op(4)) and not(op(3)) and op(2) and not(op(1)) and op(0);
jump 		<= not(op(5)) and not(op(4)) and not(op(3)) and not(op(2)) and op(1) and not(op(0));

RegDst <= r_Format ;
ALUSrc <= lw or sw ;
MemtoReg <= lw ;
RegWrite <= r_Format or lw;
MemRead <= lw;
MemWrite <= sw;
Branch <= beq;
NotBranch <= notbeq;
ALUOp1 <= r_Format;
ALUOp0 <= beq or notbeq;




end Behavioral;

