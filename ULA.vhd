--
--		Projeto ULA
--

library IEEE;
use IEEE.std_logic_1164.all;

entity ULA is port
(
	B,C: in std_logic_vector(7 downto 0);									-- Entradas da ULA
	S_full: in std_logic_vector(2 downto 0);								-- Sinais para selecionar a operação
	Q: out std_logic_vector(7 downto 0);									-- Saída da ULA
	Carry_Out: out std_logic													-- Sinal Carry_Out
);
end ULA;

architecture hardware of ULA is
	signal Out_sum, Out_and, Out_or, Out_not, Out_xor, Out_sub, Out_comp: std_logic_vector(7 downto 0);		-- Sinais Auxiliares que armazenam as saídas de cada operação.
	signal Carry_Out_adder, Carry_Out_sub: std_logic;
	component Mux_8X1
		port(
			Adder_Out, Sub_Out, And_Out, Or_Out, Not_Out, Xor_Out, Cmp_Out: in std_logic_vector(7 downto 0);
			s: in std_logic_vector(2 downto 0);
			Q: out std_logic_vector(7 downto 0)		
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
	component sub_8_bits 
		port(
			X,Y: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0);
			cout: out std_logic
		);
	end component;
	component And_8_bits
		port(
			X,Y: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	component Or_8_bits
		port(
			X,Y: in std_logic_vector(7 downto 0); 
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	component Not_8_bits
		port(
			X: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	component Xor_8_bits
		port(
			X,Y: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	component comparador8bit
		port(
			X_CMP, Y_CMP: in std_logic_vector(7 downto 0);
			eq_comparador: out std_logic_vector(7 downto 0)
		);
	end component;
	component Mux_2X1 
		port(
			Carry_OutAdder, Carry_OutSub: in std_logic; 
			s: in std_logic_vector(2 downto 0);	
			Q: out std_logic
		);
	end component;
	begin
		x0: adder_8_bits PORT MAP(B, C, '0', Out_sum, Carry_Out_adder);
		x1: And_8_bits PORT MAP(B, C, Out_and);
		x2: Or_8_bits PORT MAP(B, C, Out_or);
		x3: Xor_8_bits PORT MAP(B, C, Out_xor);
		x4: Not_8_bits PORT MAP(C, Out_not);
		x5: sub_8_bits PORT MAP(B, C, Out_sub,	Carry_Out_sub);
		x6: comparador8bit PORT MAP(B, C, Out_comp);
		x7: Mux_8X1 PORT MAP(Out_sum, Out_sub, Out_and, Out_or, Out_not, Out_xor, Out_comp, S_full, Q);
		x8: Mux_2X1 PORT MAP(Carry_Out_adder, Carry_Out_sub, S_full, Carry_Out);
end hardware;