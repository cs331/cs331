insert into text values ('Smart Guy', 'Nice Book', 1999, '0123456789012');
insert into text (author, title, isbn, year) values ('Old Scholar', 'Deep Thoughts', '1234567890120', 1900);
insert into text (author, title, isbn, year) values ('Old Scholar', 'Great Science', '1234567890121', 1901);
insert into text (year, author, title, isbn) values (2000, 'Nasty Professor', 'Hard Tests', '1111111111111');

alter table text add (opinion varchar (10));

update text set opinion = 'Excellent!' where author = 'Old Scholar';
update text set opinion = 'Bestseller' where author = 'Smart Guy';
update text set opinion = 'Boo!! Bad!' where lower (title) like '%tests%';
