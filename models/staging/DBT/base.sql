{{ config(materialized='ephemeral') }}

with source as (

    select *
    from {{ source('DBT', 'sample') }}

),

deduped as (

    select *
    from (
        select
            *,
            row_number() over (
                partition by id
                order by updated_at desc
            ) as rn
        from source
    )
    where rn = 1

)

select
    * except (rn)
from deduped
