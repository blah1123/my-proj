{{ config(materialized='table') }}

SELECT
    parent_id,
    sm.currency_code as shop_money_currency_code,
    sm.amount as shop_money_amount
FROM {{ ref('total_shipping_price_unnest') }}
CROSS JOIN UNNEST(shop_money) AS sm
