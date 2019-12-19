create database lab2;

create table countries (
  country_id serial     primary key,
  country_name text,
  regiond_id  integer,
  population integer
);

insert into countries values (10, 'name of my country', 3,  1000);

insert into countries (country_id, country_name) values (4, 'country 2');
insert into countries (regiond_id) values(null);

insert into countries values (111, '77', 4, 1000), (112, '78', 5, 1000), (113, '79', 6, 2);
alter table countries
    alter column country_name set default 'Kazakhstan';
insert into countries (country_name) values(default);
insert into countries default values ;
CREATE TABLE countries_new ( like countries including all);

insert into countries_new select  * from countries;
update countries_new set regiond_id = 1 where regiond_id is null;

update countries_new set population = population * 1.1
    returning country_name,  population, country_name as "New population";

delete from countries where population < 100000;
delete from countries_new using countries where  countries.country_id is not null returning *;
delete from countries;


drop table if exists countries_new;
drop table if exists countries;

drop database if exists lab2;
