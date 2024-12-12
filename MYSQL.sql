mysql> create database new;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| exam               |
| hiren              |
| information_schema |
| java               |
| mysql              |
| new                |
| performance_schema |
| sk                 |
| sk1                |
| sys                |
+--------------------+
10 rows in set (0.00 sec)

mysql> use new
Database changed

mysql> CREATE TABLE DEPARTMENT(DEPTID INT PRIMARY KEY, DEPTNAME VARCHAR(255) NOT NULL);
Query OK, 0 rows affected (0.10 sec)

mysql> DESC DEPARTMENT;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| DEPTID   | int          | NO   | PRI | NULL    |       |
| DEPTNAME | varchar(255) | NO   |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> CREATE TABLE EMPLOYEE(EMPID INT PRIMARY KEY, EMPNAME VARCHAR(255)
 NOT NULL, DOJ DATE NOT NULL, DEPTID INT, FOREIGN KEY(DEPTID) REFERENCES
 DEPARTMENT(DEPTID));
Query OK, 0 rows affected (0.07 sec)

mysql> DESC EMPLOYEE;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| EMPID   | int          | NO   | PRI | NULL    |       |
| EMPNAME | varchar(255) | NO   |     | NULL    |       |
| DOJ     | date         | NO   |     | NULL    |       |
| DEPTID  | int          | YES  | MUL | NULL    |       |
+---------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> INSERT INTO DEPARTMENT(DEPTID, DEPTNAME) VALUES (1,'IT');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO DEPARTMENT VALUES(2,'HR');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO DEPARTMENT(DEPTID, DEPTNAME) VALUES (3,'SALES'),(4,'DIGITAL MARKETING'),(5,'BDE');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+--------+-------------------+
| DEPTID | DEPTNAME          |
+--------+-------------------+
|      1 | IT                |
|      2 | HR                |
|      3 | SALES             |
|      4 | DIGITAL MARKETING |
|      5 | BDE               |
+--------+-------------------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE DEPARTMENT ADD DESIGNATION VARCHAR(255) NOT NULL;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC DEPARTMENT;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| DEPTID      | int          | NO   | PRI | NULL    |       |
| DEPTNAME    | varchar(255) | NO   |     | NULL    |       |
| DESIGNATION | varchar(255) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE DEPARTMENT ADD CITY VARCHAR(255) DEFAULT 'AHMEDABAD'
NOT NULL;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+--------+-------------------+-------------+-----------+
| DEPTID | DEPTNAME          | DESIGNATION | CITY      |
+--------+-------------------+-------------+-----------+
|      1 | IT                |             | AHMEDABAD |
|      2 | HR                |             | AHMEDABAD |
|      3 | SALES             |             | AHMEDABAD |
|      4 | DIGITAL MARKETING |             | AHMEDABAD |
|      5 | BDE               |             | AHMEDABAD |
+--------+-------------------+-------------+-----------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE DEPARTMENT DROP COLUMN DESIGNATION;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+--------+-------------------+-----------+
| DEPTID | DEPTNAME          | CITY      |
+--------+-------------------+-----------+
|      1 | IT                | AHMEDABAD |
|      2 | HR                | AHMEDABAD |
|      3 | SALES             | AHMEDABAD |
|      4 | DIGITAL MARKETING | AHMEDABAD |
|      5 | BDE               | AHMEDABAD |
+--------+-------------------+-----------+
5 rows in set (0.00 sec)

mysql> UPDATE DEPARTMENT SET CITY='RAJKOT' WHERE DEPTID <6 ;
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+--------+-------------------+-----------+
| DEPTID | DEPTNAME          | CITY      |
+--------+-------------------+-----------+
|      1 | IT                | RAJKOT    |
|      2 | HR                | RAJKOT    |
|      3 | SALES             | RAJKOT    |
|      4 | DIGITAL MARKETING | RAJKOT    |
|      5 | BDE               | RAJKOT    |
|      6 | WEB DEVELOPER     | BHAVNAGER |
|      7 | JAVA FULL STACK   |           |
+--------+-------------------+-----------+
7 rows in set (0.00 sec)

mysql> select * from department where CITY='RAJKOT' and (DEPTNAME like'D%');
+--------+-------------------+--------+
| DEPTID | DEPTNAME          | CITY   |
+--------+-------------------+--------+
|      4 | DIGITAL MARKETING | RAJKOT |
+--------+-------------------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM DEPARTMENT WHERE CITY='MAHUVA' AND EMPNAME LIKE'H%'
 OR DEPTNAME LIKE'%R';
+--------+---------------+-----------+---------+
| DEPTID | DEPTNAME      | CITY      | EMPNAME |
+--------+---------------+-----------+---------+
|      2 | HR            | RAJKOT    | NULL    |
|      6 | WEB DEVELOPER | BHAVNAGER | NULL    |
|      8 | HR            | MAHUVA    | HIREN   |
+--------+---------------+-----------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM DEPARTMENT WHERE DEPTID > 5;
+--------+-----------------+-----------+---------+
| DEPTID | DEPTNAME        | CITY      | EMPNAME |
+--------+-----------------+-----------+---------+
|      6 | WEB DEVELOPER   | BHAVNAGER | NULL    |
|      7 | JAVA FULL STACK |           | NULL    |
|      8 | HR              | MAHUVA    | HIREN   |
+--------+-----------------+-----------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM DEPARTMENT WHERE NOT DEPTID > 5;
+--------+-------------------+--------+---------+
| DEPTID | DEPTNAME          | CITY   | EMPNAME |
+--------+-------------------+--------+---------+
|      1 | IT                | RAJKOT | NULL    |
|      2 | HR                | RAJKOT | NULL    |
|      3 | SALES             | RAJKOT | NULL    |
|      4 | DIGITAL MARKETING | RAJKOT | NULL    |
|      5 | BDE               | RAJKOT | NULL    |
+--------+-------------------+--------+---------+
5 rows in set (0.01 sec)
