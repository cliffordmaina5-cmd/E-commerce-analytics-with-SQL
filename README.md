# E commerce analytics
A PostgreSQL data warehouse project analyzing customer purchases, product performance, store activity, and payment trends using a star schema design.

## Overview
This project turns raw transactional sales data into clear, decision-ready insights. Instead of storing everything in one giant table, the data is organized around a star schema — a central table of sales transactions surrounded by descriptive tables for customers, products, stores, time, and payments.

This structure makes it possible to answer real business questions quickly, such as:
- Which products sell the most, and which barely sell at all?
- Which regions and time periods bring in the most revenue?
- How do customers behave — are they one-time buyers or loyal repeat customers?
- What are people's preferred ways to pay?

-- Describe the data 

-- Describe what you want to uncover


## Results



This project is meant as a learning/portfolio piece showing core relational database skills:

Designing normalized tables with primary/foreign keys
Enforcing data integrity with constraints (CHECK, NOT NULL, UNIQUE)
Writing multi-table JOIN queries
Using aggregate functions (SUM, COUNT, AVG) with GROUP BY / HAVING
Running everything through pgAdmin's Query Tool

