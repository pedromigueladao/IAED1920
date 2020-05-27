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

## Pergunta C - Projecto 2 (16h35-16h55)

## Pergunta D - Projecto 2 (16h55-17h30)
