CREATE TABLE Credito (
  idCredito INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  valor INTEGER UNSIGNED NULL,
  PRIMARY KEY(idCredito)
);

CREATE TABLE Endereço (
  idEndereço INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  rua VARCHAR(60) NULL,
  bairro VARCHAR(30) NULL,
  numero INTEGER UNSIGNED NULL,
  CEP VARCHAR(9) NULL,
  cidade VARCHAR(60) NULL,
  UF VARCHAR(2) NULL,
  PRIMARY KEY(idEndereço)
);

CREATE TABLE Brinquedo (
  idBrinquedo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL,
  dataChegada DATE NOT NULL,
  dataUltimoUso DATE NULL,
  frequenciaUso INTEGER UNSIGNED NOT NULL,
  ticketPremioMax INTEGER UNSIGNED NULL,
  ticketsCurrBrinquedo INTEGER UNSIGNED NULL,
  preco INTEGER UNSIGNED NOT NULL,
  Tipo CHAR NULL,
  PRIMARY KEY(idBrinquedo)
);

CREATE TABLE Pessoa (
  idPessoa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Endereço_idEndereço INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(60) NOT NULL,
  CPF INTEGER UNSIGNED NOT NULL,
  dataNascimento DATE NULL,
  PRIMARY KEY(idPessoa),
  INDEX Pessoa_FKIndex1(Endereço_idEndereço)
);

CREATE TABLE Telefone (
  idTelefone INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INTEGER UNSIGNED NOT NULL,
  tipo VARCHAR(20) NULL,
  numero VARCHAR(10) NULL,
  DDD VARCHAR(3) NULL,
  PRIMARY KEY(idTelefone),
  INDEX Telefone_FKIndex1(Pessoa_idPessoa)
);

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INTEGER UNSIGNED NOT NULL,
  dataCadatro DATE NOT NULL,
  PRIMARY KEY(idCliente),
  INDEX Cliente_FKIndex1(Pessoa_idPessoa)
);

CREATE TABLE Cartao (
  idCartao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  dataEmissao DATE NOT NULL,
  saldo INTEGER UNSIGNED NULL,
  ativo BOOL NOT NULL,
  PRIMARY KEY(idCartao),
  INDEX Cartao_FKIndex1(Cliente_idCliente)
);

CREATE TABLE Funcionario (
  idFuncionario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pessoa_idPessoa INTEGER UNSIGNED NOT NULL,
  numCarteiraDeTrabalho VARCHAR(20) NOT NULL,
  dataAdmissao DATE NULL,
  dataDemissao DATE NULL,
  PRIMARY KEY(idFuncionario),
  INDEX Funcionario_FKIndex1(Pessoa_idPessoa)
);

CREATE TABLE CompraCredito (
  idCompraCredito INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Credito_idCredito INTEGER UNSIGNED NOT NULL,
  Cartao_idCartao INTEGER UNSIGNED NOT NULL,
  dataCompra DATE NULL,
  PRIMARY KEY(idCompraCredito),
  INDEX CompraCredito_FKIndex1(Cartao_idCartao),
  INDEX CompraCredito_FKIndex2(Credito_idCredito)
);

CREATE TABLE Debito (
  idDebito INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Brinquedo_idBrinquedo INTEGER UNSIGNED NOT NULL,
  Cartao_idCartao INTEGER UNSIGNED NOT NULL,
  dataDebito DATE NULL,
  PRIMARY KEY(idDebito),
  INDEX Debito_FKIndex1(Cartao_idCartao),
  INDEX Debito_FKIndex2(Brinquedo_idBrinquedo)
);

CREATE TABLE Premio (
  idPremio INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  descricao VARCHAR(60) NULL,
  qntTickets INTEGER UNSIGNED NULL,
  PRIMARY KEY(idPremio),
  INDEX Premio_FKIndex1(Cliente_idCliente)
);

CREATE TABLE Gerente (
  idGerente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idGerente, Funcionario_idFuncionario),
  INDEX Gerente_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE OperadorDeBrinquedo (
  idOperadorDeBrinquedo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idOperadorDeBrinquedo, Funcionario_idFuncionario),
  INDEX OperadorDeBrinquedo_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE Tecnico (
  idSuporteTecnico INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idSuporteTecnico, Funcionario_idFuncionario),
  INDEX Tecnico_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE Salario (
  idSalario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  valor INTEGER UNSIGNED NULL,
  PRIMARY KEY(idSalario),
  INDEX Salario_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE Seguranca (
  idSeguranca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idSeguranca, Funcionario_idFuncionario),
  INDEX SeguranÃ§a_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE Balconista (
  idBalconista INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idBalconista, Funcionario_idFuncionario),
  INDEX Balconista_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE ASG (
  idASG INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idASG, Funcionario_idFuncionario),
  INDEX ASG_FKIndex1(Funcionario_idFuncionario)
);

CREATE TABLE Opera (
  idOpera INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Brinquedo_idBrinquedo INTEGER UNSIGNED NOT NULL,
  OperadorDeBrinquedo_Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  OperadorDeBrinquedo_idOperadorDeBrinquedo INTEGER UNSIGNED NOT NULL,
  diaSemana VARCHAR(7) NULL,
  PRIMARY KEY(idOpera),
  INDEX Responsavel_FKIndex1(OperadorDeBrinquedo_idOperadorDeBrinquedo, OperadorDeBrinquedo_Funcionario_idFuncionario),
  INDEX Responsavel_FKIndex2(Brinquedo_idBrinquedo)
);

CREATE TABLE Conserta (
  Brinquedo_idBrinquedo INTEGER UNSIGNED NOT NULL,
  Tecnico_Funcionario_idFuncionario INTEGER UNSIGNED NOT NULL,
  Tecnico_idSuporteTecnico INTEGER UNSIGNED NOT NULL,
  diaSemana DATE NULL,
  INDEX Table_21_FKIndex1(Tecnico_idSuporteTecnico, Tecnico_Funcionario_idFuncionario),
  INDEX Table_21_FKIndex2(Brinquedo_idBrinquedo)
);