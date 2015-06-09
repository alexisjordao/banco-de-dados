CREATE TABLE Credito (
  idCredito SERIAL NOT NULL,
  valor INTEGER NOT NULL UNIQUE,
  PRIMARY KEY(idCredito)
);

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
  ticketsAttBrinquedo INTEGER NULL,
  preco REAL NOT NULL,
  tipoBrinquedo CHAR NULL,
  PRIMARY KEY(idBrinquedo)
);

CREATE TABLE Pessoa (
  idPessoa SERIAL NOT NULL,
  idEndereco INTEGER NOT NULL REFERENCES Endereco,
  nome VARCHAR(60) NOT NULL,
  CPF VARCHAR(15) NOT NULL UNIQUE,
  dataNascimento DATE NOT NULL,
  sexo CHAR(1) CHECK (sexo='M' or sexo='F'),
  PRIMARY KEY(idPessoa)
);

CREATE TABLE Telefone (
  idTelefone SERIAL NOT NULL,
  idPessoa INTEGER NOT NULL REFERENCES Pessoa,
  tipoTelefone VARCHAR(20) NULL,
  numero VARCHAR(9) NULL,
  DDD VARCHAR(3) NULL,
  PRIMARY KEY(idTelefone)
);

CREATE TABLE Cliente (
  idCliente SERIAL NOT NULL,
  idPessoa INTEGER NOT NULL REFERENCES Pessoa,
  dataCadastro DATE NOT NULL,
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

CREATE TABLE Cargo(
  idCargo SERIAL NOT NULL,
  descricao VARCHAR(60) UNIQUE CHECK (descricao IN ('Gerente', 'Recepcionista', 'Operador de Brinquedo', 'Segurança', 'Técnico', 'Auxiliar de Serviços Gerais')),
  salario REAL NOT NULL,
  PRIMARY KEY(idCargo)
);

CREATE TABLE Funcionario (
  idFuncionario SERIAL NOT NULL,
  idPessoa INTEGER NOT NULL REFERENCES Pessoa,
  numCarteiraDeTrabalho VARCHAR(20) NOT NULL UNIQUE,
  idCargo INTEGER NOT NULL REFERENCES Cargo,
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

CREATE TABLE EstoquePremio (
  idEstoquePremio SERIAL NOT NULL,
  quantidadeItemPremio INTEGER NOT NULL,
  PRIMARY KEY(idEstoquePremio)
);

CREATE TABLE ItemPremio (
  idItemPremio SERIAL NOT NULL,
  idEstoquePremio INTEGER NOT NULL REFERENCES EstoquePremio,
  descricao VARCHAR(60) NOT NULL,
  qntTickets INTEGER NOT NULL,
  PRIMARY KEY(idItemPremio)
);

CREATE TABLE Obter (
  idObter SERIAL NOT NULL,
  idCliente INTEGER NOT NULL REFERENCES Cliente,
  idItemPremio INTEGER NOT NULL REFERENCES ItemPremio,
  dataObtencao DATE NOT NULL,
  PRIMARY KEY(idObter)
);

CREATE TABLE Opera (
  idOpera SERIAL NOT NULL,
  idBrinquedo INTEGER NOT NULL REFERENCES Brinquedo,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  diaSemana VARCHAR(20) NULL CHECK (diaSemana IN ('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarda-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado')),
  PRIMARY KEY(idOpera)
);

CREATE TABLE Conserta (
  idConserta SERIAL NOT NULL,
  idBrinquedo INTEGER NOT NULL REFERENCES Brinquedo,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  diaSemana VARCHAR(20) NULL CHECK (diaSemana IN ('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarda-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado')),
  PRIMARY KEY(idConserta)
);

/* Todos valores dos créditos que podem ser comprados */
SELECT cr.idCredito, cr.valor FROM Credito cr;

/* Todos os endereços */
SELECT e.idEndereco, e.rua, e.bairro, e.numero, e.CEP, e.cidade, e.UF FROM Endereco e;

/* Todos os brinquedos */
SELECT b.idBrinquedo, b.descricao, b.dataChegada, b.dataUltimoUso, b.frequenciaUso, b.ticketPremioMax, b.ticketsAttBrinquedo, b.preco, b.tipoBrinquedo FROM Brinquedo b;

/* Todas as pessoas */
SELECT p.idPessoa, p.idEndereco, p.nome, p.CPF, p.dataNascimento FROM Pessoa p;

/* Todos os telefones */
SELECT tel.idTelefone, tel.idPessoa, tel.tipoTelefone, tel.numero, tel.DDD FROM Telefone tel;

/* Todos os clientes*/
SELECT cl.idCliente, cl.idPessoa, cl.dataCadastro FROM Cliente cl;

/* Todos os cartões */
SELECT ca.idCartao, ca.idCliente, ca.dataEmissao, ca.saldo, ca.ativo FROM Cartao ca;

/* Todos os cargos */
SELECT  car.idCargo, car.descricao, car.salario FROM Cargo car;

/* Todos os funcionários*/
SELECT f.idFuncionario, f.idPessoa, f.numCarteiraDeTrabalho,f.dataAdmissao, f.dataDemissao FROM Funcionario f;

/* Todas as compras*/
SELECT cc.idCompraCredito, cc.idCredito, cc.idCartao, cc.dataCompra FROM CompraCredito cc;

/* Todos os débitos*/
SELECT d.idDebito, d.idBrinquedo, d.idCartao, d.dataDebito FROM Debito d;

/* Todos os premios*/
SELECT pr.idItemPremio, pr.descricao, pr.qntTickets FROM ItemPremio pr;

/* Todos os premios obtidos*/
SELECT obt.idObter, obt.idCliente, obt.idItemPremio,  obt.dataObtencao FROM Obter obt;

/* Todos os funcionários que operam brinquedos*/
SELECT op.idOpera, op.idBrinquedo, op.idFuncionario, op.diaSemana FROM Opera op;

/* Todos os funcionários que consertam brinquedos*/
SELECT co.idConserta, co.idBrinquedo, co.idFuncionario, co.diaSemana FROM Conserta co;

--Views:
/* Todos valores dos créditos que podem ser comprados */
CREATE VIEW valores_dos_creditos AS SELECT cr.idCredito, cr.valor FROM Credito cr;

/* Todos os endereços */
CREATE VIEW enderecos AS SELECT e.idEndereco, e.rua, e.bairro, e.numero, e.CEP, e.cidade, e.UF FROM Endereco e;

/* Todos os brinquedos */
CREATE VIEW brinquedos AS SELECT b.idBrinquedo, b.descricao, b.dataChegada, b.dataUltimoUso, b.frequenciaUso, b.ticketPremioMax, b.ticketsAttBrinquedo, b.preco, b.tipoBrinquedo FROM Brinquedo b;

/* Todas as pessoas */
CREATE VIEW pessoas AS SELECT p.idPessoa, p.idEndereco, p.nome, p.CPF, p.dataNascimento FROM Pessoa p;

/* Todos os telefones */
CREATE VIEW telefones AS SELECT tel.idTelefone, tel.idPessoa, tel.tipoTelefone, tel.numero, tel.DDD FROM Telefone tel;

/* Todos os clientes*/
CREATE VIEW clientes AS SELECT cl.idCliente, cl.idPessoa, cl.dataCadastro FROM Cliente cl;

/* Todos os cartões */
CREATE VIEW cartoes AS SELECT ca.idCartao, ca.idCliente, ca.dataEmissao, ca.saldo, ca.ativo FROM Cartao ca;

/* Todos os cargos */
CREATE VIEW cargos AS SELECT car.idCargo, car.descricao, car.salario FROM Cargo car;

/* Todos os funcionários*/
CREATE VIEW funcionarios AS SELECT f.idFuncionario, f.idPessoa, f.numCarteiraDeTrabalho,f.dataAdmissao, f.dataDemissao FROM Funcionario f;

/* Todas as compras*/
CREATE VIEW compras_de_credito AS SELECT cc.idCompraCredito, cc.idCredito, cc.idCartao, cc.dataCompra FROM CompraCredito cc;

/* Todos os débitos*/
CREATE VIEW debitos AS SELECT d.idDebito, d.idBrinquedo, d.idCartao, d.dataDebito FROM Debito d;

/* Todos os premios*/
CREATE VIEW Itens_premio AS SELECT pr.idItemPremio, pr.descricao, pr.qntTickets FROM ItemPremio pr;

/* Todos os premios obtidos*/
CREATE VIEW premios_obtidos AS SELECT obt.idObter, obt.idCliente, obt.idItemPremio,  obt.dataObtencao FROM Obter obt;

/* Todos os funcionários que operam brinquedos*/
CREATE VIEW funcionarios_que_operam_brinquedos AS SELECT op.idOpera, op.idBrinquedo, op.idFuncionario, op.diaSemana FROM Opera op;

/* Todos os funcionários que consertam brinquedos*/
CREATE VIEW funcionarios_que_consertam_brinquedos AS SELECT co.idConserta, co.idBrinquedo, co.idFuncionario, co.diaSemana FROM Conserta co;

--Indices:
/*Indice para tabela Pessoa (idPessoa)*/
CREATE INDEX index_hash ON Pessoa USING HASH (idPessoa);

/*Indice para tabela Cargo (salario)*/
CREATE INDEX index_btree ON Cargo USING HASH (salario);

--Funções e Gatilhos:
/*Regra de negócio para a tabela credito*/
CREATE FUNCTION credito_gatilho() RETURNS trigger AS $credito_gatilho$
BEGIN
IF NEW.valor < 0 OR NEW.valor IS NULL THEN
RAISE EXCEPTION 'O valor não pode ser negativo ou nulo';
END IF;
RETURN NEW;
END;
$credito_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER credito_gatilho BEFORE INSERT OR UPDATE
ON credito
FOR EACH ROW EXECUTE
PROCEDURE credito_gatilho();

/*Regra de negócio para a tabela brinquedo*/
CREATE FUNCTION brinquedo_gatilho() RETURNS trigger AS $brinquedo_gatilho$
BEGIN
IF NEW.descricao IS NULL THEN
RAISE EXCEPTION 'A descrição do brinquedo não pode ser nulo';
END IF;
IF NEW.dataChegada IS NULL THEN
RAISE EXCEPTION 'A data de chegada do brinquedo não pode ser nulo';
END IF;
IF NEW.dataChegada > current_date THEN
RAISE EXCEPTION 'A data de chegada do brinquedo não pode ser depois de hoje';
END IF;
IF NEW.dataUltimoUso < NEW.dataChegada THEN
RAISE EXCEPTION 'A data de último uso não pode ser anterior que a data de chegada do brinquedo';
END IF;
IF NEW.frequenciaUso < 0 OR NEW.frequenciaUso IS NULL THEN
RAISE EXCEPTION 'A frequencia de uso não pode ser negativa ou nula';
END IF;
IF NEW.ticketPremioMax < 0 OR NEW.ticketPremioMax IS NULL THEN
RAISE EXCEPTION 'A quantidade de tickets máxima não pode ser negativa ou nulo';
END IF;
IF NEW.ticketPremioMax > NEW.ticketsAttBrinquedo THEN
RAISE EXCEPTION 'A quantidade de tickets máxima não pode ser mais do que tem no brinquedo';
END IF;
IF NEW.ticketsAttBrinquedo  < 0 OR NEW.ticketsAttBrinquedo IS NULL THEN
RAISE EXCEPTION 'A quantidade de tickets no brinquedo não pode ser negativa ou nula';
END IF;
IF NEW.preco < 0 OR NEW.preco IS NULL THEN
RAISE EXCEPTION 'O preço do brinquedo não pode ser negativo ou nulo';
END IF;
RETURN NEW;
END;
$brinquedo_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER brinquedo_gatilho BEFORE INSERT OR UPDATE
ON brinquedo
FOR EACH ROW EXECUTE
PROCEDURE brinquedo_gatilho();

/*Regra de negócio para a tabela cliente*/
CREATE FUNCTION cliente_gatilho() RETURNS trigger AS $cliente_gatilho$
BEGIN
IF NEW.dataCadastro IS NULL THEN
RAISE EXCEPTION 'A data de cadastro não pode ser nulo';
END IF;
IF NEW.dataCadastro <> current_date THEN
RAISE EXCEPTION 'A data de cadastro não pode ser diferente do dia de hoje';
END IF;
RETURN NEW;
END;
$cliente_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER cliente_gatilho BEFORE INSERT OR UPDATE
ON cliente
FOR EACH ROW EXECUTE
PROCEDURE cliente_gatilho();

/*Regra de negócio para a tabela cartão*/
CREATE FUNCTION cartao_gatilho() RETURNS trigger AS $cartao_gatilho$
BEGIN
IF NEW.dataEmissao IS NULL THEN
RAISE EXCEPTION 'A data de emissão não pode ser nulo';
END IF;
IF NEW.dataEmissao > current_date THEN
RAISE EXCEPTION 'A data de emissão não pode ser depois ao dia de hoje';
END IF;
IF NEW.saldo < 0 OR NEW.saldo IS NULL THEN
RAISE EXCEPTION 'O saldo não pode ser negativo ou nulo';
END IF;
IF NEW.ativo IS NULL THEN
RAISE EXCEPTION 'O cartão precisa está ativo ou desativado';
END IF;
RETURN NEW;
END;
$cartao_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER cartao_gatilho BEFORE INSERT OR UPDATE
ON cartao
FOR EACH ROW EXECUTE
PROCEDURE cartao_gatilho();

/*Regra de negócio para a tabela Funcionario (Assumimos que o idCargo do gerente é 1)*/
CREATE FUNCTION funcionario_gatilho() RETURNS trigger AS $funcionario_gatilho$
BEGIN
IF NEW.numCarteiraDeTrabalho IS NULL THEN
RAISE EXCEPTION 'O número da carteira de trabalho não pode ser nulo';
END IF;
IF NEW.dataAdmissao IS NULL THEN
RAISE EXCEPTION 'A data de admissão não pode ser nulo';
END IF;
IF NEW.dataAdmissao > current_date THEN
RAISE EXCEPTION 'A data de admissão não pode ser posterior a data atual';
END IF;
IF NEW.dataDemissao < NEW.dataAdmissao THEN
RAISE EXCEPTION 'A data de demissão não pode ser anterior a data de admissão';
END IF;
IF NEW.idCargo =  1 AND (SELECT idCargo FROM Funcionario WHERE idCargo = 1) IS NOT NULL THEN
RAISE EXCEPTION 'Não pode existir mais e um gerente';
END IF;
RETURN NEW;
END;
$funcionario_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER funcionario_gatilho BEFORE INSERT OR UPDATE
ON Funcionario
FOR EACH ROW EXECUTE
PROCEDURE funcionario_gatilho();

/*Regra de negócio para a tabela cargo*/
CREATE FUNCTION cargo_gatilho() RETURNS trigger AS $cargo_gatilho$
BEGIN
IF NEW.descricao IS NULL THEN
RAISE EXCEPTION 'A descrição do cargo não pode ser nulo';
END IF;
IF NEW.salario < 788 THEN
RAISE EXCEPTION 'O salário não pode ser menor que o salário mínimo';
END IF;
NEW.ultima_data := 'now';
NEW.ultimo_usuario := current_user;
RETURN NEW;
END;
$cargo_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER cargo_gatilho BEFORE INSERT OR UPDATE
ON cargo
FOR EACH ROW EXECUTE
PROCEDURE cargo_gatilho();

/*Regra de negócio para a tabela CompraCredito*/
CREATE FUNCTION compracredito_gatilho() RETURNS trigger AS $compracredito_gatilho$
BEGIN
IF NEW.dataCompra IS NULL THEN
RAISE EXCEPTION 'A data de compra não pode ser nulo';
END IF;
IF NEW.dataCompra <> current_date THEN
RAISE EXCEPTION 'A data de compra não pode ser diferente do dia de hoje';
END IF;
RETURN NEW;
END;
$compracredito_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER compracredito_gatilho BEFORE INSERT OR UPDATE
ON compraCredito
FOR EACH ROW EXECUTE
PROCEDURE compracredito_gatilho();

/*Regra de negócio para a tabela Debito*/
CREATE FUNCTION debito_gatilho() RETURNS trigger AS $debito_gatilho$
BEGIN
IF NEW.dataDebito IS NULL THEN
RAISE EXCEPTION 'A data de débito não pode ser nulo';
END IF;
IF NEW.dataDebito <> current_date THEN
RAISE EXCEPTION 'A data de débito não pode ser diferente do dia de hoje';
END IF;
RETURN NEW;
END;
$debito_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER debito_gatilho BEFORE INSERT OR UPDATE
ON Debito
FOR EACH ROW EXECUTE
PROCEDURE debito_gatilho();

/*Regra de negócio para a tabela ItemPremio*/
CREATE FUNCTION itempremio_gatilho() RETURNS trigger AS $itempremio_gatilho$
BEGIN
IF NEW.descricao IS NULL THEN
RAISE EXCEPTION 'A descrição não pode ser nulo';
END IF;
IF NEW.qntTickets <= 0 OR NEW.qntTickets IS NULL THEN
RAISE EXCEPTION 'A quantidade de tickets não pode ser negativo ou nulo';
END IF;
RETURN NEW;
END;
$itempremio_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER itempremio_gatilho BEFORE INSERT OR UPDATE
ON ItemPremio
FOR EACH ROW EXECUTE
PROCEDURE itempremio_gatilho();

/*Regra de negócio para a tabela EstoquePremio*/
CREATE FUNCTION estoquepremio_gatilho() RETURNS trigger AS $estoquepremio_gatilho$
BEGIN
IF NEW.quantidadeItemPremio < 0 THEN
RAISE EXCEPTION 'A quantidade de prêmio não pode ser negativa';
END IF;
IF NEW.quantidadeItemPremio IS NULL THEN
RAISE EXCEPTION 'A quantidade de prêmio não pode ser nula';
END IF;
RETURN NEW;
END;
$estoquepremio_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER estoquepremio_gatilho BEFORE INSERT OR UPDATE
ON EstoquePremio
FOR EACH ROW EXECUTE
PROCEDURE estoquepremio_gatilho();

/*Regra de negócio para a tabela Obter*/
CREATE FUNCTION obter_gatilho() RETURNS trigger AS $obter_gatilho$
BEGIN
IF NEW.dataObtencao IS NULL THEN
RAISE EXCEPTION 'A data de obtenção não pode ser nulo';
END IF;
IF NEW.dataObtencao <> current_date THEN
RAISE EXCEPTION 'A data de obtenção não pode ser diferente do dia de hoje';
END IF;
RETURN NEW;
END;
$obter_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER obter_gatilho BEFORE INSERT OR UPDATE
ON Obter
FOR EACH ROW EXECUTE
PROCEDURE obter_gatilho();

/*Regra de negócio para a tabela Obter (Assumimos que o idCargo do operador de brinquedo é 3)*/
CREATE FUNCTION opera_gatilho() RETURNS trigger AS $opera_gatilho$
BEGIN
IF (SELECT idFuncionario FROM Funcionario WHERE NEW.idFuncionario = idFuncionario AND idCargo = 3) IS NULL THEN
RAISE EXCEPTION 'Inserção permitida apenas para Operadores de Brinquedos';
END IF;
IF NEW.diaSemana IS NULL THEN
RAISE EXCEPTION 'Atributo diaSemana não pode ser nulo';
END IF;
RETURN NEW;
END;
$opera_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER opera_gatilho BEFORE INSERT OR UPDATE
ON Opera
FOR EACH ROW EXECUTE
PROCEDURE opera_gatilho()

/*Regra de negócio para a tabela Obter(Assumimos que o idCargo do técnico é 5)*/
CREATE FUNCTION conserta_gatilho() RETURNS trigger AS $conserta_gatilho$
BEGIN
IF (SELECT idFuncionario FROM Funcionario WHERE NEW.idFuncionario = idFuncionario AND idCargo = 5) IS NULL THEN
RAISE EXCEPTION 'Inserção permitida apenas para Técnicos';
END IF;
IF NEW.diaSemana IS NULL THEN
RAISE EXCEPTION 'Atributo diaSemana não pode ser nulo';
END IF;
RETURN NEW;
END;
$conserta_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER conserta_gatilho BEFORE INSERT OR UPDATE
ON Conserta
FOR EACH ROW EXECUTE
PROCEDURE conserta_gatilho()

--Transações:
/*Compra crédito*/   
BEGIN;
INSERT INTO CompraCredito(idCredito, idCartao, dataCompra)
values(1, 1, current_date);
UPDATE Cartao SET saldo = saldo + (SELECT valor FROM Credito WHERE idCredito = 1)
WHERE idCliente = 1;
COMMIT;

/*Debita saldo*/
BEGIN;
INSERT INTO Debito(idBrinquedo, idCartao, dataDebito)
values(1, 1, current_date);
UPDATE Cartao SET saldo = saldo - (SELECT preco FROM Brinquedo WHERE idBrinquedo = 1)
WHERE idCliente = 1;
COMMIT;

/*Obtenção de prêmio*/
BEGIN;
INSERT INTO Obter(idCliente, idItemPremio, dataObtencao)
values(2, 1, current_date);
UPDATE EstoquePremio SET quantidadeItemPremio = quantidadeItemPremio - 1
FROM ItemPremio
WHERE ItemPremio.idItemPremio = 1 AND EstoquePremio.idEstoquePremio = ItemPremio.idEstoquePremio;
COMMIT;
/*Inserts Credito*/
INSERT INTO Credito(valor)
values(10);

INSERT INTO Credito(valor)
values(30);

INSERT INTO Credito(valor)
values(50);

INSERT INTO Credito(valor)
values(100);

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

/*Inserts Brinquedo */
INSERT INTO Brinquedo(descricao, dataChegada, dataUltimoUso, frequenciaUso, ticketPremioMax, ticketsAttBrinquedo, preco, tipoBrinquedo)
values('Corrida de Carros', '2015-01-04', NULL, 0, 5, 2000, 5, 1);

INSERT INTO Brinquedo(descricao, dataChegada, dataUltimoUso, frequenciaUso, ticketPremioMax, ticketsAttBrinquedo, preco, tipoBrinquedo)
values('Corrida de Motos', '2015-01-04', NULL, 0, 5, 2000, 5, 1);

INSERT INTO Brinquedo(descricao, dataChegada, dataUltimoUso, frequenciaUso, ticketPremioMax, ticketsAttBrinquedo, preco, tipoBrinquedo)
values('Sinuca', '2015-02-10', NULL, 0,NULL, NULL, 5, 0);

INSERT INTO Brinquedo(descricao, dataChegada, dataUltimoUso, frequenciaUso, ticketPremioMax, ticketsAttBrinquedo, preco, tipoBrinquedo)
values('Ping-Pong', '2014-10-04', NULL, 0, NULL, NULL, 5, 0);

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

/*Inserts Cargo*/
INSERT INTO Cargo(descricao, salario)
values('Gerente', 3000);

INSERT INTO Cargo(descricao, salario)
values('Recepcionista', 1000);

INSERT INTO Cargo(descricao, salario)
values('Operador de Brinquedo', 1000);

INSERT INTO Cargo(descricao, salario)
values('Segurança', 1500);

INSERT INTO Cargo(descricao, salario)
values('Técnico', 2000);

INSERT INTO Cargo(descricao, salario)
values('Auxiliar de Serviços Gerais', 1000);

/*Inserts Funcionario*/
INSERT INTO Funcionario(idPessoa, idCargo, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(1, 1, '120.23362.99-9', '2010-05-02', NULL);

INSERT INTO Funcionario(idPessoa, idCargo, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(2, 2, '102.24445.88-2', '2015-03-20', NULL);

INSERT INTO Funcionario(idPessoa, idCargo, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(3, 3, '192.90362.86-9', '2014-06-12', NULL);

INSERT INTO Funcionario(idPessoa, idCargo, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(4, 4,'936.84527.23-5', '2012-11-20', NULL);

INSERT INTO Funcionario(idPessoa, idCargo, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(5, 5, '294.04518.12-4', '2013-12-12', NULL);

INSERT INTO Funcionario(idPessoa, idCargo, numCarteiraDeTrabalho, dataAdmissao, dataDemissao)
values(6, 6, '274.84516.26-2', '2015-05-02', NULL);

/*Inserts Cliente*/
INSERT INTO Cliente(idPessoa, dataCadastro)
values(7, '2015-03-12');

INSERT INTO Cliente(idPessoa, dataCadastro)
values(8, '2012-10-22');

INSERT INTO Cliente(idPessoa, dataCadastro)
values(9, '2013-06-28');

INSERT INTO Cliente(idPessoa, dataCadastro)
values(10, '2014-09-30');

/*Inserts Premio*/
INSERT INTO EstoquePremio(quantidadeItemPremio)
values(20);

INSERT INTO EstoquePremio(quantidadeItemPremio)
values(10);

/*Inserts Premio*/
INSERT INTO ItemPremio(idEstoquePremio, descricao, qntTickets)
values(1, 'Bola de Futebol', 100);

INSERT INTO ItemPremio(idEstoquePremio, descricao, qntTickets)
values(2, 'Camisa Personalizada', 150);

/*Inserts Obter*/
INSERT INTO Obter(idCliente, idItemPremio, dataObtencao)
values(1, 1, '2015-05-12');

INSERT INTO Obter(idCliente, idItemPremio, dataObtencao)
values(2, 2, '2014-10-10');

/*Inserts Cartão*/
INSERT INTO Cartao(idCliente, dataEmissao, saldo, ativo)
values(1, '2015-05-05', 0, TRUE);

INSERT INTO Cartao(idCliente, dataEmissao, saldo, ativo)
values(2, '2015-05-30', 0, TRUE);

INSERT INTO Cartao(idCliente, dataEmissao, saldo, ativo)
values(3, '2015-02-10', 0, TRUE);

INSERT INTO Cartao(idCliente, dataEmissao, saldo, ativo)
values(4, '2015-06-05', 0, TRUE);

/*Inserts Opera*/
INSERT INTO Opera(idBrinquedo, idFuncionario, diaSemana)
values(1, 5, 'Segunda-feira');

/*Inserts Conserta*/
INSERT INTO Conserta(idBrinquedo, idFuncionario, diaSemana)
values(1, 6, 'Segunda-feira');