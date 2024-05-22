USE AlunoDisciplina;

-- Inserindo mais registros na tabela Endereco
INSERT INTO Endereco (CEP, Tipo_Logradouro, Logradouro, Bairro, Cidade, Uf)
VALUES 
    ('23456789', 'Rua', 'das Flores', 'Jardim Botânico', 'Cidade C', 'MG'),
    ('34567890', 'Avenida', 'Central', 'Centro', 'Cidade D', 'SP'),
    ('45678901', 'Avenida', 'do Bosque', 'Vila Nova', 'Cidade E', 'RJ'),
    ('56789012', 'Rua', 'do Comércio', 'Centro', 'Cidade F', 'RS'),
    ('67890123', 'Avenida', 'do Sol', 'Parque das Árvores', 'Cidade G', 'PR'),
	('78901234', 'Rua', 'das Palmeiras', 'Praia Grande', 'Cidade H', 'BA'),
    ('89012345', 'Avenida', 'dos Girassóis', 'Jardim das Flores', 'Cidade I', 'SC'),
    ('90123456', 'Alameda', 'dos Pássaros', 'Aldeia da Mata', 'Cidade J', 'GO'),
    ('01234567', 'Rua', 'das Orquídeas', 'Vila Mariana', 'Cidade K', 'CE'),
    ('12345678', 'Avenida', 'da Paz', 'Bairro Novo', 'Cidade L', 'AM');

-- Inserindo mais registros na tabela Pessoa
INSERT INTO Pessoa (Nome, CPF, Email, Data_Nascimento, Numero_Residencia, Id_Endereco)
VALUES 
    ('Pedro Oliveira', '23456789012', 'pedro@example.com', '1992-08-25', 150, 11),
    ('Ana Santos', '34567890123', 'ana@example.com', '1988-03-10', 300, 13),
    ('Lucas Pereira', '45678901234', 'lucas@example.com', '1996-11-12', 75, 5),
    ('Carla Lima', '56789012345', 'carla@example.com', '1993-07-18', 220, 10),
    ('Gabriel Souza', '67890123456', 'gabriel@example.com', '1990-12-05', 420, 8), 
	('Fernanda Costa', '78901234567', 'fernanda@example.com', '1994-09-30', 90, 6),
    ('Ricardo Santos', '89012345678', 'ricardo@example.com', '1987-05-20', 250, 4),
    ('Patrícia Oliveira', '90123456789', 'patricia@example.com', '1998-02-15', 40, 8),
    ('Marcelo Lima', '01234567890', 'marcelo@example.com', '1991-11-08', 180, 12),
    ('Carolina Pereira', '12345678901', 'camila@example.com', '1997-04-25', 350, 10);

-- Inserindo mais registros na tabela Aluno
INSERT INTO Aluno (Id_Pessoa, RA, CPF_Pessoa)
VALUES 
    (3, '2021003', '23456789012'),
    (4, '2021004', '34567890123'),
    (5, '2021005', '45678901234'),  
    (6, '2021006', '78901234567'),
    (7, '2021007', '89012345678'),
    (8, '2021008', '90123456789');

-- Inserindo mais registros na tabela Professor
INSERT INTO Professor (Id_Pessoa, CPF_Pessoa)
VALUES 
    (6, '56789012345'),
    (7, '67890123456'),
	(8, '90123456789'),
    (9, '01234567890'),
    (10, '12345678901');

-- Inserindo mais registros na tabela Disciplina
INSERT INTO Disciplina (Id, Nome, Descricao, Carga_Horaria, Id_Professor)
VALUES 
    ('QUI101', 'Química Geral', 'Introdução à Química', 60, 6),
    ('BIO201', 'Biologia Celular', 'Estudo das células', 80, 7),
	('HIS101', 'História Geral', 'Panorama histórico mundial', 60, 9),
    ('GEO201', 'Geografia Humana', 'Estudo das interações entre sociedade e espaço geográfico', 80, 10),
	('ART101', 'Artes Visuais', 'Introdução às Artes Plásticas', 60, 10),
    ('SOC201', 'Sociologia', 'Estudo das relações sociais', 80, 9),
    ('PSI301', 'Psicologia Geral', 'Noções básicas de psicologia', 70, 8),
    ('ING101', 'Inglês Básico', 'Fundamentos da língua inglesa', 50, 7),
    ('ECO201', 'Economia', 'Princípios básicos de economia', 90, 6);

-- Inserindo mais registros na tabela Matricula
INSERT INTO Matricula (Id_Pessoa_Aluno, Id_Pessoa_Professor, Id_Disciplina, Nota1, Nota2, Sub, Media, Situacao, Semestre, Ano)
VALUES 
    (3, 6, 'QUI101', 6.5, 7.0, NULL, NULL, NULL, 1, 2024),
    (4, 7, 'BIO201', 8.0, 8.5, NULL, NULL, NULL, 1, 2024);
