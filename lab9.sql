drop table if exists customer cascade ;
drop table if exists salesman cascade ;
drop table if exists orders cascade ;
drop role if exists junior_dev ;
drop role if exists intern;
drop database if exists lab9;
create database lab9;

create table salesman(
    salesman_id serial primary key ,
    name varchar,
    city varchar,
    comission integer
);
create table customer(
    customer_id serial primary key ,
    customer_name varchar,
    city varchar,
    grade numeric,
    salesman_id integer references salesman(salesman_id)
);
create table orders(
    order_no integer,
    purcht_amt numeric,
    ord_date timestamp,
    customer_id integer references customer(customer_id),
    salesman_id integer references salesman(salesman_id)
);
--3
create role junior_dev login password 'some';
--4
create view avg_view as
select count(order_no),avg(order_no),name
from orders inner join salesman using(salesman_id)
group by salesman.salesman_id;
--5
create view number_view as
    select count(order_no),city from orders
        inner join customer using (customer_id) group by city;

grant all privileges on number_view to junior_dev;
--6
create view cust_view as
    select grade,customer_name from customer
        group by grade,customer_name
    having grade = min(grade);
grant select on cust_view to junior_dev;
--7
create view numb_of_view as
    select count(salesman_id),grade from salesman
         inner join customer using(salesman_id)
    group by grade;
--8
create view salesman_view as
    select * from salesman where 1 < (select count(*) from orders inner join salesman using (salesman_id));
--9
create role intern;
reassign owned by junior_dev to intern;


