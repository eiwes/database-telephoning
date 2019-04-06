select operator_table.operator_name, count(*) - count(abonent.passport_number) 
from abonent
join connection on connection.connection_abonent_id=abonent.abonent_id
join operator_table on operator_table.operator_id=connection.connection_operator_id
GROUP BY operator_table.operator_name;