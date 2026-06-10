# 載入套件
import pandas as pd
import streamlit as st
from langchain_ollama import OllamaLLM

# 讀取 CSV
df = pd.read_csv(r"E:\data_analyst_portfolio\project_05_ai_business_insight_system\02-Data\project_05_ai_business_insight_system.csv")

# 資料清理
df.dropna(inplace = True)
df["sales_date"] = pd.to_datetime(df["sales_date"])

# KPI 1：總營收
kpi_revenue = df["revenue"].sum()

# KPI 2：總利潤
kpi_profit = df["profit"].sum()

# KPI 3：平均營收
kpi_average_revenue = df["revenue"].mean()

# KPI 4：平均利潤
kpi_average_profit = df["profit"].mean()

# KPI 5：最高營收類別
top_category = (df.groupby("category")["revenue"].sum()
                .sort_values(ascending = False).index[0])

# KPI 6：最高利潤區域
top_region = (df.groupby("region")["profit"].sum()
              .sort_values(ascending = False).index[0])

# Dashboard 標題
st.title("Project 05 - AI Business Insight System")
st.subheader("KPI Analysis & AI Business Insight Dashboard")

# KPI 總覽
st.header("KPI 總覽")

st.metric("Total Revenue", f"${kpi_revenue:,.0f}")
st.metric("Total Profit", f"${kpi_profit:,.0f}")
st.metric("Average Revenue", f"${kpi_average_revenue:,.0f}")
st.metric("Average Profit", f"${kpi_average_profit:,.0f}")

# 類別營收分析
st.subheader("類別營收分析")

category_revenue = (df.groupby("category")["revenue"].sum())
st.bar_chart(category_revenue)

# 區域利潤分析
st.subheader("區域利潤分析")

region_profit = (df.groupby("region")["profit"].sum())
st.bar_chart(region_profit)

# 銷售資料
st.header("銷售資料")
st.dataframe(df)

# LLM Model（語言模型）
llm = OllamaLLM(model = "llama3.2:latest")

# AI Prompt（提示詞）
prompt = f"""
你是一位資深商業分析顧問，請根據以下 KPI 數據撰寫商業分析報告。

【KPI資料】

總營收：
{kpi_revenue}

總利潤：
{kpi_profit}

平均營收：
{kpi_average_revenue}

平均利潤：
{kpi_average_profit}

最高營收類別：
{top_category}

最高利潤區域：
{top_region}

類別營收：
{category_revenue.to_dict()}

區域利潤：
{region_profit.to_dict()}

【報告要求】

1. 全程使用繁體中文。
2. 不要使用任何英文標題。
3. 若資料中的類別名稱或區域名稱為英文，請自動翻譯成繁體中文後再進行分析。
4. 分析內容需具備商業洞察，而非僅重複數據。
5. 使用正式商業報告風格撰寫。
6. 每個章節至少提供 2 至 4 點重點分析。
7. 僅根據提供的 KPI 數據進行分析，不得虛構不存在的數據或趨勢。

請依照以下格式輸出：

# KPI摘要
說明整體營收、利潤與主要績效表現。

# 經營洞察
分析企業目前營運狀況、成長動能與潛在風險。

# 營收分析
分析各產品類別的營收表現與主要營收來源。

# 利潤分析
分析各區域的獲利表現與獲利差異原因。

# 經營建議
提出 3 至 5 項具體且可執行的改善建議，以提升營收與利潤表現。
"""

# AI 分析區
st.header("AI 商業洞察")

if st.button("生成AI商業洞察"):
    with st.spinner("AI 分析中..."):
        response = llm.invoke(prompt).strip()
        st.write(response)