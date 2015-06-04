CREATE TABLE Credito (
  idCredito SERIAL NOT NULL,
  valor INTEGER NULL,
  PRIMARY KEY(idCredito)
);

CREATE TABLE Endereco (
  idEndereço SERIAL NOT NULL,
  rua VARCHAR(60) NULL,
  bairro VARCHAR(30) NULL,
  numero INTEGER NULL,
  CEP VARCHAR(9) NULL,
  cidade VARCHAR(60) NOT NULL,
  UF VARCHAR(2) NOT NULL,
  PRIMARY KEY(idEndereço)
);

CREATE TABLE Brinquedo (
  idBrinquedo SERIAL NOT NULL,
  descricao VARCHAR(40) NOT NULL,
  dataChegada DATE NOT NULL,
  dataUltimoUso DATE NULL,
  frequenciaUso INTEGER NOT NULL,
  ticketPremioMax INTEGER NULL,
  ticketsCurrBrinquedo INTEGER NULL,
  preco INTEGER NOT NULL,
  tipoBrinquedo CHAR NULL,
  PRIMARY KEY(idBrinquedo)
);

CREATE TABLE Pessoa (
  idPessoa SERIAL NOT NULL,
  idEndereco INTEGER NOT NULL REFERENCES Endereco,
  nome VARCHAR(60) NOT NULL,
  CPF INTEGER NOT NULL,
  dataNascimento DATE NULL,
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
  dataCadatro DATE NOT NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Cartao (
  idCartao SERIAL NOT NULL,
  idCliente INTEGER NOT NULL REFERENCES Cliente,
  dataEmissao DATE NOT NULL,
  saldo INTEGER NULL,
  ativo BOOL NOT NULL,
  PRIMARY KEY(idCartao)
);

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
  dataCompra DATE NULL,
  PRIMARY KEY(idCompraCredito)
);

CREATE TABLE Debito (
  idDebito SERIAL NOT NULL,
  idBrinquedo INTEGER NOT NULL REFERENCES Brinquedo,
  idCartao INTEGER NOT NULL REFERENCES Cartao,
  dataDebito DATE NULL,
  PRIMARY KEY(idDebito)
);

CREATE TABLE Premio (
  idPremio SERIAL NOT NULL,
  idCliente INTEGER NOT NULL REFERENCES Cliente,
  descricao VARCHAR(60) NULL,
  qntTickets INTEGER NULL,
  PRIMARY KEY(idPremio)
);

CREATE TABLE Gerente (
  idGerente SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idGerente)
);

CREATE TABLE OperadorDeBrinquedo (
  idOperadorDeBrinquedo SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idOperadorDeBrinquedo)
);

CREATE TABLE Tecnico (
  idSuporteTecnico SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idSuporteTecnico)
);

CREATE TABLE Salario (
  idSalario SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  valor INTEGER NOT NULL,
  PRIMARY KEY(idSalario)
);

CREATE TABLE Seguranca (
  idSeguranca SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idSeguranca)
);

CREATE TABLE Balconista (
  idBalconista SERIAL NOT NULL,
  idFuncionario INTEGER NOT NULL REFERENCES Funcionario,
  PRIMARY KEY(idBalconista)
);

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
  diaSemana DATE NULL,
  PRIMARY KEY(idConserta)
);