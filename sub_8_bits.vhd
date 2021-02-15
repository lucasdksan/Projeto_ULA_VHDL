library IEEE;
use IEEE.std_logic_1164.all;

entity sub_8_bits is port
(
	X,Y: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0);
	cout: out std_logic
);
end sub_8_bits;

architecture hardware of sub_8_bits is
	signal CompA2_Out: std_logic_vector(7 downto 0);
	component complementoA2
		port(
			D: in std_logic_vector(7 downto 0);	
			K: out std_logic_vector(7 downto 0)	
		);
	end component;
	component adder_8_bits
		port(
			X,Y: in  std_logic_vector(7 downto 0);
			ci: in std_logic;
			Q: out std_logic_vector(7 downto 0);
			cout: out std_logic 	
		);
	end component;
	begin
		CompA2: complementoA2 PORT MAP( Y, CompA2_Out );
		Adder: adder_8_bits PORT MAP( X, CompA2_Out, '0', Q, cout );
end hardware;