-- Create database
CREATE DATABASE financial_analysis;
GO

-- Use database
USE financial_analysis;
GO

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create financial records table
CREATE TABLE financial_records (
    financial_id INT PRIMARY KEY,
    sale_id INT,
    revenue DECIMAL(12,2),
    cost DECIMAL(12,2),
    profit DECIMAL(12,2),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);

-- Insert product data
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 1200),
(2, 'Phone', 'Electronics', 800),
(3, 'Headphones', 'Accessories', 150),
(4, 'Keyboard', 'Accessories', 100),
(5, 'Monitor', 'Electronics', 300);

-- Insert sales data
INSERT INTO sales VALUES
(101, 1, '2024-05-01', 2),
(102, 2, '2024-05-02', 3),
(103, 3, '2024-05-03', 5),
(104, 4, '2024-05-04', 4),
(105, 5, '2024-05-05', 2);

-- Insert financial records
INSERT INTO financial_records VALUES
(1001, 101, 2400, 1800, 600),
(1002, 102, 2400, 1600, 800),
(1003, 103, 750, 500, 250),
(1004, 104, 400, 250, 150),
(1005, 105, 600, 450, 150);

-- Update product price for business adjustment
UPDATE products
SET unit_price = 1300
WHERE product_id = 1;

-- JOIN Analysis
SELECT
    p.product_name,
    p.category,
    s.sale_date,
    s.quantity,
    f.revenue,
    f.cost,
    f.profit
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
INNER JOIN financial_records f
    ON s.sale_id = f.sale_id;

-- KPI Analysis
-- Total Revenue, Cost, Profit
SELECT
    SUM(revenue) AS total_revenue,
    SUM(cost) AS total_cost,
    SUM(profit) AS total_profit
FROM financial_records;

-- Revenue by Category
SELECT
    p.category,
    SUM(f.revenue) AS total_revenue
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN financial_records f ON s.sale_id = f.sale_id
GROUP BY p.category;

-- Product Ranking (Window Function)
SELECT
    p.product_name,
    SUM(f.revenue) AS total_revenue,
    ROW_NUMBER() OVER (
        ORDER BY SUM(f.revenue) DESC
    ) AS revenue_rank
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN financial_records f ON s.sale_id = f.sale_id
GROUP BY p.product_name;

-- Subquery Analysis
SELECT
    product_name,
    category
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM sales
    GROUP BY product_id
    HAVING SUM(quantity) > 3
);

-- View
CREATE VIEW financial_summary AS
SELECT
    p.product_name,
    p.category,
    s.sale_date,
    s.quantity,
    f.revenue,
    f.cost,
    f.profit
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN financial_records f ON s.sale_id = f.sale_id;

-- View query
SELECT * FROM financial_summary;

-- CTE Analysis
WITH revenue_cte AS (
    SELECT
        p.category,
        SUM(f.revenue) AS total_revenue
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    JOIN financial_records f ON s.sale_id = f.sale_id
    GROUP BY p.category
)
SELECT *
FROM revenue_cte;

-- Window Function Analysis
SELECT
    p.product_name,
    f.revenue,
    SUM(f.revenue) OVER (
        ORDER BY f.revenue DESC
    ) AS running_total
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN financial_records f ON s.sale_id = f.sale_id;

-- CSV Export Query
SELECT
    p.product_name,
    p.category,
    s.sale_date,
    s.quantity,
    f.revenue,
    f.cost,
    f.profit
FROM products p
JOIN sales s ON p.product_id = s.product_id
JOIN financial_records f ON s.sale_id = f.sale_id;