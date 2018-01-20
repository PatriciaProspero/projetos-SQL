SELECT 
		n_cartao_refeicao, 
		Nome_empresa, 
		valor_cartao
FROM 
   (SELECT n_cartao_refeicao, 
		   Empresa1, 
		   Empresa2, 
		   Empresa3, 
		   Empresa4, 
		   Empresa5, 
		   Empresa6, 
		   Empresa7, 
		   Empresa8, 
		   Empresa9, 
		   Empresa10
   FROM tb_empresas2) p
UNPIVOT
   (valor_cartao FOR Nome_empresa IN 
      (Empresa1, Empresa2, Empresa3, Empresa4, Empresa5, Empresa6, Empresa7, Empresa8, Empresa9, Empresa10)
	)
AS UNPIVOT_tb_empresas2