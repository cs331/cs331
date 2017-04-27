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
