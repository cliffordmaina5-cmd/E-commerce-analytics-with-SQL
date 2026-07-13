l-- Determining the number of products in the e-commerce
SELECT COUNT(*) FROM item_dim;              
SELECT COUNT(DISTINCT item_key) FROM item_dim; -

-- Sales revenue for each unique product 
SELECT 
    i.item_key,
    i.item_name,
    SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN item_dim i ON f.item_key = i.item_key
GROUP BY i.item_key, i.item_name
ORDER BY total_revenue DESC;


-- Sales revenue each year
SELECT
   t.year,
    SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY t.year
ORDER BY t.year;
-- Sales revenue per month, per year
SELECT t.year, t.month, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY t.year, t.month
ORDER BY t.year, t.month;
-- Sales revenue per week
SELECT t.year, t.week, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY t.year, t.week
ORDER BY t.year, t.week;

-- Determine the best selling item
SELECT i.item_key, i.item_name, SUM(f.quantity) AS total_units_sold
FROM fact_table f
JOIN item_dim i ON f.item_key = i.item_key
GROUP BY i.item_key, i.item_name
ORDER BY total_units_sold DESC
LIMIT 1;

-- The sales revenue per ditrict
SELECT s.district, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN store_dim s ON f.store_key = s.store_key
GROUP BY s.district
ORDER BY total_revenue DESC;

-- Districts with the most sales revenue, each year
SELECT year, district, total_revenue
FROM (
    SELECT 
        t.year,
        s.district,
        SUM(f.total_price) AS total_revenue,
        RANK() OVER (PARTITION BY t.year ORDER BY SUM(f.total_price) DESC) AS rnk
    FROM fact_table f
    JOIN store_dim s ON f.store_key = s.store_key
    JOIN time_dim t ON f.time_key = t.time_key
    GROUP BY t.year, s.district
) ranked
WHERE rnk = 1;

-- Which products are sold in the highest-revenue district, each year
WITH top_district_per_year AS (
    SELECT year, district
    FROM (
        SELECT 
            t.year,
            s.district,
            SUM(f.total_price) AS total_revenue,
            RANK() OVER (PARTITION BY t.year ORDER BY SUM(f.total_price) DESC) AS rnk
        FROM fact_table f
        JOIN store_dim s ON f.store_key = s.store_key
        JOIN time_dim t ON f.time_key = t.time_key
        GROUP BY t.year, s.district
    ) ranked
    WHERE rnk = 1
)
SELECT DISTINCT t.year, tdy.district, i.item_name
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
JOIN store_dim s ON f.store_key = s.store_key
JOIN item_dim i ON f.item_key = i.item_key
JOIN top_district_per_year tdy ON tdy.year = t.year AND tdy.district = s.district
ORDER BY t.year;

--Which time odf the day has the most transactions
SELECT hour, COUNT(*) AS num_transactions
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY hour
ORDER BY num_transactions DESC
LIMIT 1;

-- Day of the week with the highest sales revenue
SELECT 
    TO_CHAR(TO_DATE(t.date, 'DD-MM-YYYY HH24:MI'), 'Day') AS day_of_week,
    SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY day_of_week
ORDER BY total_revenue DESC
LIMIT 1;

-- Which day of the week has the lowest number of transactions
SELECT 
    TO_CHAR(TO_DATE(t.date, 'DD-MM-YYYY HH24:MI'), 'Day') AS day_of_week,
    COUNT(*) AS num_transactions
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY day_of_week
ORDER BY num_transactions ASC
LIMIT 1;

-- Most preferd payment method?
SELECT tr.trans_type, COUNT(*) AS num_transactions
FROM fact_table f
JOIN trans_dim tr ON f.payment_key = tr.payment_key
GROUP BY tr.trans_type
ORDER BY num_transactions DESC
LIMIT 1;

-- Which top 5 products generate the highest sales revenue
SELECT i.item_key, i.item_name, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN item_dim i ON f.item_key = i.item_key
GROUP BY i.item_key, i.item_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Top 5 most popular products
SELECT i.item_key, i.item_name, SUM(f.quantity) AS total_units_sold
FROM fact_table f
JOIN item_dim i ON f.item_key = i.item_key
GROUP BY i.item_key, i.item_name
ORDER BY total_units_sold DESC
LIMIT 5;

--Year with the highest sales revenue
SELECT t.year, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY t.year
ORDER BY total_revenue DESC
LIMIT 1;

--Which month of which year had the highest sales revenue
SELECT t.year, t.month, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN time_dim t ON f.time_key = t.time_key
GROUP BY t.year, t.month
ORDER BY total_revenue DESC
LIMIT 1;

-- Sales revenue per product category
SELECT i.description AS category, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN item_dim i ON f.item_key = i.item_key
GROUP BY i.description
ORDER BY total_revenue DESC;

--What are the 5 least performing products
SELECT i.item_key, i.item_name, SUM(f.total_price) AS total_revenue
FROM fact_table f
JOIN item_dim i ON f.item_key = i.item_key
GROUP BY i.item_key, i.item_name
ORDER BY total_revenue ASC
LIMIT 5;

-- In a marketing campaign, we want to create a feature/column called customer type, we want to create this column by grouping customers by their repeat transaction. If a customer has transacted only once, we will create a category called "Twice" and if they have transacted more than three times, we will create a category called "Retainer". Customers who have zero transactions will have the category called "Zero".
