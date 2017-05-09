/* 
Last Successful login time: Thu Apr 27 2017 17:13:04 -04:00

Connected to:
Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options

SQL> start a2

Table dropped.

drop table text1 cascade constraints
           *
ERROR at line 1:
ORA-00942: table or view does not exist



Table dropped.


Table dropped.


Table dropped.


Table created.


Table created.


Table created.


Table created.

SQL> start a3    

Table altered.


Table altered.


Table altered.


Table altered.


1 row created.

insert into section (department, course_num, course_name, semester, four_digit_id) values ('CSCI', 311, 'Database Systems', 'F', 2532)
*
ERROR at line 1:
ORA-02290: check constraint (HAKU9207.YS) violated



DEPA COU COURSE_NAME	      S YEAR FOUR
---- --- -------------------- - ---- ----
CSCI 311 Database Systems     S 1999 1717

SQL> exit
Disconnected from Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production
With the Partitioning, OLAP, Advanced Analytics and Real Application Testing options

*/
