library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab3_top is port (
   clkin_50		: in	std_logic;
	pb				: in	std_logic_vector(3 downto 0);
 	sw   			: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds			: out std_logic_vector(7 downto 0);	-- for displaying the switch content
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;							-- seg7 digi selectors
	seg7_char2  : out	std_logic							-- seg7 digi selectors
	
); 
end LogicalStep_Lab3_top;

architecture Energy_Monitor of LogicalStep_Lab3_top is
--
-- Components Used
------------------------------------------------------------------- 
	component Compx4 port(A3, B3, A2, B2, A1, B1, A0, B0: in std_logic;
		  AGTB: out std_logic;
		  AEQB: out std_logic;
		  ALTB: out std_logic);
	end component;
------------------------------------------------------------------
	
	
-- Create any signals, or temporary variables to be used
	
signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(7 downto 4);
signal AGTB: std_logic;
signal AEQB: std_logic;
signal ALTB: std_logic;


-- Here the circuit begins

begin
	A <= sw(3 downto 0);
	B <= sw(7 downto 4);
	leds(2 downto 0) <= AGTB & AEQB & ALTB;
	INST1 : Compx4 port map (A(3), B(7), A(2), B(6), A(1), B(5), A(0), B(4), AGTB, AEQB, ALTB);
 
end Energy_Monitor;

