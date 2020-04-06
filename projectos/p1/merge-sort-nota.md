*ANÚNCIO RELEVANTE PARA QUEM ESTÁ A USAR MERGE SORT*

Caros alunos,

Acabámos de detectar que o algoritmo `mergeSort` que se encontra nos slides tem
um corner case que o torna instável. Pedimos desde já desculpas a todos os
alunos que têm batalhado com este problema.  A solução é simples e passa por
trocar a linha `if` do `merge` para `if (less(aux[j], aux[i]) || i > m)`

A função `merge` CORRIGIDA encontra-se abaixo

    void merge(Item a[], int left, int m, int right)
    { 
      int i, j, k;
      for (i = m+1; i > left; i--) 
        aux[i-1] = a[i-1];
      for (j = m; j < right; j++)
        aux[right+m-j] = a[j+1];
      for (k = left; k <= right; k++)
        if (less(aux[j], aux[i]) || i > m)
          a[k] = aux[j--];
        else
          a[k] = aux[i++];
    }

Pedimos de novo desculpa por este lapso.
O corpo docente de IAED
