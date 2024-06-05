create table payment
(id int, amount int,mode varchar(100),dateOfPayment date);

INSERT INTO payment (id,amount,mode,dateOfPayment) values
(11, 12000, 'cash', '2022-11-21'),
(22, 11200, 'upi', '2022-10-11'),
(33, 13000, 'cheque', '2021-05-10'),
(44, 14000, 'credit card', '2020-08-22'),
(55, 12500, 'debit card', '2022-12-01'),
(66, 11800, 'net banking', '2021-07-15'),
(77, 13500, 'cash', '2020-06-20'),
(88, 14500, 'upi', '2021-09-30'),
(99, 15000, 'cheque', '2023-01-05'),
(100, 16000, 'credit card', '2022-03-14');

SELECT mode,sum(amount) from payment group by mode;

SELECT EXTRACT(MONTH from dateOfPayment) as payMonth from payment;
SELECT EXTRACT(DAY from dateOfPayment) as payMonth from payment;

create table customer(id int, name varchar(100)) 

INSERT INTO customer (id, name) VALUES
(11, 'John Doe'),
(22, 'Jane Smith'),
(33, 'Alice Johnson'),
(44, 'Robert Brown'),
(55, 'Emily Davis'),
(66, 'Michael Wilson'),
(77, 'Sarah Miller'),
(88, 'David Martinez'),
(99, 'Laura Hernandez'),
(100, 'James Clark');

SELECT c.name,p.amount, p.mode
from customer as c
left join payment as p
on c.id=p.id
order by p.amount;



















































