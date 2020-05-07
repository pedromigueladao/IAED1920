# Enunciado do Projecto 2 - IAED 2019/20

## Data de entrega: 25 de Maio de 2020, às 23h59m

## LOG alterações

## 1. Introdução

O objectivo deste projeto é o desenvolvimento, em linguagem C, de um sistema de
gestão de uma base de dados de jogos de futebol amigáveis.
A interacção com o programa deverá ocorrer através de um
conjunto de linhas compostas por uma letra (comando) e um número de argumentos
dependente do comando a executar. Os possíveis comandos são listados na tabela
seguinte e indicam as operações a executar.

| Comando | Acção |
|:---:|:---|
| __a__ | Adiciona um novo jogo. |
| __A__ | Adiciona uma nova equipa. |
| __l__ | Lista todos os jogos pela ordem em que foram introduzidos. |
| __p__ | Procura um jogo. |
| __P__ | Procura uma equipa. |
| __r__ | Apaga um jogo. |
| __s__ | Altera a pontuação (_score_) de um jogo. |
| __g__ | Encontra as equipas que venceram mais jogos.
| __x__ | Termina o programa. |

## 2. Especificação do problema

O objetivo do projeto é ter um sistema de gestão da jogos de futebol que permita associar a cada jogo as equipas e o resultado.

Cada jogo e cada equipa é caracterizada por uma string não vazia, com um máximo de 1023
caracteres. Usando `scanf`, a string pode ser lida através de `%[^:\n]`,
i.e. uma string não vazia sem  `:` e `\n`.

Cada jogo é caracterizado por:

* Um _nome_, uma string não vazia, com um máximo de 1023 caracteres (`%[^:\n]`).
* Duas equipas, strings não vazias, com um máximo de 1023 caracteres cada (`%[^:\n]`).
* Um _score_, um par de números inteiros não negativos.

*Nota:* Como os nomes longos são raros, as estruturas de dados utilizadas só deverão alocar a memória necessária para guardar as strings dadas.

## 3. Dados de Entrada

Durante a execução do programa as instruções devem ser lidas do standard input
na forma de um conjunto de linhas iniciadas por um carácter, que se passa a
designar por _comando_, seguido de um número de informações dependente do
comando a executar.

Os comandos disponíveis são descritos de seguida. Cada comando indica uma
determinada acção que se passa a caracterizar em termos de formato de entrada,
formato de saída, e erros. No caso de múltiplos erros para o mesmo comando
deverá retornar apenas o primeiro desses erros.

**Importantante:**
Para simplificar o debug do projecto, no inicio de cada linha do output deverá aparecer o número da linha do comando de input que originou esse output.  
A sigla `NL` vai ser usada no texto seguinte para designar este número.

* __a__ - Adiciona um novo jogo.
  * Formato de entrada: `a nome:equipa1:equipa2:score1:score2`
  * Formato de saída: NADA (excepto erro).
  * Erros:
    * `NL Jogo existente.` no caso de já existir um jogo com esse nome no sistema.
    * `NL Equipa inexistente.` no caso de uma das equipas ou ambas não existirem no sistema.
* __l__ - Lista todos os jogos introduzidos.
  * Formato de entrada: `l`
  * Formato de saída: Uma linha por jogo no formato abaixo

        NL nome-jogo nome-equipa1 nome-equipa2 score1 score2

    Os jogos deverão ser listados pela ordem em que foram introduzidos.
    Caso não exista nenhum jogo no sistema, o comando não imprime nada.
  * Erros: Não aplicável.
* __p__ - Procura um jogo com o nome dado.
  * Formato de entrada: `p nome`
  * Formato de saída: Igual ao formato de saída do comando `l` mas apenas com o jogo `nome`.
  * Erros:
    * `NL Jogo inexistente.` no caso de não existir nenhum jogo com esse nome no sistema.
* __r__ - Apaga um jogo dado um nome.
  * Formato de entrada: `r nome`
  * Formato de saída: NADA (excepto erro).
  * Erros:
    * `NL Jogo inexistente.` no caso de não existir nenhum jogo com esse nome no sistema.
* __s__ - Altera o score de um jogo dado o nome.
  * Formato de entrada: `s nome:score1:score2`
  * Formato de saída: NADA (excepto erro).
  * Erros:
    * `NL Jogo inexistente.` no caso de não existir nenhum jogo com esse nome no sistema.
* __A__ - Adiciona uma nova equipa.
  * Formato de entrada: `A nome`
  * Formato de saída: NADA (excepto erro).
  * Erros:
    * `NL Equipa existente.` no caso de já existir uma equipa com esse nome no sistema.
* __P__ - Procura uma equipa dado um nome.
  * Formato de entrada: `P nome`
  * Formato de saída: `NL nome numero-de-jogos-ganhos`.
  * Erros:
    * `NL Equipa inexistente.` no caso de não existir nenhuma equipa com esse nome no sistema.
* __g__ - Encontra as equipas que ganharam mais jogos e lista por ordem lexicográfica (do nome da equipa).
  * Formato de entrada: `g`
  * Formato de saída:
  
        NL Melhores número-de-jogos-ganhos
        NL * nome-equipa1
        NL * nome-equipa2
        NL * nome-equipa3
        ...
    Caso não exista nenhuma equipa, o comando não imprime nada (nem a palavra `Melhores`).
  * Erros: Não aplicável.

## 4. Dados de Saída

O programa deverá escrever no standard output as respostas aos comandos apresentados no standard input. As respostas são igualmente linhas de texto formatadas conforme definido anteriormente neste enunciado. Tenha em atenção o número de espaços entre elementos do seu output, assim como os espaços no final de cada linha. Procure respeitar escrupulosamente as indicações dadas.

## 5. Exemplos (Input/Output)

Ver os exemplos de input e respectivos outputs na pasta `testes_enunciado/`.

## 6. Compilação do Programa

O compilador a utilizar é o `gcc` com as seguintes opções de compilação: `-Wall -Wextra -Werror -ansi -pedantic`. Para compilar o programa deve executar o seguinte comando:

    $ gcc -Wall -Wextra -Werror -ansi -pedantic -o proj2 *.c

Este comando deve ter como resultado a geração do ficheiro executável `proj2`, caso não haja erros de compilação. __A execução deste comando não deverá escrever qualquer resultado no terminal. Caso a execução deste comando escreva algum resultado no terminal, considera-se que o programa não compilou com sucesso__. Por exemplo, durante a compilação do programa, o compilador não deverá escrever mensagens de aviso (warnings).

Algumas dicas para degugging podem ser encontradas [aqui](debugging-guidelines.md).

__Não poderá ser usada a biblioteca `search.h`__

## 7. Execução do Programa

O programa deve ser executado da forma seguinte:

    $ ./proj2 < test.in > test.myout

Posteriormente poderá comparar o seu output (`*.myout`) com o output previsto (`*.out`) usando o comando `diff`,

    $ diff test.out test.myout

### 7.1. Testes Auxiliares

Para testar o seu programa poderá executar os passos indicados acima ou usar os scripts `test.sh` e `test-vg.sh` distribuídos nesta pasta. Para isso __deverão ter a vossa solução nesta pasta__ e

1. Para executarem todos os testes de uma `pasta` deverão executar

        $ ./test.sh <pasta> <vossos_ficheiros_c>

2. Para executarem todos os testes de uma `pasta` com o *valgrind* deverão executar

        $ ./test-vg.sh <pasta> <vossos_ficheiros_c>

Estes scripts compilam os ficheiros indicados e comparam o resultado obtido com o resultado esperado.

## 8. Entrega do Projecto

A entrega do projecto deverá respeitar o procedimento seguinte:

* Na página da disciplina aceda ao sistema para entrega de projectos. O sistema será activado uma semana antes da data limite de entrega. Instruções acerca da forma de acesso ao sistema serão oportunamente fornecidas.

* Efectue o upload de um ficheiro arquivo com extensão `.zip` que inclua todos os ficheiros fonte que constituem o programa.
  * Se o seu código tiver apenas um ficheiro o zip conterá apenas esse ficheiro.
  * Se o seu código estiver estruturado em vários ficheiros (`.c` e `.h`) não se esqueça de os juntar também ao pacote.

* Para criar um ficheiro arquivo com a extensão `.zip` deve executar o seguinte comando __na directoria onde se encontram os ficheiros__ com extensão `.c` e `.h` (se for o caso), criados durante o desenvolvimento do projecto:

        $ zip proj2.zip *.c *.h

* Como resultado do processo de upload será informado se a resolução entregue apresenta a resposta esperada num conjunto de casos de teste.

* O sistema não permite submissões com menos de 10 minutos de intervalo para o mesmo aluno. Tenha especial atenção a este facto na altura da submissão final.

* Data limite de entrega do projecto: __25 de Maio de 2020, às 23h59m__. Até à data limite poderá efectuar o número de submissões que desejar, sendo utilizada para efeitos de avaliação a última submissão efectuada. Deverá portanto verificar cuidadosamente que a última submissão corresponde à versão do projecto que pretende que seja avaliada. Não existirão excepções a esta regra.

## 9. Avaliação do Projecto

### 9.1. Componentes da Avaliação

Na avaliação do projecto serão consideradas as seguintes componentes:

1. A primeira componente será feita automaticamente e avalia o desempenho da funcionalidade do programa realizado. Esta componente é avaliada entre 0 e 17 valores.

2. A segunda componente avalia a qualidade do código entregue, nomeadamente os seguintes aspectos: comentários, indentação, alocação dinâmica de memória, estruturação, modularidade e divisão em ficheiros, abstracção de dados, entre outros. Esta componente poderá variar entre -4 valores e +3 valores relativamente à classificação calculada no item anterior e será atribuída posteriormente.
Algumas guidelines sobre este tópico podem ser encontradas [aqui](guidelines.md).

3. Na segunda componente serão utilizadas as ferramentas _lizard_, _valgrind_, e a opção _fsanitize_ por forma a detectar a complexidade de código, fugas de memória (“memory leaks”) ou outras incorrecções no código, que serão penalizadas.
Aconselha-se por isso que os alunos utilizem estas ferramentas para fazer debugging do código e corrigir eventuais incorrecções, antes da submissão do projecto. Mais informações podem ser encontradas [aqui](guidelines.md).

### 9.2. Atribuição Automática da Classificação

* A classificação da primeira componente da avaliação do projecto é obtida através da execução automática de um conjunto de testes num computador com o sistema operativo GNU/Linux. Torna-se portanto essencial que o código compile correctamente e que respeite o formato de entrada e saída dos dados descritos anteriormente. Projectos que não obedeçam ao formato indicado no enunciado serão penalizados na avaliação automática, podendo, no limite, ter 0 (zero) valores se falharem todos os testes. Os testes considerados para efeitos de avaliação poderão incluir (ou não) os disponibilizados na página da disciplina, além de um conjunto de testes adicionais. A execução de cada programa em cada teste é limitada na quantidade de memória que pode utilizar, e no tempo total disponível para execução, sendo o tempo limite distinto para cada teste.

* Note-se que o facto de um projecto passar com sucesso o conjunto de testes disponibilizado na página da disciplina não implica que esse projecto esteja totalmente correcto. Apenas indica que passou alguns testes com sucesso, mas este conjunto de testes não é exaustivo. É da responsabilidade dos alunos garantir que o código produzido está correcto.
