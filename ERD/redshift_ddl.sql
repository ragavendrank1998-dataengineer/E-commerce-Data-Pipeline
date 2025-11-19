--scd-type 2 table
CREATE TABLE IF NOT EXISTS per_customers (
	customer_id CHARACTER VARYING(255) ENCODE lzo,
	customer_unique_id CHARACTER VARYING(255) ENCODE lzo,
	customer_zip_code_prefix NUMERIC(6,0),
	customer_city CHARACTER VARYING(255) ENCODE lzo,
	customer_state CHARACTER VARYING(255) ENCODE lzo,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	insert_updt_flag CHARACTER VARYING(1) ENCODE lzo,
    insert_updt_ts TIMESTAMP WITHOUT TIME ZONE ENCODE az64,
    active_flg CHARACTER VARYING(1) ENCODE lzo,
    file_name CHARACTER VARYING(255) ENCODE lzo,
    created_date Date
	file_process_date DATE
)DISTKEY(customer_id),
SORTKEY(active_flg,customer_id,insert_updt_ts);

CREATE TABLE IF NOT EXISTS stg_customers (
	customer_id CHARACTER VARYING(255) ENCODE lzo,
	customer_unique_id CHARACTER VARYING(255) ENCODE lzo,
	customer_zip_code_prefix NUMERIC(6,0),
	customer_city CHARACTER VARYING(255) ENCODE lzo,
	customer_state CHARACTER VARYING(255) ENCODE lzo,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)
DISTSTYLE ALL;


CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix NUMERIC(6,0),
    geolocation_lat CHARACTER VARYING(255) ENCODE lzo,
    geolocation_lng CHARACTER VARYING(255) ENCODE lzo,
    geolocation_city CHARACTER VARYING(255) ENCODE lzo,
    geolocation_state CHARACTER VARYING(255) ENCODE lzo,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)DISTSTYLE ALL;

CREATE TABLE IF NOT EXISTS order_items (
	order_id CHARACTER VARYING(255) ENCODE lzo,
	order_item_id INTEGER,
	product_id CHARACTER VARYING(255) ENCODE lzo,
	seller_id CHARACTER VARYING(255) ENCODE lzo,
	shipping_limit_date CHARACTER VARYING(255) ENCODE lzo,
	price REAL,
	freight_value REAL,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)DISTSTYLE ALL;

CREATE TABLE IF NOT EXISTS order_payments (
	order_id CHARACTER VARYING(255) ENCODE lzo,
	payment_sequential INTEGER,
	payment_type CHARACTER VARYING(255) ENCODE lzo,
	payment_installments INTEGER,
	payment_value REAL,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)DISTSTYLE ALLDISTSTYLE ALL;

CREATE TABLE IF NOT EXISTS order_reviews (
	review_id CHARACTER VARYING(255) ENCODE lzo,
	order_id CHARACTER VARYING(255) ENCODE lzo,
	review_score CHARACTER VARYING(255) ENCODE lzo,
	review_comment_title CHARACTER VARYING(255) ENCODE lzo,
	review_comment_message CHARACTER VARYING(255) ENCODE lzo,
	review_creation_date CHARACTER VARYING(255) ENCODE lzo,
	review_answer_timestamp CHARACTER VARYING(255) ENCODE lzo,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)DISTSTYLE ALL;


CREATE TABLE IF NOT EXISTS orders (
	order_id CHARACTER VARYING(255) ENCODE lzo,
	customer_id CHARACTER VARYING(255) ENCODE lzo,
	order_status CHARACTER VARYING(255) ENCODE lzo,
	order_purchase_timestamp CHARACTER VARYING(255) ENCODE lzo,
	order_approved_at CHARACTER VARYING(255) ENCODE lzo,
	order_delivered_carrier_date CHARACTER VARYING(255) ENCODE lzo,
	order_delivered_customer_date CHARACTER VARYING(255) ENCODE lzo,
	order_estimated_delivery_date CHARACTER VARYING(255) ENCODE lzo,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)DISTSTYLE ALL;


CREATE TABLE IF NOT EXISTS products (
	product_id CHARACTER VARYING(255) ENCODE lzo,
	product_category_name CHARACTER VARYING(255) ENCODE lzo,
	product_name_length INTEGER,
	product_description_length INTEGER,
	product_photos_qty INTEGER,
	product_weight_g INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER,
	file_name CHARACTER VARYING(255) ENCODE lzo,
	file_process_date DATE
)DISTSTYLE ALL;
