# 🩺 SWAN Health Economics & Outcomes Research (HEOR) Project  

## 📖 Project Overview  
This project analyzes the **Study of Women’s Health Across the Nation (SWAN) baseline dataset** to generate insights on **bone health, healthcare costs, and cost-effectiveness of interventions**.  
Using **SQL, Python, and health economics principles**, this project combines **epidemiology, economic modelling, and machine learning** to deliver high-value healthcare insights.  

---

## 📂 Repository Contents  
- **`SWAN_baseline.csv`** → Baseline dataset.  
- **`SWAN_SQL_Queries.sql`** → SQL queries for epidemiology and economic analysis.  
- **`SWAN_Python_Project.ipynb`** → Python notebook for predictive modelling, ROC/AUC, feature importance.  

---

## 🧮 Key Questions Addressed  

### 🔹 SQL Analysis  
1. **Average age at baseline**  
2. **Distribution of race**  
3. **Prevalence of bone density issues**  
4. **Annual cost burden estimation**  
5. **Lifetime cost projection (20 years)**  
6. **Hormone therapy vs. bone density prevalence**  
7. **Age group prevalence analysis**  
8. **High-risk patient identification**  
9. **Intervention analysis ($500/year with 30% risk reduction)**  
10. **ICER estimation (QALY-based cost-effectiveness)**  

### 🔹 Python Analysis  
- **Data Cleaning & Preparation**  
- **Random Forest Classifier**  
- **ROC Curve & AUC Metrics**  
- **Feature Importance Ranking**  

---

## 📌 Business Insights  
- **Bone density issues** create substantial lifetime cost burden.  
- **Targeted interventions** (e.g., $500/year therapy) show **potential cost savings** and QALY improvements.  
- **Hormone therapy usage** is correlated with bone density issues, requiring deeper clinical evaluation.  
- **Predictive modelling** highlights key features (age, hormone therapy, biomarkers) that can help **early risk identification**.  

---

## ⚠️ Limitations  
- Data restricted to **baseline only** (no long-term follow-up).  
- **Simplified cost assumptions** ($3,500/year treatment, 0.1 QALY gain).  
- **No real clinical trial arms** — trial-based ICERs would be stronger.  
- Requires **validation with real-world evidence (RWE)** and clinical inputs.  

---

## ✅ Conclusion  
This project demonstrates the **integration of biostatistics, SQL, and economic modelling** to evaluate healthcare interventions.  
The analysis shows how **data-driven HEOR can inform decision-making** around costs, prevalence, and cost-effectiveness.  

---

## 👩‍💻 Author  
**Sneha Ghosh**  
- Health Economics & Data Analytics Enthusiast  
- 📎 [LinkedIn Profile](https://www.linkedin.com/in/sneha-ghosh-98aaa9337)  

---

## 🚀 Next Steps / Recommendations  
- Extend analysis to **longitudinal SWAN data**.  
- Build a **Markov model in Excel/Python** for detailed health state transitions.  
- Apply **survival analysis** for long-term outcomes.  
- Integrate more **real-world cost data** to refine ICER.  

---
