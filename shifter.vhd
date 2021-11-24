LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifter IS
	PORT(
		Sel	:	IN		STD_LOGIC_VECTOR (1 DOWNTO 0);
		I		:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
		O		:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END shifter;

ARCHITECTURE FuncLogic OF shifter IS
BEGIN
	PROCESS(Sel, I)
	BEGIN
		CASE Sel IS
			WHEN "00" =>
				O <= I;			
			WHEN "01" =>
				O <= (I(6), I(5), I(4), I(3), I(2), I(1), I(0), '0');
			WHEN "10" =>
				O <= ('0', I(7), I(6), I(5), I(4), I(3), I(2), I(1));			
			WHEN "11" =>
				O <= (I(0), I(7), I(6), I(5), I(4), I(3), I(2), I(1));
		END CASE;	
	END PROCESS; 
END FuncLogic;