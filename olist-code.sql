-- Tabla hecho
SELECT 
	oi.order_id,
	oi.order_item_id,
    o.customer_id,
    oi.product_id,
    oi.price,
    oi.freight_value,
    DATE_FORMAT(o.order_purchase_timestamp, '%Y%m%d') AS date_id -- Chave para relacionar com d_date
FROM olist_order_items_dataset AS oi
JOIN olist_orders_dataset o 
    ON oi.order_id = o.order_id;

-- Tabla d_customers
SELECT 
	customer_id,
    customer_city,
    customer_state
FROM olist_customers_dataset;

-- Tabla d_products
SELECT 
	product_id,
    product_category_name
FROM olist_products_dataset;

-- Tabla d_date
SELECT 
	DISTINCT DATE(order_purchase_timestamp) AS date,
    DATE_FORMAT(order_purchase_timestamp, '%Y%m%d') AS date_id,
    YEAR(order_purchase_timestamp) AS year,
    MONTH(order_purchase_timestamp) AS month,
    MONTHNAME(order_purchase_timestamp) AS month_name,
	QUARTER(order_purchase_timestamp) AS quarter
FROM olist_orders_dataset;
