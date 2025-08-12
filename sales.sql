SELECT 
    strftime('%Y', "Date") AS year,
    strftime('%m', "Date") AS month,
    SUM("Total Revenue") AS monthly_revenue,
    COUNT(DISTINCT "Transaction ID") AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;
SELECT 
    strftime('%Y-%m', "Date") AS month_year,
    SUM("Total Revenue") AS monthly_revenue
FROM orders
GROUP BY month_year
ORDER BY monthly_revenue DESC
LIMIT 3;
SELECT 
    strftime('%Y', "Date") AS year,
    strftime('%m', "Date") AS month,
    SUM("Total Revenue") AS monthly_revenue,
    COUNT(DISTINCT "Transaction ID") AS order_volume
FROM orders
WHERE strftime('%Y', "Date") = '2024'
GROUP BY year, month
ORDER BY month;
SELECT 
    "Product Category",
    SUM("Total Revenue") AS category_revenue
FROM orders
GROUP BY "Product Category"
ORDER BY category_revenue DESC
LIMIT 5;




