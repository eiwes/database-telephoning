select operator_table.operator_name ,max(tarif.tarif_number_count) from tarif 
join operator_table on tarif_operator_id = operator_table.operator_id
GROUP BY operator_table.operator_name;