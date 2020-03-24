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

## ex02

Suponha que tem um ficheiro de texto em que as linhas podem ser da seguinte forma:

    a 1
    b
    c 1:2:3
    d 1:2
    e Ze Manel:1:2:3
    d 7:8
    c 4:5:6
    f

Implemente um programa que leia linhas da forma acima e que:

- Para a linha `a N` imprima `Bem Vindo passageiro N`
- Para a linha `b` imprima `OK!`
- Para a linha `c N:M:L` imprima `O Passageiro N esta sentado na fila M, lugar L`
- Para a linha `d N:M` imprima `Ha lugares disponiveis na fila N, lugar M`
- Para a linha `e S:N:M:L` imprima `Bem vindo S. O seu numero identificador eh N e esta sentado na fila M, lugar L`
- A linha `f` termina o programa

Relembramos que estas linhas podem aparecer por qualquer ordem e em qualquer número.
Ao tratar de strings no comando `e` podem assumir que estas não vão ter mais de 80 caracteres.

Se `ficheiro1` for um ficheiro que contém os comandos acima, executando o programa `./processa < ficheiro1` deverá retornar

    Bem Vindo passageiro 1
    OK!
    O Passageiro 1 esta sentado na fila 2, lugar 3
    Ha lugares disponiveis na fila 1, lugar 2
    Bem vindo Ze Manel. O seu numero identificador eh 1 e esta sentado na fila 2, lugar 3
    Ha lugares disponiveis na fila 7, lugar 8
    O Passageiro 4 esta sentado na fila 5, lugar 6

*Dicas:*

- Sugere-se a utilização do comando `switch`
- Para ler o comando `e` poderá usar a função `scanf("%[^:]:%d:%d:%d", arg1, &arg2, &arg3, &arg4);`
