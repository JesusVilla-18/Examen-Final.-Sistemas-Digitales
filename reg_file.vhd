LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY reg_file IS
	PORT(
			CLK		:	IN		STD_LOGIC;
			WE			:	IN		STD_LOGIC; --write enambe 
			WA			:	IN		STD_LOGIC_VECTOR (1 DOWNTO 0); --write adress
			D			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0); --port input
			RAE, RBE	:	IN		STD_LOGIC; --read enable ports A&B
			RAA, RBA	:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0); --read adress port A&B
			PORTA		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0); --output port A
			PORTB		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0) --output port B
	);
END reg_file;

ARCHITECTURE Behav OF reg_file IS
	SUBTYPE reg IS STD_LOGIC_VECTOR(7 DOWNTO 0); --definición de un registro de 8 bits
	TYPE	regArray IS array(0 TO 3) OF reg;
	SIGNAL RF	:	regArray; --Register File
BEGIN
	Writeprocess: PROCESS(CLK)
	BEGIN
		IF (CLK'Event AND CLK='1')THEN
			IF (WE = '1')THEN
				RF (CONV_INTEGER(WA)) <= D;
			END IF;
		END IF;
	END PROCESS Writeprocess;
	
	ReadPortA : PROCESS(RAA, RAE, RF)
	BEGIN
		IF (RAE = '1') THEN
			PortA <= RF(CONV_INTEGER(RAA));
		ELSE
			PortA <= (OTHERS => '0');
		END IF;
	END PROCESS ReadPortA;
	
		ReadPortB : PROCESS(RBA, RBE, RF)
	BEGIN
		IF (RBE = '1') THEN
			PortB <= RF(CONV_INTEGER(RBA));
		ELSE
			PortB <= (OTHERS => '0');
		END IF;
	END PROCESS ReadPortB;
END Behav;