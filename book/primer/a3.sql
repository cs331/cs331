alter table section drop constraint ys;
alter table section add constraint ys check (year > 1950 AND year < 2005);
alter table section modify (year char (4) default 2004);
alter table section modify (year char (4) default to_char (sysdate, 'YYYY'));

insert into section (department, course_num, course_name, semester, four_digit_id, year) values ('CSCI', 311, 'Database Systems', 'S', '1717', 1999);
insert into section (department, course_num, course_name, semester, four_digit_id) values ('CSCI', 311, 'Database Systems', 'F', 2532);

select * from section;
