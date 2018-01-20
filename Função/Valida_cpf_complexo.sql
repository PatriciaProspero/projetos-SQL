IF OBJECT_ID(N'[dbo].[allfc_valida_cpf]', N'FN') IS NOT NULL
	DROP FUNCTION [dbo].[allfc_valida_cpf]
GO


CREATE FUNCTION dbo.allfc_valida_cpf
(
	@cpf VARCHAR(15)
)
RETURNS BIT
AS
BEGIN
	--$Revision: 1.8 $

	/*
	
	SELECT dbo.allfc_valida_cpf('26256760867')
	
	*/

    DECLARE @digitocpf		CHAR(2),
			@digitopassado	CHAR(2),
			@verdadeiro		BIT,
			@cpf_aux		VARCHAR(15) = RTRIM(LTRIM(REPLACE(REPLACE(@cpf, '-', ''), '.', '')))


	IF LEN(@cpf_aux) > 11
	OR ISNUMERIC(@cpf_aux) = 0
	BEGIN
		RETURN 0
	END


 select @verdadeiro =0



	--passa o CNPJ retorna o digito
	
	declare @i int
    declare @fatormultiplicador int
    declare @soma int
    declare @digitover int
 
 declare @soma_1 int
 declare @divisao_1 int
 declare @multiplica_1 int
 declare @resto_1 int
 declare @newcpf char(12)
 declare @digito1 char(1),@digito2 char(1)
 declare @tamanho int
 
 
select 
   @tamanho=case 
   when len(@cpf) > 11 then 
      11
   when len(@cpf) < 2 or @cpf is null then 
      2
    else len(@cpf)
  end

if @cpf is null or len(@cpf) < 2
  select @cpf = '0'


 
select @digitopassado=right(@cpf,2)
select @cpf=left(@cpf,@tamanho-2) 


 --verifica o tamanho da vnumero e coloca os zeros na frente se necessario
if Len(@CPF) = 9
   select @newcpf = @cpf
 if Len(@CPF) = 8
   select @newcpf = '0' + @cpf
 if Len(@CPF) = 7
   select @newcpf = '00' + @cpf
 if Len(@CPF) = 6
   select @newcpf = '000' + @cpf
 if Len(@CPF) = 5
   select @newcpf = '0000' + @cpf
 if Len(@CPF) = 4
   select @newcpf = '00000' + @cpf
 if Len(@CPF) = 3
   select @newcpf = '000000' + @cpf             
 if Len(@CPF) = 2
   select @newcpf = '0000000' + @cpf
 if Len(@CPF) = 1
   select @newcpf = '00000000' + @cpf  

--print 'Numero CPF :'+ convert(char,@newcpf)
 --*****************************************
 --Primeira posição do digito verificador
 
 --Multiplica as posições do cnpj
 select @soma = 10 * convert(Int,substring(@newcpf, 1, 1))
 select @soma = @soma + (9 * convert(Int,substring(@newcpf, 2, 1)))
 select @soma = @soma + (8 * convert(Int,substring(@newcpf, 3, 1)))
 select @soma = @soma + (7 * convert(Int,substring(@newcpf, 4, 1)))
 select @soma = @soma + (6 * convert(Int,substring(@newcpf, 5, 1)))
 select @soma = @soma + (5 * convert(Int,substring(@newcpf, 6, 1)))
 select @soma = @soma + (4 * convert(Int,substring(@newcpf, 7, 1)))
 select @soma = @soma + (3 * convert(Int,substring(@newcpf, 8, 1)))
 select @soma = @soma + (2 * convert(Int,substring(@newcpf, 9, 1)))
 
 --print 'Soma1 :'+ convert(char,@soma)
 
  select @soma_1 = @soma
  select @divisao_1 = @soma_1 / 11
  select @multiplica_1 = @divisao_1 * 11
  select @resto_1 = @soma_1 - @multiplica_1
  --se o resto for = 1 ou = 0
  If @resto_1 = 0 Or @resto_1 = 1 
    select @digitover = 0
  else
  begin
  If @resto_1 < 0 
    select @digitover = Abs(@resto_1)
  Else
    select @digitover = 11 - @resto_1
  end
  
  select @digito1 = @digitover
  --print 'Digito 1:' + @digito1
 -- 'Segunda posição do Digito verificador
  
 --Multiplica as posições do Cnpj
 --Multiplica as posições do CPF
 select @soma = 11 * convert(Int,substring(@newcpf, 1, 1))
 select @soma = @soma + (10 * convert(Int,substring(@newcpf, 2, 1)))
 select @soma = @soma + (9 * convert(Int,substring(@newcpf, 3, 1)))
 select @soma = @soma + (8 * convert(Int,substring(@newcpf, 4, 1)))
 select @soma = @soma + (7 * convert(Int,substring(@newcpf, 5, 1)))
 select @soma = @soma + (6 * convert(Int,substring(@newcpf, 6, 1)))
 select @soma = @soma + (5 * convert(Int,substring(@newcpf, 7, 1)))
 select @soma = @soma + (4 * convert(Int,substring(@newcpf, 8, 1)))
 select @soma = @soma + (3 * convert(Int,substring(@newcpf, 9, 1)))
 select @soma = @soma + (2 * convert(Int,@digito1)) 
 
 
  select @soma_1 = @soma
  select @divisao_1 = @soma_1 / 11
  select @multiplica_1 = @divisao_1 * 11
  select @resto_1 = @soma_1 - @multiplica_1
    
  If @resto_1 = 0 Or @resto_1 = 1
    select @digitover = 0
  else
  begin
   If @resto_1 < 0 
    select @digitover = Abs(@resto_1)
   Else
    select @digitover = 11 - @resto_1
  end
 
  select @digito2 = @digitover
  --print 'Digito2:' +@digito2
  
  --retorna o digito do CNPJ
  select @digitocpf = @digito1 + @digito2
	
  if @digitocpf = @digitopassado 
     select @verdadeiro=1

	RETURN(@verdadeiro)
END
GO
--test