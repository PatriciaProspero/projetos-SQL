EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'PerfilPadr�o',
@recipients = 'patricia.prospero@hotmail.com',
@subject = 'T�tulo aqui',
@body = 'Conte�do aqui',
@body_format = 'HTML';