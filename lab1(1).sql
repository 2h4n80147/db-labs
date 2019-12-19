-- 1
create DATABASE lab1;

-- 2
create table if not exists users (
    id SERIAL,
    firstname varchar(50) ,
    lastnamee varchar(50)
);
-- 3
alter table users
    add column  isadmin integer;
-- 4
alter table users
    alter column isadmin type boolean;
-- 5
alter table users
    alter column isadmin set default false;
-- 6
alter table users
    add primary key (id);
-- 7
create table tasks (
    id serial,
    name varchar(50),
    user_id integer
);
-- 8
drop table tasks;

-- 9
DROP DATABASE lab1;


