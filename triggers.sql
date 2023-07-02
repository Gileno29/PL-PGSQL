CREATE TRIGGER <name_trigger> {BEFORE | AFTER} {EVENT [ OR ... ] } ON TABLE [FROM referenced_table_name]
				[FOR [EACH] {ROW | STATEMENT}]
				EXECUTE PROCEDURE function_name ( arguments )


		-- o evento pode ser um dentre: INSERT UPDATE [OF  column_name] [, ...] ] DELETE TRUNCATE


/* Criamos nossa trigger que informa que devemos executar  a funcionario_log_func() toda vez que houverem inserções ou atualizações na tabela Funcionarios */
CREATE TRIGGER log_trigger
AFTER INSERT OR UPDATE ON funcionarios
FOR EACH ROW
	EXECUTE PROCEDURE funcionario_log_func();



/* criar função funcionario_log_func

*/

CREATE OR REPLACE FUNCTION funcionario_log_func()
RETURNS trigger AS $$
BEGIN
	INSERT INTO funcionarios_auditoria
	(codigo_func, data_alteracao)
	VALUES
	(NEW.codigo, current_date);
	RETURN NEW; 
END;
$$ LANGUAGE plpgsql;
