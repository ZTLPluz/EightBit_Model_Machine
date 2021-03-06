LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
ENTITY DR IS 
PORT( 
	DATA_IN:IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	IDR:IN STD_LOGIC; 
	EDR:IN STD_LOGIC; 
	CLK:IN STD_LOGIC; 
	DATA_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0) ); 
END DR; 
ARCHITECTURE DR_arch OF DR IS 
SIGNAL REGQ:STD_LOGIC_VECTOR(7 DOWNTO 0); --中间信号
BEGIN 
	PROCESS(CLK,IDR,EDR,DATA_IN) 
	BEGIN 
	IF(rising_edge(CLK)) THEN 
		IF(IDR='1') THEN 
			REGQ<=DATA_IN; 
		END IF; 
	END IF; 
	END PROCESS; 
	DATA_OUT<=REGQ WHEN EDR='0' ELSE "ZZZZZZZZ"; 
END DR_arch;