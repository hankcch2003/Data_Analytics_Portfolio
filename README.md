# 📊 Data Analyst Portfolio System

（銀行 × 銷售 × 財務 × 客戶分群｜SQL + Python + Excel + Power BI + AI Analysis）

---

# 🔄 Core Data Pipeline

SQL → Data Processing (Python) → KPI Analysis → Excel Reporting → Power BI Dashboard

👉 所有專案皆採用統一 BI 分析流程，不同 Business Domain。

👉 AI 僅應用於 Customer Segmentation（Project 04）與未來 AI System（Project 05）。

---

# 🐍 Python Usage Scope

In Project 01–03, Python is mainly used for data cleaning, exploratory data analysis (EDA), and basic visualization. In Project 04, Python is extended to perform RFM-based customer segmentation for advanced analytics.

---

# 📌 Portfolio Projects

### Project 01：Banking Analysis
銀行客戶、帳戶與交易分析

### Project 02：Sales Analysis
銷售與產品績效分析

### Project 03：Financial Analysis
營收、成本與利潤分析

### Project 04：Customer Segmentation Analysis
RFM 客戶分群 + AI 商業分析

---

# 📌 Project 01: Banking Analysis

## 🧠 專案概述

模擬銀行內部客戶分析流程，從資料建模到 KPI Dashboard。

👉 將 raw data 轉換為商業決策資訊

---

## 🗄️ SQL 資料分析

### 📌 Data Modeling
- Customers（客戶資料）
- Accounts（帳戶資料）
- Transactions（交易資料）

### 📌 Data Management
- Database 建立
- Table 建立
- Primary Key / Foreign Key
- INSERT / UPDATE

### 📌 Data Integration & Analysis
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

### 📌 KPI Analysis
- 客戶交易金額分析
- 帳戶餘額分析
- 交易排行分析
- 累積交易分析
- 高價值客戶分析

### 📌 Advanced SQL Analysis
- Subquery
- CTE
- View
- Window Function (ROW_NUMBER / OVER / PARTITION BY)

### 📌 Data Export

SQL → CSV Export

- Python Data Processing
- Excel Analysis & Reporting
- Power BI Dashboard Development

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

## 📤 Data Workflow

SQL → CSV → Python → KPI Analysis → Excel → Power BI

---

# 📌 Project 02: Sales Analysis

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

## 📤 Data Workflow

SQL → CSV → Python → KPI Analysis → Excel → Power BI

---

# 📌 Project 03: Financial Analysis

## 🧠 專案概述

分析 Revenue / Cost / Profit 結構與 KPI Dashboard。

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

### DAX Measures
- Total Revenue
- Total Cost
- Total Profit

### KPI Cards
- Revenue KPI Card
- Cost KPI Card
- Profit KPI Card

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

SQL → CSV → Python → KPI Analysis → Excel → Power BI

---

# 📌 Project 04: Customer Segmentation Analysis

## 🧠 專案概述

RFM 客戶分群 + KPI Dashboard + AI 商業分析

---

## 🗄️ SQL 資料分析

### 📌 Data Modeling
- Customers（客戶資料）
- Transactions（交易資料）
- RFM_Result（RFM 分析結果）

### 📌 Data Management
- Database 建立
- Table 建立
- Primary Key / Foreign Key
- INSERT / UPDATE

### 📌 Data Integration & Analysis
- INNER JOIN
- LEFT JOIN

### 📌 KPI Analysis
- Customer Spending Analysis
- Transaction Analysis
- Customer Value Analysis
- RFM Analysis
- Customer Segmentation Analysis

### 📌 Advanced SQL Analysis
- Subquery
- CTE
- View
- Window Function (RANK)

### 📌 Data Export

SQL → CSV Export

- Python RFM Analysis
- AI Business Insights
- Excel Analysis & Reporting
- Power BI Dashboard Development

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

- KPI Monitoring
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

### DAX Measures
- Total Revenue
- Customer Count
- Transaction Count
- High Value Customers

### KPI Cards
- Total Revenue KPI
- Customer Count KPI
- Transaction Count KPI
- High Value Customers KPI

### Dashboard Analysis
- Customer Segment Distribution
- Top Customer Spending
- Revenue by Segment
- Revenue by City

---

## 📈 Business Insights

- High-value customers contribute most revenue
- RFM effectively segments customer value
- Dashboard supports business decisions
- AI generates actionable insights

---

## 📤 Data Workflow

SQL → CSV → Python → RFM Analysis → AI Business Insights → Excel → Power BI

---

# 🚀 Future Projects

## 📌 Project 05: AI Business Insight System

AI Business Insight System (LLM + KPI Summary + Recommendation Engine)

- Automated KPI Summarization
- Business Insight Generation
- Decision Support System
- Executive Reporting Assistant

---

# 🎯 Final Positioning

Junior BI / Data Analyst

(Banking × Sales × Financial × Customer Segmentation Analytics)

**Analytics Stack:**
SQL → Python → Excel → Power BI

**AI Capability:**
Applied in Customer Segmentation (Project 04) and Future AI System (Project 05)