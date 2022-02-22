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

--