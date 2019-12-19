drop database if exists lab6;
create database lab6;
create table employees(
  emp_id serial,
  first_name varchar(20),
  last_name varchar(40),
  salary integer not null,
  begin_date date,
  end_date date,
  job_title varchar(50) default '',

);
create table department(
  department_id serial primary key,
  department_name varchar(5),
  emp_id integer references employees(emp_id),
  email varchar(40) unique,
  phone_number varchar(12),
  hire_date timestamp without time zone,
  commission float
);
alter table employees
    add constraint end_date_greater_than_begin_date
        check(end_date >= begin_date and begin_date >= '2001-01-01');
alter table employees
    add constraint chk_salary
        check(salary >= 65000);
alter table employees
    add constraint unique_last_name_when_logged_in
        unique (last_name);
alter table employees
    drop constraint chk_salary;
alter table department
    add constraint deparment_possible_names
        check(department_name in ('FIT', 'BS', 'FEOG', 'FCGE' ));
alter table department
    drop column emp_id;
select * from employees where last_name > 'Fleming';
alter table employees
    drop constraint unique_last_name_when_logged_in;




