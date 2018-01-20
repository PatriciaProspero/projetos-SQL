EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'PerfilPadrão',
@recipients = 'patricia.prospero@hotmail.com',
@subject = 'Título aqui',
@body = 'Conteúdo aqui',
@body_format = 'HTML';