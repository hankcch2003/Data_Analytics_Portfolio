-- Create database
CREATE DATABASE ai_business_insight;
GO

-- Use database
USE ai_business_insight;
GO

-- Create KPI summary table
CREATE TABLE kpi_summary (
    kpi_id INT PRIMARY KEY,
    total_revenue DECIMAL(12,2),
    total_profit DECIMAL(12,2),
    top_category VARCHAR(50),
    top_region VARCHAR(50)
);

-- Create sales data table
CREATE TABLE sales_data (
    sales_id INT PRIMARY KEY,
    kpi_id INT NOT NULL,

    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    sales_date DATE,
    revenue DECIMAL(12,2),
    profit DECIMAL(12,2),

    CONSTRAINT FK_SalesData_KPI
        FOREIGN KEY (kpi_id)
        REFERENCES kpi_summary(kpi_id)
);

-- Create AI insight table
CREATE TABLE ai_insight (
    insight_id INT PRIMARY KEY,
    kpi_id INT NOT NULL UNIQUE,

    insight_date DATE,
    insight_summary VARCHAR(500),
    recommendation VARCHAR(500),

    CONSTRAINT FK_AIInsight_KPI
        FOREIGN KEY (kpi_id)
        REFERENCES kpi_summary(kpi_id)
);

-- Insert KPI summary
INSERT INTO kpi_summary
(
    kpi_id,
    total_revenue,
    total_profit,
    top_category,
    top_region
)
VALUES
(
    1,
    0,
    0,
    NULL,
    NULL
);

-- Insert sales data
INSERT INTO sales_data
(
    sales_id,
    kpi_id,
    product_name,
    category,
    region,
    sales_date,
    revenue,
    profit
)
VALUES
(1, 1, 'Laptop',  'Electronics', 'North', '2024-05-01', 50000, 12000),
(2, 1, 'Phone',   'Electronics', 'South', '2024-05-02', 42000, 10000),
(3, 1, 'Desk',    'Furniture',   'East',  '2024-05-03', 25000, 5000),
(4, 1, 'Chair',   'Furniture',   'West',  '2024-05-04', 18000, 3500),
(5, 1, 'Monitor', 'Electronics', 'North', '2024-05-05', 32000, 8000);

-- Update sales data
UPDATE sales_data
SET revenue = 55000
WHERE sales_id = 1;

-- Join analysis
SELECT
    s.product_name,
    s.category,
    s.region,
    s.revenue,
    s.profit
FROM sales_data s;

-- KPI analysis
SELECT
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_data;

-- Category KPI analysis
SELECT
    category,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY category;

-- Region KPI analysis
SELECT
    region,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region;

-- Subquery analysis
SELECT
    product_name,
    revenue
FROM sales_data
WHERE revenue > (
    SELECT AVG(revenue)
    FROM sales_data
);

-- Create KPI dashboard view
CREATE VIEW kpi_dashboard AS
SELECT
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales_data;

-- View query
SELECT *
FROM kpi_dashboard;

-- CTE analysis
WITH category_cte AS (
    SELECT
        category,
        SUM(revenue) AS total_revenue
    FROM sales_data
    GROUP BY category
)

SELECT *
FROM category_cte;

-- Window function analysis
SELECT
    product_name,
    revenue,
    RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM sales_data;

-- Update KPI summary
UPDATE kpi_summary
SET
    total_revenue = (
        SELECT SUM(revenue)
        FROM sales_data
    ),
    total_profit = (
        SELECT SUM(profit)
        FROM sales_data
    ),
    top_category = (
        SELECT TOP 1 category
        FROM sales_data
        GROUP BY category
        ORDER BY SUM(revenue) DESC
    ),
    top_region = (
        SELECT TOP 1 region
        FROM sales_data
        GROUP BY region
        ORDER BY SUM(revenue) DESC
    )
WHERE kpi_id = 1;

-- KPI summary query
SELECT *
FROM kpi_summary;

-- Insert AI insight
INSERT INTO ai_insight
(
    insight_id,
    kpi_id,
    insight_date,
    insight_summary,
    recommendation
)
VALUES
(
    1,
    1,
    GETDATE(),
    'Electronics category generates the highest revenue.',
    'Increase marketing investment in Electronics products.'
);

-- AI insight query
SELECT *
FROM ai_insight;

-- CSV Export Query
SELECT
    s.sales_id,
    s.product_name,
    s.category,
    s.region,
    s.sales_date,
    s.revenue,
    s.profit
FROM sales_data s;