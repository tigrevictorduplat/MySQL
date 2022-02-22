CREATE DATABASE Livraria;

USE Livraria;

CREATE TABLE Leitores(
CPF VARCHAR(45) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(20) NOT NULL,
DataNasc DATE NOT NULL,
CodEndereço INT NOT NULL,
ClubeDoLivro BIT NOT NULL,
);

CREATE TABLE Endereco(
CodEndereço INT IDENTITY(1,1) PRIMARY KEY,
CPF VARCHAR(45) NOT NULL,
Cidade VARCHAR(45) NOT NULL,
TipoLocal VARCHAR(45) NOT NULL,
Logradouro VARCHAR(45) NOT NULL,
Numero INT NOT NULL,
Complemento VARCHAR(45),
);

CREATE TABLE Locaçao(
CPF VARCHAR(45) PRIMARY KEY,
ISBN VARCHAR(45) NOT NULL,
DataLocacao DATE NOT NULL,
DataDevolucao DATE NOT NULL,
)

CREATE TABLE Doaçao(
CPF VARCHAR(45) PRIMARY KEY,
ISBN VARCHAR(45) NOT NULL,
Título VARCHAR(45) NOT NULL,
)

CREATE TABLE "Compra/Venda"(
CodOperaçao INT IDENTITY(1,1) PRIMARY KEY,
CPF VARCHAR(45) NOT NULL,
ISBN VARCHAR(45) NOT NULL,
CodFuncionario VARCHAR(45) NOT NULL,
DataVenda DATE NOT NULL,
)

ALTER TABLE [Compra/Venda]
ALTER COLUMN CodFuncionario INT NOT NULL;

CREATE TABLE Funcionarios(
CodFuncionario INT IDENTITY(1,1) PRIMARY KEY,
Nome VARCHAR(45) NOT NULL,
Sobrenome VARCHAR(45) NOT NULL,
DataIngresso DATE NOT NULL,
)

CREATE TABLE Livros(
ISBN VARCHAR(45) PRIMARY KEY,
Titulo VARCHAR(45) NOT NULL,
Editora VARCHAR(45) NOT NULL,
CodAutor INT NOT NULL,
Quantidade INT,
DataInclusao DATE,
)

CREATE TABLE Autores(
CodAutor INT IDENTITY(1,1) PRIMARY KEY,
Nome VARCHAR(45) NOT NULL,
)

ALTER TABLE Leitores
	ADD CONSTRAINT fk_Endereco FOREIGN KEY(CodEndereço) REFERENCES Endereço(CodEndereço);

ALTER TABLE Locaçao
	ADD CONSTRAINT fk_LeiLoc FOREIGN KEY (CPF) REFERENCES Leitores(CPF);

ALTER TABLE Doaçao
	ADD CONSTRAINT fk_DoaLoc FOREIGN KEY (CPF) REFERENCES Leitores(CPF);

ALTER TABLE [Compra/Venda]
	ADD CONSTRAINT fk_LeiCom FOREIGN KEY (CPF) REFERENCES Leitores(CPF);

ALTER TABLE [Compra/Venda]
	ADD CONSTRAINT fk_Funcionario FOREIGN KEY(CodFuncionario) REFERENCES Funcionarios(CodFuncionario);

ALTER TABLE [Compra/Venda]
	ADD CONSTRAINT fk_ISBN FOREIGN KEY(ISBN) REFERENCES Livros(ISBN);

ALTER TABLE Livros
	ADD CONSTRAINT fk_Autor FOREIGN KEY(CodAutor) REFERENCES Autores(CodAutor);



INSERT INTO Endereço (CPF, Cidade, TipoLocal, Logradouro, Numero, Complemento)
VALUES
('09984751570', 'Camaçari', 'Rua', 'Ibicaraí', 37, 302),
('02145479570', 'Salvador', 'Avenida', 'Paralela', 28, 301),
('01145482040', 'Camaçari', 'Rua', 'Das Flores', 20, 0);

SELECT*FROM Endereço
SELECT*FROM Funcionarios

INSERT INTO Funcionarios (Nome,Sobrenome,DataIngresso)
VALUES
('Rian', 'Novais', '20151010'),
('Claudio', 'Teixeira', '20190910'),
('Ana', 'Carolina', '20201104');

INSERT INTO Autores (Nome)
VALUES
('José'),
('Carlos'),
('Sebastião');

SELECT*FROM Autores
SELECT*FROM LEITORES

ALTER TABLE Leitores
DROP COLUMN CodEndereço;

ALTER TABLE Leitores
ADD CodEndereço INT IDENTITY(1,1) NOT NULL;

ALTER TABLE Livros
DROP COLUMN CodAutor

ALTER TABLE Livros
ADD CodAutor INT IDENTITY(1,1) NOT NULL;

SELECT*FROM Livros

INSERT INTO Leitores (CPF, Nome, Sobrenome, DataNasc, ClubeDoLivro)
VALUES
('09984751570', 'Rian', 'Muniz', '20030717', 0),
('02145479570', 'Ana', 'Teixeira', '20010416', 1),
('01145482040', 'Alessandro', 'Marques', '19960108', 0);

INSERT INTO Livros (ISBN, Titulo, Editora, Quantidade , DataInclusao)
VALUES
('964-1-243123-23-1', 'ABCDE', 'Globo', 22, '20210417'),
('961-2-246893-21-2', 'DFGED', 'Globo', 2, '20210411'),
('954-0-245113-24-0', 'ZXSQW', 'Record', 10, '20100216');


SELECT*FROM Doaçao
SELECT*FROM Livros


ALTER TABLE Doaçao
ALTER COLUMN Quantidade INT NOT NULL;

ALTER TABLE Locaçao
ADD Quantidade INT NOT NULL;

TRUNCATE TABLE Doaçao

INSERT INTO Doaçao (CPF, ISBN, Título, Quantidade)
VALUES
('09984751570', '964-1-243123-23-1', 'ABCDE', 1),
('02145479570', '961-2-246893-21-2', 'DFGED', 2),
('01145482040', '954-0-245113-24-0', 'ZXSQW', 3);

INSERT INTO Leitores (CPF, Nome, Sobrenome, DataNasc, ClubeDoLivro)
VALUES
('01252631240', 'Clovis', 'Silveira', '20011002', 0),
('10236541239', 'Amanda', 'Souza', '20000705', 1),
('10589314025', 'Roberto', 'Nunes', '19920125', 0);

INSERT INTO Locaçao(CPF, ISBN, Quantidade, DataLocacao,DataDevolucao)
VALUES
('10236541239' , '954-0-245113-24-0', 1 , '20210920', '20211110'),
('10589314025', '961-2-246893-21-2', 2, '20210820', '20211010');


INSERT INTO [Compra/Venda] (CPF, CodFuncionario, ISBN, DataVenda)
VALUES
('10236541239',2, '954-0-245113-24-0', '20210905');

SELECT*FROM [Compra/Venda]

INSERT INTO [Compra/Venda] (CPF, CodFuncionario, ISBN, DataVenda)
VALUES
('10236541219',2, '954-0-245113-24-2', '20210915');

TRUNCATE TABLE [Compra/Venda]


ALTER TABLE [Compra/Venda]
ADD Quantidade INT NOT NULL;

INSERT INTO [Compra/Venda] (CPF, CodFuncionario, ISBN, DataVenda, Quantidade)
VALUES
('10236541219',2, '954-0-245113-24-2', '20210915',1);

TRUNCATE TABLE Livros;
TRUNCATE TABLE Leitores;
TRUNCATE TABLE Autores;
TRUNCATE TABLE Funcionarios;
TRUNCATE TABLE [Compra/Venda];
TRUNCATE TABLE Endereço;
TRUNCATE TABLE Doaçao;
TRUNCATE TABLE Locaçao;

SELECT*FROM Autores
SELECT*FROM Livros
SELECT*FROM Funcionarios
SELECT*FROM [Compra/Venda]
SELECT*FROM Endereço
SELECT*FROM Leitores
SELECT*FROM Locaçao
SELECT*FROM Doaçao

INSERT INTO Autores (Nome)
VALUES
('Napoleon Hill'),
('Jorge Amado'),
('Guimarães Rosa'),
('Machado de Assis'),
('William Shakespeare'),
('Clarice Linspector'),
('Augusto Cury'),
('George R.R Martin'),
('J.K Rowling'),
('George Orwell');

INSERT INTO Endereço(CPF, Cidade, TipoLocal, Logradouro, Numero, Complemento)
VALUES
('045.254.365-70', 'Camaçari', 'Rua', 'Das Araras', '37',''),
('012.126.124-9', 'Camaçari', 'Avenida', 'Getulio Vargas', '16', ''),
('291.889.915-11', 'Camaçari', 'Rua', 'Nova Esperança', '12', ''),
('112.869.935-16', 'Camaçari', 'Rua', 'Boa Sorte', '11', ''),
('113.869.935-23', 'Camaçari', 'Rua', 'Quatorze', '23', '32'),
('354.869.935-43', 'Camaçari', 'Rua', 'São João', '54', '21'),
('232.869.935-11', 'Camaçari', 'Rua', 'Sete De Setembro', '23', ''),
('111.869.935-11', 'Camaçari', 'Rua', 'Quinze De Novembro', '61', '4'),
('152.869.935-29', 'Camaçari', 'Rua', 'Tiradentes', '161', ''),
('102.869.935-15', 'Camaçari', 'Rua', 'Rui Barbosa', '173', '');

INSERT INTO Leitores (CPF, Nome, Sobrenome, DataNasc, ClubeDoLivro)
VALUES
('045.254.365-70', 'Rian', 'Muniz', '20030110', 1);

INSERT INTO Leitores (CPF, Nome, Sobrenome, DataNasc, ClubeDoLivro)
VALUES
('012.126.124-9', 'Claudia', 'Teixeira', '20010120', 1),
('291.889.915-11', 'Roberto', 'Almeida', '19920430', 0),
('112.869.935-16', 'Juliana', 'Ribeiro', '20010410', 1),
('113.869.935-23', 'Antonio', 'Peixoto', '19891210', 0),
('354.869.935-43', 'Claudio', 'Fragoso', '19991005', 0),
('232.869.935-11', 'Carlos', 'Fragoso', '19970420', 1),
('152.869.935-29', 'Maristela', 'Silva', '19761120', 0);

INSERT INTO Funcionarios(Nome, Sobrenome, DataIngresso)
VALUES
('Antonio ','José','20191021'),
('Carlos','Fonseca','20201001'),
('Maria','Das Dores','20211001'),
('Marina','Reis','20181023'),
('Carla','Silva','20180920');

INSERT INTO Doaçao (CPF,ISBN,Título,Quantidade)
VALUES
('152.869.935-29', '978-3-16-148410-0','Abc',1),
('112.869.935-16', '924-3-15-125810-1','Cde', 2);

INSERT INTO Locaçao (CPF, ISBN, DataLocacao, DataDevolucao, Quantidade)
VALUES
('113.869.935-23', '921-3-14-125021-0', '20210910', '20210930', 2),
('354.869.935-43', '911-1-12-125011-1', '20210811', '20210829', 1),
('012.126.124-9', '921-3-14-125021-0', '20210910', '20210930', 4);

INSERT INTO Livros (ISBN, Titulo,Editora, Quantidade,DataInclusao)
VALUES
('978-3-16-148410-0', 'Abc', 'Record', 2, '20210910'),
('924-3-15-125810-1', 'Cde', 'Companhia Das Letras', 1,'20210810'),
('914-2-12-123456-1', 'Zxw', 'Novos Territorios', 2, '20210711'),
('215-2-12-142761-1', 'Qxw', 'Intriseca' , 11, '20201212'),
('005-2-45-161131-2', 'Axw', 'Veneta', 24, '20210818');

INSERT INTO [Compra/Venda] (CPF, ISBN, CodFuncionario, DataVenda, Quantidade)
VALUES
('354.869.935-43', '245-5-15-252126-1',2,'20210113',3),
('232.869.935-11', '415-5-12-348512-0', 1, '20201010', 2);

-- Qual Autor com mais livros?
SELECT max(Count(CodAutor))
FROM Livros group by CodAutor;


TRUNCATE TABLE Autores;