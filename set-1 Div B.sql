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

mysql> show tables;
+-----------------+
| Tables_in_hiren |
+-----------------+
| employee        |
| student         |
+-----------------+
2 rows in set (0.00 sec)

mysql> create table client(C_ID int primary key, C_FirstName varchar(30), C_LastName varchar(30), Gender varchar(20), DOB date, Address varchar(60),Contact_No int not null);
Query OK, 0 rows affected (0.04 sec)

mysql> desc client;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| C_ID        | int         | NO   | PRI | NULL    |       |
| C_FirstName | varchar(30) | YES  |     | NULL    |       |
| C_LastName  | varchar(30) | YES  |     | NULL    |       |
| Gender      | varchar(20) | YES  |     | NULL    |       |
| DOB         | date        | YES  |     | NULL    |       |
| Address     | varchar(60) | YES  |     | NULL    |       |
| Contact_No  | int         | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> create table branch_details(B_ID int, B_Name varchar(100), address varchar(255), Total_Assets int, C_ID int references client(C_ID));
Query OK, 0 rows affected (0.04 sec)

mysql> desc branch_details;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| B_ID         | int          | YES  |     | NULL    |       |
| B_Name       | varchar(100) | YES  |     | NULL    |       |
| address      | varchar(255) | YES  |     | NULL    |       |
| Total_Assets | int          | YES  |     | NULL    |       |
| C_ID         | int          | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into client(C_ID,C_FirstName,C_LastName,Gender,Address,Contact_No) values(1,'hiren','parmar','male','mahuva',93136);
Query OK, 1 row affected (0.01 sec)

mysql> select * from client;
+------+-------------+------------+--------+------+-----------+------------+
| C_ID | C_FirstName | C_LastName | Gender | DOB  | Address   | Contact_No |
+------+-------------+------------+--------+------+-----------+------------+
|    1 | hiren       | parmar     | male   | NULL | mahuva    |      93136 |
|    2 | vivek       | rathod     | male   | NULL | mahuva    |    3342123 |
|    3 | diya        | rathod     | female | NULL | ahmedabad |    3342123 |
|    4 | yash        | gohil      | male   | NULL | ahmedabad |      38005 |
|    5 | khushi      | choksi     | female | NULL | ahmedabad |      38001 |
+------+-------------+------------+--------+------+-----------+------------+
5 rows in set (0.00 sec)

mysql> insert into branch_details(B_ID,B_Name,address,Total_Assets)values(1001,'SBI','ahmedabad',7500);
Query OK, 1 row affected (0.01 sec)

mysql> select * from branch_details;
+------+--------+-----------+--------------+------+
| B_ID | B_Name | address   | Total_Assets | C_ID |
+------+--------+-----------+--------------+------+
| 1001 | SBI    | ahmedabad |         7500 | NULL |
| 1002 | BOB    | ahmedabad |        25000 | NULL |
| 1003 | AXIS   | Rajkot    |        28000 | NULL |
| 1004 | SBI    | Rajkot    |         9000 | NULL |
| 1005 | SBI    | mahuva    |        15000 | NULL |
+------+--------+-----------+--------------+------+
5 rows in set (0.00 sec)

#Query ...

1)

mysql> select * from client where C_FirstName='hiren' && address='mahuva';
+------+-------------+------------+--------+------+---------+------------+
| C_ID | C_FirstName | C_LastName | Gender | DOB  | Address | Contact_No |
+------+-------------+------------+--------+------+---------+------------+
|    1 | hiren       | parmar     | male   | NULL | mahuva  |      93136 |
+------+-------------+------------+--------+------+---------+------------+
1 row in set, 1 warning (0.00 sec)

2)

mysql> update branch_details set address='mumbai' where Total_Assets=25000;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from branch_details;
+------+--------+-----------+--------------+------+
| B_ID | B_Name | address   | Total_Assets | C_ID |
+------+--------+-----------+--------------+------+
| 1001 | SBI    | ahmedabad |         7500 | NULL |
| 1002 | BOB    | mumbai    |        25000 | NULL |
| 1003 | AXIS   | Rajkot    |        28000 | NULL |
| 1004 | SBI    | Rajkot    |         9000 | NULL |
| 1005 | SBI    | mahuva    |        15000 | NULL |
+------+--------+-----------+--------------+------+
5 rows in set (0.00 sec)

3)

mysql> select C_ID, C_FirstName from client;
+------+-------------+
| C_ID | C_FirstName |
+------+-------------+
|    1 | hiren       |
|    2 | vivek       |
|    3 | diya        |
|    4 | yash        |
|    5 | khushi      |
+------+-------------+
5 rows in set (0.00 sec)

4)
mysql> select b.B_Name,c.C_First_Name from client c inner join 
	   branch_details b on b.B_ID=c.C_ID;
ERROR 1054 (42S22): Unknown column 'c.C_First_Name' in 'field list'

mysql> select client.C_FirstName,branch_details.B_Name 
		from client,branch_details 
		where client.C_ID=branch_details.B_ID;
Empty set (0.00 sec)

5)


# other Queries...

mysql> select * from client order by C_FirstName asc;
+------+-------------+------------+--------+------+-----------+------------+
| C_ID | C_FirstName | C_LastName | Gender | DOB  | Address   | Contact_No |
+------+-------------+------------+--------+------+-----------+------------+
|    3 | diya        | rathod     | female | NULL | ahmedabad |    3342123 |
|    1 | hiren       | parmar     | male   | NULL | mahuva    |      93136 |
|    5 | khushi      | choksi     | female | NULL | ahmedabad |      38001 |
|    2 | vivek       | rathod     | male   | NULL | mahuva    |    3342123 |
|    4 | yash        | gohil      | male   | NULL | ahmedabad |      38005 |
+------+-------------+------------+--------+------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select * from client order by C_FirstName desc;
+------+-------------+------------+--------+------+-----------+------------+
| C_ID | C_FirstName | C_LastName | Gender | DOB  | Address   | Contact_No |
+------+-------------+------------+--------+------+-----------+------------+
|    4 | yash        | gohil      | male   | NULL | ahmedabad |      38005 |
|    2 | vivek       | rathod     | male   | NULL | mahuva    |    3342123 |
|    5 | khushi      | choksi     | female | NULL | ahmedabad |      38001 |
|    1 | hiren       | parmar     | male   | NULL | mahuva    |      93136 |
|    3 | diya        | rathod     | female | NULL | ahmedabad |    3342123 |
+------+-------------+------------+--------+------+-----------+------------+
5 rows in set (0.00 sec)

mysql> update client set C_FirstName='yug' where C_ID=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from client;
+------+-------------+------------+--------+------+-----------+------------+
| C_ID | C_FirstName | C_LastName | Gender | DOB  | Address   | Contact_No |
+------+-------------+------------+--------+------+-----------+------------+
|    1 | hiren       | parmar     | male   | NULL | mahuva    |      93136 |
|    2 | vivek       | rathod     | male   | NULL | mahuva    |    3342123 |
|    3 | diya        | rathod     | female | NULL | ahmedabad |    3342123 |
|    4 | yug         | gohil      | male   | NULL | ahmedabad |      38005 |
|    5 | khushi      | choksi     | female | NULL | ahmedabad |      38001 |
+------+-------------+------------+--------+------+-----------+------------+
5 rows in set (0.00 sec)

mysql> update client set address='bhavnagar' where C_ID=4;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from client where address in ('bhavnagar','ahmedabad');
+------+-------------+------------+--------+------+-----------+------------+
| C_ID | C_FirstName | C_LastName | Gender | DOB  | Address   | Contact_No |
+------+-------------+------------+--------+------+-----------+------------+
|    3 | diya        | rathod     | female | NULL | ahmedabad |    3342123 |
|    4 | yug         | gohil      | male   | NULL | bhavnagar |      38005 |
|    5 | khushi      | choksi     | female | NULL | ahmedabad |      38001 |
+------+-------------+------------+--------+------+-----------+------------+
3 rows in set (0.00 sec)

mysql> alter table client add email varchar(30);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc client;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| C_ID        | int         | NO   | PRI | NULL    |       |
| C_FirstName | varchar(30) | YES  |     | NULL    |       |
| C_LastName  | varchar(30) | YES  |     | NULL    |       |
| Gender      | varchar(20) | YES  |     | NULL    |       |
| DOB         | date        | YES  |     | NULL    |       |
| Address     | varchar(60) | YES  |     | NULL    |       |
| Contact_No  | int         | NO   |     | NULL    |       |
| email       | varchar(30) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)