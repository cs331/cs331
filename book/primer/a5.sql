create index text1_author_idx on text 1 (author); 

alter table text1 add (rank decimal (1,0));
alter table text1 add constraint gt check (rank between 0 and 5);
update text1 set rank = 5 where author = 'Old Scholar';
update text1 set rank = 0 where author = 'Nasty Professor';
update text1 set rank = 1 where year > 1990;
create bitmap index text1_rank_idx on text (rank);

select * from text1;
