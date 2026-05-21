# 載入套件
import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt
import seaborn as sns

# 讀取 CSV（因為沒有欄位名稱，所以 header = None）
df = pd.read_csv(
    r"E:\data_analyst_portfolio\project_01_customer_analysis\02-Data\project_01_customer_analysis.csv",
    header = None
)

# 手動補欄位名稱（對應 SQL 輸出）
df.columns = [
    "customer_id",
    "customer_name",
    "customer_segment",
    "account_type",
    "balance",
    "transaction_amount"
]

# 資料清理
df.dropna(inplace = True)

# KPI 1：客戶分群總消費
kpi_segment = df.groupby("customer_segment")["transaction_amount"].sum()

# KPI 2：帳戶類型總餘額
kpi_account = df.groupby("account_type")["balance"].sum()

# Dashboard 標題
st.title("Project 01 - Customer Analysis Dashboard")
st.subheader("Customer Analytics Pipeline for Business Insights")

# KPI 區塊
st.header("KPI 總覽")

st.subheader("客戶分群消費")
st.bar_chart(kpi_segment)

st.subheader("帳戶類型餘額")
st.bar_chart(kpi_account)

# EDA 分析（Seaborn + Matplotlib）
st.header("資料探索分析（EDA）")

fig, ax = plt.subplots()

sns.barplot(
    x = kpi_segment.index,
    y = kpi_segment.values,
    ax = ax
)

st.pyplot(fig)

# 原始資料
st.header("原始資料")
st.dataframe(df)

# KPI 整理
st.header("KPI 整理")
st.write(kpi_segment)
st.write(kpi_account)