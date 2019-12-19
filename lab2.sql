create database lab2;

create table project (
  id serial,
  name varchar(50),
  start_datetime timestamp without time zone ,
  end_datetime timestamp without time zone,
  is_finished boolean,
  desription text
);
alter table project
    add column created_at date;

alter table project
    alter column name set data type varchar(100);
alter table project
    alter column is_finished set default false;
alter table project
    add constraint a primary key (id);

create table tasks (
    id serial,
    name varchar(50),
    description text,
    priority smallint,
    project_id serial references project(id)
);

drop table project cascade;
drop table tasks;

drop database lab2;


