-- with clause (CTE)

select * from employee;

select * from employee where salary>=(select round(avg(salary),2) from employee);

-- same query using with clause

with avg_salary(avgSal)
as (select cast(avg(salary) as int) from employee)
select *
from employee as e, avg_salary as av
where e.salary>av.avgSal;

CREATE TABLE store_data (
    store_id INTEGER,
    store_name VARCHAR(50),
    product VARCHAR(50),
    quantity INTEGER,
    cost INTEGER
);

INSERT INTO store_data (store_id, store_name, product, quantity, cost) VALUES
(2, 'Apple Originals 1', 'iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 1', 'MacBook pro 13', 3, 2000),
(4, 'Apple Originals 1', 'AirPods Pro', 2, 280),
(5, 'Apple Originals 2', 'iPhone 12 Pro', 2, 1000),
(6, 'Apple Originals 3', 'iPhone 12 Pro', 4, 1000),
(7, 'Apple Originals 3', 'MacBook pro 13', 2, 2000),
(8, 'Apple Originals 3', 'MacBook Air', 3, 1100),
(9, 'Apple Originals 3', 'iPhone 12', 2, 1000),
(10, 'Apple Originals 3', 'AirPods Pro', 3, 280),
(11, 'Apple Originals 4', 'iPhone 12 Pro', 4, 1000),
(11, 'Apple Originals 4', 'MacBook pro 13', 4, 2500);

SELECT * FROM sales;

-- Find stores who's sales were better than the average sales accross all stores
-- 1) find total sales as per stores
select store_id, cast(sum(cost*quantity) as int) as totalSales from sales group by store_id;

-- 2) find the average sales of of all the stores
select cast(avg(totalSales) as int) avg_sales_stores
from (
		select store_id, cast(sum(cost*quantity) as int) as totalSales
		from sales group by store_id
     ) as avgSales;
-- 3)find the stores where total sales are greater than the avg sales of all stores




-- using CTE
-- WITH total_sales AS (
--     SELECT store_id, CAST(SUM(cost * quantity) AS INT) AS totalSales
--     FROM Sales
--     GROUP BY store_id
-- ),
-- avg_sales AS (
--     SELECT cast(AVG(cost * quantity) as int) AS avgSales
--     FROM Sales
-- )
-- SELECT s.*, ts.totalSales
-- FROM Sales s
-- JOIN total_sales ts ON s.store_id = ts.store_id
-- JOIN avg_sales a ON ts.totalSales > a.avgSales;


with total_sales(store_id,totalSales_per_store)
as ( SELECT store_id, cast(sum(cost*quantity)as int) AS totalSales_per_store
     from
	 Sales
	 group by store_id
   ),
   avg_sales(avgSales_per_store)
as (SELECT cast(avg(totalSales_per_store) as int) as avgSales_per_store
    from total_sales
   )
select *
from total_sales as ts
join avg_sales as av
on ts.totalSales_per_store>av.avgSales_per_store;














































