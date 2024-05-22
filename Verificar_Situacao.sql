CREATE OR ALTER PROC Verificar_Situacao
AS
BEGIN
	DECLARE Aux_Cursor CURSOR FOR  
		SELECT Id_Disciplina, Id_Pessoa_Aluno, Media, Situacao
		FROM Matricula
 
	OPEN Aux_Cursor
 
	DECLARE @Id_Disciplina varchar(8),
			@Id_Pessoa_Aluno int,
			@Media decimal(4,2), 
			@Situacao varchar(10)
 
	FETCH NEXT FROM Aux_Cursor  
	INTO @Id_Disciplina,
		 @Id_Pessoa_Aluno,
		 @Media, 
		 @Situacao
 
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		update Matricula
		SET Situacao = 'AP'
		WHERE Id_Disciplina = @Id_Disciplina AND Id_Pessoa_Aluno = @Id_Pessoa_Aluno AND Media >= 5
		
		update Matricula
		SET Situacao = 'RE'
		WHERE Id_Disciplina = @Id_Disciplina AND Id_Pessoa_Aluno = @Id_Pessoa_Aluno AND Media < 5
		
		FETCH NEXT FROM Aux_Cursor  
		INTO @Id_Disciplina,
		@Id_Pessoa_Aluno,
		@Media, 
		@Situacao
	END
 
	CLOSE Aux_Cursor
	DEALLOCATE Aux_Cursor
END

EXEC Verificar_Situacao

select * from Matricula;