CREATE OR ALTER PROC Cadastrar_Aluno_Disciplina
	@Id_Pessoa_Aluno INT,
	@Id_Pessoa_Professor INT,
	@Id_Disciplina VARCHAR(8),
	@Semestre INT,
	@Ano INT

AS
BEGIN
	INSERT INTO Matricula (Id_Pessoa_Aluno, Id_Pessoa_Professor, Id_Disciplina, Semestre, Ano)
	VALUES (@Id_Pessoa_Aluno, @Id_Pessoa_Professor, @Id_Disciplina, @Semestre, @Ano)
	SELECT * FROM Matricula;
END

EXEC Cadastrar_Aluno_Disciplina 3,6,ART101,1,2024
EXEC Cadastrar_Aluno_Disciplina 3,7,BIO201,1,2024
EXEC Cadastrar_Aluno_Disciplina 4,7,BIO201,1,2024
EXEC Cadastrar_Aluno_Disciplina 7,8,HIS101,1,2024
EXEC Cadastrar_Aluno_Disciplina 7,9,ART101,1,2024
EXEC Cadastrar_Aluno_Disciplina 8,10,QUI101,1,2024
EXEC Cadastrar_Aluno_Disciplina 4,10,QUI101,1,2024

select * from Aluno;
select * from Professor;
select * from Disciplina;