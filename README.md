# Projeto ULA (Unidade Lógica Aritmética).

## Esse projeto foca em uma ULA que possui duas entradas de dados de 8 bits e uma saída de 8.

## Resumindo: A ULA executa as principais operações lógicas e aritméticas do computador. Ela soma, subtrai, divide, determina se um número é positivo ou negativo ou se é zero. Além de executar funções aritméticas, uma ULA deve ser capaz de determinar se uma quantidade é menor ou maior que outra e quando quantidades são iguais. A ULA pode executar funções lógicas com letras e com números.

## As funções que ela reproduz são Soma, subtração, AND, OR, NOT, XOR, Comparação. 
## Para produzir esse projeto foi utilizado VHDL.
## No arquivo ULA.vhdl é possível observar toda a arquitetura do projeto. A entidade possui duas entradas B e C de 8 bits, uma entrada S_full de 3 bits, uma saída Q de 8 bits e uma saída Carry_Out de 1 bit.

## As estradas B e C são os dados que serão processados dentro da ULA.
## As entradas S_full são os sinais que irão alimentar as entradas de seleção MUX. Eles são responsáveis por selecionar qual operação sairá da ULA.
## A saída Q é o resultado da operação, é a mesma saída do Mux mencionada acima.
## A saída Carry_Out é o bit relacionado a função de adição.

## Na arquitetura é possível perceber os sinais usados para armazenar as informações que vêm diretamente das operações. O projeto foi dividido em relação às funcionalidades do sistema, portanto, para cada operação aritmética e lógica existe um arquivo em vhdl. O componente MUX_8X_1 é um mux que seleciona qual operação a ALU executará. Os componentes adder_8_bits, sub_8_bits, And_8_bits, Or_8_bits, Not_8_bits, Xor_8_bits e comparator8bits são responsáveis por executar as operações dadas as informações. O componente Mux_2X1 é responsável por selecionar qual Carry sairá da ULA.

## A implementação do somador de 8 bits foi baseada na estrutura física de um IC. Em outras palavras. Portas lógicas foram utilizadas em sua estrutura, somando "bit a bit" na base das portas lógicas XOR, AND e OR.
## A lógica do subtrator vem do princípio do complemento para 2. onde os dados passarão por uma porta lógica NOT e então somarão 1. Em seguida, ele usa um somador de 8 bits para realmente subtrair os números. Por isso na sua estrutura ele usa os componentes complementA2 e adder_8_bits.

## As funções AND, OR, NOT e XOR executam a porta lógica respectivamente.
## A função comparador8bits, faz uma comparação bit a bit dos dados de entrada e retorna as posições que são iguais. Por exemplo, B = 10001111 e C = 11111010 Saída = 10001010.