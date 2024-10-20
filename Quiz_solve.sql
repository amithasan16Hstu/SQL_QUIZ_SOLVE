-- Create Salesman table first, as Customer references Salesman
CREATE TABLE salesman (
    salesman_id int PRIMARY KEY,
    name varchar(20),
    city varchar(20),
    commission numeric(5,2)
);

-- Create Customer table, with foreign key referencing Salesman
CREATE TABLE Customer (
    customer_id int PRIMARY KEY,
    cust_name varchar(20),
    city varchar(20),
    grade int,
    salesman_id int,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

-- Create Orders table, with foreign keys referencing Customer and Salesman
CREATE TABLE orders (
    ord_no int PRIMARY KEY,
    purch_amt numeric(5,2),
    ord_date date,
    customer_id int,
    salesman_id int,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

-- Insert data into Salesman table
INSERT INTO salesman(salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14);

-- Insert data into Customer table, ensuring valid foreign key references
INSERT INTO Customer(customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brand Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002);

-- Insert data into Orders table, ensuring valid customer_id and salesman_id references
INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3008, 5005);

-- Question 1
 Select sales.name AS Salesman, cus.cust_name,cus.city AS cus_city, sales.city AS sales_city
 From Customer AS cus
 INNER JOIN salesman AS sales ON cus.salesman_id= sales.salesman_id
 WHERE cus.city=sales.city;
 
 -- Question 2
 Select cus.cust_name AS Customer_Name, cus.city AS customer_city,sales.name AS Salesman_Name,sales.commission
 From Customer AS cus
 INNER JOIN salesman AS sales ON cus.salesman_id= sales.salesman_id
 WHERE sales.commission>0.12;
 
 -- Question 3
 Select cus.cust_name,cus.city AS Customer_city,cus.grade,sales.name AS Salesman,sales.city AS salesmancity
 From Customer AS cus
 INNER JOIN salesman AS sales ON cus.salesman_id= sales.salesman_id
  order by cus.customer_id asc;
  
  -- Question 4
  Select ord.ord_no,ord.purch_amt,cus.cust_name,cus.city
  From Customer AS cus
 INNER JOIN salesman AS sales ON cus.salesman_id= sales.salesman_id
 INNER JOIN orders AS ord ON sales.salesman_id = ord.salesman_id
 WHERE ord.purch_amt>=50 and ord.purch_amt<=2000;
 
 -- Question 5
 Select cus.cust_name,sales.name AS Salesman_name,ord.ord_date AS order_Date
 From Customer AS cus
 INNER JOIN salesman AS sales ON cus.salesman_id= sales.salesman_id
 INNER JOIN orders AS ord ON sales.salesman_id = ord.salesman_id
 WHERE ord.ord_date >= '2012-10-01' AND ord.ord_date<='2012-11-30';
 
 -- Question 6
 Select cus.cust_namecourse_info
 From Customer AS cus
 LEFT JOIN orders AS ord ON ord.customer_id = cus.customer_id
 WHERE ord.ord_no IS NULL;
 
 
 