/*
	Crie uma função que receba uma palavra qualquer como parâmetro, e retorne esta palavra escrita ao contrario.
*/
CREATE OR ALTER FUNCTION reverter
(
	@Palavra VARCHAR (50)
)
returns varchar(50)
AS
BEGIN

DECLARE
	@contador int = len(@palavra),
	@final varchar(50) =''

WHILE @contador > 0
	BEGIN
		set @final = @final + (select substring(@palavra, @contador, 1))
		set @contador = @contador -1
	END	
	return @final
END;

select dbo.reverter('roma')

