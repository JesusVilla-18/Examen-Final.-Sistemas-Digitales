LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE circuits_package IS

COMPONENT mux2x1_8 
	PORT( 
			I0, I1		:		IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
			S				:		IN		STD_LOGIC;
			Y				:		OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0)
	    );	
END COMPONENT;

COMPONENT ALU
	PORT(
		A, B 	 	: 	IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
		F	  	 	: 	OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0);
		ALUsel 	: 	IN 	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 );
END COMPONENT;

COMPONENT reg_file
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

END COMPONENT;

COMPONENT shifter IS
	PORT(
		Sel	:	IN		STD_LOGIC_VECTOR (1 DOWNTO 0);
		I		:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
		O		:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tristate
	PORT(
			X 	: 	IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			F 	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			OE	:	IN		STD_LOGIC
	    );
END COMPONENT;

COMPONENT ucontrolFib
	PORT(
			CLK, Resetn, State    		:		IN		STD_LOGIC;
			sIE, sWE, sRAE, sRBE, sOE	:		OUT	STD_LOGIC;
			sWA, sRAA, sRBA, sSH			:		OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			sALUsel							:		OUT	STD_LOGIC_VECTOR(2 DOWNTO 0)		
		 );
END COMPONENT;

END circuits_package;