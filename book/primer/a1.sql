drop table employee cascade constraints;
drop table works cascade constraints;
drop table company cascade constraints;
drop table manages cascade constraints;

create table employee (ename varchar (200), street varchar (20), city varchar (20));
create table works (ename varchar(20), cname varchar (20), salary decimal (8, 2));
create table company (cname varchar (20), city varchar (20));
create table manages (ename varchar (20), mname varchar (20), cname varchar (20));

insert into employee values ('John Wise', 'Sunny Hill', 'Forest City');
insert into employee values ('Mary Clever', 'Garden Lane', 'Flowertown');
insert into works values ('Mary Clever', 'Big Factory', 349.99);
insert into works values ('John Wise', 'Big Factory', 359.99);
insert into company values ('Big Factory', 'High Planes');
insert into manages values ('Mary Clever', 'John Wise', 'Big Factory');

select * from employee;
select * from works;
select * from company;
select * from manages;

select e.ename, salary, w.cname from employee e, works w where (e.ename = w.ename and (salary > 350 or w.cname like '%Big%'));
