{{ config(materialized='table') }}

SELECT
    parent_id,
    pm.currency_code as presentation_money_currency_code,
    pm.amount as presentation_money_amount
FROM {{ ref('total_shipping_price_unnest') }}
CROSS JOIN UNNEST(presentment_money) AS pm
