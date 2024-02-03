CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

DROP DATABASE Oficina;

-- CLIENTES
CREATE TABLE Clientes (
	idClientes INT auto_increment PRIMARY KEY,
    idVeiculo INT,
    CONSTRAINT fk_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
    );
DESC Clientes;

-- VEICULOS
CREATE TABLE Veiculos (
	idVeiculo INT auto_increment PRIMARY KEY,
    idRevisão INT,
    Placa CHAR(7) NOT NULL,
    constraint placa_idVeiculo UNIQUE (idVeiculo, Placa)
    );
alter table Veiculo ADD CONSTRAINT fk_eqp_mec FOREIGN KEY (idVeiculo) REFERENCES EqpMec(idEqpMec),
ADD CONSTRAINT fk_conserto foreign key (idVeiculo) references Conserto(idConserto),
ADD CONSTRAINT fk_revisao foreign key (idRevisão) references Revisão(idRevisão);
DESC Veiculos;

-- PF
CREATE TABLE PF (
	idPF INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereço VARCHAR(45),
    Contato CHAR(11)
    );
ALTER TABLE PF ADD CONSTRAINT unique_cpf_PF UNIQUE (CPF);
ALTER TABLE PF ADD CONSTRAINT fk_idClientes_pf FOREIGN KEY (idPF) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_cliente_pf FOREIGN KEY (idClientePf) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_veiculo_pf FOREIGN KEY (idPF) REFERENCES Veiculo(idVeiculo);

DESC PF;

-- PJ
CREATE TABLE PJ (
	idPJ INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Endereço VARCHAR(45),
    Contato CHAR(11),
    Constraint unique_cnpj_PJ UNIQUE (CNPJ)
    );
ALTER TABLE PF CONSTRAINT fk_clientes_pj FOREIGN KEY (idPJ) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_veiculos_pj FOREIGN KEY (idPJ) REFERENCES Veiculo(idVeiculo);
DESC PJ;

-- CONSERTO
CREATE TABLE Conserto (
	idConserto INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45) NOT NULL
    );
DESC Conserto;

-- REVISÃO
CREATE TABLE Revisão (
	idRevisão INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45) NOT NULL
    );
DESC Revisão;

-- MECANICO
CREATE TABLE Mec (
	idMec INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereço VARCHAR(45) NOT NULL,
    Especialidade VARCHAR(45) NOT NULL
    );
DESC Mec;

-- EQUIPE MECÂNICOS
CREATE TABLE EqpMec (
	idEqpMec INT auto_increment PRIMARY KEY
    );

ALTER TABLE EqpMec ADD CONSTRAINT fk_EqpMec FOREIGN KEY (idEqpMec) REFERENCES Mec(idMec),
ALTER TABLE OS ADD CONSTRAINT fk_OS FOREIGN KEY (idOS) REFERENCES OS(idOS);

DESC EqpMec;

-- ORDEM DE SERVIÇO
CREATE TABLE OS (
	idOS INT auto_increment PRIMARY KEY,
    DataEmissão DATE,
    ValorSv FLOAT NOT NULL,
    ValorPeça FLOAT NOT NULL,
    ValorTotal FLOAT NOT NULL,
    Status ENUM('NÃO REALIZADO', 'EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO'),
    DataConclusão DATE
    );

SELECT * FROM OS ORDER BY DataEmissão;
SELECT * FROM OS ORDER BY ValorTotal;
DESC OS;

-- REFERENCIA DE PREÇOS
CREATE TABLE ReferenciaPreços(
	idReferenciaPreços INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_referencia_precos FOREIGN KEY (idReferenciaPreços) REFERENCES OdServiço(idOdServiço)
);

DESC ReferenciaPreços;

-- AUTORIZAÇÃO CLIENTE
CREATE TABLE Autorização(
	idAutorização INT auto_increment PRIMARY KEY,
	Autorizado BOOL DEFAULT FALSE,
    CONSTRAINT fk_autorização_cliente FOREIGN KEY (idAutorização) REFERENCES Clientes(idClientes),
    CONSTRAINT fk_autorização_veiculo FOREIGN KEY (idAutorização) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_autorização_OdServiço FOREIGN KEY (idAutorização) REFERENCES OdServiço(idOdServiço)
);

DESC Autorização;

-- PEÇAS
CREATE TABLE Pecas(
	idPecas INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45),
    Valor FLOAT NOT NULL
);

DESC Pecas;

-- OS PEÇAS
CREATE TABLE OsPecas(
	idOsPecas INT auto_increment PRIMARY KEY,
	CONSTRAINT fk_pecas FOREIGN KEY (idOsPecas) REFERENCES Pecas(idPecas),
    CONSTRAINT fk_os_pecas FOREIGN KEY (idOsPecas) REFERENCES OdServiço(idOdServiço)
);

DESC OsPecas;

-- SERVIÇOS
CREATE TABLE Serviços(
	idServiços INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45),
    Valor FLOAT NOT NULL
);

DESC Serviços;

-- ORDEM DE SERVIÇO
CREATE TABLE OdServiço(
	idOdServiço INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_serviços FOREIGN KEY (idOdServiço) REFERENCES Serviços(idServiços),
    CONSTRAINT fk_os_serviços FOREIGN KEY (idOdServiço) REFERENCES OdServiço(idOdServiço)
);

DESC OdServiço;