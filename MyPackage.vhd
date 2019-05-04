library IEEE;
use IEEE.STD_LOGIC_1164.all;
package MyPackage is

Component DEC32 is
    Port ( sel : in  STD_LOGIC_VECTOR (4 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component MUX IS
	GENERIC (
		N : INTEGER := 32
	);
	PORT (
		mux_ctl  : IN STD_logic;
		mux_in0  : IN std_logic_vector(N - 1 DOWNTO 0);
		mux_in1  : IN std_logic_vector(N - 1 DOWNTO 0);
		mux_out  : OUT STD_logic_vector(N - 1 DOWNTO 0)
	);
END Component;

Component REG is
Generic(n:NATURAL :=4);
PORT(
I:IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
CLK,LuD,INC,CLR :IN STD_LOGIC;
O:OUT STD_LOGIC_VECTOR(n-1 downto 0) );
END Component;

Component MUX32 is
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
end Component;

COMPONENT mux4x1 is
  port(
    sw : in std_logic_vector(1 downto 0);
    x : in std_logic_vector(3 downto 0);
    y : out std_logic
  );
end COMPONENT;

COMPONENT mux2x1 is
  port(
    sel : in std_logic;
    a : in std_logic;
    b : in std_logic;
	 o : out std_logic
  );
end COMPONENT;

COMPONENT bits5mux2x1 is
port(
		sw: in std_logic;
		input1: in std_logic_vector(4 downto 0);
		input2: in std_logic_vector(4 downto 0);
		output: out std_logic_vector(4 downto 0)
);
end COMPONENT;

COMPONENT bits32mux2x1 is
port(
		sw: in std_logic;
		input1: in std_logic_vector(31 downto 0);
		input2: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
);
end COMPONENT;

COMPONENT fadder is
  port(
    a, b ,cin: in std_logic;
    s, cout : out std_logic
  );
end COMPONENT;

COMPONENT bit1ALU is
     Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           oper : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC;
           cout : out  STD_LOGIC;
			  less : in  STD_LOGIC;
			  set : out  STD_LOGIC);
end COMPONENT;

COMPONENT ALU is
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
end COMPONENT;

COMPONENT RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT CU is
PORT(
         Op : IN  std_logic_vector(5 downto 0);
         
         RegDst : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         MemtoReg : OUT  std_logic;
			RegWrite : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
			Branch : OUT  std_logic;
			notBranch : OUT std_logic;
         ALUOp1 : OUT  std_logic;
         ALUOp0 : OUT  std_logic;
			Jump : OUT std_logic
        );
end COMPONENT ;

COMPONENT ALUControl is
port(
			fn: in std_logic_vector (5 downto 0);
			ALUopt0: in std_logic;
			ALUopt1: in std_logic;
			output: out std_logic_vector (3 downto 0)
);
end COMPONENT;

COMPONENT DATAMEMORY is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt: in STD_LOGIC;
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
			CLK       : in STD_LOGIC
			);
end COMPONENT;

COMPONENT INSTRMEMORY is
	Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port(
    LoadIt: in Std_logic ;
	 DATA: out STD_LOGIC_VECTOR(wordsize-1 downto 0);
    ADDRESS: in STD_LOGIC_VECTOR(addresssize-1 downto 0);
    CLK: in STD_LOGIC
    );
end COMPONENT;


COMPONENT SignExtened is
    Port ( input : in  STD_LOGIC_VECTOR(15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

end MyPackage;
package body MyPackage is

end MyPackage;
