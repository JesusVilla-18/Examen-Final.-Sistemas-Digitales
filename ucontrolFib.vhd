LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ucontrolFib IS
PORT(
		CLK, Resetn, State    		:		IN		STD_LOGIC;
		sIE, sWE, sRAE, sRBE, sOE	:		OUT	STD_LOGIC;
		sWA, sRAA, sRBA, sSH			:		OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		sALUsel							:		OUT	STD_LOGIC_VECTOR(2 DOWNTO 0)		
    );
END ucontrolFib;

ARCHITECTURE Behav OF ucontrolFib IS
	TYPE State_Type IS (E0, E1, E2, E3, E4, E5, E6);
	SIGNAL yP, yN	: State_Type;
	SIGNAL cont : STD_LOGIC;
BEGIN
	PROCESS(yP, State, cont, yN)
	BEGIN
		CASE yP IS
			WHEN E0=>
				yN <= E1;		
			WHEN E1=> 
				yN <= E2;		
			WHEN E2=> 
    			yN <= E3;
			WHEN E3=> 
				yN <= E4;
			WHEN E4 =>
				IF State = '0' THEN
					IF cont = '0' THEN
						yN <= E5;
					ELSE
						yN <= E3;
					END IF;
				ELSE
					yN <= E6;
				END IF;
			WHEN E5=>
				yN <= E4;
			WHEN E6=> 
				yN <= E6;
		END CASE;	
	END PROCESS;
	
	PROCESS (yP, cont, CLK)
	BEGIN
		IF (CLK'Event AND CLK='1') THEN
			IF yP=E3 THEN 
				cont <= '0';
			ELSIF yP=E5 THEN 
				cont <= '1';
			ELSE
				cont <= '-';
			END IF;
		END IF;
	END PROCESS;
		
	PROCESS(CLK, Resetn)
	BEGIN	
		IF Resetn='0' THEN
			yP <= E0;
		ELSIF (CLK'Event AND CLK='1') THEN
			yP <= yN;
		END IF;	
	END PROCESS;
	
	PROCESS(yP)
	BEGIN
		CASE yP IS
			WHEN E0 =>
				sIE <= '1';
				sWE <= '1';
				sWA <= "11";
				sRAE <= '0';
				sRAA <= "--";
				sRBE <= '0';
				sRBA <= "--";
				sALUsel <= "---";
				sSH <= "--";
				sOE <= '0';
			WHEN E1 =>
				sIE <= '0';
				sWE <= '1';
				sWA <= "00";
				sRAE <= '1';
				sRAA <= "00";
				sRBE <= '1';
				sRBA <= "00";
				sALUsel <= "101";
				sSH <= "00";
				sOE <= '1';
			WHEN E2 =>
				sIE <= '0';
				sWE <= '1';
				sWA <= "01";
				sRAE <= '1';
				sRAA <= "01";
				sRBE <= '0';
				sRBA <= "--";
				sALUsel <= "110";
				sSH <= "00";
				sOE <= '1';
			WHEN E3 =>
				sIE <= '0';
				sWE <= '1';
				sWA <= "00";
				sRAE <= '1';
				sRAA <= "00";
				sRBE <= '1';
				sRBA <= "01";
				sALUsel <= "100";
				sSH <= "00";
				sOE <= '1';
			WHEN E4 =>
				sIE <= '0';
				sWE <= '1';
				sWA <= "11";
				sRAE <= '1';
				sRAA <= "11";
				sRBE <= '0';
				sRBA <= "--";
				sALUsel <= "111";
				sSH <= "00";
				sOE <= '0';
			WHEN E5 =>
				sIE <= '0';
				sWE <= '1';
				sWA <= "01";
				sRAE <= '1';
				sRAA <= "00";
				sRBE <= '1';
				sRBA <= "01";
				sALUsel <= "100";
				sSH <= "00";
				sOE <= '1';
			WHEN E6 =>
				sIE <= '-';
				sWE <= '0';
				sWA <= "--";
				sRAE <= '0';
				sRAA <= "--";
				sRBE <= '0';
				sRBA <= "--";
				sALUsel <= "---";
				sSH <= "--";
				sOE <= '0';
		END CASE;
	END PROCESS;
END Behav;