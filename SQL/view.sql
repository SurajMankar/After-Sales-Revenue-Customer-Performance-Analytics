CREATE VIEW vw_sales_analytics AS
SELECT
    c.customer_id,
    c.customer_name,
    c.industry,
    c.region,
    c.country,
    s.service_type,
    s.product_category,
    s.service_cost,
    r.revenue_amount,
    r.contract_type,
    r.service_date
FROM customers c
JOIN services s ON c.customer_id = s.customer_id
JOIN revenue r
    ON c.customer_id = r.customer_id
   AND s.service_date = r.service_date;