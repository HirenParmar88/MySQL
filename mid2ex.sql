C:\Users\Hiren>mysql --version
mysql  Ver 8.0.35 for Win64 on x86_64 (MySQL Community Server - GPL)

C:\Users\Hiren>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.35 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> create database hiren;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| hiren              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use hiren;
Database changed
mysql> create table student(name varchar(30),id int not null primary key,address varchar(50),marks int);
Query OK, 0 rows affected (0.04 sec)

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(30) | YES  |     | NULL    |       |
| id      | int         | NO   | PRI | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
| marks   | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into student(marks,id,name,address)values(78,12,'hiren','mahuva');
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values('ravi',23,'mahuva',56);
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values('yash',45,'ahmedabad',79),('vivek',17,'bhavnagar',90);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | mahuva    |    78 |
| vivek | 17 | bhavnagar |    90 |
| ravi  | 23 | mahuva    |    56 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
4 rows in set (0.00 sec)

mysql> select id,name from student;
+----+-------+
| id | name  |
+----+-------+
| 12 | hiren |
| 17 | vivek |
| 23 | ravi  |
| 45 | yash  |
+----+-------+
4 rows in set (0.00 sec)

mysql> select * from student where id=12;
+-------+----+---------+-------+
| name  | id | address | marks |
+-------+----+---------+-------+
| hiren | 12 | mahuva  |    78 |
+-------+----+---------+-------+
1 row in set (0.00 sec)

mysql> select * from student whre name='ravi';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name='ravi'' at line 1
mysql> select * from student whre name="ravi";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'name="ravi"' at line 1
mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | mahuva    |    78 |
| vivek | 17 | bhavnagar |    90 |
| ravi  | 23 | mahuva    |    56 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
4 rows in set (0.00 sec)

mysql> insert into student values ('ram',12,'dudhala',67);
ERROR 1062 (23000): Duplicate entry '12' for key 'student.PRIMARY'
mysql> update student set adress='ahmedabad' where id=12;
ERROR 1054 (42S22): Unknown column 'adress' in 'field list'
mysql> update student set address='ahmedabad' where id=12;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| ravi  | 23 | mahuva    |    56 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
4 rows in set (0.00 sec)

mysql> alter table student add phonenum int;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(30) | YES  |     | NULL    |       |
| id       | int         | NO   | PRI | NULL    |       |
| address  | varchar(50) | YES  |     | NULL    |       |
| marks    | int         | YES  |     | NULL    |       |
| phonenum | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> select * from student;
+-------+----+-----------+-------+----------+
| name  | id | address   | marks | phonenum |
+-------+----+-----------+-------+----------+
| hiren | 12 | ahmedabad |    78 |     NULL |
| vivek | 17 | bhavnagar |    90 |     NULL |
| ravi  | 23 | mahuva    |    56 |     NULL |
| yash  | 45 | ahmedabad |    79 |     NULL |
+-------+----+-----------+-------+----------+
4 rows in set (0.00 sec)

mysql> update set phonenum=12345 where id=12;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'set phonenum=12345 where id=12' at line 1
mysql> update student set phonenum=12345 where id=12;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+-------+----+-----------+-------+----------+
| name  | id | address   | marks | phonenum |
+-------+----+-----------+-------+----------+
| hiren | 12 | ahmedabad |    78 |    12345 |
| vivek | 17 | bhavnagar |    90 |     NULL |
| ravi  | 23 | mahuva    |    56 |     NULL |
| yash  | 45 | ahmedabad |    79 |     NULL |
+-------+----+-----------+-------+----------+
4 rows in set (0.00 sec)

mysql> desc student;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(30) | YES  |     | NULL    |       |
| id       | int         | NO   | PRI | NULL    |       |
| address  | varchar(50) | YES  |     | NULL    |       |
| marks    | int         | YES  |     | NULL    |       |
| phonenum | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table student modify column name varchar(60);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(60) | YES  |     | NULL    |       |
| id       | int         | NO   | PRI | NULL    |       |
| address  | varchar(50) | YES  |     | NULL    |       |
| marks    | int         | YES  |     | NULL    |       |
| phonenum | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table student drop column phonenum;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| ravi  | 23 | mahuva    |    56 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
4 rows in set (0.00 sec)

mysql> desc student;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(60) | YES  |     | NULL    |       |
| id      | int         | NO   | PRI | NULL    |       |
| address | varchar(50) | YES  |     | NULL    |       |
| marks   | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> delete from student where name='ravi';
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> select sum(marks) from student;
+------------+
| sum(marks) |
+------------+
|        247 |
+------------+
1 row in set (0.00 sec)

mysql> select svg(marks) from student;
ERROR 1305 (42000): FUNCTION hiren.svg does not exist
mysql> select avg(marks) from student;
+------------+
| avg(marks) |
+------------+
|    82.3333 |
+------------+
1 row in set (0.00 sec)

mysql> select count(name) from student;
+-------------+
| count(name) |
+-------------+
|           3 |
+-------------+
1 row in set (0.00 sec)

mysql> select max(marks) from student;
+------------+
| max(marks) |
+------------+
|         90 |
+------------+
1 row in set (0.00 sec)

mysql> select min(marks) from student;
+------------+
| min(marks) |
+------------+
|         78 |
+------------+
1 row in set (0.00 sec)

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> select * from student order by id;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> select * from student order by marks;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| yash  | 45 | ahmedabad |    79 |
| vivek | 17 | bhavnagar |    90 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> select * from student order by id desc;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| yash  | 45 | ahmedabad |    79 |
| vivek | 17 | bhavnagar |    90 |
| hiren | 12 | ahmedabad |    78 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> select * from student where name like 'h%';
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
+-------+----+-----------+-------+
1 row in set (0.00 sec)

mysql> select * from student where name like '%h';
+------+----+-----------+-------+
| name | id | address   | marks |
+------+----+-----------+-------+
| yash | 45 | ahmedabad |    79 |
+------+----+-----------+-------+
1 row in set (0.00 sec)

mysql> select * from student where name like '_i%';
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
+-------+----+-----------+-------+
2 rows in set (0.00 sec)

mysql> select * from student where name like '%s_';
+------+----+-----------+-------+
| name | id | address   | marks |
+------+----+-----------+-------+
| yash | 45 | ahmedabad |    79 |
+------+----+-----------+-------+
1 row in set (0.00 sec)

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> create table employee(id int not null primary key,salary int,empcode int,name varchar(30));
Query OK, 0 rows affected (0.03 sec)

mysql> desc employee;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int         | NO   | PRI | NULL    |       |
| salary  | int         | YES  |     | NULL    |       |
| empcode | int         | YES  |     | NULL    |       |
| name    | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into employee values(12,20000,102,'aman'),(23,60000,104,'hiren'),(78,7000,105,'ram'),(45,30000,202,'yash');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+----+--------+---------+-------+
| id | salary | empcode | name  |
+----+--------+---------+-------+
| 12 |  20000 |     102 | aman  |
| 23 |  60000 |     104 | hiren |
| 45 |  30000 |     202 | yash  |
| 78 |   7000 |     105 | ram   |
+----+--------+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from student;
+-------+----+-----------+-------+
| name  | id | address   | marks |
+-------+----+-----------+-------+
| hiren | 12 | ahmedabad |    78 |
| vivek | 17 | bhavnagar |    90 |
| yash  | 45 | ahmedabad |    79 |
+-------+----+-----------+-------+
3 rows in set (0.00 sec)

mysql> select * from student inner join employee on student.id=employee.id;
+-------+----+-----------+-------+----+--------+---------+------+
| name  | id | address   | marks | id | salary | empcode | name |
+-------+----+-----------+-------+----+--------+---------+------+
| hiren | 12 | ahmedabad |    78 | 12 |  20000 |     102 | aman |
| yash  | 45 | ahmedabad |    79 | 45 |  30000 |     202 | yash |
+-------+----+-----------+-------+----+--------+---------+------+
2 rows in set (0.00 sec)

mysql> select * from student left join employee on student.id=employee.id;
+-------+----+-----------+-------+------+--------+---------+------+
| name  | id | address   | marks | id   | salary | empcode | name |
+-------+----+-----------+-------+------+--------+---------+------+
| hiren | 12 | ahmedabad |    78 |   12 |  20000 |     102 | aman |
| vivek | 17 | bhavnagar |    90 | NULL |   NULL |    NULL | NULL |
| yash  | 45 | ahmedabad |    79 |   45 |  30000 |     202 | yash |
+-------+----+-----------+-------+------+--------+---------+------+
3 rows in set (0.00 sec)

mysql> select * from student right join employee on student.id=employee.id;
+-------+------+-----------+-------+----+--------+---------+-------+
| name  | id   | address   | marks | id | salary | empcode | name  |
+-------+------+-----------+-------+----+--------+---------+-------+
| hiren |   12 | ahmedabad |    78 | 12 |  20000 |     102 | aman  |
| NULL  | NULL | NULL      |  NULL | 23 |  60000 |     104 | hiren |
| yash  |   45 | ahmedabad |    79 | 45 |  30000 |     202 | yash  |
| NULL  | NULL | NULL      |  NULL | 78 |   7000 |     105 | ram   |
+-------+------+-----------+-------+----+--------+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from student cross join employee;
+-------+----+-----------+-------+----+--------+---------+-------+
| name  | id | address   | marks | id | salary | empcode | name  |
+-------+----+-----------+-------+----+--------+---------+-------+
| yash  | 45 | ahmedabad |    79 | 12 |  20000 |     102 | aman  |
| vivek | 17 | bhavnagar |    90 | 12 |  20000 |     102 | aman  |
| hiren | 12 | ahmedabad |    78 | 12 |  20000 |     102 | aman  |
| yash  | 45 | ahmedabad |    79 | 23 |  60000 |     104 | hiren |
| vivek | 17 | bhavnagar |    90 | 23 |  60000 |     104 | hiren |
| hiren | 12 | ahmedabad |    78 | 23 |  60000 |     104 | hiren |
| yash  | 45 | ahmedabad |    79 | 45 |  30000 |     202 | yash  |
| vivek | 17 | bhavnagar |    90 | 45 |  30000 |     202 | yash  |
| hiren | 12 | ahmedabad |    78 | 45 |  30000 |     202 | yash  |
| yash  | 45 | ahmedabad |    79 | 78 |   7000 |     105 | ram   |
| vivek | 17 | bhavnagar |    90 | 78 |   7000 |     105 | ram   |
| hiren | 12 | ahmedabad |    78 | 78 |   7000 |     105 | ram   |
+-------+----+-----------+-------+----+--------+---------+-------+
12 rows in set (0.00 sec)

mysql>