----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:13:45 04/22/2019 
-- Design Name: 
-- Module Name:    MainModule - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
use work.MyPackage.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainModule is
PORT (
			START: IN STD_LOGIC; 
			CLK: IN STD_LOGIC; 
			RegFileOut1: OUT STD_LOGIC_VECTOR(31 downto 0); 
			RegFileOut2: OUT STD_LOGIC_VECTOR(31 downto 0); 
			ALUOut: OUT STD_LOGIC_VECTOR(31 downto 0); 
			PCOut: OUT STD_LOGIC_VECTOR(31 downto 0); 
			DataMemOut: OUT STD_LOGIC_VECTOR(31 downto 0)
		);
		
end MainModule;

architecture Behavioral of MainModule is
signal PC: std_logic_vector (31 downto 0); 
signal PCO: std_logic_vector (31 downto 0); 

--ALL instrution memory out signals
signal INSTRMEMORYout: std_logic_vector (31 downto 0);
signal INSTRUCTION31_26: std_logic_vector (5 downto 0);
signal INSTRUCTION25_21: std_logic_vector (4 downto 0);
signal INSTRUCTION20_16: std_logic_vector (4 downto 0);
signal INSTRUCTION15_11: std_logic_vector (4 downto 0);
signal INSTRUCTION15_0: std_logic_vector (15 downto 0); 
signal INSTRUCTION5_0: std_logic_vector (5 downto 0); 

--control unit out signals 
signal RegDst : std_logic;
signal ALUSrc : std_logic;
signal MemtoReg : std_logic;
signal RegWrite : std_logic;
signal MemRead :  std_logic;
signal MemWrite : std_logic;
signal Branch : std_logic;
signal notBranch : std_logic;
signal ALUOp1 : std_logic;
signal ALUOp0 : std_logic;
signal Jump : std_logic;

signal INSTRUCTIONRT_RG: std_logic_vector (4 downto 0);
signal RFILEWRITEDATA: std_logic_vector(31 downto 0);
signal RFILEOUT1: std_logic_vector(31 downto 0);
signal RFILEOUT2: std_logic_vector(31 downto 0);

signal SIGNALEXTENDED32: std_logic_vector(31 downto 0);

signal ALUMASTEROPR: std_logic_vector(3 downto 0);
signal ALUMASTERINPUT2: std_LOGIC_VECTOR (31 downto 0);
signal dataoutALUMASTER :   std_logic_vector(31 downto 0);
signal cflagALUMASTER :  std_logic;
signal zflagALUMASTER :   std_logic;
signal oflagALUMASTER :  std_logic;

signal DATAMEMOUTPUT: STD_LOGIC_VECTOR (31 downto 0);

signal ALUPLUS4PC : STD_LOGIC_VECTOR (31 downto 0);

signal ALUPLUS4INPUT2 : STD_LOGIC_VECTOR (31 downto 0);
signal ALUPLUS4DUM : STD_LOGIC_VECTOR (2 downto 0);
signal ALUPLUS4OPER : STD_LOGIC_VECTOR (3 downto 0);

signal INSTRUCTION25_0 : STD_LOGIC_VECTOR (25 downto 0);
signal INSTRUCTION25_0SHIFT2: STD_LOGIC_VECTOR (27 downto 0);

signal JUMPADRRESS: STD_LOGIC_VECTOR (31 downto 0);
signal ALUSHIFFTED: STD_LOGIC_VECTOR (31 downto 0);

signal ALU2OUTPUT: STD_LOGIC_VECTOR (31 downto 0); 

signal MUX1OUTPUT: STD_LOGIC_VECTOR (31 downto 0); 
signal MUX1OPER: std_logic;

begin

PROGCOUNT:REG generic map(32) port map(PC,CLK,START ,'0',not START,PCO);

INSTRMEMORYoo : INSTRMEMORY generic map(64,32,32) port map(not start, INSTRMEMORYout, PCO, CLK);
INSTRUCTION31_26 <= INSTRMEMORYout (31 downto 26);
INSTRUCTION25_21 <= INSTRMEMORYout (25 downto 21);
INSTRUCTION20_16 <= INSTRMEMORYout (20 downto 16);
INSTRUCTION15_11 <= INSTRMEMORYout (15 downto 11);
INSTRUCTION15_0  <= INSTRMEMORYout (15 downto 0);
INSTRUCTION5_0   <= INSTRMEMORYout (5  downto 0);
INSTRUCTION25_0  <= INSTRMEMORYout (25 downto 0);

CONTROLUNIT : CU PORT MAP(
         INSTRUCTION31_26,
         RegDst,
         ALUSrc,
         MemtoReg,
			RegWrite,
         MemRead,
         MemWrite,
			Branch,
			notBranch,
         ALUOp1,
         ALUOp0,
			Jump
        );
		  
MUXRT_RD:  MUX generic map(5) PORT MAP (RegDst, INSTRUCTION20_16, INSTRUCTION15_11, INSTRUCTIONRT_RG);--done

REGFILE: RegisterFile PORT MAP(
          INSTRUCTION25_21,
          INSTRUCTION20_16,
          INSTRUCTIONRT_RG,
          RegWrite,
          CLK,
          RFILEWRITEDATA, 
          RFILEOUT1,
          RFILEOUT2
        );

SignExtended: SignExtened PORT MAP (INSTRUCTION15_0, SIGNALEXTENDED32);

MUX2ndout: MUX generic map(32) PORT MAP (ALUSrc, RFILEOUT2, SIGNALEXTENDED32, ALUMASTERINPUT2);-- done

ALUCONTROL00: ALUControl PORT MAP(
			INSTRUCTION5_0,
			ALUOp0,
			ALUOp1,
			ALUMASTEROPR
			);
			
ALUMASTER: ALU PORT MAP(
         RFILEOUT1,
         ALUMASTERINPUT2,
         ALUMASTEROPR,
         '0',
         dataoutALUMASTER,
         cflagALUMASTER,
         zflagALUMASTER,
         oflagALUMASTER
			);
			
DATAMEMORY00 : DATAMEMORY generic map(64,32,32) PORT MAP( 
			not START,
  			RFILEOUT2,
			DATAMEMOUTPUT,
         MemRead,
			MemWrite,
			dataoutALUMASTER,
			CLK
			);


MUXDATAMEM: MUX generic map(32) PORT MAP (MemtoReg, dataoutALUMASTER,  DATAMEMOUTPUT, RFILEWRITEDATA);--done

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


ALUPLUS4PC <= PCO + "00000000000000000000000000000100";


INSTRUCTION25_0SHIFT2 <= INSTRUCTION25_0 & "00"; 	

JUMPADRRESS <= ALUPLUS4PC (31 downto 28) & INSTRUCTION25_0SHIFT2;

ALUSHIFFTED <= SIGNALEXTENDED32 (29 downto 0) & "00";
			
ALU2OUTPUT <= ALUPLUS4PC + ALUSHIFFTED ;

MUX1OPER <= (Branch and zflagALUMASTER ) or (notBranch and not zflagALUMASTER) ;

MUX1: MUX generic map(32) PORT MAP (MUX1OPER, ALUPLUS4PC, ALU2OUTPUT,MUX1OUTPUT);

MUX2: MUX generic map(32) PORT MAP (Jump, MUX1OUTPUT, JUMPADRRESS, PC);


RegFileOut1 <= RFILEOUT1;
RegFileOut2 <= RFILEOUT2;
ALUOut <= dataoutALUMASTER;
PCOut <= PC;
DataMemOut <= DATAMEMOUTPUT;

end Behavioral;