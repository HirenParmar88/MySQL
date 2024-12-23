CREATE TABLE CUSTOMER(
CID NUMBER(3) PRIMARY KEY,
CNAME VARCHAR(30) NOT NULL,
CITY VARCHAR(25) NOT NULL,
DOB DATE
);

CREATE TABLE PRODUCT(
PID NUMBER(3) PRIMARY KEY,
PNAME VARCHAR(25) NOT NULL,

)

#assignment que rdbms...
# 1

create table customer(
c_id int primary key, 
c_name varchar(255), 
city varchar(100), 
dob date);

create table product(
p_id int primary key,
p_name varchar(255),
p_cost float,
p_profit float);

create table sales_details(
s_id int primary key,
c_id int,
p_id int,
sales varchar(255),
sales_date date,
foreign key(c_id) references customer(c_id),
foreign key(p_id) references product(p_id));

#Queries...

1)insert into customer values(101,'hiren','bhavnagar','5-nov-2023');

SQL> select * from customer order by c_name desc;

SQL> update customer set c_name='ravi' where c_id=101;

SQL> select * from customer order by dob asc;

SQL> select * from customer where city in('surat','rajkot','ahmedabad');

  C_ID
----------
C_NAME
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CITY                                                                                                 DOB
---------------------------------------------------------------------------------------------------- ---------
       103
mayank
surat                                                                                                01-NOV-23

       104
chintan
ahmedabad                                                                                            03-NOV-23

       105
sahil
rajkot                                                                                               04-NOV-23

SQL> alter table customer add email varchar(255);

Table altered.

SQL> desc customer;
 Name                                            Null?    Type
 ----------------------------------------------- -------- --------------------------------
 C_ID                                            NOT NULL NUMBER(38)
 C_NAME                                                   VARCHAR2(255)
 CITY                                                     VARCHAR2(100)
 DOB                                                      DATE
 EMAIL                                                    VARCHAR2(255)
 
 # two table join Queries...
 
 
select customer.c_name,sales_details.sales
from customer,sales_details
where customer.c_id=sales_details.c_id;
