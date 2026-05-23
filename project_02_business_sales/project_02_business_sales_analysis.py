# 載入套件
import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt
import seaborn as sns

# 讀取 CSV
df = pd.read_csv(r"E:\data_analyst_portfolio\project_02_business_sales_analysis\02-Data\project_02_business_sales_analysis.csv")

# 資料清理
df.dropna(inplace = True)

# KPI 1：客戶總消費
kpi_customer = df.groupby("customer_name")["total_amount"].sum()

# KPI 2：產品總銷售
kpi_product = df.groupby("product_name")["total_amount"].sum()

# KPI 3：類別總銷售
kpi_category = df.groupby("category")["total_amount"].sum()

# Dashboard 標題
st.title("Project 02 - Business Sales Analysis Dashboard")
st.subheader("Business Sales Analytics Pipeline for KPI Insights")

# KPI 總覽
st.header("KPI 總覽")

# 客戶總消費
st.subheader("客戶總消費")
st.bar_chart(kpi_customer)

# 產品總銷售
st.subheader("產品總銷售")
st.bar_chart(kpi_product)

# 類別總銷售
st.subheader("類別總銷售")
st.bar_chart(kpi_category)

# EDA 分析（Seaborn + Matplotlib）
st.header("資料探索分析（EDA）")

fig, ax = plt.subplots()

sns.barplot(
    x = kpi_category.index,
    y = kpi_category.values,
    ax = ax
)

st.pyplot(fig)

# 原始資料
st.header("原始資料")
st.dataframe(df)

# KPI 整理
st.header("KPI 整理")
st.write(kpi_customer)
st.write(kpi_product)
st.write(kpi_category)