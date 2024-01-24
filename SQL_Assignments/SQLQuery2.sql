
use jayradadiya_db
--Sample table1: salesman

---salesman_id

---name

---city

---commission
create table salesman(
	salesman_id int primary key,
	name varchar(255),
	city varchar(255),
	commission float
)





insert into salesman values 
(1001,'PEEL','LONDON', .12),
(1002,'SERRES','SANJOSE',.13),
(1004,'NOTIKA','LONDON',.11),
(1007,'RIFKIN','BARCELONA',.15),
(1003,'AXELROD','NEWYORK',.1)

select * from salesman
--Sample table2: customer

---customer_id

---cust_name

---city

---grade

---salesman_id

create table customer(
customer_id int not null,
cust_name varchar(255) not null,
city varchar(255) not null,
grade int not null,
salesman_id int not null)

insert into customer values
(2001,'HOFFMAN','LONDON',100,1001),
(2002,'GIOVANNI','ROME',200,1003),
(2003,'LIU','SANJOSE',200,1002),
(2004,'GRASS','BERLIN',300,1002),
(2006,'CLEMENS','LONDON',100,1001),
(2008,'CISNEROS','SANJOSE',300,1007),
(2007,'PERIERA','ROME',100,1004)

select * from customer
--Sample table3: orders

---ord_no

---purch_amt

---ord_date

---customer_id

---salesman_id

create table orders(
ord_no int not null,
purch_amt float not null,
ord_date date not null,
customer_id int not null,
salesman_id int not null)

insert into orders values(
3001,18.69,'1990-3-10',2008,1007),
(3003,767.19,'1990-3-10',2001,1001),
(3002,1900.1,'1990-3-10',2007,1004),
(3005,5160.45,'1990-3-10',2003,1002),
(3006,1098.16,'1990-3-10',2008,1007),
(3009,1713.23,'1990-4-10',2002,1003),
(3007,75.75,'1990-4-10',2004,1002),
(3008,4723,'1990-5-10',2006,1001),
(3010,1309.95,'1990-6-10',2004,1002),
(3011,9891.88,'1990-6-10',2006,1001),
(3012,900.45,'1990-3-10',2006,1007)

select * from orders

select * from customer;
select * from salesman;


--1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city

select s.name,c.cust_name,s.city from salesman s inner join customer c on s.city = c.city;


--2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city 

select * from orders
select * from customer;

select o.ord_no,o.purch_amt,c.cust_name,c.city from orders o inner join customer c on o.customer_id=c.customer_id where o.purch_amt between 500 and 2000;

--3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission 

select * from salesman;
select * from customer;

select c.cust_name,c.city,s.name,s.commission from salesman s inner join customer c on s.salesman_id = c.salesman_id;

--4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

select * from salesman;
select * from customer;

select c.cust_name,c.city,s.name,s.commission from salesman s inner join customer c on s.salesman_id = c.salesman_id where s.commission > 0.12;

--5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and 
--have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission
select * from salesman;
select * from customer;
select c.cust_name,c.city,s.name,s.city,s.commission from salesman s inner join customer c on s.salesman_id = c.salesman_id where c.city != s.city and s.commission > 0.12;

--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission

select * from orders
select * from customer;
select * from salesman;

select o.ord_no,o.ord_date,o.purch_amt,c.cust_name,c.grade,s.name,s.commission from orders o inner join customer c on o.customer_id=c.customer_id 
inner join salesman s on c.salesman_id=s.salesman_id and s.salesman_id = o.salesman_id

--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.

--8. write a SQL query to display the customer name, customer city, grade, salesman, 
--salesman city. The results should be sorted by ascending customer_id.

select * from customer;
select * from salesman;
select c.cust_name,c.city as cus_city,c.grade,s.name,s.city as sal_city from customer c inner join salesman s on c.salesman_id = s.salesman_id order by customer_id

--9. write a SQL query to find those customers with a grade less than 300. Return 
--cust_name, customer city, grade, Salesman, salesmancity. The result should be 
--ordered by ascending customer_id. 
select * from customer;
select * from salesman;
select c.cust_name,c.city as cus_city,c.grade,s.name,s.city as sal_city from customer c inner join salesman s on c.salesman_id = s.salesman_id where grade<300 order by customer_id

--10. Write a SQL statement to make a report with customer name, city, order number, 
--order date, and order amount in ascending order according to the order date to 
--determine whether any of the existing customers have placed an order or not

select * from orders
select * from customer;

select o.ord_no,o.purch_amt,c.cust_name,c.city,o.ord_date from customer c left join orders o on o.customer_id=c.customer_id order by ord_date

--11. Write a SQL statement to generate a report with customer name, city, order number, 
--order date, order amount, salesperson name, and commission to determine if any of 
--the existing customers have not placed orders or if they have placed orders through 
--their salesman or by themselves
select * from orders
select * from customer;
select * from salesman;
select o.ord_no,o.purch_amt,c.cust_name,c.city,o.ord_date from customer c left join orders o on o.customer_id=c.customer_id left join salesman s on c.salesman_id=s.salesman_id

--12. Write a SQL statement to generate a list in ascending order of salespersons who 
--work either for one or more customers or have not yet joined any of the customersselect * from customer;
select * from salesman;

select * from salesman s left join customer c on s.salesman_id=c.salesman_id order by s.salesman_id

--13. write a SQL query to list all salespersons along with customer name, city, grade, 
--order number, date, and amount.select * from orders
select * from customer;
select * from salesman;
select o.ord_no,o.purch_amt,c.cust_name,c.city,o.ord_date from salesman s left join customer c on c.salesman_id=s.salesman_id left join orders o on c.customer_id = o.customer_id--14. Write a SQL statement to make a list for the salesmen who either work for one or 
--more customers or yet to join any of the customers. The customer may have placed, 
--either one or more orders on or above order amount 2000 and must have a grade, or 
--he may not have placed any order to the associated supplier.select s.salesman_id,s.name,c.cust_name,o.ord_no,o.purch_amt from salesman s left join customer c on c.salesman_id=s.salesman_id left join orders o on c.customer_id = o.customer_id where c.grade is not null and o.purch_amt>2000--15. Write a SQL statement to generate a list of all the salesmen who either work for one 
--or more customers or have yet to join any of them. The customer may have placed 
--one or more orders at or above order amount 2000, and must have a grade, or he 
--may not have placed any orders to the associated supplier.

select s.salesman_id,s.name,c.cust_name,o.ord_no,o.purch_amt from salesman s left join customer c on c.salesman_id=s.salesman_id left join orders o on c.customer_id = o.customer_id where c.grade is not null and o.purch_amt>2000--16. Write a SQL statement to generate a report with the customer name, city, order no. 
--order date, purchase amount for only those customers on the list who must have a 
--grade and placed one or more orders or which order(s) have been placed by the 
--customer who neither is on the list nor has a grade.select * from orders
select * from customer;SELECT c.cust_name AS "Customer Name",
       c.city,
       o.ord_no,
       o.ord_date,
       o.purch_amt
  FROM customer c
  RIGHT JOIN orders o
    ON c.customer_id= o.customer_id;

--	17. Write a SQL query to combine each row of the salesman table with each row of the 
--customer table

select * from salesman full outer join customer on salesman.salesman_id  = customer.salesman_id

--18. Write a SQL statement to create a Cartesian product between salesperson and 
--customer, i.e. each salesperson will appear for all customers and vice versa for that 
--salesperson who belongs to that city

select * from salesman s cross join customer c where s.city=c.city

--19. Write a SQL statement to create a Cartesian product between salesperson and 
--customer, i.e. each salesperson will appear for every customer and vice versa for 
--those salesmen who belong to a city and customers who require a grade

select * from salesman s cross join customer c where s.city is not null and c.grade is not null

--20. Write a SQL statement to make a Cartesian product between salesman and 
--customer i.e. each salesman will appear for all customers and vice versa for those 
--salesmen who must belong to a city which is not the same as his customer and the 
--customers should have their own gradeselect * from salesman s cross join customer c where s.city is not null and c.grade is not null and s.city=c.city