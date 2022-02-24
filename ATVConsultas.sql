/*Query:
QUANTOS LIVROS TEMOS CADASTRADOS*/

SELECT COUNT(DISTINCT IdLivro) AS "Quantidade Livros"
FROM TB_LIVROS;

/*Query
QUANTOS CLIENTES TEMOS DE CADA CIDADE ? */

SELECT Cidade, COUNT(Cidade)AS "Quantidade"
FROM TB_ENDERECOCLIENTE
GROUP BY TB_ENDERECOCLIENTE.Cidade

-- Inner Join: Intersecção dos Funcionarios, Pedidos, Vendas e Clientes.
--Para mostrar todos os Clientes que fizeram Pedidos e os Funcionarios que executaram essas vendas, mostrando o Identificador e Data de Cada Operação
SELECT DISTINCT
V.idVenda as `Id Operação`,
V.dataVenda as `Data`,
C.Nome as `Nome Cliente`,
C.Sobrenome as `Sobrenome Cliente`,
F.Nome as `Nome Vendedor`,
F.Sobrenome as `Sobrenome Vendedor`,
V.valorBrutoVenda `Preço`,
V.descontoVenda `% de Desconto`
FROM 
TB_CLIENTES as C
INNER JOIN
TB_FUNCIONARIOS as F
INNER JOIN 
TB_PEDIDOS as P
INNER JOIN
TB_VENDAS as V
ON
F.idFuncionario =  V.idFuncionario AND
V.idVenda = P.idVendas AND
V.idCliente = C.idCliente
;
/*
Outer Join - Exclusão da intersecção entre Leitores e Vendas
Mostra todos os Leitores que ainda não compraram nenhum livro
*/ 
SELECT
-- V.idVenda as `Identificador da Venda`,
C.idCliente as `Identificador do Cliente`,
C.Nome,C.Sobrenome,C.CPF
FROM
TB_CLIENTES as C LEFT JOIN
TB_VENDAS as V
ON
C.idCliente = V.idCliente
WHERE V.idVenda IS NULL
;

/*
Outer Join (Extra) - Exclusão da intersecção entre Livros e Pedidos
Livros que não foram comprados
*/
SELECT
-- P.idPedido as `Pedidos Feitos`,
L.idLivro as `Identificador do Livro`,
L.Titulo,L.Categoria
FROM
TB_LIVROS as L
LEFT JOIN 
TB_PEDIDOS as P
ON
P.idLivro = L.idLivro
WHERE P.idPedido IS NULL
;
/*
Cross Join - Relacionando Categoria Mistério com Todos Livros e Autores de Mistério
*/
SELECT DISTINCT L.Categoria, A.Nome as `Autor(a)` FROM
TB_LIVROS as L 
CROSS JOIN
TB_AUTORES as A
ON
L.idAutor = A.idAutor
WHERE L.Categoria = "Misterio"
;
/*
COUNT - Quantos Clientes são de fora de Camaçari e quais suas cidades, ordenados por ordem Alfabética
*/
SELECT
EC.Cidade,
COUNT(EC.Cidade) as `Número de Clientes`
FROM
TB_CLIENTES as C,
TB_ENDERECOCLIENTE as EC
WHERE
EC.idEndereco = C.idEndereco AND
EC.Cidade != "Camacari"
GROUP BY EC.Cidade
ORDER BY Cidade
;
/*
COUNT EXTRA -  Quantidade de Livros por Autor
*/
SELECT
CONCAT(A.Nome,"", A.Sobrenome) as `Autor(a)`,
COUNT(L.idLivro) as `Quantidade de Livros`
FROM
TB_AUTORES as A, 
TB_LIVROS as L
WHERE L.idAutor = A.idAutor
GROUP BY `Autor(a)`
ORDER BY `Quantidade de Livros` desc
;
/*
AVG - Média do Preço dos Livros por Categoria
*/
SELECT
L.Categoria,
ROUND(AVG(L.Preco),2) as `Média de Preço`
FROM TB_LIVROS as L
GROUP BY L.Categoria
ORDER BY `Média de Preço`
;
/*
MAX Autor Com Mais Livros
*/
SELECT MAX() FROM TB_LIVROS as L 


SELECT
CONCAT(A.Nome," ", A.Sobrenome) as `Autor(a)`
--MAX(L.idLivro) as `Quantidade de Livros`
FROM
TB_LIVROS as L
LEFT JOIN 
TB_AUTORES as A 
ON L.idAutor = A.idAutor 


/*
View 1 - Leitores de Camaçari
 Retorna os Leitores que moram em Camaçari.
 MAS para ser considerado "Leitor" é necessário ter comprado ao menos 1 livro!
 Então essa view retorna Clientes, que Compraram algum livro e moram em Camaçari
*/
CREATE VIEW vw_LeitoresCamacari
AS
SELECT DISTINCT
-- V.idVenda as `Identificador da Venda`,
C.idCliente as `Identificador do Cliente`,
C.Nome,C.Sobrenome,C.CPF,
EC.Cidade
FROM
TB_ENDERECOCLIENTE as EC,
TB_CLIENTES as C LEFT JOIN
TB_VENDAS as V
ON
C.idCliente = V.idCliente
WHERE V.idVenda IS NOT NULL AND
EC.idEndereco = C.idEndereco AND
EC.Cidade = "Camacari"
;
/*
View 2 - Funcionários por Ordem de Ingresso e Alfabética
*/
CREATE VIEW vw_FuncionariosPorIngresso
AS
SELECT
F.idFuncionario as `Identificador do Funcionário`,
F.Nome, F.Sobrenome,
F.DataIngresso as `Data de Ingresso` FROM
TB_FUNCIONARIOS as F
ORDER BY `Data de Ingresso`, Nome
;

/*
View 3 -  Autores Mais Lidos
Mostra o Nome do Autor, Quantidade de livros "lidos" (vendidos) e ordenado de forma decrescente por Quantidade de livros lidos
*/
CREATE VIEW vw_LeitoresdeAutores
AS
SELECT TB_AUTORES.nome as "Autor(a)", sum(TB_PEDIDOS.qtdePedido) AS "Leitores"
FROM TB_AUTORES, TB_LIVROS, TB_PEDIDOS
WHERE (TB_PEDIDOS.idLivro = TB_LIVROS.idLivro)
AND (TB_LIVROS.idAutor = TB_AUTORES.idAutor)
group by TB_AUTORES.nome
order by sum(TB_PEDIDOS.qtdePedido) desc;

/*
View 4 - Lista de Livros Mais Lidos por ordem de Quantidade de Livros Vendidos decrescente e de Preço ascendente

*/
CREATE VIEW vw_LivrosMaisLidos
AS
SELECT
P.idPedido as `Identificador do Pedido`,
L.Titulo, L.Preco as `Preço`, L.Categoria,
P.qtdePedido as `Quantidade`
FROM
TB_LIVROS as L
LEFT JOIN
TB_PEDIDOS as P
ON
L.idLivro = P.idLivro
WHERE
P.idPedido IS NOT NULL
ORDER BY `Quantidade` desc, `Preço` asc
;



/*  Procedimento I - Verifica as Vendas e Compara a uma Meta Estipulada, se a meta for batida o procedimento exibe uma mensagem de parabens
*/
-- View - Quantidade de Vendas por Funcionário, ordenada decrescente 
CREATE VIEW vw_PerformaceFuncionarios as
SELECT F.Nome as "Nome do Funcionário", sum(P.QtdePedido) AS "Livros Vendidos"
FROM TB_FUNCIONARIOS as F,TB_PEDIDOS as P, TB_VENDAS as V
WHERE(V.idFuncionario = F.idFuncionario)
AND (P.idVendas = V.idVenda)
GROUP BY F.idFuncionario
ORDER BY `Livros Vendidos` desc

--Create a new Procedure

-- Procedure definition

CREATE PROCEDURE proced_ChecarMetaFuncionario(idFuncionario INT)
BEGIN
	SELECT ValorMeta FROM TB_METAMENSAL;
    SELECT `Livros Vendidos` FROM vw_PerformaceFuncionarios;  
       IF ( `Livros Vendidos` >= ValorMeta) THEN
           INSERT INTO TB_FUNCIONARIOS(StatusMeta)
		   SELECT StatusMeta FROM TB_FUNCIONARIOS WHERE idFuncionario = 1
       END IF;

END ..
DELIMITER ;

-- Alter a Relational table to add a column

ALTER TABLE TB_FUNCIONARIOS(StatusMeta) True;

SHOW FULL TABLES
WHERE table_type = 'VIEW';


-- ● Quantos livros do autor X foram vendidos?
-- ● Quantos livros foram vendidos para um cliente morador de Camacari?
-- ● Qual a maior venda?
-- ● Qual funcionário com mais vendas?