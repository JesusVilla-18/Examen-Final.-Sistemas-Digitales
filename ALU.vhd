LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ALU IS
	PORT(
			A, B 	 	: 	IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			F	  	 	: 	OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ALUsel 	: 	IN 	STD_LOGIC_VECTOR(2 DOWNTO 0)
		 );
	END ALU;

ARCHITECTURE Behav OF ALU IS
BEGIN
	PROCESS(A, B, ALUsel)
	BEGIN
		CASE ALUsel IS
			WHEN "000" => --A
				F <= A;			
			WHEN "001" => --A AND B
				F <= A AND B;
			WHEN "010" => --A OR B
				F <= A OR B;			
			WHEN "011" => --NOT A
				F <= NOT A;			
			WHEN "100" => --A + B
				F <= A + B;			
			WHEN "101" => --A - B
				F <= A - B;			
			WHEN "110" => --A + 1
				F <= A + 1;			
			WHEN "111" => --A - 1
				F <= A -1;			
		END CASE;	
	END PROCESS;

END Behav;




