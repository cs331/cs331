drop table customer cascade constraints;
drop table author cascade constraints;
drop table book cascade constraints;
drop table sale cascade constraints;

create table customer (
    emailC varchar (36),
    nameC varchar (24),
    dept char (4), 
    primary key (emailC)
);

create table author (
    emailA varchar (36),
    nameA varchar (24),
    born date,
    country varchar (24),
    primary key (emailA)
);

create table book (
    isbn char (10),
    price decimal (10,2),
    copies decimal (10,0),
    title varchar (182) default '', 
    who varchar (36), 
    primary key (isbn),
    foreign key (who) references author
);

create table sale ( 
    buyer varchar (36),
    bought char (10),
    whenLast date,
    totalCount decimal (10.0) default 1,
    primary key (buyer, bought),
    foreign key (buyer) references customer,
    foreign key (bought) references book
);

insert into customer (emailC, nameC, dept) values ('hikingfan@gmail.com', 'Hiking Fan', 'CS');
insert into customer (emailC, nameC, dept) values ('bikingfan@gmail.com', 'Biking Fan', 'CS');
insert into customer (emailC, nameC, dept) values ('rowingfan@gmail.com', 'Rowing Fan', 'Math');

insert into author (emailA, nameA, born, country) values ('hikingfan@gmail.com', 'Hiking Fan', '25-Oct-1984', 'England');

select extract (month from born) as month from author; 
