## ex01 (8 rainhas) - facultativo 

O problema das 8 rainhas pede para colocar 8 rainhas num tabuleiro de xadrez
(8x8) de uma forma que nenhuma das rainhas seja atacada por outra.  Implemente
um programa que calcule o número das soluções desse problema.  Relembramos que
as rainhas se podem deslocar ao longo de linhas, colunas e diagonais.

Como já sabemos que só pode existir 1 rainha numa linha, cada solução
potencial pode ser representada por 8 números, N0, .., N7, onde o número Ni
representa a coluna da rainha na linha i. Cada um dos números Ni só pode ter 8 valores (0..7).
Isto quer dizer que os números Ni podem ser representados por 3 bits e uma
solução potencial por 24 bits.

Por exemplo, o número 000 001 010 011 100 101 110 111 (binário), representa uma configuração
das rainhas na diagonal.

Para contar o número das soluções devem percorrer os números entre 0 e max,
onde o max pode ser obtido em C como (1<<24) - 1.  Reparem que o max representa
uma configuração onde todas as rainhas ficam na última coluna.
Para cada configuração assim obtida verificar se é ou não uma solução do problema.

Não há testes automáticos para este exercício. Existem 92 soluções para
tabuleiro de 8x8 e 2 soluções para tabuleiro de 4x4.

__Dica.__  Podem usar a biblioteca `stdint.h` para usar o tipo `uint32_t`
que garante inteiros de 32 bits. 

    #include<stdint.h>
    typedef uint32_t T;

__Dica.__  Definem uma função `int P(T c, int row)` que devolve a coluna da
dama na linha `row`. Esta pode ser usada da maneira seguinte para imprimir uma
configuração.

    #define DIM_LOG 3
    #define DIM (1<<DIM_LOG)
    void print(T c) {
        int col, row;
        for (row = 0; row < DIM; row++)  {
            const int ix = P(c, row);
            for (col = 0; col < DIM; col++)
                printf("|%c", ix == col  ? '*' : ' ');
            printf("|\n");
        }
    }
