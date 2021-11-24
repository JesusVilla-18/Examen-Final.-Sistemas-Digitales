LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tristate IS
	PORT(
			X 	: 	IN 	STD_LOGIC_VECTOR(7 DOWNTO 0); --entrada de datos
			F 	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0); 	--salida de datos
			OE	:	IN		STD_LOGIC 										--output enable
																								--OE='0': F=Z,   (Z.-Alta impedancia)
																								--OE='1': F=X
	    );
END tristate;

ARCHITECTURE Behav OF tristate IS
BEGIN
	F <= (OTHERS => 'Z') WHEN OE='0' ELSE
	     (X);
END Behav;




