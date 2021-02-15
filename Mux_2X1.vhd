library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_2X1 is port
(
	Carry_OutAdder, Carry_OutSub: in std_logic; 
	s: in std_logic_vector(2 downto 0);	
	Q: out std_logic
);
end Mux_2X1;

architecture hardware of Mux_2X1 is
	begin
		with s select
					Q <= Carry_OutAdder when "000",			
						  Carry_OutSub when "001",
						  '0' when others;
					
end hardware; 