# Teste Prático - IAED 2019/20

## Data: 27 de Maio de 2020, das 16h00 às 17h30

## LOG alterações

- 27Mai2020 - Adiciona versão base do ficheiro `perguntas.md`.
- 27Mai2020 - Adiciona informação respeitante ao identificador Zoom de cada aluno.
- 27Mai2020 - Adiciona link de registo no Mooshak, Zoom para Alameda e TAGUS.
- 26Mai2020 - Adiciona link para Testes do Mooshak do P2.

## 1. Introdução

O objectivo deste teste é avaliar a capacidade dos alunos efectuarem alterações/adições aos projectos desenvolvidos durante o semestre na cadeira de IAED.

A nota final do Teste Prático levará em conta a nota obtida no sistema Mooshak mas será feita uma validação posterior no que respeita a erros ao nível de gestão de memória.

__Será também atribuído crédito a soluções parciais ou a soluções incompletas, pelo que deverão submeter SEMPRE as soluções a que chegarem.__

Existirão intervalos de tempo pré-definidos para a resolução de cada uma das perguntas. Os alunos deverão submeter a solução para cada uma delas no intervalo de tempo correspondente (que será entre 15 e 35 minutos dependente da pergunta).
A prova inicia-se às 16h00 com a Pergunta A. É responsabilidade de cada aluno ligar e autenticar-se antes dessa hora.

As perguntas serão disponibilizadas [aqui](perguntas.md). (Fazer `git pull` no início de cada um dos intervalos de tempo)

Recordamos que os enunciados dos projectos podem ser encontrados [aqui (P1)](https://github.com/pedromigueladao/IAED1920/tree/master/projectos/p1) e [aqui (P2)](https://github.com/pedromigueladao/IAED1920/tree/master/projectos/p2).

Os testes que foram executados no Mooshak podem ser encontrados [aqui (P1)](https://fenix.tecnico.ulisboa.pt/downloadFile/1126518382247359/P1-testes-mooshak.zip) e
[aqui (P2)](https://fenix.tecnico.ulisboa.pt/downloadFile/1689468335639728/testes-mooshak-p2.tgz).

### Compromisso de Honra

__Ao submeter esta avaliação online, cada aluno declara por sua honra que irá resolver a prova recorrendo apenas aos elementos de consulta autorizados, de forma autónoma e sem trocar qualquer informação por qualquer meio, com qualquer pessoa ou repositório de informação, físico ou virtual. [link](https://sartre.tecnico.ulisboa.pt/codigo-honra/)__

## 2. Regras para o Teste Prático

1. Criem uma cópia dos vossos projectos e trabalhem sobre esses pontos de partida. Chamem a essas pastas `proj1` e `proj2`.
2. Identifiquem o que precisam de alterar/adicionar em cada pergunta e façam apenas as alterações/adições necessárias.
3. Os projectos deverão preservar toda a funcionalidade anterior, excepto nos casos dos comandos alterados que deverão apresentar a funcionalidade pedida.
4. Tenham em atenção o número de espaços entre elementos do seu output, assim como a ausência de espaços e os pontos finais no final de cada linha. Deverão respeitar escrupulosamente as indicações dadas.
5. Testem os vossos projectos localmente antes de os submeter no Mooshak por forma a optimizar o vosso tempo.
6. Submetam as vossas soluções no Mooshak assim que tiverem resolvido cada uma das perguntas.
7. O sistema não permitirá submissões com menos de 5 minutos de intervalo para cada aluno. Tenham especial atenção a este facto na altura da submissão final.
8. __Para o sistema Mooshak deverão usar a mesma password que foi usada no Projecto 2. Quem não tiver realizado o Projecto 2, deverá registar-se através do link que será disponibilizado oportunamente [aqui](http://acp.tecnico.ulisboa.pt/~mooshak/cgi-bin/iaed1920s2getpass)__
9. __Cada pergunta estará identificada por uma letra. Deverá submeter cada resposta no problema correspondente do Mooshak.__
10. __Cada aluno deverá registar o seu utilizador na plataforma Zoom com o e-mail `tecnico.ulisboa.pt`.__
11. Existirá uma sessão Zoom, com link a disponibilizar [aqui (Alameda)](https://videoconf-colibri.zoom.us/j/620437566?pwd=MTlTa3B4MUpqOXFNdmY5dFZrL3VTUT09) e [aqui (Tagus)](https://videoconf-colibri.zoom.us/j/92556592505?pwd=RUZHNnZSZzZpVERyVXNIT2luNmJoZz09), que será usada para monitorizar a execução do teste. Cada aluno deverá fazer login com a conta definida acima, e deverá manter a câmara do seu computador ligada durante todo o teste prático.
12. __Cada aluno deverá utilizar um identificador na sessão Zoom no seguinte formato `identificadorMooshak/Nome`, eg, `al123456:José Almeida`.__

## 3. Compilação do Programa

O compilador a utilizar é o `gcc` com as seguintes opções de compilação `-Wall -Wextra -Werror -ansi -pedantic`. Para compilar o programa deve executar o seguinte comando: (idem para o projecto 2)

    $ gcc -Wall -Wextra -Werror -ansi -pedantic -o proj1 *.c

Este comando deve ter como resultado a geração do ficheiro executável `proj1`, caso não haja erros de compilação. __A execução deste comando não deverá escrever qualquer resultado no terminal. Caso a execução deste comando escreva algum resultado no terminal, considera-se que o programa não compilou com sucesso__. Por exemplo, durante a compilação do programa, o compilador não deverá escrever mensagens de aviso (warnings).

## 3. Exemplos (Input/Output)

Utilizem para debug os exemplos de input e respectivos output que serão disponibilizados nas pastas `testes-A/`, `testes-B/`, etc...

## 4. Execução do Programa

O programa deve ser executado da forma seguinte: (idem para `proj2`)

    $ ./proj1 < test.in > test.myout

Posteriormente poderá comparar o seu output (`*.myout`) com o output previsto (`*.out`) usando o comando `diff`,

    $ diff test.out test.myout

### 4.1. Testes Auxiliares

Para testar o seu programa poderá executar os passos indicados acima ou usar o script `test.sh` distribuído nesta pasta. Para executar todos os testes de uma `pasta` deverá executar

    $ ./test.sh pasta vossos_ficheiros_c

Este script compila os ficheiros indicados e compara o resultado obtido com o resultado esperado.
Se apenas indicar o tempo de execução é porque o comando `diff` não encontrou nenhuma diferença. Caso indique mais informação, então é porque o resultado obtido e o resultado esperado diferem.

## 5. Entrega do Projecto

A entrega do projecto será feita através do sistema [Mooshak](http://acp.tecnico.ulisboa.pt/~mooshak/) e deverá respeitar o procedimento seguinte:

- Efectue __para cada pergunta__ o upload de um ficheiro arquivo com extensão `.zip` que inclua todos os ficheiros fonte que constituem o programa.
  - Se o seu código tiver apenas um ficheiro o zip conterá apenas esse ficheiro.

        $ zip proj1.zip proj1.c
  - Se o seu código estiver estruturado em vários ficheiros (`.c` e `.h`) não se esqueça de os juntar também ao pacote.

        $ zip proj1.zip *.c *.h

- O sistema não permite submissões com menos de 5 minutos de intervalo para cada aluno. Tenha especial atenção a este facto na altura da submissão final.

- Até à hora limite de submissão de cada pergunta poderá efectuar o número de submissões que desejar, sendo utilizada para efeitos de avaliação a última submissão efectuada. Deverá portanto verificar cuidadosamente que a última submissão corresponde à versão da resposta que pretende que seja avaliada. Não existirão excepções a esta regra.
