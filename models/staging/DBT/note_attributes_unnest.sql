{{ config(materialized='table') }}

select
    b.id as order_id,
    na.name,
    na.value
from {{ ref('base') }} b
left join unnest(b.note_attributes) as na
