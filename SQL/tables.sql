CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    industry VARCHAR(50),
    region VARCHAR(50),
    country VARCHAR(50)
);


CREATE TABLE services (
    service_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    service_date DATE,
    service_type VARCHAR(50),
    product_category VARCHAR(50),
    service_cost INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE revenue (
    revenue_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    service_date DATE,
    revenue_amount INT,
    contract_type VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);