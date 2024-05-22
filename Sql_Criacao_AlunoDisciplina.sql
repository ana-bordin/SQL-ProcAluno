CREATE DATABASE AlunoDisciplina;
USE AlunoDisciplina;

CREATE TABLE Endereco
(
	Id INT IDENTITY(1,1) NOT NULL,
	CEP VARCHAR(8),
	Tipo_Logradouro VARCHAR(7) NOT NULL,
	Logradouro VARCHAR(100) NOT NULL,
	Bairro VARCHAR(50)  NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Uf CHAR(2) NOT NULL,
	CONSTRAINT pk_Endereco PRIMARY KEY (Tipo_Logradouro, Logradouro, Bairro, Cidade, Uf),
	CONSTRAINT Unique_EnderecoId UNIQUE (Id)
);

CREATE TABLE Pessoa
(
	Id INT IDENTITY(1,1)NOT NULL,
	Nome VARCHAR(100),
	CPF VARCHAR(11) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Numero_Residencia INT NOT NULL,
	Id_Endereco INT NOT NULL,
	CONSTRAINT pk_PessoaId PRIMARY KEY (Id),
	CONSTRAINT Unique_PessoaCPF UNIQUE (CPF),
	CONSTRAINT fk_Pessoa FOREIGN KEY (Id_Endereco) REFERENCES Endereco(Id)
);

CREATE TABLE Aluno
(
	Id_Pessoa INT NOT NULL,
	RA VARCHAR(15) NOT NULL,
	CPF_Pessoa VARCHAR(11) NOT NULL,
	
	CONSTRAINT Unique_AlunoID UNIQUE (Id_Pessoa),
	CONSTRAINT fk_AlunoId FOREIGN KEY (Id_Pessoa) REFERENCES Pessoa(Id),
	CONSTRAINT fk_AlunoCPF FOREIGN KEY (CPF_Pessoa) REFERENCES Pessoa(CPF),
	CONSTRAINT pk_Aluno PRIMARY KEY (RA, CPF_Pessoa)	
);

CREATE TABLE Professor
(
	Id_Professor INT IDENTITY(1,1) NOT NULL,
	Id_Pessoa INT NOT NULL,
	CPF_Pessoa VARCHAR(11) NOT NULL,
	
	CONSTRAINT Unique_ProfessorID UNIQUE (Id_Pessoa),
	CONSTRAINT fk_ProfessorPessoaID FOREIGN KEY (Id_Pessoa) REFERENCES Pessoa(Id),
	CONSTRAINT fk_Professor FOREIGN KEY (CPF_Pessoa) REFERENCES Pessoa(CPF),
	CONSTRAINT pk_Professor PRIMARY KEY (Id_Professor, CPF_Pessoa)	
);

CREATE TABLE Disciplina
(
	Id VARCHAR(8),
	Nome VARCHAR(50) NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
	Carga_Horaria INT NOT NULL,
	Id_Professor INT NOT NULL,
	CONSTRAINT pk_Disciplina PRIMARY KEY (Id),
	CONSTRAINT fk_Disciplina FOREIGN KEY (Id_Professor) REFERENCES Professor(Id_Pessoa)	
);

CREATE TABLE Matricula
(
	Id_Pessoa_Aluno INT NOT NULL,
	Id_Pessoa_Professor INT NOT NULL,
	Id_Disciplina VARCHAR(8) not null,
	Nota1 Decimal(4,2),
	Nota2 Decimal(4,2),
	Sub Decimal(4,2),
	Media Decimal(4,2),
	Situacao CHAR(2),
	Semestre int NOT NULL,
	Ano int NOT NULL,
	
	CONSTRAINT pk_Matricula PRIMARY KEY (Id_Pessoa_Aluno, Id_Disciplina, Semestre, Ano),
	CONSTRAINT fk_Matricula_Aluno FOREIGN KEY (Id_Pessoa_Aluno) REFERENCES Aluno(Id_Pessoa),
	CONSTRAINT fk_Matricula_Professor FOREIGN KEY (Id_Pessoa_Professor) REFERENCES Aluno(Id_Pessoa),
    CONSTRAINT fk_Matricula_Disciplina FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id)
);