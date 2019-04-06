select operator_name, sum(dolg_summa) from dolg join connection on connection.connection_id=dolg.dolg_connection_id
join operator_table on operator_table.operator_id = connection.connection_operator_id  
group by operator_table.operator_name
order by sum(dolg_summa) desc