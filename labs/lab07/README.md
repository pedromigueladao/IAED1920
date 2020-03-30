# Algoritmos de Ordenação

## Ex 1

Considere o vector `v = <6, 3, 4, 2, 5, 1>`. Indique o conteúdo de `v` no final de cada passo dos algoritmos

- insertion sort
- selection sort

## Ex 2

Considere o vector `v = <12, 2, 18, 15, 16, -1, 35, 30, 15>`.

Será possível o vector `<-1, 2, 12, 15, 18, 15, 16, 30, 35>` corresponder ao conteúdo de `v` num passo intermédio da aplicação dos algoritmos

- insertion sort
- selection sort, ou
- merge sort

Se não puder, indique as razões.

## Ex 3

Considere a aplicação do algoritmo bubblesort ao vector `v=<20, 11, 16, 9, 12, 14, 17, 19, 13, 15>`. Supondo que o algoritmo percorre o vector da esquerda para a direita em cada iteração, qual o conteúdo do vector após as duas primeiras iterações do algoritmo bubblesort?

## Ex 4

Considere a implementação clássica da função `int partition (Item v[], int l, int r)` usada no algoritmo quicksort tal como apresentada nas aulas teóricas. Esta função recebe o vector `v` e as posições `left` e `right` que definem, respectivamente, os índices limite esquerdo e direito do vector a considerar na função. Suponha que o procedimento partition é invocado com os seguintes argumentos: `v = <13, 6, 5, 14, 12, 4, 16, 18, 7, 9, 10>`, `left = 0`, `right = 10`.  Considerando a posição `a[r]` como pivot, indique qual o conteúdo do vector `v` após a execução da função `partition`.

## Ex 5

Considere o exercício anterior, mas onde os argumentos da função `partition` são os seguintes: `v =<20, 11, 16, 9, 12, 14, 17, 19, 13, 15>`, `left = 0` , `right = 9`. Qual o conteúdo do vector `v` após a execução do procedimento `partition`?
