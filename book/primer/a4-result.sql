/* 
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

drop table text cascade constraints;
drop table text1 cascade constraints;
drop table teacher cascade constraints;
drop table section cascade constraints;
drop table adopt cascade constraints;

create table text ( 
    author varchar (20),
    title varchar (20),
    year decimal (4,0),
    isbn varchar (13),
    primary key (isbn), 
    constraint yt check (year > 1800)
);

create table teacher (
    soc_sec decimal (9, 0),
    first_name varchar (20) not null,
    last_name varchar (20) not null,
    phone decimal (4,0),
    primary key (soc_sec),
    constraint ph check (phone > 0),
    constraint ss check (soc_sec >=0),
    constraint nmph unique (last_name, phone)
);

create table section (
    department varchar (4) not null,
    course_num char (3) check (to_number (course_num) > 0),
    course_name varchar (20), 
    semester char,
    year char (4),
    four_digit_id char (4) check (to_number (four_digit_id) >= 1000),
    constraint ys check (year > 1950 AND year < 2005),
    constraint sm check (semester in ('S', 'F', 'M')),
    primary key (four_digit_id, year, semester)
);

create table adopt (
    soc_sec decimal (9, 0),
    four_digit_id char (4),
    year char (4),
    semester char,
    isbn varchar (13),
    primary key (soc_sec, four_digit_id, year, semester, isbn),
    foreign key (soc_sec) references teacher,
    foreign key (isbn) references text,
    foreign key (four_digit_id, year, semester) references section
);

alter table section drop constraint ys;
alter table section add constraint ys check (year > 1950 AND year < 2025);
alter table section modify (year char (4) default 2004);
alter table section modify (year char (4) default to_char (sysdate, 'YYYY'));

insert into section (department, course_num, course_name, semester, four_digit_id, year) values ('CSCI', 311, 'Database Systems', 'S', '1717', 1999);
insert into section (department, course_num, course_name, semester, four_digit_id) values ('CSCI', 311, 'Database Systems', 'F', 2532);

select * from section;

insert into text values ('Smart Guy', 'Nice Book', 1999, '0123456789012');
insert into text (author, title, isbn, year) values ('Old Scholar', 'Deep Thoughts', '1234567890120', 1900);
insert into text (author, title, isbn, year) values ('Old Scholar', 'Great Science', '1234567890121', 1901);
insert into text (year, author, title, isbn) values (2000, 'Nasty Professor', 'Hard Tests', '1111111111111');

alter table text add (opinion varchar (10));

update text set opinion = 'Excellent!' where author = 'Old Scholar';
update text set opinion = 'Bestseller' where author = 'Smart Guy';
update text set opinion = 'Boo!! Bad!' where lower (title) like '%tests%';

delete from text where (lower (opinion) like '%bad%');

drop view new_text;
create view new_text as select author, title, year, isbn from text;
select * from new_text;

create table text1 (author varchar (20), title varchar (20), year decimal (4, 0), isbn varchar (13), primary key (isbn), constraint yt1 check (year > 1800));

insert into text1 (author, title, year, isbn) select * from new_text;

select * from text1;



Table dropped.

Table dropped.

Table dropped.

Table dropped.

Table created.

Table created.

Table created.

Table created.

1 row(s) inserted.

1 row(s) inserted.

1 row(s) inserted.

1 row(s) inserted.

1 row(s) inserted.

1 row(s) inserted.

Result Set 140
ENAME	STREET	CITY
John Wise	Sunny Hill	Forest City
Mary Clever	Garden Lane	Flowertown

2 rows selected.

Result Set 141
ENAME	CNAME	SALARY
Mary Clever	Big Factory	349.99
John Wise	Big Factory	359.99

2 rows selected.

Result Set 142
CNAME	CITY
Big Factory	High Planes

Result Set 143
ENAME	MNAME	CNAME
Mary Clever	John Wise	Big Factory

Result Set 144
ENAME	SALARY	CNAME
Mary Clever	349.99	Big Factory
John Wise	359.99	Big Factory

2 rows selected.

Table dropped.

Table dropped.

Table dropped.

Table dropped.

Table dropped.

Table created.

Table created.

Table created.

Table created.

Table altered.

Table altered.

Table altered.

Table altered.

1 row(s) inserted.

1 row(s) inserted.

Result Set 145
DEPARTMENT	COURSE_NUM	COURSE_NAME	SEMESTER	YEAR	FOUR_DIGIT_ID
CSCI	311	Database Systems	S	1999	1717
CSCI	311	Database Systems	F	2017	2532

2 rows selected.

1 row(s) inserted.

1 row(s) inserted.

1 row(s) inserted.

1 row(s) inserted.

Table altered.

2 row(s) updated.

1 row(s) updated.

1 row(s) updated.

1 row(s) deleted.

View dropped.

View created.

Result Set 146
AUTHOR	TITLE	YEAR	ISBN
Smart Guy	Nice Book	1999	0123456789012
Old Scholar	Deep Thoughts	1900	1234567890120
Old Scholar	Great Science	1901	1234567890121

3 rows selected.

Table created.

3 row(s) inserted.

Result Set 147
AUTHOR	TITLE	YEAR	ISBN
Smart Guy	Nice Book	1999	0123456789012
Old Scholar	Deep Thoughts	1900	1234567890120
Old Scholar	Great Science	1901	1234567890121

3 rows selected.

*/
