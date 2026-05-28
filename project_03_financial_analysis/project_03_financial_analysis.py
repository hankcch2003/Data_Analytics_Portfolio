# 載入套件
import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt
import seaborn as sns

# 讀取 CSV
df = pd.read_csv(r"E:\data_analyst_portfolio\project_03_financial_analysis\02-Data\project_03_financial_analysis.csv")

# 資料清理
df.dropna(inplace = True)

# KPI 1：總營收
kpi_revenue = df["revenue"].sum()

# KPI 2：總成本
kpi_cost = df["cost"].sum()

# KPI 3：總利潤
kpi_profit = df["profit"].sum()

# KPI 4：類別總營收
kpi_category = df.groupby("category")["revenue"].sum()

# KPI 5：產品總利潤
kpi_product = df.groupby("product_name")["profit"].sum()

# Dashboard 標題
st.title("Project 03 - Financial Analysis Dashboard")
st.subheader("Financial Analytics Pipeline for KPI Insights")

# KPI 總覽
st.header("KPI 總覽")

st.metric("Total Revenue", f"${kpi_revenue:,.0f}")
st.metric("Total Cost", f"${kpi_cost:,.0f}")
st.metric("Total Profit", f"${kpi_profit:,.0f}")

# 類別總營收
st.subheader("類別總營收")
st.bar_chart(kpi_category)

# 產品總利潤
st.subheader("產品總利潤")
st.bar_chart(kpi_product)

# EDA 分析（Seaborn + Matplotlib）
st.header("資料探索分析（EDA）")

fig, ax = plt.subplots()

sns.barplot(
    x = kpi_category.index,
    y = kpi_category.values,
    ax = ax
)

ax.set_title("Revenue by Category")
st.pyplot(fig)

# 原始資料
st.header("原始資料")
st.dataframe(df)

# KPI 整理
st.header("KPI 整理")

st.write("Revenue by Category")
st.write(kpi_category)

st.write("Profit by Product")
st.write(kpi_product)