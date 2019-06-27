library IEEE;
use IEEE.std_logic_1164;

entity Compx4 is
	port(A3, B3, A2, B2, A1, B1, A0, B0: in std_logic_vector(3 downto 0);
		  AGTB: out std_logic;
		  AEQB: out std_logic;
		  ALTB: out std_logic);
	end Compx4;

architecture bit4comparator of Compx4 is
	component Compx1 port(
		A, B: in std_logic;
		AGTB: out std_logic;
		AEQB: out std_logic;
		ALTB: out std_logic);
	end component;
	
	signal A3GTB3: std_logic;
	signal A3EQB3: std_logic;
	signal A3LTB3: std_logic;
	signal A2GTB2: std_logic;
	signal A2EQB2: std_logic;
	signal A2LTB2: std_logic;
	signal A1GTB1: std_logic;
	signal A1EQB1: std_logic;
	signal A1LTB1: std_logic;
	signal A0GTB0: std_logic;
	signal A0EQB0: std_logic;
	signal A0LTB0: std_logic;

begin
	
	AGTB <= A3GTB3 OR A2GTB2 OR A1GTB1 OR A0GTB0;
	AEQB <= A3EQB3 AND A2EQB2 AND A1EQB1 AND A0EQB0;
	ALTB <= A3LTB3 OR A2LTB2 OR A1LTB1 OR A0LTB0;

	INST1: Compx1 port map(A3, B3, A3GTB3, A3EQB3, A3LTB3);
	INST2: Compx1 port map(A2, B2, A2GTB2, A2EQB2, A2LTB2);
	INST3: Compx1 port map(A1, B1, A1GTB1, A1EQB1, A1LTB1);
	INST4: Compx1 port map(A0, B0, A0GTB0, A0EQB0, A0LTB0);
	
	
			