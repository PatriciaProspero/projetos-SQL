-- Inserir Valor em uma Tabela, com as informaçãoes de outra tabela, isso quando a tabla for alterada.


create table ex_funcionarios
(
id int,
data_demissao date
)


alter trigger atualiza_funcionarios
on dbo.funcionarios 
after update 
as

begin

declare @ativo varchar (5), 
		@id int 
    
	select @ativo = f.ativo, @id = f.id
    from funcionarios f join inserted i
	on f.id = i.id

if @ativo = 'D'
	print @id
	insert into ex_funcionarios
	values (@id, getdate())
end

select * from funcionarios 
select * from ex_funcionarios 

update dbo.funcionarios
set ativo = 'D'
where id = 1


