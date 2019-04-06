select operator_name,dolg_summa from dolg
join connection on connection.connection_id=dolg.dolg_connection_id
join operator_table on operator_table.operator_id = connection.connection_operator_id
where dolg_summa>3000 and operator_table.operator_name = 'MTC'