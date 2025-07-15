# Blinkit Sales Data Analysis

This project provides a comprehensive SQL/Python/PowerBi-based analysis of the **Blinkit** dataset available on Kaggle `. It involves data cleaning, summary statistics, and deep-dives into performance metrics based on product and outlet attributes.
---


<img width="1322" height="723" alt="image" src="https://github.com/user-attachments/assets/6859d3d2-a2ec-4f53-b99b-4710c7fe5f5e" />



## 📁 Database & Table

- **Database Used**: `blinkit_db`
- **Main Table**: `blinkit_data`

---

## 🔧 Data Cleaning

- Standardized ambiguous values in the `Item_Fat_Content` column:
  - `'LF'`, `'low fat'` → `'Low Fat'`
  - `'reg'` → `'Regular'`

---

## 📊 Key Analyses Performed

### 1. **Basic Insights**
- Total sales in millions
- Average sales per item
- Total number of items
- Average item rating

### 2. **Group-Wise Metrics**
#### a. Based on `Item_Fat_Content`
- Total and average sales
- Average ratings
- Number of items per category

#### b. Based on `Item_Type`
- Total sales in thousands
- Average sales and rating by item category

#### c. Based on `Outlet_Location_Type` and `Item_Fat_Content`
- Combined group metrics including percentage contribution to overall sales

#### d. Based on `Outlet_Establishment_Year`
- Year-wise total and percentage of sales
- Average rating and number of items

#### e. Based on `Outlet_Location_Type`
- Tier-wise total and percentage of sales
- Average sales, rating, and item count

#### f. Based on `Outlet_Type`
- Outlet type-wise breakdown of all key metrics

#### g. Based on `Outlet_Size`
- Total and percentage of sales by outlet size

---

## 📈 Pivot Analysis

- **Pivoted View**: Total sales by `Outlet_Location_Type` and `Item_Fat_Content`
- Cleanly displays sales of **Low Fat** and **Regular** items across outlet tiers

---

## 🧮 Formatting Highlights

- Sales data is normalized into:
  - **Millions (M)** for overall summaries
  - **Thousands (K)** for group-level comparisons
- Values are cast with appropriate decimal formatting for readability

---

## ✅ Outcome

This SQL analysis helps:
- Understand sales patterns across item and outlet characteristics
- Identify high-performing outlet types and product categories
- Support business decisions with data-backed metrics
---

