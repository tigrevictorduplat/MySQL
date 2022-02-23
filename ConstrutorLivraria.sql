CREATE TABLE TB_EDITORAS(
idEditora INTEGER auto_increment NOT NULL,
nome VARCHAR(30) NOT NULL,
telefone CHAR(15) NOT NULL,
CONSTRAINT PK_idEditora PRIMARY KEY (idEditora)
)

CREATE TABLE TB_ENDERECOCLIENTE(
idEndereco INTEGER auto_increment NOT NULL,
Estado VARCHAR(20) NOT NULL,
Cidade VARCHAR(20) NOT NULL,
Logradouro VARCHAR(60) NOT NULL,
CONSTRAINT PK_idEndereco PRIMARY KEY(idEndereco)
)

CREATE TABLE TB_CLIENTES(
idCliente INTEGER auto_increment NOT NULL,
Nome VARCHAR(30),
Sobrenome VARCHAR(30),
CPF BIGINT NOT NULL,
idEndereco INTEGER NOT NULL,
CONSTRAINT PK_idCliente PRIMARY KEY(idCliente),
CONSTRAINT fk_idEndereco FOREIGN KEY (idEndereco) REFERENCES TB_ENDERECOCLIENTE(idEndereco)
)

CREATE TABLE TB_AUTORES(
idAutor INTEGER auto_increment NOT NULL,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(20) NOT NULL,
CONSTRAINT PK_idAutor PRIMARY KEY (idAutor)
)

CREATE TABLE TB_LIVROS(
idLivro INTEGER auto_increment NOT NULL,
idAutor INTEGER NOT NULL,
idEditora INTEGER NOT NULL,
ISBN BIGINT NOT NULL,
Titulo VARCHAR(100) NOT NULL,
Preco DECIMAL(10,2),
Categoria VARCHAR(100) NOT NULL,
CONSTRAINT PK_idLivro PRIMARY KEY (idLivro),
CONSTRAINT FK_idAutor FOREIGN KEY (idAutor) REFERENCES TB_AUTORES(idAutor),
CONSTRAINT FK_idEditora FOREIGN KEY (idEditora) REFERENCES TB_EDITORAS(idEditora)
)

CREATE TABLE TB_FUNCIONARIOS(
idFuncionario INTEGER auto_increment NOT NULL,
Nome VARCHAR(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
DataIngresso DATE NOT NULL,
CONSTRAINT PK_idFuncionario PRIMARY KEY (idFuncionario)
)

CREATE TABLE TB_VENDAS(
idVenda INTEGER auto_increment NOT NULL,
idCliente INTEGER NOT NULL,
-- idPedido INTEGER NOT NULL,
idFuncionario INTEGER NOT NULL,
dataVenda DATE NOT NULL,
descontoVenda INT NOT NULL,
valorBrutoVenda NUMERIC(10,2) NOT NULL,
CONSTRAINT PK_idVenda PRIMARY KEY (idVenda),
CONSTRAINT FK_idCliente FOREIGN KEY (idCliente) REFERENCES TB_CLIENTES(idCliente),
-- CONSTRAINT FK_idPedido FOREIGN KEY (idPedido) REFERENCES TB_PEDIDOS(idPedido),
CONSTRAINT FK_idFuncionario FOREIGN KEY (idFuncionario) REFERENCES TB_FUNCIONARIOS(idFuncionario)
)

CREATE TABLE TB_PEDIDOS(
idPedido INTEGER auto_increment NOT NULL,
idVendas INTEGER NOT NULL,
idLivro INTEGER NOT NULL,
qtdePedido INT NOT NULL,
CONSTRAINT PK_idPedido PRIMARY KEY (idPedido),
CONSTRAINT FK_idLivro FOREIGN KEY (idLivro) REFERENCES TB_LIVROS(idLivro),
CONSTRAINT FK_idVendas FOREIGN KEY (idVendas) REFERENCES TB_VENDAS(idVenda)
)

INSERT INTO TB_EDITORAS (nome, telefone)
VALUES
('Intriseca', '(11)95133-1562'),
('Panini', '(21)95215-5215'),
('Cia Das Letras', '(11)45218526'),
('Nemo', '(21)98552-1511'),
('JBC', '(31)95245-1523'),
('Ática', '(11)8562-1155'),
('Melhoramentos', '(11)3327-6322'),
('Nova Fronteira','(21)2123-1223'),
('Sextante','(11)3344-1246'),
('Rocco','(31)98827-2316');

SELECT*FROM TB_EDITORAS

SELECT*FROM TB_ENDERECOCLIENTE


INSERT INTO TB_ENDERECOCLIENTE(Estado, Cidade, Logradouro)
VALUES
('SP','São Paulo','Rua Dos Frades, 37 Itaim Bibi'),
('SP','Santos','Rua Paulo Afonso, 32 Largo Nov'),
('BA','Camacari','Rua Ibicaraí, 21, Gleba C'),
('BA','Salvador','Avenida ACM, 38, Itaigara'),
('MG','Uberlândia','Avenida Getulio Vargas, 34'),
('BA','Lauro de Freitas','Estrada do Coco, km 6,Portão'),
('BA','Camacari','Rua Ibicaraqui, 24, Gleba Z');

SELECT*FROM TB_ENDERECOCLIENTE
SELECT*FROM TB_CLIENTES

INSERT INTO TB_CLIENTES(Nome,Sobrenome,CPF,idEndereco)
VALUES
('Rian','Novais','05656246510',1),
('Cláudio','Peixoto','05645252620',2),
('Maria','Souza','62653226610',3),
('Luciana','Menezes','65652626570',4),
('Carlos','Silveira','35489693568',5)
('Carla','Dinea','12298998562',6),
('João','Figueiredo','52652671262',7);


INSERT INTO TB_AUTORES(Nome,Sobrenome)
VALUES
('Willian','Shakespeare'),
('Jorge','Amado'),
('Monteiro','Lobato'),
('Clarice','Linspector'),
('Luis', 'De Camões'),
('Conan', 'Doyle'),
('Dan', 'Brown'),
('Suzane','Collins'),
('Agatha', 'Cristie');

SELECT*FROM TB_AUTORES;
SELECT*FROM TB_LIVROS;

INSERT INTO TB_LIVROS(idAutor, idEditora, ISBN, Titulo, Preco, Categoria)
VALUES
(1,2,'53526258896','Hamlet',99.90,'Ficcão'),
(2,5,'56987456321','Capitães da Areia',49.90,'Literatura Brasileira'),
(3,1,'16329826689', 'Dom Quixote', 25.90, 'Literatura Brasileira'),
(4,4,'65459832689', 'A Hora da Estrela', 99.90, 'Literatura Brasileira'),
(5,4,'89563256123', 'Os Lusíadas', 139.90, 'Historia'),
(6,7,'46748368434','Sherlock Holmes: Um Estudo em Vermelho',21.95,'Misterio'),
(6,7,'46748363214','Sherlock Holmes: A Volta de Sherlock Holmes',23.95,'Misterio'),
(6,7,'46748369876','Sherlock Holmes: O Cão de Baskerville',21.50,'Misterio'),
(6,7,'46748367653','Sherlock Holmes: O Signo dos Quatro',21.95,'Misterio'),
(7,8,'25920373837','Ponto de Impacto',54.50,'Ficção-Cientifica'),
(7,8,'25926378290','Código DaVinci',80.45,'Ficção-Cientifica'),
(8,9,'36557552677','Jogos Vorazes',32.50,'Infanto-Juvenil'),
(8,9,'36558789378','Jogos Vorazes: Em Chamas',32.50,'Infanto-Juvenil'),
(8,9,'36557467866','Jogos Vorazes: A Esperança',42.90,'Infanto-Juvenil');

INSERT INTO TB_FUNCIONARIOS(Nome,Sobrenome,DataIngresso)
VALUES
('João','Guilherme','20101015'),
('Antonio', 'Silveira','20100112'),
('Giovana', 'Fagundes','20120821'),
('Carol', 'Silva','20130529'),
('Claudio','Costa','20200228');

ALTER TABLE TB_VENDAS ADD CONSTRAINT FK_IDCLIENTE FOREIGN KEY(idCliente) REFERENCES TB_CLIENTES;

INSERT INTO TB_VENDAS(idCliente, idFuncionario, dataVenda, descontoVenda, valorBrutoVenda)
VALUES
(1,  2, '20211215' , 0, 145.90),
(2,  3, '20211113', 10, 39.90),
(3,  2, '20211209', 10, 59.90)
(6,  1, '20211210' , 10, 159.90),
(7, 5, '20211224', 0,23.95 ),
(7, 5, '20220104', 10,43.45 ),
(3, 5,'20221030',20, 107.90);

-- Ponto de Pausa, Inserindo Dados

INSERT INTO TB_PEDIDOS(idVendas, idLivro,qtdePedido)
VALUES
(1, 4, 1),
(2, 1, 2),
(3, 2, 1),
(3, 3, 4),
(4, 4, 2),
(5, 12, 1),
(6, 11, 1),
(6, 13, 1),
(6,14,1),
(7,17,1),
(7,18,1),
(7,19,1);


INSERT INTO TB_PEDIDOS(idVendas, idLivro,qtdePedido)
VALUES
(2, 3,  1);



SELECT*FROM TB_AUTORES;
SELECT*FROM TB_ENDERECOCLIENTE;
SELECT*FROM TB_FUNCIONARIOS;
SELECT*FROM TB_CLIENTES;
SELECT*FROM TB_LIVROS;
SELECT*FROM TB_EDITORAS;
SELECT*FROM TB_PEDIDOS;
SELECT*FROM TB_VENDAS;



/*autores mais lidos*/
nome do autor, quantidade de livros vendidos
ordenado por quantidade de livros vendidos

select TB_AUTORES.nome, sum(TB_PEDIDOS.qtdePedido) AS "Leitores"
from TB_AUTORES, TB_LIVROS, TB_PEDIDOS
where (TB_PEDIDOS.idLivro = TB_LIVROS.idLivro)
and (TB_LIVROS.idAutor = TB_AUTORES.idAutor)
group by TB_AUTORES.nome
order by sum(TB_PEDIDOS.qtdePedido) desc

/*QUANTOS LIVROS TEMOS CADASTRADOS*/

SELECT COUNT(DISTINCT IdLivro) AS "Quantidade Livros"
FROM TB_LIVROS;

/*QUANTOS CLIENTES TEMOS DE CADA CIDADE ? */

SELECT Cidade, COUNT(Cidade)AS "Quantidade"
FROM TB_ENDERECOCLIENTE
GROUP BY TB_ENDERECOCLIENTE.Cidade

/* QUANTIDADE DE VENDA POR FUNCIONARIO */

SELECT*FROM TB_FUNCIONARIOS
SELECT*FROM TB_VENDAS
SELECT*FROM TB_PEDIDOS


create view teste as
SELECT TB_FUNCIONARIOS.idFuncionario, sum(TB_PEDIDOS.QtdePedido) AS "Livros Vendidos"
FROM TB_FUNCIONARIOS ,TB_PEDIDOS, TB_VENDAS
WHERE(TB_VENDAS.idFuncionario = TB_FUNCIONARIOS.idFuncionario)
AND (TB_PEDIDOS.idVendas = TB_VENDAS.idVenda)
GROUP BY TB_FUNCIONARIOS.idFuncionario

select * from teste

SHOW FULL TABLES
WHERE table_type = 'VIEW';

/*select TB_AUTORES.nome, sum(TB_PEDIDOS.qtdePedido) AS "Leitores"
from TB_AUTORES, TB_LIVROS, TB_PEDIDOS
where (TB_PEDIDOS.idLivro = TB_LIVROS.idLivro)
and (TB_LIVROS.idAutor = TB_AUTORES.idAutor)
group by TB_AUTORES.nome
order by sum(TB_PEDIDOS.qtdePedido) desc

-- ● Quantos livros do autor X foram vendidos?
-- ● Quantos livros foram vendidos para um cliente morador de Camacari?
-- ● Qual a maior venda?
-- ● Qual funcionário com mais vendas?

/*
CREATE DATABASE Livraria;

USE Livraria;

CREATE TABLE Leitores
(
CPF VARCHAR(45) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(20) NOT NULL,
DataNasc DATE NOT NULL,
CodEndereco INT NULL,
ClubeDoLivro BIT NOT NULL
);

CREATE TABLE Endereco(
CodEndereco INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(45) NOT NULL,
Cidade VARCHAR(45) NOT NULL,
TipoLocal VARCHAR(45) NOT NULL,
Logradouro VARCHAR(45) NOT NULL,
Numero INT NOT NULL,
Complemento VARCHAR(45)
);

CREATE TABLE Locacao(
CPF VARCHAR(45) PRIMARY KEY,
ISBN VARCHAR(45) NOT NULL,
DataLocacao DATE NOT NULL,
DataDevolucao DATE NOT NULL,
Quantidade INT NOT NULL
);

CREATE TABLE Doacao(
CPF VARCHAR(45) PRIMARY KEY,
ISBN VARCHAR(45) NOT NULL,
Titulo VARCHAR(45) NOT NULL,
Quantidade INT NOT NULL
);


CREATE TABLE CompraVenda (
CodOperacao INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(45) NOT NULL,
ISBN VARCHAR(45) NOT NULL,
CodFuncionario INT NOT NULL,
DataVenda DATE NOT NULL,
Quantidade INT NOT NULL
);


CREATE TABLE Funcionarios(
CodFuncionario INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(45) NOT NULL,
Sobrenome VARCHAR(45) NOT NULL,
DataIngresso DATE NOT NULL
);

CREATE TABLE Livros(
ISBN VARCHAR(45) PRIMARY KEY,
Titulo VARCHAR(45) NOT NULL,
Editora VARCHAR(45) NOT NULL,
CodAutor INT NOT NULL,
Quantidade INT,
DataInclusao DATE
);

CREATE TABLE Autores(
CodAutor INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(45) NOT NULL
);

-- Adicionando as FK keys
ALTER TABLE Leitores
	ADD CONSTRAINT fk_Endereco FOREIGN KEY(CodEndereco) REFERENCES Endereco(CodEndereco);

ALTER TABLE Locacao
	ADD CONSTRAINT fk_LeiLoc FOREIGN KEY (CPF) REFERENCES Leitores(CPF);

ALTER TABLE Doacao
	ADD CONSTRAINT fk_DoaLoc FOREIGN KEY (CPF) REFERENCES Leitores(CPF);

ALTER TABLE CompraVenda
	ADD CONSTRAINT fk_LeiCom FOREIGN KEY (CPF) REFERENCES Leitores(CPF);

ALTER TABLE CompraVenda
	ADD CONSTRAINT fk_Funcionario FOREIGN KEY(CodFuncionario) REFERENCES Funcionarios(CodFuncionario);

ALTER TABLE CompraVenda
	ADD CONSTRAINT fk_ISBN FOREIGN KEY(ISBN) REFERENCES Livros(ISBN);

ALTER TABLE Livros
	ADD CONSTRAINT fk_Autor FOREIGN KEY(CodAutor) REFERENCES Autores(CodAutor);

-- Inserindo Valores

INSERT INTO Autores (Nome)
VALUES
('Napoleon Hill'),
('Jorge Amado'),
('Guimarces Rosa'),
('Machado de Assis'),
('William Shakespeare'),
('Clarice Linspector'),
('Augusto Cury'),
('George R.R Martin'),
('J.K Rowling'),
('George Orwell');

INSERT INTO Endereco(CPF, Cidade, TipoLocal, Logradouro, Numero, Complemento)
VALUES
('045.254.365-70', 'Camacari', 'Rua', 'Das Araras', '37',''),
('012.126.124-9', 'Camacari', 'Avenida', 'Getulio Vargas', '16', ''),
('291.889.915-11', 'Camacari', 'Rua', 'Nova Esperanca', '12', ''),
('112.869.935-16', 'Camacari', 'Rua', 'Boa Sorte', '11', ''),
('113.869.935-23', 'Camacari', 'Rua', 'Quatorze', '23', '32'),
('354.869.935-43', 'Camacari', 'Rua', 'Sco Joco', '54', '21'),
('232.869.935-11', 'Camacari', 'Rua', 'Sete De Setembro', '23', ''),
('111.869.935-11', 'Camacari', 'Rua', 'Quinze De Novembro', '61', '4'),
('152.869.935-29', 'Camacari', 'Rua', 'Tiradentes', '161', ''),
('102.869.935-15', 'Camacari', 'Rua', 'Rui Barbosa', '173', '');

INSERT INTO Leitores (CPF, Nome, Sobrenome, DataNasc, ClubeDoLivro)
VALUES
('045.254.365-70', 'Rian', 'Muniz', '20030110', 1),
('012.126.124-9', 'Claudia', 'Teixeira', '20010120', 1),
('291.889.915-11', 'Roberto', 'Almeida', '19920430', 0),
('112.869.935-16', 'Juliana', 'Ribeiro', '20010410', 1),
('113.869.935-23', 'Antonio', 'Peixoto', '19891210', 0),
('354.869.935-43', 'Claudio', 'Fragoso', '19991005', 0),
('232.869.935-11', 'Carlos', 'Fragoso', '19970420', 1),
('152.869.935-29', 'Maristela', 'Silva', '19761120', 0);

INSERT INTO Funcionarios(Nome, Sobrenome, DataIngresso)
VALUES
('Antonio ','Josc','20191021'),
('Carlos','Fonseca','20201001'),
('Maria','Das Dores','20211001'),
('Marina','Reis','20181023'),
('Carla','Silva','20180920');

INSERT INTO Doacao (CPF,ISBN,Titulo,Quantidade)
VALUES
('152.869.935-29', '978-3-16-148410-0','Abc',1),
('112.869.935-16', '924-3-15-125810-1','Cde', 2);

INSERT INTO Locacao (CPF, ISBN, DataLocacao, DataDevolucao, Quantidade)
VALUES
('113.869.935-23', '921-3-14-125021-0', '20210910', '20210930', 2),
('354.869.935-43', '911-1-12-125011-1', '20210811', '20210829', 1),
('012.126.124-9', '921-3-14-125021-0', '20210910', '20210930', 4);

INSERT INTO Livros (CodAutor,ISBN, Titulo,Editora, Quantidade,DataInclusao)
VALUES
(1,'978-3-16-148410-0', 'Abc', 'Record', 2, '20210910'),
(2,'924-3-15-125810-1', 'Cde', 'Companhia Das Letras', 1,'20210810'),
(3,'914-2-12-123456-1', 'Zxw', 'Novos Territorios', 2, '20210711'),
(4,'215-2-12-142761-1', 'Qxw', 'Intriseca' , 11, '20201212'),
(5,'005-2-45-161131-2', 'Axw', 'Veneta', 24, '20210818');

INSERT INTO CompraVenda (CPF, ISBN, CodFuncionario, DataVenda, Quantidade)
VALUES
('354.869.935-43', '924-3-15-125810-1',2,'20210113',3),
('232.869.935-11', '005-2-45-161131-2', 1, '20201010', 2);

/*