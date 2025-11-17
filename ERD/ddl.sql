CREATE TABLE IF NOT EXISTS stg_customers (
	customer_id TEXT,
	customer_unique_id TEXT,
	customer_zip_code_prefix INTEGER,
	customer_city TEXT,
	customer_state TEXT,
	file_name TEXT,
	file_process_date DATE
);

CREATE TABLE IF NOT EXISTS per_customers (
	customer_id TEXT,
	customer_unique_id TEXT,
	customer_zip_code_prefix INTEGER,
	customer_city TEXT,
	customer_state TEXT,
	insert_updt_flag TEXT,
	insert_updt_ts TIMESTAMP,
    active_flg TEXT,
    file_name TEXT,
    created_date DATE
);

CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat TEXT,
    geolocation_lng TEXT,
    geolocation_city TEXT,
    geolocation_state TEXT,
	file_name TEXT,
	file_process_date DATE
);

CREATE TABLE IF NOT EXISTS order_items (
	order_id TEXT,
	order_item_id INTEGER,
	product_id TEXT,
	seller_id TEXT,
	shipping_limit_date TEXT,
	price REAL,
	freight_value REAL,
	file_name TEXT,
	file_process_date DATE
);

CREATE TABLE IF NOT EXISTS order_payments (
	order_id TEXT,
	payment_sequential INTEGER,
	payment_type TEXT,
	payment_installments INTEGER,
	payment_value REAL,
	file_name TEXT,
	file_process_date DATE
);

CREATE TABLE IF NOT EXISTS order_reviews (
	review_id TEXT,
	order_id TEXT,
	review_score TEXT,
	review_comment_title TEXT,
	review_comment_message TEXT,
	review_creation_date TEXT,
	review_answer_timestamp TEXT,
	file_name TEXT,
	file_process_date DATE
);


CREATE TABLE IF NOT EXISTS orders (
	order_id TEXT,
	customer_id TEXT,
	order_status TEXT,
	order_purchase_timestamp TEXT,
	order_approved_at TEXT,
	order_delivered_carrier_date TEXT,
	order_delivered_customer_date TEXT,
	order_estimated_delivery_date TEXT,
	file_name TEXT,
	file_process_date DATE
);


CREATE TABLE IF NOT EXISTS products (
	product_id TEXT,
	product_category_name TEXT,
	product_name_length INTEGER,
	product_description_length INTEGER,
	product_photos_qty INTEGER,
	product_weight_g INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER,
	file_name TEXT,
	file_process_date DATE
);

