# Exercicios MySQL
# 3°TIB - IFBA Campus Camaçari - 2022
**Disciplina LPII - _Prof Fábio_**
 
**Alunos:**
> - _Shaiane Nascimento,_
> - _Pedro Lucas,_    
> - _Mayra Silva,_
> - _Víctor Tigre._


*** 
 Repositório feito na aula de **Banco de Dados** para acompanhar a realização do Trabalho Prático com várias consultas específicas

***Query*** - Quantos Livros temos Cadastrados
***Query*** - Quantos Clientes temos em cada cidade? 

***Inner Join:*** Intersecção dos Funcionarios, Pedidos, Vendas e Clientes.
Para mostrar todos os Clientes que fizeram Pedidos e os Funcionarios que executaram essas vendas, mostrando o Identificador e Data de Cada Operação

***Outer Join*** - Exclusão da intersecção entre Leitores e Vendas
Mostra todos os Leitores que ainda não compraram nenhum livro

***Outer Join (Extra)*** - Exclusão da intersecção entre Livros e Pedidos
Livros que não foram comprados

***Cross Join -*** Relacionando Categoria Mistério com Todos Livros e Autores de Mistério

***Count -*** Quantos Clientes são de fora de Camaçari e quais suas cidades, ordenados por ordem Alfabética

***Count (Extra)*** -  Quantidade de Livros por Autor
***AVG*** - Média do Preço dos Livros por Categoria
***MAX*** Autor Com Mais Livros - 
***MIN*** - Preço por Venda

View 1 - Leitores de Camaçari
 Retorna os Leitores que moram em Camaçari.
 MAS para ser considerado "Leitor" é necessário ter comprado ao menos 1 livro!
 Então essa view retorna Clientes, que Compraram algum livro e moram em Camaçari

View 2 - Funcionários por Ordem de Ingresso e Alfabética

View 3 -  Autores Mais Lidos
Mostra o Nome do Autor, Quantidade de livros "lidos" (vendidos) e ordenado de forma decrescente por Quantidade de livros lidos

View 4 - Lista de Livros Mais Lidos por ordem de Quantidade de Livros Vendidos decrescente e de Preço ascendente

TRIGGER 1 - Preenche a Tabela Backup com os dados da Tabela Cliente, toda vez que um novo cliente é adcionado. Visando preservar os dados dos novos clientes

TRIGGER 2 - Preenche a Tabela Histórico com os dados da Tabela Funcionarios, toda vez que um funcionário é desligado. Visando manter o registro de quem já trabalhou no estabelecimento

Procedimento I - Chamar Todas as VIEWS
 
Procedimento II - Verifica as Vendas e Compara a uma Meta Estipulada, se a meta for batida o procedimento exibe uma mensagem de parabens

