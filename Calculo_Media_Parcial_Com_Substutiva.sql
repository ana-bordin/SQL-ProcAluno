CREATE OR ALTER PROC Calculo_Media_Parcial_Com_Substutiva 
	@id_Disciplina VARCHAR(8),
	@id_Pessoa_Aluno INT,
	@sub DECIMAL(4,2)
AS
BEGIN
	DECLARE @nota1 decimal(4,2),
			@nota2 decimal(4,2),
			@media decimal(4,2)

	SELECT @media = Media, @nota1 = Nota1, @nota2 = Nota2
		FROM Matricula
		WHERE Id_Disciplina = @id_Disciplina AND Id_Pessoa_Aluno = @id_Pessoa_Aluno

		IF @nota1 <= @sub OR @nota2 <= @sub
		BEGIN
			IF @nota1 <= @nota2 
				SET @media = (@nota2 + @sub) / 2
			ELSE
				SET @media = (@nota1 + @sub) / 2
		
		update Matricula
		SET Media = @media,
			Sub = @sub
		WHERE Id_Disciplina = @Id_Disciplina AND Id_Pessoa_Aluno = @Id_Pessoa_Aluno	
		END
END

EXEC Calculo_Media_Parcial_Com_Substutiva BIO201,4,4
select * from Matricula;