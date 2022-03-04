CREATE DATABASE Livraria;
USE Livraria;

CREATE TABLE TB_EDITORAS(
idEditora INTEGER auto_increment NOT NULL,
nome VARCHAR(30) NOT NULL,
telefone CHAR(15) NOT NULL,
CONSTRAINT PK_idEditora PRIMARY KEY (idEditora)
);

CREATE TABLE TB_ENDERECOCLIENTE(
idEndereco INTEGER auto_increment NOT NULL,
Estado VARCHAR(20) NOT NULL,
Cidade VARCHAR(20) NOT NULL,
Logradouro VARCHAR(60) NOT NULL,
CONSTRAINT PK_idEndereco PRIMARY KEY(idEndereco)
);

CREATE TABLE TB_CLIENTES(
idCliente INTEGER auto_increment NOT NULL,
Nome VARCHAR(30),
Sobrenome VARCHAR(30),
CPF BIGINT NOT NULL,
idEndereco INTEGER NOT NULL,
CONSTRAINT PK_idCliente PRIMARY KEY(idCliente),
CONSTRAINT fk_idEndereco FOREIGN KEY (idEndereco) REFERENCES TB_ENDERECOCLIENTE(idEndereco)
);
CREATE TABLE TB_CLIENTESBACKUP(
idCliente INTEGER NOT NULL,
Nome VARCHAR(30),
Sobrenome VARCHAR(30),
CPF BIGINT NOT NULL,
idEndereco INTEGER NOT NULL
);


CREATE TABLE TB_AUTORES(
idAutor INTEGER auto_increment NOT NULL,
Nome VARCHAR(20) NOT NULL,
Sobrenome VARCHAR(20) NOT NULL,
CONSTRAINT PK_idAutor PRIMARY KEY (idAutor)
);

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
);

CREATE TABLE TB_FUNCIONARIOS(
idFuncionario INTEGER auto_increment NOT NULL,
Nome VARCHAR(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
DataIngresso DATE NOT NULL,
StatusMeta BOOLEAN NOT NULL DEFAULT false,
CONSTRAINT PK_idFuncionario PRIMARY KEY (idFuncionario)
);
CREATE TABLE TB_FUNCIONARIOSHISTORICO(
idFuncionario INTEGER NOT NULL,
Nome VARCHAR(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
DataIngresso DATE NOT NULL
);

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
);

CREATE TABLE TB_PEDIDOS(
idPedido INTEGER auto_increment NOT NULL,
idVendas INTEGER NOT NULL,
idLivro INTEGER NOT NULL,
qtdePedido INT NOT NULL,
CONSTRAINT PK_idPedido PRIMARY KEY (idPedido),
CONSTRAINT FK_idLivro FOREIGN KEY (idLivro) REFERENCES TB_LIVROS(idLivro),
CONSTRAINT FK_idVendas FOREIGN KEY (idVendas) REFERENCES TB_VENDAS(idVenda)
);
CREATE TABLE TB_METAMENSAL(
	ValorMeta DECIMAL(10,2) NOT NULL,
	MesMeta VARCHAR(25) NOT NULL,
	AnoMeta YEAR DEFAULT 2022
);
INSERT INTO TB_METAMENSAL(ValorMeta, MesMeta, AnoMeta)
VALUES
(150.00, "Fervereiro",2020);
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

INSERT INTO TB_ENDERECOCLIENTE(Estado, Cidade, Logradouro)
VALUES
('SP','São Paulo','Rua Dos Frades, 37 Itaim Bibi'),
('SP','Santos','Rua Paulo Afonso, 32 Largo Nov'),
('BA','Camacari','Rua Ibicaraí, 21, Gleba C'),
('BA','Salvador','Avenida ACM, 38, Itaigara'),
('MG','Uberlândia','Avenida Getulio Vargas, 34'),
('BA','Lauro de Freitas','Estrada do Coco, km 6,Portão'),
('BA','Camacari','Rua Ibicaraqui, 24, Gleba Z');

INSERT INTO TB_CLIENTES(Nome,Sobrenome,CPF,idEndereco)
VALUES
('Rian','Novais','05656246510',1),
('Cláudio','Peixoto','05645252620',2),
('Maria','Souza','62653226610',3),
('Luciana','Menezes','65652626570',4),
('Carlos','Silveira','35489693568',5),
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
(7,10,'25920373837','Ponto de Impacto',54.50,'Ficção-Cientifica'),
(7,10,'25926378290','Código DaVinci',80.45,'Ficção-Cientifica'),
(8,9,'36557552677','Jogos Vorazes',32.50,'Infanto-Juvenil'),
(8,9,'36558789378','Jogos Vorazes: Em Chamas',32.50,'Infanto-Juvenil'),
(8,9,'36557467866','Jogos Vorazes: A Esperança',42.90,'Infanto-Juvenil'),
(9,8,'78352388778','Assassinato no Expresso Oriente',30.50,'Misterio');

INSERT INTO TB_FUNCIONARIOS(Nome,Sobrenome,DataIngresso)
VALUES
('João','Guilherme','20101015'),
('Antonio', 'Silveira','20100112'),
('Giovana', 'Fagundes','20120821'),
('Carol', 'Silva','20130529'),
('Claudio','Costa','20200228');

INSERT INTO TB_VENDAS(idCliente, idFuncionario, dataVenda, descontoVenda, valorBrutoVenda)
VALUES
(1, 2, '20211215',0, 99.90),
(2, 3, '20211113',5, 99.90),
(3, 2, '20211209',20, 203.50),
(6, 1, '20211210',15, 134.95),
(7, 5, '20211224',0, 23.95 ),
(7, 5, '20220104',10, 43.45 ),
(3, 5, '20220330',20, 107.90);

INSERT INTO TB_PEDIDOS(idVendas, idLivro,qtdePedido)
VALUES
(1, 4, 1),
(2, 1, 2),
(3, 2, 1),
(3, 3, 4),
(4, 15, 1),
(4, 16, 1),
(5, 12, 1),
(6, 11, 1),
(6, 13, 1),
(6,14,1),
(7,17,1),
(7,18,1),
(7,19,1);