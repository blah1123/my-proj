{% macro unnest_record(source_table, nested_column, parent_key) %}

SELECT
    base.{{ parent_key }} AS parent_id,
    nested.*
FROM {{ source_table }} AS base
CROSS JOIN UNNEST(base.{{ nested_column }}) AS nested

{% endmacro %}
