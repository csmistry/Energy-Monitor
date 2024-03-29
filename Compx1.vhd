library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compx1 is
	Port(A: in std_logic;
		  B: in std_logic;
		  AGTB: out std_logic;
		  AEQB: out std_logic;
		  ALTB: out std_logic);
	end Compx1;
	
architecture dataflow of Compx1 is
begin
	AGTB <= (A AND (NOT B));
	ALTB <= ((NOT A) AND B);
	AEQB <= A XNOR B;
end architecture dataflow;