library IEEE;
use IEEE.std_logic_1164.all;

entity comparador8bit is port
(
	X_CMP, Y_CMP: in std_logic_vector(7 downto 0);
   eq_comparador: out std_logic_vector(7 downto 0)
);
end comparador8bit;
    
architecture hardware of comparador8bit is
	signal out_xnor: std_logic_vector(7 downto 0);
	begin
		out_xnor(0) <= Y_CMP(0) xnor X_CMP(0);
		out_xnor(1) <= X_CMP(1) xnor X_CMP(1);
		out_xnor(2) <= Y_CMP(2) xnor X_CMP(2);
		out_xnor(3) <= Y_CMP(3) xnor X_CMP(3);
		out_xnor(4) <= Y_CMP(4) xnor X_CMP(4);
		out_xnor(5) <= Y_CMP(5) xnor X_CMP(5);
		out_xnor(6) <= Y_CMP(6) xnor X_CMP(6);
		out_xnor(7) <= Y_CMP(7) xnor X_CMP(7);
		eq_comparador <= out_xnor;  
end hardware; 