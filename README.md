# E commerce analytics
A PostgreSQL data warehouse project analyzing customer purchases, product performance, store activity, and payment trends using a star schema design.

## Overview
This project turns raw transactional sales data into clear, decision-ready insights. Instead of storing everything in one giant table, the data is organized around a star schema — a central table of sales transactions surrounded by descriptive tables for customers, products, stores, time, and payments.

This structure makes it possible to answer real business questions quickly, such as:
- What's selling and what isn't?
- Who your most loyal customers are?
- When your busiest hours and days are?
- Which locations are having a good market, and which need attention?
- How your revenue really is, beyond just a single "total sales" number?

-- Describe the data 
This project transforms raw e-commerce transaction data into a structured database. The data is organized into clearly defined categories, each representing a different aspect of the business and answering specific information needs.
ather than dumping every piece of information into one giant spreadsheet, the data is split into clearly defined categories — each one answering a different question:

TableWhat it answers🧾 Transactions (Fact Table)"What actually happened?" — every individual sale: quantity, price, and links to everything else below👤 Customers"Who bought it?" — customer names and contact details📦 Products"What was bought?" — product names, prices, suppliers, countries of origin🏬 Stores"Where was it bought?" — division, district, and local area of each store🕒 Time"When was it bought?" — the exact date, hour, day, week, month, quarter, and year💳 Payments"How was it paid for?" — cash, card, mobile payment, etc., and which bank was involved

-- Describe what you want to uncover


## Results



This project is meant as a learning/portfolio piece showing core relational database skills:

Designing normalized tables with primary/foreign keys
Enforcing data integrity with constraints (CHECK, NOT NULL, UNIQUE)
Writing multi-table JOIN queries
Using aggregate functions (SUM, COUNT, AVG) with GROUP BY / HAVING
Running everything through pgAdmin's Query Tool

