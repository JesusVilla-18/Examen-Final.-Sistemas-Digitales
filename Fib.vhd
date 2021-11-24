LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.circuits_package.all;

ENTITY Fib IS
	PORT (
			D				:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			CLK, Resetn		:	IN 	STD_LOGIC;
			Output			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
END Fib;

ARCHITECTURE Behav OF Fib IS
	SIGNAL IE, WE, RAE, RBE, OE, State	:	STD_LOGIC;
	SIGNAL WA, RAA, RBA, SH					:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL ALUsel								:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL OMux, PA, PB, OAlu, OShift	:	STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
	mux_u: mux2x1_8 PORT MAP (OShift, D, IE, OMux);
	reg_u: reg_file PORT MAP (CLK, WE, WA, OMux, RAE, RBE, RAA, RBA, PA, PB);
	alu_u: ALU PORT MAP (PA, PB, OAlu, ALUsel);
	shf_u: shifter PORT MAP (SH, OAlu, OShift);
	tri_u: tristate PORT MAP (OShift, Output, OE);
	con_u: ucontrolFib PORT MAP (CLK, Resetn, State, IE, WE, RAE, RBE, OE, WA, RAA, RBA, SH, ALUsel);
	
	State <= '0' WHEN OShift>2 ELSE '1'; 
END Behav;