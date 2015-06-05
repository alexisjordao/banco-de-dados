CREATE TABLE Credito (
  idCredito SERIAL NOT NULL,
  valor INTEGER NULL,
  PRIMARY KEY(idCredito)
);

/*Insets ok*/
CREATE TABLE Endereco (
  idEndereco SERIAL NOT NULL,
  rua VARCHAR(60) NULL,
  bairro VARCHAR(30) NULL,
  numero INTEGER NULL,
  CEP VARCHAR(9) NULL,
  cidade VARCHAR(60) NOT NULL,
  UF VARCHAR(2) NOT NULL,
  PRIMARY KEY(idEndereco)
);

CREATE TABLE Brinquedo (
  idBrinquedo SERIAL NOT NULL,
  descricao VARCHAR(40) NOT NULL,
  dataChegada DATE NOT NULL,
  dataUltimoUso DATE NULL,
  frequenciaUso INTEGER NOT NULL,
  ticketPremioMax INTEGER NULL,
  ticketsCurrBrinquedo INTEGER NULL,
  preco REAL NOT NULL,
  tipoBrinquedo CHAR NULL,
  PRIMARY KEY(idBrinquedo)
);

/*Inserts OK*/
CREATE TABLE Pessoa (
  idPessoa SERIAL NOT NULL,
  idEndereco INTEGER NOT NULL REFERENCES Endereco,
  nome VARCHAR(60) NOT NULL,
  CPF VARCHAR(15) NOT NULL UNIQUE,
  dataNascimento DATE NOT NULL,
  sexo CHAR(1) CHECK (sexo='M' or sexo='F'),
  PRIMARY KEY(idPessoa)
);

/*Inserts ok*/
CREATE TABLE Telefone (
  idTelefone SERIAL NOT NULL,
  idPessoa INTEGER NOT NULL REFERENCES Pessoa,
  tipoTelefone VARCHAR(20) NULL,
  numero VARCHAR(9) NULL,
  DDD VARCHAR(3) NULL,
  PRIMARY KEY(idTelefone)
);

/*Inserts OK*/
CREATE TABLE Cliente (
  idCliente SERIAL NOT NULL,
  idPessoa INTEGER NOT NULL REFERENCES Pessoa,
  dataCadatro DATE NOT NULL, /*correção de erro -> cadatro - cadastro*/
  PRIMARY KEY(idCliente)
);

CREATE TABLE Cartao (
  idCartao SERIAL NOT NULL,
  idCliente INTEGER NOT NULL REFERENCES Cliente,
  dataEmissao DATE NOT NULL,
  saldo REAL NULL,
  ativo BOOL NOT NULL,
  PRIMARY KEY(idCartao)
);

/*Inserts OK*/
CREATE TABLE Funcionario (
  idFuncionario SERIAL NOT NULL,
  idPessoa INTEGER NOT NULL REFERENCES Pessoa,
  numCarteiraDeTrabalho VARCHAR(20) NOT NULL,
  dataAdmissao DATE NOT NULL,
  dataDemissao DATE NULL,
  PRIMARY KEY(idFuncionario)
);

CREATE TABLE CompraCredito (
  idCompraCredito SERIAL NOT NULL,
  idCredito INTEGER NOT NULL REFERENCES Credito,
  idCartao INTEGER NOT NULL REFERENCES Cartao,
  dataCompra DATE NOT NULL,
  PRIMARY KEY(idCompraCredito)
);

CREATE TABLE Debito (
  idDebito SERIAL NOT NULL,
  idBrinquedo INTEGER NOT NULL REFERENCES Brinquedo,
  idCartao INTEGER NOT NULL REFERENCES Cartao,
  dataDebito DATE NOT NULL,
  PRIMARY KEY(idDebito)
);

/*Inserts OK*/
CREATE TABLE Premio (
  idPremio SERIAL NOT NULL,
  descricao VARCHAR(60) NOT NULL,
  qntTickets INTEGER NOT NULL,
  PRIMARY KEY(idPremio)
);

/*Inserts OK*/
CREATE TABLE Obter (
  idObter SERIAL NOT NULL,
  idCliente INTEGER NOT NULL REFERENCES Cliente,
  idPremio INTEGER NOT NULL REFERENCES Premio,
  dataObtencao DATE NOT NULL,
  PRIMARY KEY(idObter)
);

/*Inserts OK*/
CREATE TABLE Gerente (
  idGerente SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idGerente)
);

/*Inserts OK*/
CREATE TABLE OperadorDeBrinquedo (
  idOperadorDeBrinquedo SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idOperadorDeBrinquedo)
);

/*Inserts OK*/
CREATE TABLE Tecnico (
  idSuporteTecnico SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idSuporteTecnico)
);

/*Inserts OK*/
CREATE TABLE Salario (
  idSalario SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  valor REAL NOT NULL,
  PRIMARY KEY(idSalario)
);

/*Inserts OK*/
CREATE TABLE Seguranca (
  idSeguranca SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idSeguranca)
);

/*Inserts OK*/
CREATE TABLE Balconista (
  idBalconista SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idBalconista)
);

/*Inserts OK*/
CREATE TABLE ASG (
  idASG SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idASG)
);

CREATE TABLE Opera (
  idOpera SERIAL NOT NULL,
  idBrinquedo INTEGER NOT NULL REFERENCES Brinquedo,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  idOperadorDeBrinquedo INTEGER NOT NULL REFERENCES OperadorDeBrinquedo,
  diaSemana VARCHAR(7) NULL,
  PRIMARY KEY(idOpera)
);

CREATE TABLE Conserta (
  idConserta SERIAL NOT NULL,
  idBrinquedo INTEGER NOT NULL REFERENCES Brinquedo,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  idSuporteTecnico INTEGER NOT NULL REFERENCES Tecnico,
  diaSemana DATE NOT NULL,
  PRIMARY KEY(idConserta)
);

/*-----------------------------------------------------------------------------------------------*/

/*Inserts Endereço  http://www.qualocep.com/busca-endereco//natal/RN  */
INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Avenida Presidente Café Filho', 'Praia do Meio', 101, '59010-000', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Travessa Presidente Café Filho', 'Praia do Meio', 102, '59010-005', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Praça Miguel Carrilho', 'Praia do Meio', 103, '59010-008', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Rua Capitão-Mor Gouveia', 'Praia do Meio', 104, '59010-010', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Rua Miramar', 'Praia do Meio', 105, '59010-015', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Rua Feliciano Coelho', 'Praia do Meio', 106, '59010-020', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Rua Mascarenha Homem', 'Praia do Meio', 107, '59010-025', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Avenida Vinte e Cinco de Dezembro', 'Praia do Meio', 108, '59010-030', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Rua Vinte e Cinco de Dezembro', 'Praia do Meio', 109, '59010-035', 'Natal', 'RN');

INSERT INTO Endereco(rua, bairro, numero, CEP, cidade, UF)
values('Travessa Vinte e Cinco de Dezembro', 'Praia do Meio', 109, '59010-036', 'Natal', 'RN');

/*Inserts Pessoa 
Nome: https://sigaa.ufrn.br/sigaa/public/curso/alunos.jsf?lc=pt_BR&id=96054058
CPF: http://www.geradorcpf.com/
*/
INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(1, 'ÁBIDA HELLEN BARROS PEREIRA', '657.872.430-30', '1992-03-12', 'F');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(2, 'ABÍLIO GABRIEL MAIA DE LIMA', '577.325.963-07', '1992-04-12', 'M');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(3, 'BÁRBARA JULIANA NUNES REGO SILVA', '291.441.275-45', '1983-10-22', 'F');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(4, 'BEATRIZ ARAÚJO MEDEIROS', '176.445.645-94', '1991-10-22', 'F');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(5, 'CAIO ANDRÉ FERNANDES BATISTA', '455.044.334-01', '1984-11-20', 'M');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(6, 'CAIO BRENO ARAUJO DE PAIVA', '745.465.875-03', '1968-09-02', 'M');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(7, 'DAIANE MEDEIROS DE ARAÚJO', '181.413.318-68', '1993-12-21', 'F');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(8, 'DAILSON GOMES DE ASSIS', '444.764.488-60', '1981-11-11', 'M');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(9, 'EDENILTON JOSE DE SOUSA', '686.317.135-03', '1972-02-20', 'M');

INSERT INTO Pessoa(idEndereco, nome, CPF, dataNascimento, sexo)
values(10, 'EDER FERREIRA DO NASCIMENTO JÚNIOR', '976.372.912-27', '1990-07-28', 'M');

/*Inserts Telefone  http://pt.fakenamegenerator.com/gen-male-br-br.php  */
INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(1, 'residencial', '2006-3823', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(2, 'residencial', '3239-4896', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(3, 'residencial', '3728-7440', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(4, 'residencial', '6499-3340', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(5, 'residencial', '7856-2314', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(6, 'celular', '5238-4542', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(7, 'celular', '3352-5559', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(8, 'celular', '9599-7075', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(9, 'celular', '6206-3053', '084');

INSERT INTO Telefone(idPessoa, tipoTelefone, numero, DDD)
values(10, 'celular', '4034-8072', '084');

/*Inserts Funcionario*/
INSERT INTO Funcionario(idPessoa, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(1, '120.23362.99-9', '2010-05-02', NULL);

INSERT INTO Funcionario(idPessoa, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(2, '102.24445.88-2', '2015-03-20', NULL);

INSERT INTO Funcionario(idPessoa, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(3, '192.90362.86-9', '2014-06-12', NULL);

INSERT INTO Funcionario(idPessoa, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(4, '936.84527.23-5', '2012-11-20', NULL);

INSERT INTO Funcionario(idPessoa, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(5, '294.04518.12-4', '2013-12-12', NULL);

INSERT INTO Funcionario(idPessoa, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(6, '274.84516.26-2', '2015-05-02', NULL);

/*Inserts Gerente*/
INSERT INTO Gerente(idFuncionario)
values(1);

/*Inserts OperadorDeBrinquedo*/
INSERT INTO OperadorDeBrinquedo(idFuncionario)
values(2);

/*Inserts Tecnico*/
INSERT INTO Tecnico(idFuncionario)
values(3);

/*Inserts Seguranca*/
INSERT INTO Seguranca(idFuncionario)
values(4);

/*Inserts Balconista*/
INSERT INTO Balconista(idFuncionario)
values(5);

/*Inserts ASG*/
INSERT INTO ASG(idFuncionario)
values(6);

/*Inserts Salario*/
INSERT INTO Salario(idFuncionario, valor) 
values(6, 1000); /*ASG*/

INSERT INTO Salario(idFuncionario, valor)
values(5, 1000); /*Balsonista*/

INSERT INTO Salario(idFuncionario, valor)
values(1, 3000); /*Gerente*/

INSERT INTO Salario(idFuncionario, valor)
values(2, 1000); /*OperadorDeBrinquedo*/

INSERT INTO Salario(idFuncionario, valor)
values(4, 1500); /*Segurança*/

INSERT INTO Salario(idFuncionario, valor)
values(3, 2000); /*Tecnico*/

/*Inserts Cliente*/
INSERT INTO Cliente(idPessoa, dataCadatro)
values(7, '2015-03-12');

INSERT INTO Cliente(idPessoa, dataCadatro)
values(8, '2012-10-22');

INSERT INTO Cliente(idPessoa, dataCadatro)
values(9, '2013-06-28');

INSERT INTO Cliente(idPessoa, dataCadatro)
values(10, '2014-09-30');

/*Inserts Premio*/
INSERT INTO Premio(descricao, qntTickets)
values('Bola de Futebol', 100);

INSERT INTO Premio(descricao, qntTickets)
values('Camisa Personalizada', 150);

/*Inserts Obter*/
INSERT INTO Obter(idCliente, idPremio, dataObtencao)
values(1, 1, '2015-05-12');

INSERT INTO Obter(idCliente, idPremio, dataObtencao)
values(2, 2, '2014-10-10');

/*-----------------------------------------------------------------------------------------------*/


SELECT cr.idCredito, cr.valor FROM Credito cr
SELECT e.idEndereco, e.rua, e.bairro, e.numero, e.CEP, e.cidade, e.UF FROM Endereco e
SELECT b.idBrinquedo, b.descricao, b.dataChegada, b.dataUltimoUso, b.frequenciaUso, b.ticketPremioMax, b.ticketsCurrBrinquedo, b.preco, b.tipoBrinquedo FROM Brinquedo b
SELECT p.idPessoa, p.idEndereco, p.nome, p.CPF, p.dataNascimento FROM Pessoa p
SELECT tel.idTelefone, tel.idPessoa, tel.tipoTelefone, tel.numero, tel.DDD FROM Telefone tel
SELECT cl.idCliente, cl.idPessoa, cl.dataCadatro FROM Cliente cl
SELECT ca.idCartao, ca.idCliente, ca.dataEmissao, ca.saldo, ca.ativo FROM Cartao ca
SELECT f.idFuncionario, f.idPessoa, f.numCarteiraDeTrabalho,f.dataAdmissao, f.dataDemissao FROM Funcionario f
SELECT cc.idCompraCredito, cc.idCredito, cc.idCartao, cc.dataCompra FROM CompraCredito cc
SELECT d.idDebito, d.idBrinquedo, d.idCartao, d.dataDebito FROM Debito d
SELECT pr.idPremio, pr.idCliente, pr.descricao, pr.qntTickets FROM Premio pr
SELECT g.idGerente, g.idFuncionario FROM Gerente g
SELECT ob.idOperadorDeBrinquedo, ob.idFuncionario FROM OperadorDeBrinquedo ob
SELECT tec.idSuporteTecnico, tec.idFuncionario FROM Tecnico tec
SELECT sa.idSalario, sa.idFuncionario, sa.valor FROM Salario sa
SELECT se.idSeguranca, se.idFuncionario FROM Seguranca se
SELECT ba.idBalconista, ba.idFuncionario FROM Balconista ba
SELECT asg.idASG, asg.idFuncionario FROM ASG asg
SELECT op.idOpera, op.idBrinquedo, op.idFuncionario,op.idOperadorDeBrinquedo, op.diaSemana FROM Opera op
SELECT co.idConserta, co.idBrinquedo, co.idFuncionario,co.idSuporteTecnico, co.diaSemana FROM Conserta co
