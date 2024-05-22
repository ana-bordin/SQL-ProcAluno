CREATE OR ALTER PROC Calculo_Media_Parcial 
AS
BEGIN
	DECLARE Aux_Cursor CURSOR FOR  
		SELECT Id_Disciplina, Id_Pessoa_Aluno, Nota1, Nota2, Media
		FROM Matricula
 
	OPEN Aux_Cursor
 
	DECLARE @Id_Disciplina varchar(8),
			@Id_Pessoa_Aluno int,
			@nota1 decimal(4,2),
			@nota2 decimal(4,2),
			@media decimal(4,2)
 
	FETCH NEXT FROM Aux_Cursor  
	INTO @Id_Disciplina,
		 @Id_Pessoa_Aluno,
		 @nota1,
		 @nota2,
		 @media
 
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		SET @media = (@nota1 + @nota2) / 2

		update Matricula
		SET Media = @media
		WHERE Id_Disciplina = @Id_Disciplina AND Id_Pessoa_Aluno = @Id_Pessoa_Aluno

		FETCH NEXT FROM Aux_Cursor  
		INTO @Id_Disciplina,
		@Id_Pessoa_Aluno,
		@nota1,
	    @nota2, 
		@media
	END
 
	CLOSE Aux_Cursor
	DEALLOCATE Aux_Cursor
END

EXEC Calculo_Media_Parcial

select * from Matricula;