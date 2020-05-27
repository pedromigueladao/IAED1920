# Perguntas Teste Prático - IAED 2019/20

- As 4 perguntas abaixo correspondem a 4 problemas no sistemas Mooshak identificados com as letras `A` a `D`.
- Deverá submeter a resposta a cada pergunta no problema correspondente.
- Quando uma pergunta `X` dependa de uma pergunta `Y`, deverá responder a `X` usando a solução de `Y`. Se por algum motivo não tiver realizado (correctamente) a pergunta `Y`, assuma que o fez na resposta à pergunta `X`. A sua solução da pergunta `X` será corrigida manualmente a posteriori.
- Os testes realizados no Mooshak são os mesmos que os disponibilizados aos alunos. Evite submissões desnecessárias no Mooshak.
- __No caso de criar um comando novo, não se esqueça de o adicionar ao `switch` dos comandos.__
- __Cada aluno deverá utilizar um identificador na sessão Zoom no seguinte formato `identificadorMooshak/Nome`, eg, `al123456:José Almeida`.__

## Compromisso de Honra

__Ao submeter esta avaliação online, cada aluno declara por sua honra que irá resolver a prova recorrendo apenas aos elementos de consulta autorizados, de forma autónoma e sem trocar qualquer informação por qualquer meio, com qualquer pessoa ou repositório de informação, físico ou virtual. [link](https://sartre.tecnico.ulisboa.pt/codigo-honra/)__

## Pergunta A - Projecto 1 (16h00-16h15)

__A1.__ Altere o comando `N` por forma a que este receba um parâmetro que é um nome de cliente (uma string não vazia, sem espaços, com um máximo de 63 caracteres).

__A2.__ Crie um comando `V` que dado um identificador de uma encomenda lista o cliente associado. _Não se esqueça de adicionar a opção `V` ao `switch` dos comandos_.

Os comandos alterados/novos deverão por isso ser os seguintes:

- __N__ - cria uma nova encomenda
  - Formato de entrada: `N cliente`
  - Formato de saída: `Nova encomenda <ide> <cliente>.` onde `<ide>` é o identificador da encomenda criada e `<cliente>` é o nome do cliente da encomenda.

- __V__ - lista o cliente de uma encomenda
  - Formato de entrada: `V ide`
  - Formato de saída: `<ide> <cliente>.` onde `<ide>` é o identificador da encomenda criada e `<cliente>` é o nome do cliente da encomenda.
    - `Impossivel listar encomenda <ide>. Encomenda inexistente.` no caso de não existir nenhuma encomenda criada com esse identificador

## Pergunta B - Projecto 1 (16h15-16h35)

- Esta pergunta depende da pergunta `A`. Assuma que a realizou correctamente na submissão a esta pergunta.

__B.__ Crie o comando `Y` que lista todas as encomendas por ordem crescente de custo. _Não se esqueça de adicionar a opção `Y` ao `switch` dos comandos_.

O comando novo deverá por isso ser o seguinte:

- __Y__ - lista todas as encomendas existentes no sistema por ordem crescente do seu custo total. Se houver 2 ou mais encomendas com o mesmo custo, deverá imprimir essas por ordem crescente de `id` de encomenda
  - Formato de entrada: `Y`
  - Formato de saída: Um bloco no formato abaixo, e em que as encomendas são listadas por ordem crescente de custo

        Encomendas
        * <ide1> <custo1>
        * <ide2> <custo2>
        ...
        * <iden> <custon>
  - Erros: Não aplicável

## Pergunta C - Projecto 2 (16h45-18h00)

__C1.__ Altere o comando `a` por forma a que este receba um parâmetro extra que é _informação adicional sobre o jogo_ (uma string não vazia, geralmente pequena, mas com um máximo de 1023 caracteres `%1023[^:\n]`).

__C2.__ Altere os comandos `l` e `p` por forma a listarem também a _informação adicional sobre o jogo_.

        NL nome-jogo nome-equipa1 nome-equipa2 score1 score2 info-adicional

O comando alterado deverá por isso ser o seguinte:

- __a__ - Adiciona um novo jogo.
  - Formato de entrada: `a nome:equipa1:equipa2:score1:score2:info`
  - Formato de saída: NADA (excepto erro).
  - Erros:
    - `NL Jogo existente.` no caso de já existir um jogo com esse nome no sistema.
    - `NL Equipa inexistente.` no caso de uma das equipas ou ambas não existirem no sistema.

## Pergunta D - Projecto 2 (17h00-18h00)

- Esta pergunta depende da pergunta `C`. Assuma que a realizou correctamente na submissão a esta pergunta.

__D.__ Crie o comando `Z` que remove uma equipa do sistema, ou retorne um erro caso essa equipa não exista ou tenha algum jogo registado. _Não se esqueça de adicionar a opção `Z` ao `switch` dos comandos_.

O comando novo deverá por isso ser o seguinte:

- __Z__ - Apaga uma equipa dado um nome.
  - Formato de entrada: `Z equipa`
  - Formato de saída: NADA (excepto erro).
  - Erros:
    - `NL Equipa inexistente.` no caso de não existir nenhuma equipa com esse nome no sistema.
    - `NL Equipa com jogos.` no caso de a equipa ter 1 ou mais jogos registados no sistema.
