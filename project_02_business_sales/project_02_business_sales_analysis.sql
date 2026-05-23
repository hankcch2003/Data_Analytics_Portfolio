-- Create database
CREATE DATABASE business_sales_analysis;
GO

-- Use database
USE business_sales_analysis;
GO

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    segment VARCHAR(20)
);

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert customer data
INSERT INTO customers VALUES
(1, 'Alex Chen', 'Taipei', 'Gold'),
(2, 'Jenny Lin', 'Taichung', 'Silver'),
(3, 'Kevin Wu', 'Kaohsiung', 'VIP'),
(4, 'Cindy Huang', 'Taipei', 'Gold'),
(5, 'David Tsai', 'Tainan', 'Standard');

-- Insert product data
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 30000),
(102, 'Phone', 'Electronics', 20000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Monitor', 'Electronics', 8000),
(105, 'Keyboard', 'Accessories', 1500);

-- Insert order data
INSERT INTO orders VALUES
(1001, 1, 101, '2024-05-01', 1, 30000),
(1002, 2, 102, '2024-05-02', 2, 40000),
(1003, 3, 103, '2024-05-03', 3, 9000),
(1004, 4, 104, '2024-05-04', 1, 8000),
(1005, 5, 105, '2024-05-05', 4, 6000);

-- Update customer segment
UPDATE customers
SET segment = 'Premium'
WHERE customer_id = 5;

-- JOIN analysis
SELECT
    c.customer_name,
    p.product_name,
    o.quantity,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id;

-- Customer KPI analysis
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Product KPI analysis
SELECT
    p.category,
    SUM(o.total_amount) AS total_sales
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category;

-- Create view
CREATE VIEW sales_summary AS
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- CTE analysis
WITH customer_cte AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_cte;

-- Window function analysis
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spending,
    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS ranking
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- CSV export query
SELECT
    c.customer_name,
    c.segment,
    p.product_name,
    p.category,
    o.quantity,
    o.total_amount,
    o.order_date
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id;