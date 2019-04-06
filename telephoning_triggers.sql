create table schema_track(
    ddl_date date,
    ddl_user VARCHAR2(20),
    object_created VARCHAR2(20),
    object_name VARCHAR2(20),
    ddl_operation VARCHAR2(20)
);
/
create trigger track_system
after ddl on SCHEMA
begin
    insert into schema_track values(
        sysdate, 
        sys_context('USERENV', 'CURRENT_USER'),
        ora_dict_obj_type,
        ora_dict_obj_name,
        ora_sysevent
    );
end;
/
create trigger change_to_upper
after insert on abonent
for each row
begin
    update abonent set abonent_name = upper(abonent_name);
end;
/
create trigger show_new
after ddl on SCHEMA 
begin
      DBMS_OUTPUT.put_line('Some tables has new updates');
end;
/