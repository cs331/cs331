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

insert into author (emailA, nameA, born, country) values ('katyperry@example.com', 'Katy Perry', '25-Oct-1984', 'USA');
insert into author (emailA, nameA, born, country) values ('bryanadams@example.com', 'Bryan Adams', '5-Nov-1959', 'Canada');
insert into author (emailA, nameA, born, country) values ('philcollins@example.com', 'Phil Collins', '30-Jan-1951', 'England');
insert into author (emailA, nameA, born, country) values ('kesha@example.com', 'Kesha Rose Sebert', '1-Mar-1987', 'USA');

insert into book (isbn, price, copies, title, who) values ('3869305002', 164.71, 4, 'Bryan Adams: Exposed', 'katyperry@example.com');

insert into sale (buyer, bought, whenLast, totalCount) values ('hikingfan@gmail.com', '3869305002', '14-Feb-2007', 25);
insert into sale (buyer, bought, whenLast, totalCount) values ('bikingfan@gmail.com', '3869305002', '14-Feb-2007', 25);
insert into sale (buyer, bought, whenLast, totalCount) values ('rowingfan@gmail.com', '3869305002', '14-Feb-2007', 125);

select nameA, emailA, max (price), sum(totalCount)
from author, book, sale
where book.isbn = sale.bought and
book.who = author.emailA and
author.born > '31-DEC-1980'
group by nameA, emailA
having sum(totalCount) >= 100;
