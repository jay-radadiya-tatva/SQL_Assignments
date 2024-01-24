
use jayradadiya_db
CREATE TABLE employee(
emp_id int not null primary key,
emp_name varchar(50) not null,
mngr_id int,
salary decimal(10,2),
dept_id int not null);

insert into employee values (7369,'SMITH',7902,800,20);

insert into employee values (7499,'ALLEN',7698,1600,30);

insert into employee values (7521,'WARD',7698,1250,30);

insert into employee values (7566,'JONES',7839,2975,20);

insert into employee values (7698,'BLAKE',7839,2850,30);

insert into employee values (7782,'CLARK',7839,2450,10);

insert into employee values (7788,'SCOTT',7566,3000,20);

insert into employee values (7839,'KING',null,5000,10);

insert into employee values (7844,'TURNER',7698,1500,30);

insert into employee values (7876,'ADAMS',7788,1100,20);

insert into employee values (7900,'JAMES',7698,950,30);

insert into employee values (7934,'MILLER',7782,1300,10);

insert into employee values (7902,'FORD',7566,3000,20);

insert into employee values (7654,'MARTIN',7698,1250,30);


CREATE TABLE department(
dept_id int not null primary key,
dept_name varchar(50) not null,
)


insert into department values (10,'Accounting');

insert into department values (20,'Research');

insert into department values (30,'Sales');

insert into department values (40,'Operations');


select * from employee
select * from department

--1. write a SQL query to find Employees who have the biggest salary in their Department
select * from employee
select * from department
select max(salary) as 'highest salary',d.dept_name from employee e join department d on d.dept_id=e.dept_id group by dept_name

select e.emp_name,e.salary,d.dept_name from employee e join department d on d.dept_id=e.dept_id where e.salary in(select max(salary) from employee group by dept_id)


--2. write a SQL query to find Departments that have less than 3 people in it

select d.dept_id,d.dept_name,count(*) as 'total emp.' from employee e join department d on d.dept_id=e.dept_id group by d.dept_id,d.dept_name having count(*)<3


--3. write a SQL query to find All Department along with the number of people there

select d.dept_id,d.dept_name,count(*) as 'total emp.' from employee e join department d on d.dept_id=e.dept_id group by d.dept_id,d.dept_name

--4. write a SQL query to find All Department along with the total salary there

select d.dept_id,d.dept_name,sum(e.salary) as 'total salary' from employee e join department d on d.dept_id=e.dept_id group by d.dept_id,d.dept_name
select * from employee
select * from department