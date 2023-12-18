-- Column level constraint
-- Not Null: Null values not allowed
-- Unique : Only Unique values allowed, Null values allowed
-- Primary key: Only Unique values allowed, Null values NOT allowed
-- Default: Shows default values if nothing is inserted in the column
-- Check: Allows only value based on some condition

create database excelr;
use excelr;
drop table  student;

create table student(
GR_No int primary key,
Stud_name varchar(50) not null,
Roll_int int unique,
Address varchar(100) default "-",
Age int check(Age>=18)
);

insert into student(GR_No,Stud_name,Roll_int, Age)
values( 111, "Ninad",1,19);

insert into student(GR_No,Stud_name,Roll_int,Address,Age) 
values( 112, "Pranali",2, "Sunburn Apt",19);

-- Table Level constraint
-- Composite primary key

drop table  student;

create table student(
Stud_name varchar(50) not null,
Roll_no int ,
Stud_div varchar(4),
Address varchar(100) default "-",
Age int check(Age>=18),
email_id varchar(20) unique,
Constraint Roll_div primary key(Roll_no,Stud_div)
);

insert into student(Stud_name,Roll_no,Stud_div,Age, email_id)
values("Ninad",1,"A",19,"ninadmandavkar28@gmail.com" );

insert into student(Stud_name,Roll_no,Stud_div,Address,Age, email_id) 
values("Pranali",2, "Sunburn Apt",19);


-- A foreign key is a referential constraint 
-- Parent table
drop table product1;
create table product1(
Pid int primary key,
product_name varchar(50) not null,
product_quantity int,
per_unit_price float
);
insert into product1(Pid,product_name,product_quantity,per_unit_price)
values
(1,"Phone",20,10000.20),
(2,"laptop",30,40000.50),
(3,"Charger",15,1000);

-- Child Table
create table transaction_details(
Trans_id int primary key,
Trans_time timestamp default current_timestamp,
Pid int,
foreign key(Pid) references product1(Pid)
);
insert into transaction_details(Trans_id,Pid)
values
(111,1),
(112,2);

-- create students table
-- Roll_No (No null values showld be uinque)
-- Name (No null values accepted)
-- Age( Should accept values between 5 and 15)
-- Parents_email(Should be unique)
-- Address (By default it should be "-")

drop table student;
create table student(
Roll_No int primary key,
Stud_name  varchar(50) not null,
Age int check(Age between 5 and 15),
Parents_email varchar(100) unique,
Address varchar(100) default "-"
);

insert into student(Roll_No,Stud_name,Age,Parents_email,Address)
values( 111, "Ninad",14,"sunilmandavkar10@gmail.com","2/45,Lahore Nagar Delhi");
