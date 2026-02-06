
-- =========================
-- MODEL: models/staging/stg_orders_shipping.sql
-- Unnest total_shipping_price_set
-- =========================

{{ config(materialized='table') }}

{{ unnest_record(
    source_table = ref('base'),
    nested_column = 'total_shipping_price_set',
    parent_key = 'id'
) }}
