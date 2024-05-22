CREATE OR ALTER PROC Inserir_Nota
	@Id_Pessoa_Aluno INT, 
	@Id_Disciplina VARCHAR(8),
	@nota1 DECIMAL(4,2), 
	@nota2 DECIMAL(4,2)
AS
BEGIN
	update Matricula
	SET Nota1 = @nota1
	WHERE Id_Pessoa_Aluno = @Id_Pessoa_Aluno AND Id_Disciplina = @Id_Disciplina

	update Matricula
	SET Nota2 = @nota2
	WHERE Id_Pessoa_Aluno = @Id_Pessoa_Aluno AND Id_Disciplina = @Id_Disciplina

	select * from Matricula;
END

EXEC Inserir_Nota 3,ART101,10,5
EXEC Inserir_Nota 3,BIO201,9,8
EXEC Inserir_Nota 4,BIO201,5,3
EXEC Inserir_Nota 4,QUI101,7,6;
EXEC Inserir_Nota 7,ART101,10,5;
EXEC Inserir_Nota 7,HIS101,8,9;
EXEC Inserir_Nota 8,QUI101,6,7;

select * from Matricula;
