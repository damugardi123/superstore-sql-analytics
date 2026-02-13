-- Table: public.superstore

-- creating table superstore

-- DROP TABLE IF EXISTS public.superstore;

CREATE TABLE IF NOT EXISTS public.superstore
(
    row_id integer,
    order_id text COLLATE pg_catalog."default",
    order_date date,
    ship_date date,
    ship_mode text COLLATE pg_catalog."default",
    customer_id text COLLATE pg_catalog."default",
    customer_name text COLLATE pg_catalog."default",
    segment text COLLATE pg_catalog."default",
    country text COLLATE pg_catalog."default",
    city text COLLATE pg_catalog."default",
    state text COLLATE pg_catalog."default",
    postal_code text COLLATE pg_catalog."default",
    region text COLLATE pg_catalog."default",
    product_id text COLLATE pg_catalog."default",
    category text COLLATE pg_catalog."default",
    sub_category text COLLATE pg_catalog."default",
    product_name text COLLATE pg_catalog."default",
    sales numeric,
    quantity integer,
    discount numeric,
    profit numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.superstore
    OWNER to postgres;
----

--creating view superstore_analytics

-- View: public.superstore_analytics

-- DROP VIEW public.superstore_analytics;

CREATE OR REPLACE VIEW public.superstore_analytics
 AS
 SELECT row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    date_part('year'::text, order_date) AS order_year,
    date_part('month'::text, order_date) AS order_month,
    date_part('quarter'::text, order_date) AS order_quarter,
    sales * quantity::numeric AS gross_sales
   FROM superstore;

ALTER TABLE public.superstore_analytics
    OWNER TO postgres;

