# big_four

## Prediciting Electricity Usage

*Using supervised learning classification techniques, created model that predicts if a company will be audited by the Big Four or another accounting firm*

---
### Target Variable and Features
**Target Variable:** 1)Big Four, or 2)Other

**Features:**
1. Cash Flows (feature engineered to indicate inflow/outflow)
   - CAPEX
   - NCF - Business Acquisitions and Disposals
   - NCF - Cash & Cash Equivalents
   - NCF - Financing
   - Issuance/Repayments of Debt Securities
   - Issuance/Purchase of Equity Shares 
   - Payment of Dividends & Other Cash Distributions
   - NCF - Investing
   - NCF- Operations
2. Balance Sheet
   - Assets
   - Cash and Cash Equivalents
   - Liabilities
   - Debt
   - Equity
3. Earnings
   - Revenue
   - EBITDA
   - Equity
4. Market
   - Market Capitilization
   - Enterprise Value
5. Industry
6. Location(State)
7. Exchange

---

### Data Used
PCAOB Auditor Search:
https://pcaobus.org/resources/auditorsearch

Quandl - Core US Fundamentals Data:
https://www.quandl.com/databases/SF1/data

---

### Tools and Packages
1. Python
2. PostgreSQL
3. Pandas
4. NumPy
5. matplotlip
6. seaborn
7. Geopandas
8. scikit-learn
9. SQLAlchemy

---

### Repo Guide

**Database Exploration, Creation, and Querying**

- explore_csv.ipynb
- create_database.sql
- query.sql

**Preprocessing and EDA**

- import_preprocess.ipynb
- eda_viz.ipynb

**Modeling and Metrics**

- knn.ipynb
- logistic_regression.ipynb
- naive_bayes.ipynb
- decision_tree.ipynb
- random_forest.ipynb
- xgboost.ipynb
- ensemble.ipynb
- roc_curve.ipynb

