----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:30 04/14/2019 
-- Design Name: 
-- Module Name:    bit32ALU - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0);
         cflag : OUT  std_logic;
         zflag : OUT  std_logic;
         oflag : OUT  std_logic
        );
end ALU;

architecture Behavioral of ALU is
--R1: reg GENERIC MAP (32) PORT MAP (data1,clk,'0',Not C,C,Tmp2);
--R2: reg GENERIC MAP (32) PORT MAP (data2,clk,L,'0','0',R2out);
signal tmpres: std_logic_vector(31 downto 0) ;
signal sum : std_logic_vector(31 downto 0) ;
signal gtemp : std_logic_vector(31 downto 0);
signal SSet : std_logic;
begin

alu0:  bit1ALU Port MAP(data1(0),data2(0),aluop(2) ,aluop,sum(0),tmpres(0),SSet ,gtemp(0));
alu1:  bit1ALU PORT MAP(data1(1),data2(1),tmpres(0),aluop,sum(1)   ,tmpres(1),'0'  ,gtemp(1));
alu2:  bit1ALU PORT MAP(data1(2),data2(2),tmpres(1),aluop,sum(2)   ,tmpres(2),'0'  ,gtemp(2));
alu3:  bit1ALU PORT MAP(data1(3),data2(3),tmpres(2),aluop,sum(3)   ,tmpres(3),'0'  ,gtemp(3));
alu4:  bit1ALU PORT MAP(data1(4),data2(4),tmpres(3),aluop,sum(4)   ,tmpres(4),'0'  ,gtemp(4));
alu5:  bit1ALU PORT MAP(data1(5),data2(5),tmpres(4),aluop,sum(5)   ,tmpres(5),'0'  ,gtemp(5));
alu6:  bit1ALU PORT MAP(data1(6),data2(6),tmpres(5),aluop,sum(6)   ,tmpres(6),'0'  ,gtemp(6));
alu7:  bit1ALU PORT MAP(data1(7),data2(7),tmpres(6),aluop,sum(7)   ,tmpres(7),'0'  ,gtemp(7));
alu8:  bit1ALU PORT MAP(data1(8),data2(8),tmpres(7),aluop,sum(8)   ,tmpres(8),'0'  ,gtemp(8));
alu9:  bit1ALU PORT MAP(data1(9),data2(9),tmpres(8),aluop,sum(9)   ,tmpres(9),'0'  ,gtemp(9));
alu10: bit1ALU PORT MAP(data1(10),data2(10),tmpres(9),aluop,sum(10),tmpres(10) ,'0',gtemp(10));
alu11: bit1ALU PORT MAP(data1(11),data2(11),tmpres(10),aluop,sum(11),tmpres(11),'0',gtemp(11));
alu12: bit1ALU PORT MAP(data1(12),data2(12),tmpres(11),aluop,sum(12),tmpres(12),'0',gtemp(12));
alu13: bit1ALU PORT MAP(data1(13),data2(13),tmpres(12),aluop,sum(13),tmpres(13),'0',gtemp(13));
alu14: bit1ALU PORT MAP(data1(14),data2(14),tmpres(13),aluop,sum(14),tmpres(14),'0',gtemp(14));
alu15: bit1ALU PORT MAP(data1(15),data2(15),tmpres(14),aluop,sum(15),tmpres(15),'0',gtemp(15));
alu16: bit1ALU PORT MAP(data1(16),data2(16),tmpres(15),aluop,sum(16),tmpres(16),'0',gtemp(16));
alu17: bit1ALU PORT MAP(data1(17),data2(17),tmpres(16),aluop,sum(17),tmpres(17),'0',gtemp(17));
alu18: bit1ALU PORT MAP(data1(18),data2(18),tmpres(17),aluop,sum(18),tmpres(18),'0',gtemp(18));
alu19: bit1ALU PORT MAP(data1(19),data2(19),tmpres(18),aluop,sum(19),tmpres(19),'0',gtemp(19));
alu20: bit1ALU PORT MAP(data1(20),data2(20),tmpres(19),aluop,sum(20),tmpres(20),'0',gtemp(20));
alu21: bit1ALU PORT MAP(data1(21),data2(21),tmpres(20),aluop,sum(21),tmpres(21),'0',gtemp(21));
alu22: bit1ALU PORT MAP(data1(22),data2(22),tmpres(21),aluop,sum(22),tmpres(22),'0',gtemp(22));
alu23: bit1ALU PORT MAP(data1(23),data2(23),tmpres(22),aluop,sum(23),tmpres(23),'0',gtemp(23));
alu24: bit1ALU PORT MAP(data1(24),data2(24),tmpres(23),aluop,sum(24),tmpres(24),'0',gtemp(24));
alu25: bit1ALU PORT MAP(data1(25),data2(25),tmpres(24),aluop,sum(25),tmpres(25),'0',gtemp(25));
alu26: bit1ALU PORT MAP(data1(26),data2(26),tmpres(25),aluop,sum(26),tmpres(26),'0',gtemp(26));
alu27: bit1ALU PORT MAP(data1(27),data2(27),tmpres(26),aluop,sum(27),tmpres(27),'0',gtemp(27));
alu28: bit1ALU PORT MAP(data1(28),data2(28),tmpres(27),aluop,sum(28),tmpres(28),'0',gtemp(28));
alu29: bit1ALU PORT MAP(data1(29),data2(29),tmpres(28),aluop,sum(29),tmpres(29),'0',gtemp(29));
alu30: bit1ALU PORT MAP(data1(30),data2(30),tmpres(29),aluop,sum(30),tmpres(30),'0',gtemp(30));
alu31: bit1ALU PORT MAP(data1(31),data2(31),tmpres(30),aluop,sum(31),tmpres(31),'0',SSet);

dataout <= sum;
cflag <= tmpres(31); 
zflag <= '1' when sum(31 downto 0) = "00000000000000000000000000000000" else '0'; 
oflag <= tmpres(31) xor tmpres(30);
end Behavioral;