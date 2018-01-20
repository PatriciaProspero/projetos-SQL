-- Modelo para pegar o ID de alguma coisa e não usar o Identtifi

-----------------------------------------------------
/* Temp para criar o ID do meio de pagamneto*/
   if object_id('tempdb..#temp_corp_meio_pagamento_patricia') is not null
     begin
	drop table #temp_corp_meio_pagamento_patricia
end
       
create table #temp_corp_meio_pagamento_patricia
(
	id_meio_pagamento_patricia	int
)
 ---------------------------------------------------
 BEGIN
  
  INSERT INTO dbo.corp_meio_pagamento_patricia (nm_meio_pagamento_patricia)
  /*Para dar Output no ID e na Tabela que você precisa*/
  OUTPUT inserted.id_meio_pagamento_patricia into #temp_corp_meio_pagamento_patricia 
  VALUES (@nm_meio_pagamento_patricia)
  
  SELECT @id_meio_pagamento_patricia = id_meio_pagamento_patricia 
  FROM #temp_corp_meio_pagamento_patricia 
  -----------------------------------------------------