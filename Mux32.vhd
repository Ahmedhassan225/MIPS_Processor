library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyPackage.all;
entity MUX32 is
    Port ( sel : in  STD_LOGIC_VECTOR (4 downto 0);
           r0 : in  STD_LOGIC_VECTOR (31 downto 0);
           r1 : in  STD_LOGIC_VECTOR (31 downto 0);
           r2 : in  STD_LOGIC_VECTOR (31 downto 0);
           r3 : in  STD_LOGIC_VECTOR (31 downto 0);
           r4 : in  STD_LOGIC_VECTOR (31 downto 0);
           r5 : in  STD_LOGIC_VECTOR (31 downto 0);
           r6 : in  STD_LOGIC_VECTOR (31 downto 0);
           r7 : in  STD_LOGIC_VECTOR (31 downto 0);
           r8 : in  STD_LOGIC_VECTOR (31 downto 0);
           r9 : in  STD_LOGIC_VECTOR (31 downto 0);
           r10 : in  STD_LOGIC_VECTOR (31 downto 0);
           r11 : in  STD_LOGIC_VECTOR (31 downto 0);
           r12 : in  STD_LOGIC_VECTOR (31 downto 0);
           r13 : in  STD_LOGIC_VECTOR (31 downto 0);
           r14 : in  STD_LOGIC_VECTOR (31 downto 0);
           r15 : in  STD_LOGIC_VECTOR (31 downto 0);
           r16 : in  STD_LOGIC_VECTOR (31 downto 0);
           r17 : in  STD_LOGIC_VECTOR (31 downto 0);
           r18 : in  STD_LOGIC_VECTOR (31 downto 0);
           r19 : in  STD_LOGIC_VECTOR (31 downto 0);
           r20 : in  STD_LOGIC_VECTOR (31 downto 0);
           r21 : in  STD_LOGIC_VECTOR (31 downto 0);
           r22 : in  STD_LOGIC_VECTOR (31 downto 0);
           r23 : in  STD_LOGIC_VECTOR (31 downto 0);
           r24 : in  STD_LOGIC_VECTOR (31 downto 0);
           r25 : in  STD_LOGIC_VECTOR (31 downto 0);
           r26 : in  STD_LOGIC_VECTOR (31 downto 0);
           r27 : in  STD_LOGIC_VECTOR (31 downto 0);
           r28 : in  STD_LOGIC_VECTOR (31 downto 0);
           r29 : in  STD_LOGIC_VECTOR (31 downto 0);
           r30 : in  STD_LOGIC_VECTOR (31 downto 0);
           r31 : in  STD_LOGIC_VECTOR (31 downto 0);
			  o	: out	STD_LOGIC_VECTOR (31 downto 0));
end MUX32;

architecture Behavioral of MUX32 is

begin
o<= r0 when sel= "00000" else
r1 when sel= "00001" else
r2 when sel= "00010" else
r3 when sel= "00011" else
r4 when sel= "00100" else
r5 when sel= "00101" else
r6 when sel= "00110" else
r7 when sel= "00111" else
r8 when sel= "01000" else
r9 when sel= "01001" else
r10 when sel= "01010" else
r11 when sel= "01011" else
r12 when sel= "01100" else
r13 when sel= "01101" else
r14 when sel= "01110" else
r15 when sel= "01111" else
r16 when sel= "10000" else
r17 when sel= "10001" else
r18 when sel= "10010" else
r19 when sel= "10011" else
r20 when sel= "10100" else
r21 when sel= "10101" else
r22 when sel= "10110" else
r23 when sel= "10111" else
r24 when sel= "11000" else
r25 when sel= "11001" else
r26 when sel= "11010" else
r27 when sel= "11011" else
r28 when sel= "11100" else
r29 when sel= "11101" else
r30 when sel= "11110" else
r31 when sel= "11111" ;


end Behavioral;

