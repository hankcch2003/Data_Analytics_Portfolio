# 載入套件
import pandas as pd
import streamlit as st
from langchain_ollama import OllamaLLM

# 讀取 CSV
df = pd.read_csv(r"E:\data_analyst_portfolio\project_04_customer_segmentation_analysis\02-Data\project_04_customer_segmentation_analysis.csv")

# 資料清理
df.dropna(inplace = True)
df["transaction_date"] = pd.to_datetime(df["transaction_date"])

# 建立 RFM
reference_date = df["transaction_date"].max()

rfm_df = df.groupby(["customer_id", "customer_name"]).agg(
    recency = ("transaction_date", lambda x: (reference_date - x.max()).days),
    frequency = ("transaction_amount", "count"),
    monetary = ("transaction_amount", "sum")
).reset_index()

# 建立 RFM Score
rfm_df["rfm_score"] = rfm_df["frequency"] + (rfm_df["monetary"] / 1000)

# 建立客戶分群
def create_segment(score):
    if score >= 10:
        return "High Value"

    elif score >= 5:
        return "Mid Value"

    else:
        return "Low Value"

rfm_df["segment"] = rfm_df["rfm_score"].apply(create_segment)

# KPI 1：總客戶數
kpi_customers = rfm_df["customer_id"].nunique()

# KPI 2：總消費金額
kpi_revenue = rfm_df["monetary"].sum()

# KPI 3：平均消費金額
kpi_average = rfm_df["monetary"].mean()

# KPI 4：高價值客戶數
kpi_high_value = rfm_df[rfm_df["segment"] == "High Value"].shape[0]

# Dashboard 標題
st.title("Project 04 - Customer Segmentation Analysis")
st.subheader("Customer Segmentation & RFM Analysis Dashboard")

# KPI 總覽
st.header("KPI 總覽")

st.metric("Total Customers", kpi_customers)
st.metric("Total Revenue", f"${kpi_revenue:,.0f}")
st.metric("Average Spending", f"${kpi_average:,.0f}")
st.metric("High Value Customers", kpi_high_value)

# 客戶分群分析
st.subheader("客戶分群分佈")
st.bar_chart(rfm_df["segment"].value_counts())

# 高消費客戶分析
st.subheader("高消費客戶排名")
top_customer = rfm_df.sort_values("monetary", ascending = False).head(10)
st.bar_chart(top_customer.set_index("customer_name")["monetary"])

# 客戶資料
st.header("客戶資料")
st.dataframe(rfm_df)

# LLM Model（語言模型）
llm = OllamaLLM(model = "llama3.2:latest")

# AI Prompt（提示詞）
prompt = f"""
請分析以下客戶分群結果：

總客戶數：{kpi_customers}
總消費金額：{kpi_revenue}
平均消費金額：{kpi_average}
高價值客戶數：{kpi_high_value}

客戶分群：
{rfm_df["segment"].value_counts().to_dict()}

請提供：
1. 客戶摘要
2. 客戶分群觀察
3. 簡單建議
"""

# AI 分析區
st.header("AI 分析區")

if st.button("生成AI商業分析"):
    with st.spinner("AI 分析中..."):
        st.write(llm.invoke(prompt).strip())