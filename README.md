# 📊 Data Analyst Portfolio System

（銀行 × 銷售 × 財務 × 客戶分群｜SQL + Python + Excel + Power BI + AI Analysis）

---

# 🔄 Core Data Pipeline

SQL → Data Processing → KPI Analysis → Excel → Power BI → Business Insights → AI Analysis

👉 這一系列專案都是用同一套分析流程做延伸，不同的是 business domain。

👉 從資料建模（Data Modeling）開始，到 KPI Dashboard 建立，再延伸到 AI 商業洞察分析。

---

# 📌 Portfolio Projects

### Project 01：Banking Analysis
銀行客戶、帳戶與交易分析

### Project 02：Sales Analysis
銷售與產品績效分析

### Project 03：Financial Analysis
營收、成本與利潤分析

### Project 04：Customer Segmentation Analysis
RFM 客戶分群與 AI 商業分析

---

# 📌 Project 01: Banking Analysis

---

## 🧠 專案概述

模擬銀行內部客戶分析流程，從資料建模到 KPI Dashboard。

👉 將 raw data 轉換為商業決策資訊

---

## 🗄️ SQL 資料分析

### 📌 Data Modeling
- Customers（客戶資料）
- Accounts（帳戶資料）
- Transactions（交易資料）

---

### 📌 Data Management
- Database 建立
- Table 建立
- Primary Key / Foreign Key
- INSERT / UPDATE

---

### 📌 Data Integration & Analysis
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

---

### 📌 KPI Analysis
- 客戶交易金額分析
- 帳戶餘額分析
- 交易排行分析
- 累積交易分析
- 高價值客戶分析

---

### 📌 Advanced SQL Analysis
- Subquery
- CTE（Common Table Expression）
- View
- Window Function（ROW_NUMBER / OVER / PARTITION BY）

---

### 📌 Data Export
SQL → CSV（給 Python / Power BI 用）

---

## 🔗 ER Model

CUSTOMERS (1) ─── (N) ACCOUNTS  
ACCOUNTS (1) ─── (N) TRANSACTIONS

---

## 🐍 Python Analysis

- pandas data processing
- groupby KPI analysis
- missing value handling (dropna)
- basic statistical analysis

---

## 📊 Excel Analysis

- customer segmentation analysis
- asset analysis
- pivot table reporting

---

## 📊 Power BI Dashboard

- customer segmentation KPI
- account balance analysis
- transaction behavior analysis

---

# 📌 Project 02: Sales Analysis

---

## 🧠 專案概述

將銀行分析方法延伸到 Sales domain。

👉 統一 data thinking，不同 business scenario

---

## 🗄️ SQL Dataset

- customer_name
- segment
- product_name
- category
- quantity
- total_amount
- order_date

---

## 🔗 ER Model

CUSTOMERS (1) ─── (N) ORDERS  
PRODUCTS (1) ─── (N) ORDERS

---

## 🐍 Python Analysis

- data cleaning
- groupby analysis
- KPI calculation

---

## 📊 Excel Analysis

- segment revenue analysis
- product analysis
- category analysis

---

## 📊 Power BI Dashboard

- Revenue by Segment
- Revenue by Product
- Revenue by Category

---

# 📌 Project 03: Financial Analysis

---

## 🧠 專案概述

分析 Revenue / Cost / Profit 結構與 KPI dashboard。

---

## 🗄️ SQL Dataset

- product_name
- category
- quantity
- revenue
- cost
- profit
- sale_date

---

## 🔗 ER Model

PRODUCTS (1) ─── (N) SALES  
SALES (1) ─── (N) FINANCIAL_RECORDS

---

## 🐍 Python Analysis

- pandas processing
- KPI calculation
- data cleaning

---

## 📊 Excel Analysis

- revenue KPI
- cost KPI
- profit KPI
- product analysis

---

## 📊 Power BI Dashboard

### Power Query
- data type transformation

---

### DAX Measures
- Total Revenue
- Total Cost
- Total Profit

---

### KPI Cards
- Revenue KPI Card
- Cost KPI Card
- Profit KPI Card

---

### Dashboard Analysis
- Category Revenue Analysis KPI
- Product Profit Analysis KPI
- Product Revenue Analysis KPI

---

## 📈 Business Insights

- 產品營收集中在少數類別
- 利潤分布不平均
- Revenue / Profit 結構差異明顯

---

## 📤 Data Workflow

SQL → CSV → Python → Excel → Power BI

---

# 📌 Project 04: Customer Segmentation Analysis

---

## 🧠 專案概述

RFM 客戶分群 + KPI Dashboard + AI 商業分析

---

## 🗄️ SQL 資料分析

### 📌 Data Modeling
- Customers（客戶資料）
- Transactions（交易資料）
- RFM_Result（RFM 分析結果）

---

### 📌 Data Management
- Database 建立
- Table 建立
- Primary Key / Foreign Key
- INSERT / UPDATE

---

### 📌 Data Integration & Analysis
- INNER JOIN
- LEFT JOIN

---

### 📌 KPI Analysis
- Customer Spending Analysis
- Transaction Analysis
- Customer Value Analysis
- RFM Analysis
- Customer Segmentation Analysis

---

### 📌 Advanced SQL Analysis
- Subquery
- CTE
- View
- Window Function (RANK)

---

### 📌 Data Export
SQL → CSV

---

## 🔗 ER Model

CUSTOMERS (1) ─── (N) TRANSACTIONS  
CUSTOMERS (1) ─── (1) RFM_RESULT

---

## 🐍 Python Analysis

### Data Processing
- pandas data processing
- missing value handling (dropna)
- datetime transformation

### RFM Analysis
- Recency Calculation
- Frequency Calculation
- Monetary Calculation
- RFM Score Calculation

### Customer Segmentation
- High Value Customer
- Mid Value Customer
- Low Value Customer

### KPI Analysis
- Total Customers
- Total Revenue
- Average Spending
- High Value Customers

---

## 🚀 Streamlit Dashboard

### KPI Monitoring
- Total Customers
- Total Revenue
- Average Spending
- High Value Customers

---

### Dashboard Analysis
- Customer Segment Distribution
- Top Customer Spending
- Customer Data Table

---

## 🤖 AI Business Analysis

### Ollama Integration
- Ollama
- llama3.2:latest

### AI Features
- Customer Segmentation Summary
- Customer Segment Observation
- Business Recommendation

---

## 📊 Excel Analysis

- customer segment analysis
- customer spending analysis
- city analysis

---

## 📊 Power BI Dashboard

### Power Query
- data type transformation

---

### DAX Measures
- Total Revenue
- Customer Count
- Transaction Count
- High Value Customers

---

### KPI Cards
- Total Revenue KPI
- Customer Count KPI
- Transaction Count KPI
- High Value Customers KPI

---

### Dashboard Analysis
- Customer Segment Distribution
- Top Customer Spending
- Revenue by Segment
- Revenue by City

---

## 📈 Business Insights

- 高價值客戶貢獻最多營收
- RFM 可有效區分客戶價值
- Dashboard 可支持商業決策
- AI 可生成商業洞察

---

## 📤 Data Workflow

SQL → CSV → Python → Excel → Power BI → AI Analysis

---

# 🚀 Future Projects

## 📌 Project 05: AI Business Insight System

AI 商業洞察系統（LLM + KPI Summary + Business Recommendation）

---

# 🎯 Final Positioning

Junior BI / Data Analyst

（Banking × Sales × Financial × Customer Segmentation Analytics）

SQL + Python + Excel + Power BI + AI Analysis