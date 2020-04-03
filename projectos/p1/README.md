# Enunciado do Projecto 1 - IAED 2019/20

## Data de entrega: 7 de Abril de 2020, às 23h59m (23h59m)

## LOG alterações

- 31Mar2020 - Mooshak aberto. Ver informações na Secção Projecto na página da cadeira. Relembramos que não podem usar a função `qsort` nativa do C e que esta string não deverá aparecer no vosso código.
- 24Mar2020 - Clarifica comando `r`

## 1. Introdução

O objectivo deste projeto é o desenvolvimento, em linguagem C, de um sistema de logística. A interacção com o programa deverá ocorrer através de um conjunto de linhas compostas por uma letra (comando) e um número de argumentos dependente do comando a executar. Os possíveis comandos são listados na Tabela seguinte e indicam as operações a executar.

| Comando | Acção |
|:---:|:---|
| __a__ | adiciona um novo produto ao sistema |
| __q__ | adiciona stock a um produto existente no sistema |
| __N__ | cria uma nova encomenda |
| __A__ | adiciona um produto a uma encomenda |
| __r__ | remove stock a um produto existente |
| __R__ | remove um produto de uma encomenda |
| __C__ | calcula o custo de uma encomenda |
| __p__ | altera o preço de um produto existente no sistema |
| __E__ | retorna a descrição e a quantidade de um produto numa dada encomenda |
| __m__ | retorna o identificador da encomenda em que um dado produto ocorre mais vezes |
| __l__ | lista todos os produtos existentes no sistema por ordem crescente de preço |
| __L__ | lista todos os produtos de uma encomenda por ordem alfabética da descrição |
| __x__ | termina o programa |

## 2. Especificação do problema

O objectivo do projecto é ter um sistema de logística que permite gerir stocks de produtos e encomendas.

Existem vários produtos que podem ser adicionados às encomendas.

Cada __produto__ é caracterizado por:

* um identificador (um número inteiro no intervalo [0, 9 999])
* uma descrição (uma string não vazia com um máximo de 63 caracteres)
* o seu preço (um número inteiro maior que 0)
* o seu peso (um número inteiro maior que 0)
* a sua quantidade em stock (um número inteiro maior ou igual a 0)

Uma __encomenda__ é um conjunto de produtos.

As restrições ao problema são as seguintes:

* Os identificadores dos produtos são únicos.
* Pode assumir que existirão no máximo 10 000 produtos diferentes.
* Os produtos são numerados de 0 a 9 999 e sequencialmente pela sua ordem de introdução.
* Pode assumir que todos os produtos criados com o comando `a` serão distintos.
* Pode assumir que existirão no máximo 500 encomendas
* As encomendas são numeradas de 0 a 499 e sequencialmente pela sua ordem de introdução.
* Cada encomenda poderá pesar no máximo 200 unidades de peso.
* Só podem ser adicionados a encomendas produtos que existam em stock na quantidade necessária.

Pode assumir que todo o input fornecido respeitará os tipos indicados. Por exemplo, nunca será adicionado um produto cujo preço seja uma string, um valor negativo, nem zero.

## 3. Dados de Entrada

O programa deverá ler os dados de entrada a partir da linha de comandos e do terminal.

Durante a execução do programa as instruções devem ser lidas do terminal (standard input) na forma de um conjunto de linhas iniciadas por um carácter, que se passa a designar por comando, seguido de um número de informações dependente do comando a executar; o comando e cada uma das informações são separados pelo caracter `':'`.

Os comandos disponíveis são descritos de seguida. Cada comando indica uma determinada acção que se passa a caracterizar em termos de formato de entrada, formato de saída, e erros a retornar. Se o comando gerar mais do que um erro, deverá ser indicado apenas o primeiro.

* __a__ - adiciona um novo produto ao sistema
  * Formato de entrada: `a descricao:preco:peso:qtd`
  * Formato de saída: `Novo produto <idp>.` onde `<idp>` é o identificador do produto criado.
* __q__ - adiciona stock a um produto existente no sistema
  * Formato de entrada: `q idp:qtd`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Impossivel adicionar produto <idp> ao stock. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
* __N__ - cria uma nova encomenda
  * Formato de entrada: `N`
  * Formato de saída: `Nova encomenda <ide>.` onde `<ide>` é o identificador da encomenda criada.
* __A__ - adiciona um produto a uma encomenda. Se o produto já existir na encomenda, adiciona a nova quantidade à quantidade existente
  * Formato de entrada: `A ide:idp:qtd`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Impossivel adicionar produto <idp> a encomenda <ide>. Encomenda inexistente.` no caso de não existir nenhuma encomenda criada com esse identificador
    * `Impossivel adicionar produto <idp> a encomenda <ide>. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
    * `Impossivel adicionar produto <idp> a encomenda <ide>. Quantidade em stock insuficiente.` no caso de não existir stock suficiente desse produto para satisfazer a encomenda
    * `Impossivel adicionar produto <idp> a encomenda <ide>. Peso da encomenda excede o maximo de 200.` no caso de a adição desse produto exceder o peso máximo permitido por encomenda
* __r__ - remove stock a um produto existente
  * Formato de entrada: `r idp:qtd`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Impossivel remover stock do produto <idp>. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
    * `Impossivel remover <qtd> unidades do produto <idp> do stock. Quantidade insuficiente.` no caso de a quantidade de stock restante após a remoção ser negativa
* __R__ - remove um produto de uma encomenda
  * Formato de entrada: `R ide:idp`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Impossivel remover produto <idp> a encomenda <ide>. Encomenda inexistente.` no caso de não existir nenhuma encomenda criada com esse identificador
    * `Impossivel remover produto <idp> a encomenda <ide>. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
* __C__ - calcula o custo de uma encomenda
  * Formato de entrada: `C ide`
  * Formato de saída: `Custo da encomenda <ide> <total>.` onde `<total>` é o valor total da encomenda `<ide>`
  * Erros:
    * `Impossivel calcular custo da encomenda <ide>. Encomenda inexistente.` no caso de não existir nenhuma encomenda criada com esse identificador
* __p__ - altera o preço de um produto existente no sistema
  * Formato de entrada: `p idp:preco`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Impossivel alterar preco do produto <idp>. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
* __E__ - lista a descrição e a quantidade de um produto numa encomenda
  * Formato de entrada: `E ide:idp`
  * Formato de saída: `<desc> <qtd>.` onde `<desc>` é a descrição do produto `<idp>` e `<qtd>` é a quantidade desse produto na encomenda `<ide>`
  * Erros:
    * `Impossivel listar encomenda <ide>. Encomenda inexistente.` no caso de não existir nenhuma encomenda criada com esse identificador
    * `Impossivel listar produto <idp>. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
* __m__ - lista o identificador da encomenda em que o produto dado ocorre mais vezes. Se houver 2 ou mais encomendas nessa situação, deverá imprimir a encomenda de menor `id`.
  * Formato de entrada: `m idp`
  * Formato de saída:
    * `Maximo produto <idp> <ide> <qtd>.` onde `<ide>` é o número da encomenda em que `<idp>` ocorre mais vezes, sendo essa quantidade `<qtd>`
    * Não deverá listar nada caso o produto `<idp>` não ocorra em nenhuma encomenda, ou caso não haja encomendas
  * Erros:
    * `Impossivel listar maximo do produto <idp>. Produto inexistente.` no caso de não existir nenhum produto criado com esse identificador
* __l__ - lista todos os produtos existentes no sistema por ordem crescente de preço. Se houver 2 ou mais produtos com o mesmo preço, deverá imprimir esses por ordem crescente de `id` de produto
  * Formato de entrada: `l`
  * Formato de saída: Um bloco no formato abaixo, e em que os produtos são listados por ordem crescente de preço

        Produtos
        * <desc1> <preco1> <qtd1 em stock>
        * <desc2> <preco2> <qtd2 em stock>
        ...
        * <descn> <precon> <qtdn em stock>
  * Erros: Não aplicável
* __L__ - lista todos os produtos de uma encomenda por ordem alfabética da descrição
  * Formato de entrada: `L <ide>`
  * Formato de saída: Um bloco no formato abaixo, e em que os produtos são listados por ordem alfabética de descrição

        Encomenda <ide>
        * <desc1> <preco1> <qtd1 na ide>
        * <desc2> <preco2> <qtd2 na ide>
        ...
        * <descn> <precon> <qtdn na ide>
  * Erros:
    * `Impossivel listar encomenda <ide>. Encomenda inexistente.` no caso de não existir nenhuma encomenda criada com esse identificador
* __x__ - termina o programa
  * Formato de entrada: `x`
  * Formato de saída: NADA

## 4. Dados de Saída

O programa deverá escrever no standard output as respostas aos comandos apresentados no standard input. As respostas são igualmente linhas de texto formatadas conforme definido anteriormente neste enunciado. Tenha em atenção ao número de espaços entre elementos do seu output, assim como a ausência de espaços e os pontos finais no final de cada linha. Procure respeitar escrupulosamente as indicações dadas.

## 5. Exemplos (Input/Output)

Ver os exemplos de input e respectivos output na pasta `testes_enunciado/`.

Foram disponiblizados novos exemplos de input e respectivos output na pasta `testes_publicos/`. Para uma maior facilidade de debug os produtos criados com o comando `a` nestes exemplos têm como sufixo o seu `idp`, ie, a sua descrição é `string-aleatoria-idp` onde `idp` é o seu identificador. __NOTAR que as descrições dos produtos nos testes avaliados no Mooshak não terão este formato. Este é só para facilitar o debug durante o desenvolvimento.__

Existem ainda outros 4 exemplos que pelo seu tamanho encontram-se disponíveis [aqui](https://fenix.tecnico.ulisboa.pt/downloadFile/845043405518428/testes-publicos.zip).

## 6. Compilação do Programa

O compilador a utilizar é o `gcc` com as seguintes opções de compilação: `-Wall -Wextra -Werror -ansi -pedantic`. Para compilar o programa deve executar o seguinte comando:

    $ gcc -Wall -Wextra -Werror -ansi -pedantic -o proj1 *.c

Este comando deve ter como resultado a geração do ficheiro executável `proj1`, caso não haja erros de compilação. __A execução deste comando não deverá escrever qualquer resultado no terminal. Caso a execução deste comando escreva algum resultado no terminal, considera-se que o programa não compilou com sucesso__. Por exemplo, durante a compilação do programa, o compilador não deverá escrever mensagens de aviso (warnings).

## 7. Execução do Programa

O programa deve ser executado da forma seguinte:

    $ ./proj1 < test.in > test.myout

Posteriormente poderá comparar o seu output (`*.myout`) com o output previsto (`*.out`) usando o comando `diff`,

    $ diff test.out test.myout

### 7.1. Testes Auxiliares

Para testar o seu programa poderá executar os passos indicados acima ou usar o script `test.sh` distribuído nesta pasta. Para isso __deverá ter a sua solução nesta pasta__ e

Para executar todos os testes de uma `pasta` deverá executar

    $ ./test.sh pasta vossos_ficheiros_c

Este script compila os ficheiros indicados e compara o resultado obtido com o resultado esperado.
Se apenas indicar o tempo de execução é porque o comando `diff` não encontrou nenhuma diferença. Caso indique mais informação, então é porque o resultado obtido e o resultado esperado diferem.

## 8. Entrega do Projecto

A entrega do projecto deverá respeitar o procedimento seguinte:

* Na página da disciplina aceda ao sistema para entrega de projectos. O sistema será activado uma semana antes da data limite de entrega. Instruções acerca da forma de acesso ao sistema serão oportunamente fornecidas.

* Efectue o upload de um ficheiro arquivo com extensão `.zip` que inclua todos os ficheiros fonte que constituem o programa.
  * Se o seu código tiver apenas um ficheiro o zip conterá apenas esse ficheiro.
  * Se o seu código estiver estruturado em vários ficheiros (`.c` e `.h`) não se esqueça de os juntar também ao pacote.

* Para criar um ficheiro arquivo com a extensão `.zip` deve executar o seguinte comando __na directoria onde se encontram os ficheiros__ com extensão `.c` e `.h` (se for o caso), criados durante o desenvolvimento do projecto:

        $ zip proj1.zip *.c *.h

    Se só tiver um único ficheiro (e.g., `proj1.c`), bastará escrever:

        $ zip proj1.zip proj1.c

* Como resultado do processo de upload será informado se a resolução entregue apresenta a resposta esperada num conjunto de casos de teste.

* O sistema não permite submissões com menos de 10 minutos de intervalo para o mesmo grupo. Tenha especial atenção a este facto na altura da submissão final. Exemplos de casos de teste serão oportunamente fornecidos.

* Data limite de entrega do projecto: __7 de Abril de 2020, às 23h59m__. Até à data limite poderá efectuar o número de submissões que desejar, sendo utilizada para efeitos de avaliação a última submissão efectuada. Deverá portanto verificar cuidadosamente que a última submissão corresponde à versão do projecto que pretende que seja avaliada. Não existirão excepções a esta regra.

## 9. Avaliação do Projecto

### 9.1. Componentes da Avaliação

Na avaliação do projecto serão consideradas as seguintes componentes:

1. A primeira componente avalia o desempenho da funcionalidade do programa realizado. Esta componente é avaliada entre 0 e 17 valores.

2. A segunda componente avalia a qualidade do código entregue, nomeadamente os seguintes aspectos: comentários, indentação, estruturação, modularidade, abstracção, entre outros. Esta componente poderá variar entre -3 valores e +3 valores relativamente à classificação calculada no item anterior e será atribuída posteriormente.
Algumas guidelines sobre este tópico podem ser encontradas [aqui](guidelines.md).

### 9.2. Atribuição Automática da Classificação

* A classificação da primeira componente da avaliação do projecto é obtida através da execução automática de um conjunto de testes num computador com o sistema operativo GNU/Linux. Torna-se portanto essencial que o código compile correctamente e que respeite o formato de entrada e saída dos dados descrito anteriormente. Projectos que não obedeçam ao formato indicado no enunciado serão penalizados na avaliação automática, podendo, no limite, ter 0 (zero) valores se falharem todos os testes. Os testes considerados para efeitos de avaliação poderão incluir (ou não) os disponibilizados na página da disciplina, além de um conjunto de testes adicionais. A execução de cada programa em cada teste é limitada na quantidade de memória que pode utilizar, e no tempo total disponível para execução, sendo o tempo limite distinto para cada teste.

* Note-se que o facto de um projecto passar com sucesso o conjunto de testes disponibilizado na página da disciplina não implica que esse projecto esteja totalmente correcto. Apenas indica que passou alguns testes com sucesso, mas este conjunto de testes não é exaustivo. É da responsabilidade dos alunos garantir que o código produzido está correcto.

* Em caso algum será disponibilizado qualquer tipo de informação sobre os casos de teste utilizados pelo sistema de avaliação automática. A totalidade de ficheiros de teste usados na avaliação do projecto serão disponibilizados na página da disciplina após a data de entrega.

## 10. Dicas para Desenvolvimento do Projecto

Abaixo podem encontrar algumas dicas simples que facilitam o despiste de erros comuns no desenvolvimento do projecto.
Sugerimos que __desenvolvam os vossos projectos de forma incremental e que testem as vossas soluções localmente antes de as submeterem no Mooshak__.

Sugerimos que sigam os seguintes passos:

1. Desenvolvam e corrijam o código de forma incremental garantindo que compila sem erros nem warnings. Não acumulem uma série de erros pois o debug é tanto mais complexo quanto a dimensão da base de código a analisar.
2. Garantam que estão a ler o input e a escrever o output correctamente, em particular garantam que as strings não ficam com espaços extra, `\n` no final, que a formatação está correcta e de acordo com o que está no enunciado, etc.
3. Garantam que o comando `a` funciona correctamente. Poderá para isso ser útil desenvolver um comando auxiliar `k` que lista os produtos existentes no sistema  (semelhante ao `l` mas esquecendo a ordenação).
4. Garantam que os comandos `N` e `A` funcionam correctamente. Poderá para isso ser útil desenvolver um comando auxiliar `K` que lista os produtos existentes numa encomenda (semelhante ao `L` mas esquecendo a ordenação).
5. Garantam que o comando `E` funciona correctamente.
6. Teste isoladamente os comandos `q`, `r`, `R`, `C`, `p`, e `M` e verifiquem que funcionam correctamente. Poderá de novo ser útil os comandos `k` e `K` criados acima.
7. Garantam que os comandos `l` e `L` funcionam correctamente. Os comandos `k` e `K` criados acima poderão ser bons pontos de partida.
