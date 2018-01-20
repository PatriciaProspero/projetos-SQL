CREATE VIEW v_tb_empresas
AS

SELECT Nome,
	   Data
FROM tb_empresas
WHERE Valor > 100.00


-- Testando a View
--SELECT * FROM dbo.v_tb_empresas