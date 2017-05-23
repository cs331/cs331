drop table section cascade constraints;
drop table adopt cascade constraints;
drop cluster adoptions;

create cluster adoptions ( 
    fdgt char (4),
    year char (4),
    smst char
);

create table section (
    department varchar (4) not null,
    course_num char (3) check (to_number (course_num) > 0),
    name varchar (20), 
    semester char,
    year char (4), 
    four_digit_id char (4) check (to_number (four_digit_id) >= 1000),
    constraint ys check (year > 1950 and year < 2000),
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
) cluster adoptions (four_digit_id, year, semester);

create index adoptions_idx on cluster adoptions;
