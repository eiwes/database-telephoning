drop table abonent;
CREATE TABLE abonent(
    abonent_id int,
    abonent_name VARCHAR(20),
    abonent_surname VARCHAR(20),
    abonent_gender VARCHAR(20),
    abonent_address VARCHAR(20)
);
alter table abonent add(
    constraint abonent_pk primary key(abonent_id)
);
drop sequence abonent_seq;
create sequence abonent_seq start with 1;
drop trigger abonent_bir;
create trigger abonent_bir
before insert on abonent
for each row
begin
    SELECT abonent_seq.NEXTVAL
    INTO   :new.abonent_id
    FROM   dual;
end;
/
drop table operator;
create table operator(
    operator_id int,
    operator_name varchar(20)
);
alter table operator add(
    constraint operator_pk primary key(operator_id)
);
drop sequence operator_seq;
create sequence operator_seq start with 1;
drop trigger operator_bir;
create trigger operator_bir before insert on operator for each row
begin
    select operator_seq.nextval
    into :new.operator_id
    from dual;
end;
/
drop table connection;
create table connection(
    connection_id int,
    connection_abonent_id int,
    connection_operator_id int,
    foreign key (connection_abonent_id) references abonent(abonent_id),
    foreign key (connection_operator_id) references operator(operator_id)
);
alter table connection add(
    constraint connection_pk primary key(connection_id)
);
drop sequence connection_seq;
create sequence connection_seq start with 1;
drop trigger connection_bir;
create trigger connection_bir before insert on connection for each row
begin 
    select connection_seq.nextval
    into :new.connection_id
    from dual;
end;
/    
    
create table dolg(
    dolg_id int,
    dolg_connection_id int,
    dolg_summa int,    
    foreign key (dolg_connection_id) references connection(connection_id)
);
alter table dolg add(
    constraint dolg_pk primary key(dolg_id)
);

create sequence dolg_seq start with 1;

create trigger dolg_bir before insert on dolg for each row
begin 
    select dolg_seq.nextval
    into :new.dolg_id
    from dual;
end;
/

create table address(
    address_id int,
    address_abonent_id int,
    address_street VARCHAR(20),
    address_number int,
    foreign key (address_abonent_id) references abonent(abonent_id)
);
alter table address add(
    constraint address_pk primary key(address_id)
);

create sequence address_seq start with 1;

create trigger address_bir before insert on address for each row
begin 
    select address_seq.nextval
    into :new.address_id
    from dual;
end;
/

create table tarif(
    tarif_id int,
    tarif_operator_id int,
    tarif_name varchar(20),
    tarif_number_count int,    
    foreign key (tarif_operator_id) references operator(operator_id)
);
alter table tarif add(
    constraint tarif_pk primary key(tarif_id)
);

create sequence tarif_seq start with 1;

create trigger tarif_bir before insert on tarif for each row
begin 
    select tarif_seq.nextval
    into :new.tarif_id
    from dual;
end;
/

