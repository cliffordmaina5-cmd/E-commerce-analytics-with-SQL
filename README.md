# E commerce analytics
A PostgreSQL data warehouse project analyzing customer purchases, product performance, store activity, and payment trends using a star schema design.

## Overview
This project turns raw transactional sales data into clear, decision-ready insights. Instead of storing everything in one giant table, the data is organized around a star schema — a central table of sales transactions surrounded by descriptive tables for customers, products, stores, time, and payments.

This structure makes it possible to answer real business questions quickly, such as:
- What's selling and what isn't?
- Who is your most loyal customers are?
- When is your busiest hours and days are?
- Which locations are having a good market, and which need attention?
- How your revenue really is, beyond just a single "total sales" number?

-- Describe the data 
This project transforms raw e-commerce transaction data into a structured database. The data is organized into clearly defined categories, each representing a different aspect of the business and answering specific information needs.

Rather than putting every piece of information into one big spreadsheet, the data is split into clearly defined categories — each one answering a different question:
| Table | What it answers |
|-------|------------------|
|  Transactions (Fact Table) | **What actually happened?** — Every individual sale, including quantity, price, and links to all related dimensions. |
| Customers | **Who bought it?** — Customer names and contact details. |
| Products | **What was bought?** — Product names, prices, suppliers, and countries of origin. |
| Stores | **Where was it bought?** — Division, district, and local area of each store. |
| Time | **When was it bought?** — The exact date, hour, day, week, month, quarter, and year. |
| Payments | **How was it paid for?** — Payment method (cash, card, mobile payment, etc.) and the bank involved. |



-- What to uncover
 # Performance of good and the Revenue
- Which products bring in the most money, and which are underperforming?
- Which product categories contribute the biggest share of total revenue?
- Which year, month, or week had our strongest sales?

## Marketing
By knowing the one-time customers and the quiet days with low or no sales, this will help to know when marketing campaigns can be timed and targeted

### Payment Behavior
- How do customers prefer to pay?
- Does the most-used payment method also bring in the most revenue, or are they different?

####  Customer Loyalty
- Who are our one-time shoppers, our occasional repeat buyers, and our loyal regulars?
- This "customer type" segmentation — Single, Twice, Retainer, or Zero (never purchased) — is designed specifically to support  targeted marketing: a first-time buyer needs a different message than a loyal regular.

##### Timing & Operations
- What time of day are we busiest? (Useful for staffing and system load planning.)
- Which day of the week brings the most revenue?
- Which day is our quietest — a natural target for a marketing push to fill the gap?

### Results
Once the analysis is run on the e-commerce transaction data, it provides useful insights such as:
- Top-selling products – identifies which products sell the most and generate the highest revenue.
- Sales trends over time – shows how sales change by year, quarter, month, or week, helping identify growth patterns and seasonal trends.
- Store performance – compares sales across different districts to identify the best-performing locations.
- Customer purchasing habits – shows how many customers make repeat purchases compared to those who buy only once.
- Payment method preferences – reveals which payment methods customers use most often, helping the business understand customer preferences.