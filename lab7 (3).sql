drop table if exists
    locations, departments, employees, job_grades, managers ;

drop database if exists
    lab7;
create table locations (
  location_id serial primary key,
  street_address varchar(25),
  postal_code varchar(12),
  city varchar(30),
  state_province varchar(12)
);
create table departments (
    department_id   serial primary key ,
    department_name  varchar(50) unique,
    budget          integer,
    location_id     integer references locations
);
create table employees (
    employee_id     serial primary key,
    first_name      varchar(50),
    last_name       varchar(50),
    email           varchar(50),
    phone_number    varchar(20),
    salary          integer,
    manager_id      integer references employees,
    department_id   integer references departments
);
create table job_grades (
    grade           char(1),
    lowest_salary   integer,
    highest_salary  integer
);
create table managers (
    manager_id serial primary key,
    first_name varchar(50),
    last_name varchar(50)
);

-- 3
select
       employees, first_name, department_id, city, state_province
from (employees natural inner join locations)
    where last_name like '%b%';

-- 4
select department_name, city, state_province
from departments natural join locations
group by department_id, city, state_province;

-- 5
select employees.first_name, managers.first_name
from employees left join managers on managers.manager_id = employees.manager_id;

-- 6
select avg(salary), grade
from employees inner join job_grades on employees.salary between lowest_salary and highest_salary
group by grade;

-- 7
select employees.first_name, employees.last_name, locations.city
from
     employees inner join departments on employees.department_id = departments.department_id
inner join locations on departments.location_id = locations.location_id
where locations.city = 'London';

-- 8
select first_name, last_name, department_id, department_name
from employees natural inner join departments;

-- 9
select first_name, last_name, departments.department_id, department_name
from employees inner join departments on employees.department_id = departments.department_id and employees.department_id in (40,80);

-- 10
select first_name, last_name, employees.department_id
from employees inner join (select department_id from employees where last_name = 'Taylor') taylor_departments
    on employees.department_id = taylor_departments.department_id;


