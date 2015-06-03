CREATE TABLE Credito (
  idCredito INTEGER NOT NULL,
  valor INTEGER NULL,
  PRIMARY KEY(idCredito)
);

CREATE TABLE Endereço (
  idEndereço INTEGER NOT NULL,
  rua VARCHAR(60) NULL,
  bairro VARCHAR(30) NULL,
  numero INTEGER NULL,
  CEP VARCHAR(9) NULL,
  cidade VARCHAR(60) NULL,
  UF VARCHAR(2) NULL,
  PRIMARY KEY(idEndereço)
);

CREATE TABLE Brinquedo (
  idBrinquedo INTEGER NOT NULL,
  descricao VARCHAR(40) NOT NULL,
  dataChegada DATE NOT NULL,
  dataUltimoUso DATE NULL,
  frequenciaUso INTEGER NOT NULL,
  ticketPremioMax INTEGER NULL,
  ticketsCurrBrinquedo INTEGER NULL,
  preco INTEGER NOT NULL,
  Tipo CHAR NULL,
  PRIMARY KEY(idBrinquedo)
);

CREATE TABLE Pessoa (
  idPessoa INTEGER NOT NULL,
  Endereço_idEndereço INTEGER NOT NULL,
  nome VARCHAR(60) NOT NULL,
  CPF INTEGER NOT NULL,
  dataNascimento DATE NULL,
  PRIMARY KEY(idPessoa)
);

CREATE TABLE Telefone (
  idTelefone INTEGER NOT NULL,
  Pessoa_idPessoa INTEGER NOT NULL,
  tipo VARCHAR(20) NULL,
  numero VARCHAR(10) NULL,
  DDD VARCHAR(3) NULL,
  PRIMARY KEY(idTelefone)
);

CREATE TABLE Cliente (
  idCliente INTEGER NOT NULL,
  Pessoa_idPessoa INTEGER NOT NULL,
  dataCadatro DATE NOT NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Cartao (
  idCartao INTEGER NOT NULL,
  Cliente_idCliente INTEGER NOT NULL,
  dataEmissao DATE NOT NULL,
  saldo INTEGER NULL,
  ativo BOOL NOT NULL,
  PRIMARY KEY(idCartao)
);

CREATE TABLE Funcionario (
  idFuncionario INTEGER NOT NULL,
  Pessoa_idPessoa INTEGER NOT NULL,
  numCarteiraDeTrabalho VARCHAR(20) NOT NULL,
  dataAdmissao DATE NULL,
  dataDemissao DATE NULL,
  PRIMARY KEY(idFuncionario)
);

CREATE TABLE CompraCredito (
  idCompraCredito INTEGER NOT NULL,
  Credito_idCredito INTEGER NOT NULL,
  Cartao_idCartao INTEGER NOT NULL,
  dataCompra DATE NULL,
  PRIMARY KEY(idCompraCredito)
);

CREATE TABLE Debito (
  idDebito INTEGER NOT NULL,
  Brinquedo_idBrinquedo INTEGER NOT NULL,
  Cartao_idCartao INTEGER NOT NULL,
  dataDebito DATE NULL,
  PRIMARY KEY(idDebito)
);

CREATE TABLE Premio (
  idPremio INTEGER NOT NULL,
  Cliente_idCliente INTEGER NOT NULL,
  descricao VARCHAR(60) NULL,
  qntTickets INTEGER NULL,
  PRIMARY KEY(idPremio)
);

CREATE TABLE Gerente (
  idGerente INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY(idGerente, Funcionario_idFuncionario)
);

CREATE TABLE OperadorDeBrinquedo (
  idOperadorDeBrinquedo INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY(idOperadorDeBrinquedo, Funcionario_idFuncionario)
);

CREATE TABLE Tecnico (
  idSuporteTecnico INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY(idSuporteTecnico, Funcionario_idFuncionario)
);

CREATE TABLE Salario (
  idSalario INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  valor INTEGER NULL,
  PRIMARY KEY(idSalario)
);

CREATE TABLE Seguranca (
  idSeguranca INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY(idSeguranca, Funcionario_idFuncionario)
);

CREATE TABLE Balconista (
  idBalconista INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY(idBalconista, Funcionario_idFuncionario)
);

CREATE TABLE ASG (
  idASG INTEGER NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY(idASG, Funcionario_idFuncionario)
);

CREATE TABLE Opera (
  idOpera INTEGER NOT NULL,
  Brinquedo_idBrinquedo INTEGER NOT NULL,
  OperadorDeBrinquedo_Funcionario_idFuncionario INTEGER NOT NULL,
  OperadorDeBrinquedo_idOperadorDeBrinquedo INTEGER NOT NULL,
  diaSemana VARCHAR(7) NULL,
  PRIMARY KEY(idOpera)
);

CREATE TABLE Conserta (
  idConserta INTEGER NOT NULL,
  Brinquedo_idBrinquedo INTEGER NOT NULL,
  Tecnico_Funcionario_idFuncionario INTEGER NOT NULL,
  Tecnico_idSuporteTecnico INTEGER NOT NULL,
  diaSemana DATE NULL,
  PRIMARY KEY(idConserta)
);